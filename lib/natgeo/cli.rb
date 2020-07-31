require 'pry'

module NatGeo
    class CLI 

        def start 
            line_spacing
            puts "WELCOME TO THIS NATIONAL GEOGRAPHIC GEM!"
            Story.load_stories 
            stories 
        end 


        def stories
            line_spacing
            puts "These are the top stories of the day!" 
            line_spacing  
            list_stories
            line_spacing 
            pick_a_story
        end 


        def list_stories
            Story.all.each.with_index(1) do |story, index| #params
                puts "#{index}. #{story.title}"
            end
        end 


        def pick_a_story
            puts "Choose an article by the number to read further."
            input = gets.strip.to_i

            if !input.between?(1,10)
                puts "Wrong entry! Please try again."
                list_stories
                pick_a_story
            elsif 
                Story.find_users_choice(input).get_details
            end
            choice
        end 


        def choice 
            puts "Would you like to keep reading? Type 'read' to keep going or 'no' to exit."
            input = gets.strip
            if input == "read"
              list_stories
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
