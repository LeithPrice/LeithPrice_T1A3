require 'colorize'
require 'artii'
require 'tty-prompt'


$workshop_name = ''
$workshop_address = ''
$time = ''
$customer_details = []
$prompt =TTY::Prompt.new
$a = Artii::Base.new
$value =''

def initilize(workshop_name, workshop_address, time)
        $workshop_name = workshop_name
        $workshop_address = workshop_address
        $time = time
        $value = value
        $customer_details = []
end

def banner_title
    system "clear"
    puts " "
    puts $a.asciify("#{$workshop_name} Workshop Software").colorize(:red)
    puts "*****************************************************************************************************************************".colorize(:blue)
    puts "#{$workshop_address}".colorize(:red)
    puts " "
    puts " "
end

def leave_software
    value = $prompt.select("Would you like to leave the Software?") do |menu|
        menu.choice "Yes", 1
        menu.choice "No", 2
    end 
   
    if value == 1
        banner_title
        puts "Thank you for using #{$workshop_name} Workshop Software"
        puts " "
    elsif value == 2
        invoice_query
    end
end

def display_invoice
    banner_title    
    totalresult = $customer_details[7] * $time
    puts "*******************************************************************".colorize(:green)
    puts "*******************************************************************".colorize(:green)
    puts "******* Work Invoice **********************************************".colorize(:green)
    puts " Customer         : #{$customer_details[0]}"
    puts " Customer Address : #{$customer_details[1]}"
    puts " Registration No. : #{$customer_details[2]}"
    puts " Vehicle Year     : #{$customer_details[3]}"
    puts " Vehicle Make     : #{$customer_details[4]}"
    puts " Vehicle Model    : #{$customer_details[5]}"
    puts " Odometer         : #{$customer_details[6]} kms"
    puts "*******************************************************************".colorize(:green)
    puts "*******************************************************************".colorize(:green)
    print " Labour Hourly Rate :"
    puts "           $#{$customer_details[7]}".colorize(:blue)
    print " Labour Quantity    :"
    puts "           #{$time}".colorize(:blue)
    puts "_____________________________________________".colorize(:red)
    print " TOTAL AMOUNT       :" 
    puts "           $#{totalresult}".colorize(:blue)
    puts "_____________________________________________".colorize(:red)
    puts " "
    puts "*******************************************************************".colorize(:green)
    leave_software

end

def labour_time
    banner_title
    puts "What is the Labour time"
    begin
        $time = gets.chomp
        $time = Float($time)
    rescue ArgumentError
        puts "Please enter an hourly number:".colorize(:red)
        retry
    end

end


def customer_information
    banner_title
    $customer_details.clear
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
        puts "Please enter correct year:".colorize(:red)
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
        
        puts "Please enter correct odometer:".colorize(:red)
        retry
    end
    $customer_details.push input
    banner_title
    puts "What is the Hourly Labour Rate for this Customer:"
    begin
        input = gets.chomp
        input = Float(input)
    rescue ArgumentError
        
        puts "Please enter correct Hourly Rate".colorize(:red)
        retry
    end
    $customer_details.push input
    File.write("customer.txt", $customer_details, mode: "a")
end




def existing_customer
    banner_title
 file_data = File.read("customer.txt")
print file_data


end



def invoice_query
    banner_title
    value = $prompt.select("Would you like to Generate a new invoice?") do |menu|
        menu.choice "Yes", 1
        menu.choice "No", 2
    end 
    if value == 1
        banner_title
        value = $prompt.select("Is this a new customer") do |menu|
            menu.choice "Yes", 1
            menu.choice "No", 2
        end 
        if value == 1
            customer_information
            labour_time
            display_invoice
        elsif value == 2
            existing_customer
        end
    elsif value == 2
        banner_title
        leave_software
    end
end



system "clear" 
puts "Welcome to Workshop Software".colorize(:red)
puts "----------------------------".colorize(:blue)
puts "Please enter your Workshop Name"
$workshop_name= gets.chomp.to_s
puts "Please enter your Workshop Address"
$workshop_address = gets.chomp.to_s
banner_title
invoice_query











