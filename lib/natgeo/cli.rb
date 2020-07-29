require 'pry'

module NatGeo
    class CLI 

        def start
            line_spacing
            puts "---Welcome to this National Geographic gem!---"
            Story.load_stories
            stories 
        end


        def stories    
            line_spacing
            puts "These are the top picks of the day."
            line_spacing
            list_stories
            line_spacing
            pick_story
            line_spacing
        end


        def list_stories 
            Story.all.each.with_index(1) do |story, index|
                puts "#{index}. #{story.title}."
            end 
        end 

        
        def pick_story
            line_spacing
            puts "Chose an article by the number to read further."
            line_spacing
            input = gets.chomp.to_i 

            if !input.between?(1,10)
                puts "Wrong entry! Please try again."
                line_spacing
                list_stories
                line_spacing
                pick_story
            elsif
                Story.find_users_choice(input).get_details
            end
            choice 
        end 


        def choice 
            puts "Would you like to keep reading or exit the program? Type read or exit"
            input = gets.chomp
            
            if input  == "read"
                list_stories
                pick_story
            elsif input == "exit"
                exit 
            else 
                puts "Wrong entry! Please try again."
                choice
            end
        end 
    

        def line_spacing
            puts ""
        end   
    end
end 
