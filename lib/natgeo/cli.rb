require 'pry'

module NatGeo
    class CLI 

        def start 
            line_spacing
            puts "WELCOME TO THIS NATIONAL GEOGRAPHIC GEM!"
            Story.load_stories #makes the api call and display the list of top 10. 
            stories 
        end 
#only trying to make just one api call 
#dont want to do to many api calls, discuss in blog. setup the loop for that purpose. 

        def stories
            line_spacing
            puts "These are the top stories of the day!" 
            line_spacing  
            list_stories
            line_spacing 
            pick_a_story
        end 
#this puts out all the top picks of the day and then shows off all of the stories
#trying to use this for the loop 
        def list_stories
            Story.all.each.with_index(1) do |story, index|
                puts "#{index}. #{story.title}"
            end
        end 

        def pick_a_story
            puts "Choose an article by the number to read further."
            input = gets.chomp.to_i

            if !input.between?(1,10)
                puts "Wrong entry! Please try again."
                list_stories
                pick_a_story
                # choice 
            elsif 
                Story.find_users_choice(input).get_details
            end
            choice
        end 


        def choice #mini loop 
            puts "Would you like to keep reading? Type read to keep going or no to exit."
            input = gets.strip
            if input == "read"
              pick_a_story
            elsif input == "no"
              goodbye
              exit 
            else 
              puts "Error, please try again with the correct entry."
              choice
            end 
          end


        def goodbye
            puts "Thanks for reading! Goodbye!"
        end 


        def line_spacing
            puts ""
        end 
    end
end 
