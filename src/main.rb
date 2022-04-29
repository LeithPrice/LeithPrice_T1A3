$workshop_name = ''
$workshop_address = ''
$time = ''
$customer_details = []


def initilize(workshop_name, workshop_address, time)
        $workshop_name = workshop_name
        $workshop_address = workshop_address
        $time = time
        $customer_details = []
end

def banner_title
    system "clear"
    puts " "
    puts "#{$workshop_name} Workshop Software"
    puts " "
end

def leave_software
    
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
        puts "Thank you for using #{$workshop_name} Workshop Software"
        puts " "
    elsif quit == "no"
        invoice_query
    end
end

def display_invoice
    banner_title    
    totalresult = $customer_details[7] * $customer_details[8]
    puts "*******************************************************************"
    puts "*******************************************************************"
    puts "******* Work Invoice **********************************************"
    puts " Customer         : #{$customer_details[0]}"
    puts " Customer Address : #{$customer_details[1]}"
    puts " Registration No. : #{$customer_details[2]}"
    puts " Vehicle Year     : #{$customer_details[3]}"
    puts " Vehicle Make     : #{$customer_details[4]}"
    puts " Vehicle Model    : #{$customer_details[5]}"
    puts " Odometer         : #{$customer_details[6]} kms"
    puts "*******************************************************************" 
    puts "*******************************************************************"
    puts " Labour Hourly Rate : $#{$customer_details[7]}"
    puts " Labour Quantity    : #{$customer_details[8]}"
    puts "_____________________________________________"
    puts " TOTAL AMOUNT       : $#{totalresult}"
    puts "_____________________________________________"
    puts " "
    leave_software

end

def labour_time
    banner_title
    puts "What is the Labour time"
    begin
        time = gets.chomp
        time = Float(time)
    rescue ArgumentError
        puts "Please enter an hourly number:"
        retry
    end


    $customer_details.push time
    customerdeets = $customer_details
    print customerdeets
    puts " "
end


def customer_information
    banner_title
    puts "Customer Name:"
    input = gets.chomp.to_s
    $customer_details.push input
    banner_title
    puts "Customer Address:"
    input = gets.chomp.to_s
    $customer_details.push input
    banner_title
    puts "Vehicle Registration Number:"
    input = gets.chomp.to_s
    $customer_details.push input
    banner_title
    puts "Vehicle Year:"
    begin
        input = gets.chomp
        input = Integer(input)
    rescue ArgumentError
        banner_title
        puts "Please enter correct year:"
        retry
    end
    $customer_details.push input
    banner_title
    puts "Vehicle Make:"
    input = gets.chomp.to_s
    $customer_details.push input
    banner_title
    puts "Vehicle Model:"
    input = gets.chomp.to_s
    $customer_details.push input
    banner_title
    puts "Odometer Kms:"
    begin
        input = gets.chomp
        input = Integer(input)
    rescue ArgumentError
        banner_title
        puts "Please enter correct odometer:"
        retry
    end
    $customer_details.push input
    banner_title
    puts " What is the Hourly Labour Rate for this Customer:"
    begin
        input = gets.chomp
        input = Float(input)
    rescue ArgumentError
        banner_title
        puts "Please enter correct Hourly Rate"
        retry
    end
    $customer_details.push input
    
end






def existing_customer
    banner_title
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
        puts "Is this a new customer (Yes/No)"
        customer = gets.chomp.downcase
        while (customer !='yes' && customer != 'no' )
            if (customer !='yes' && customer != 'no' )
            puts "Please answer yes or no"
            customer = gets.chomp.downcase 
            end
        end     
        if (customer == 'yes' && customer != 'no')
            customer_information
            labour_time
            display_invoice
        elsif (customer == 'no' && customer != 'yes')
            existing_customer
            
            
        end
    elsif invoice == "no"
        banner_title
        leave_software
    end
end



system "clear" 
puts "Welcome to Workshop Software"
puts "----------------------------"
puts "Please enter your Workshop Name"
$workshop_name= gets.chomp.to_s
puts "Please enter your Workshop Address"
$workshop_address = gets.chomp.to_s
banner_title
invoice_query











