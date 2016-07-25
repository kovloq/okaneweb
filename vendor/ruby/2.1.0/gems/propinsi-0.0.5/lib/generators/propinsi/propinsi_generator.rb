require 'rails/generators'
require 'rails/generators/base'
require 'rails/generators/named_base'

module Propinsi
	class PropinsiGenerator < Rails::Generators::NamedBase
	  # source_root File.expand_path("../../templates", __FILE__)
	  desc "This generator will create model and db seed"

	  def create_migration
	    generate 'model', "#{class_name} name:string --no-timestamps"
	  end

	  def create_db_seed
	    text = "\n\n"
	    text << Prefectures.map.with_index(1) do |name, idx|
	      "#{class_name}.find_or_create_by(id: #{idx}, name: '#{name}')"
	    end.join("\n")

	    inject_into_file 'db/seeds.rb', text.force_encoding('ascii-8bit'), after: /.\Z/
	  end

	end
end