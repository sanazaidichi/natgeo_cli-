require 'pry'

module NatGeo
   class Story
        attr_accessor  :title, :url, :description

        @@all = []

        def initialize(attributes = {}) #setter getter method 
            attributes.each do |attribute_name, attribute_details|
            if self.respond_to?("#{attribute_name}=")
                self.send(("#{attribute_name}="), attribute_details)
                end
            end 
        end 
#scopes
#what is scope of local variable / global /instance /class 

        def self.load_stories 
            api_data = API.get_stories
            @@all = create_stories(api_data)
        end 


        def self.create_stories(api_data)
            api_data.collect do |article_hash|
            self.new(article_hash)     
            end  
        end 


        def self.find_users_choice(input) 
            self.all[input.to_i-1]
        end 


        def get_details
            puts ""
            puts "TITLE: #{self.title}"
            puts "DESCRIPTION: #{self.description}."
            puts "FULL STORY URL: #{self.url}" 
            puts ""
        end 

        def self.clear
            @@all.clear
        end


        def self.all 
            @@all 
        end 
    end 
end 
