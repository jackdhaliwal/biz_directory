require "biz_directory/version"
require "unirest"

module SanFranciscoBusinesses
  class Business
attr_reader :name, :type, :neighborhood, :inception, :first_name, :last_name

  	def initialize(input_options)
  	  @name = input_options["ownership_name"]
  	  @type = input_options["naic_code_description"]
  	  @neighborhood = input_options["neighborhoods_analysis_boundaries"]
  	  @inception = input_options["dba_start_date"]
  	  @first_name = @name.split(",  ")[1]
  	  @last_name = @name.split(",  ")[0]
  	end
  	def self.all
  		ruby_data = []
  		bulk_data = Unirest.get("https://data.sfgov.org/resource/vbiu-2p9h.json").body
  		bulk_data.each do |business|
  			ruby_data << Business.new(business)
  		end
  		ruby_data
  	end
  	def self.zip(parameter_option)
  		ruby_data = []
  		bulk_data = Unirest.get("https://data.sfgov.org/resource/vbiu-2p9h.json?location_zip=").body
  		bulk_Data.each do |business|
  			ruby_data << Business.new(business)
  		end
  		ruby_data
  	end	
  	#different way of writing similar method
  	def self.newest
  	  businesses = Unirest.get("https://data.sfgov.org/resource/vbiu-2p9h.json").body
  	  	.map { |business| Business.new(business)}
  	  businesses.sort_by.max_by(100) { |business| business.inception}
  	end	
  end
end


