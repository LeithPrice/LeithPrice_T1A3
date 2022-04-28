def initilize(workshop_name, workshop_address)
        @workshop_name = workshop_name
        @workshop_address = workshop_address
        @customer_details = []
end

def banner_title
    system "clear"
    puts " "
    puts "#{@workshop_name} Workshop Software"
    puts " "
end

def leave_software
    banner_title
    puts "Would you like to leave the software(Yes/No)"
    quit = gets.chomp.downcase
    while (quit !='yes' && quit != 'no' )
        if (quit !='yes' && quit != 'no' )
            puts "Please answer yes or no"
            quit = gets.chomp.downcase 
        end
    end
    if quit == "yes"
        banner_title
        puts "Thank you for using #{@workshop_name} Workshop Software"
        puts " "
    elsif quit == "no"
        invoice_query
    end
end


def invoice_query
    banner_title
    puts "Would you like to Generate a new invoice (Yes/No)"
    invoice = gets.chomp.downcase
    while (invoice !='yes' && invoice != 'no' )
      if (invoice !='yes' && invoice != 'no' )
            puts "Please answer yes or no"
            invoice = gets.chomp.downcase
        end
    end
    if invoice == "yes"
        banner_title
        puts "Is the a new customer (Yes/No)"
        customer = gets.chomp.downcase
        while (customer !='yes' && customer != 'no' )
            if (customer !='yes' && customer != 'no' )
            puts "Please answer yes or no"
            customer = gets.chomp.downcase  
            end
            customer_details
    end     
elsif invoice == "no"
        leave_software
end
end

def customer_details
    banner_title
    puts " Customer Name:"
    
end

system "clear" 
puts "Welcome to Workshop Software"
puts "----------------------------"
puts "Please enter your Workshop Name"
@workshop_name= gets.chomp.to_s
puts "Please enter your Workshop Address"
@workshop_address = gets.chomp.to_s
banner_title
invoice_query













# puts "Is the a new customer(Yes/No)"
# Customer = gets.chomp.downcase
# while (customer !='yes' && customer != 'no' )
#     if (customer !='yes' && customer != 'no' )
#         puts "Please answer yes or no"
#         customer = gets.chomp.downcase  
#     end
# end



# puts "What is the Temperature"
#     begin
#         temp = gets.chomp
#         temp = Integer(temp)
#     rescue ArgumentError
#         print "Please enter an integer number:"
# retry 
# end

# if weather == "yes" && temp < 15
#     puts "It’s wet and cold"
# elsif weather == "no" && temp < 15
#     puts "It’s not raining but cold"
# elsif weather == "no" && temp >= 15
#     puts "It’s warm but not raining"
# else
#     puts "It’s warm and raining"
# end