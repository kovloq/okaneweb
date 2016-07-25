require "propinsi/version"
require 'yaml'
module Propinsi
  # Your code goes here...
  	def Propinsi.all
		filepath = File.join(File.dirname(__FILE__), 'data/all.yml')
		all=YAML.load_file(filepath);
    	return all["provinces"]
  	end

  	def Propinsi.propinsi
  		filepath = File.join(File.dirname(__FILE__), 'data/provinces.yml')
  		prop=YAML.load_file(filepath);
  		return prop["provinces"]
  	end

  	def Propinsi.kota
  		filepath = File.join(File.dirname(__FILE__), 'data/cities.yml')
  		kota=YAML.load_file(filepath);
  		return kota["cities"];
  	end

  	def Propinsi.findkota(input)
  		kota=self.kota;
  		index=kota.each_with_index do |row,idx|
  			break idx if(input.to_s == row["id"].to_s || row["name"].to_s.downcase.include? input.to_s.downcase)
  		end
  		if index.kind_of?(Array)
  			return false;
	  	else
	  		return kota[index]
	  	end
	  	
  	end

  	def Propinsi.findpropinsi(input)
  		prop=self.all
  		index=prop.each_with_index do |row,idx|
  			break idx if(input.to_s == row["id"].to_s || row["name"].to_s.downcase.include? input.to_s.downcase)
  		end
  		if index.kind_of?(Array)
  			return false;
	  	else
	  		return prop[index]
	  	end
  	end
end
