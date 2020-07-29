require 'pry'

module NatGeo
    class CLI 

        def start
            line_spacing
            puts "Welcome to this National Geographic gem!"
            line_spacing
            puts "These are the top picks of the day."
            line_spacing
            collect_stories
            pick_story
            while @input != "exit"
                if valid?
        
                else
                    line_spacing
                    puts "Oops, wrong entry! Please try again."
                end 
                pick_story
                line_spacing
            end
        end

        
        
         def collect_stories
            Story.load_stories
            Story.list_stories 
            
         end 

        def pick_story
            line_spacing
            puts "Chose an article by the number to read further."
           input = gets.chomp.to_i 
           
            if !input.between?(1,10)
                Story.find_users_choice(input).get_details
                puts "Wrong entry! Please try again."
                collect_stories 
            elsif
                
                Story.find_users_choice(input).get_details
                collect_Stories 
                
            else 
                exit  
            end 
        end 

        def valid?
            @input.to_i.between?(1, 10)
          end
    
          def line_spacing
            puts ""
          end 
    end
    
end 
