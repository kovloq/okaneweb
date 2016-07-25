require 'rails/generators'
require 'rails/generators/base'
require 'yaml'

module Propinsi
	class InstallGenerator < Rails::Generators::Base
	  # source_root File.expand_path("../../templates", __FILE__)
	  desc "This generator will create model and db seed"

	  def create_initializer_file
	    create_file "lib/tasks/propinsi.rake", "# task province \nnamespace :propinsi do \n  desc \"Dump all data\" \n    task :import => :environment do \n    end \nend\n"
	  end
	  

	  def create_migration
	  	# Generate Propinsi
	    generate 'model', "province name:string --no-timestamps"
	    # generate Kota
	    generate 'model', "city province_id:string name:string --no-timestamps"
	  end

	  def create_db_seed
	  	filepath = File.join(File.dirname(__FILE__), '../../data/all.yml')
    	@data = YAML.load_file(filepath)
	    text = "\n\n"
	    city_id=0;
	    @data["provinces"].map.each do |row|
	    	# puts row["name"];
	    	# puts "\n break"
	      text << "Province.find_or_create_by(id: #{row["id"]}, name: '#{row["name"]}') \n"
	      row["cities"].map.with_index.each do |row2,idx|
	      	city_id=city_id+1;
	      	# puts row2
	      	text << "City.find_or_create_by(id: #{city_id}, name: '#{row2["name"]}', province_id: '#{row2["province_id"]}') \n"
	      end
	    end
	   
	    # puts text;
	    inject_into_file 'lib/tasks/propinsi.rake', text, after: "task :import => :environment do"
	    #inject into province model
	    province_text="\nhas_many :cities\nvalidates_presence_of :name"
	    inject_into_file 'app/models/province.rb', province_text, after: "class Province < ActiveRecord::Base"
	    #inject into city model
	    city_text="\nbelongs_to :province\nvalidates_presence_of :name"
	    inject_into_file 'app/models/city.rb', city_text, after: "class City < ActiveRecord::Base"
	  end

	end
end