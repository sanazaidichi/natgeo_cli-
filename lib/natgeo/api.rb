require 'pry'
require 'net/http'
require 'json'

module NatGeo 
    class API
    #stores API endpoint URL in a constant at the top of the class
   
        URL = "https://newsapi.org/v2/top-headlines?sources=national-geographic&apiKey="

        def self.get_stories 
            uri = URI.parse(URL+api_key)
            response = Net::HTTP.get_response(uri) #string 
            JSON.parse(response.body)["articles"]
           
        end    
            
        def self.api_key
            begin 
                @@key = File.open(File.expand_path("~/.news-api-key")).read.strip 
            rescue 
                puts "Whoops! Looks like you have not added your API key"
                puts "Post it here"
                
                @@key = gets.strip   
                return if @@key == "exit"
                File.open(File.expand_path("~/.news-api-key"), "w") do |file|
                    file.print @@key 
                end 
            end 
            @@key 
        end 
    end 

end 
  


         

