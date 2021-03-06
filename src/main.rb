# Initializing the Gems
require 'colorize'
require 'artii'
require 'tty-prompt'

# clearing all variables and arrays
$workshop_name = ''
$workshop_address = ''
$time = ''
$customer_details = []
$prompt =TTY::Prompt.new
$a = Artii::Base.new
$value = ''
$file_data = []
$input = ''
$old_input = ''
$user_name = ''

# initializing the arrays and variables to global status
def initilize(workshop_name, workshop_address, time, value, input, old_input, user_name)
  $workshop_name = workshop_name
  $workshop_address = workshop_address
  $time = time
  $value = value
  $input = input
  $user_name = user_name
  $old_input = old_input
  $customer_details = []
  $file_data = []
end

# the method for the banner display at top of every page
def banner_title
  system "clear"
  puts " "
  puts $a.asciify("#{$workshop_name} Workshop Software").colorize(:red)
  puts "*****************************************************************************************************************************".colorize(:blue)
  puts "#{$workshop_address}".colorize(:red)
  puts " "
  puts " "
end

# the method for the leaving program question
def leave_software
  puts = " "
  puts = " "
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

# the method for displaying final invoice 
def display_invoice
  banner_title    
  totalresult = $customer_details[6].to_i * $time
  puts "*******************************************************************".colorize(:green)
  puts "*******************************************************************".colorize(:green)
  puts "******* Work Invoice **********************************************".colorize(:green)
  puts " Customer First Name: #{$customer_details[0]}"
  puts " Customer Last Name : #{$customer_details[1]}"
  puts " Registration No.   : #{$customer_details[2]}"
  puts " Vehicle Year       : #{$customer_details[3]}"
  puts " Vehicle Make       : #{$customer_details[4]}"
  puts " Vehicle Model      : #{$customer_details[5]}"
  puts " Odometer           : #{$customer_details[7]} kms"
  puts "*******************************************************************".colorize(:green)
  puts "*******************************************************************".colorize(:green)
  print " Labour Hourly Rate :"
  puts "           $#{$customer_details[6]}".colorize(:blue)
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

# the method for calculating the labour time to charge
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

# the method for entering the odometer of the vehicle
def odometer_input
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
end

# the method for inputing customer information into an array and saving data to the text file
def customer_information
  banner_title
  $customer_details.clear
  puts "Customer First Name:"
  $input = gets.chomp.to_s
  $input = $input.delete(' ')
  $customer_details.push $input
  banner_title
  puts "Customer Last Name:"
  $input = gets.chomp.to_s
  $input = $input.delete(' ')
  $customer_details.push $input
  banner_title
  puts "Vehicle Registration Number:"
  $input = gets.chomp.upcase
  $input = $input.delete(' ')
  $customer_details.push $input
  banner_title
  puts "Vehicle Year:"
  begin
    $input = gets.chomp
    $input = Integer($input)
  rescue ArgumentError
    puts "Please enter correct year:".colorize(:red)
    retry
  end
  $customer_details.push $input
  banner_title
  puts "Vehicle Make:"
  $input = gets.chomp.to_s
  $input = $input.delete(' ')
  $customer_details.push $input
  banner_title
  puts "Vehicle Model:"
  $input = gets.chomp.to_s
  $input = $input.delete(' ')
  $customer_details.push $input
  banner_title
  puts "What is the Hourly Labour Rate for this Customer ($):"
  begin
    $input = gets.chomp
    $input = Float($input)
  rescue ArgumentError
    puts "Please enter correct Hourly Rate".colorize(:red)
    retry
  end
  $customer_details.push $input
  File.open('customer.txt', 'a') do |f|
    $customer_details.each do |ch|
      f.write("#{ch};")
    end
    f.write("\n")
  end
end

# the method for getting user input for searching the text file for existing customers and saving to a usable array
def existing_customer
  banner_title
  puts "Vehicle Registration Number:"
  $old_input = gets.chomp.upcase
  $old_input = $old_input.delete(' ')
  $customer_details.clear
  $file_data = File.read("customer.txt").split
  $file_data.each do |customer|
    customerParts = customer.split(';')
    rego = customerParts[2];
    if rego == $old_input
      puts " "
      puts "Found Customer Registration #{customerParts[2]}".colorize(:green)
      puts "Vehicle Belongs to #{customerParts[0]} #{customerParts[1]}".colorize(:red)
      puts = " "
      value = $prompt.select("Is this the Customer you were looking for?") do |menu|
        menu.choice "Yes", 1
        menu.choice "No", 2
        puts = " "
      end
      if value ==1
        $customer_details = customerParts 
        break
      elsif value = 2
        print "\n"
      end
    end
  end
end


# the method for asking if user wants to generate a new invoice and if the customer is new or old
def invoice_query
  banner_title
  value = $prompt.select("Would you like to Generate a new invoice?") do |menu|
    menu.choice "Yes", 1
    menu.choice "No", 2
  end 
  if value == 1
    banner_title
    value = $prompt.select("Is this an existing customer") do |menu|
      menu.choice "Yes", 1
      menu.choice "No", 2
    end 
    if value == 2
      customer_information
      odometer_input
      labour_time
      display_invoice
    elsif value == 1
      existing_customer
      if $customer_details.empty?
        print "Registration not found, Returning to Main menu...".colorize(:red)
        sleep 2
        invoice_query
      else
        odometer_input
        labour_time
        display_invoice
      end
    end
  elsif value == 2
    banner_title
    leave_software
  end
end

# Main Logon and Password check
  system "clear"
  puts "Welcome to Workshop Software".colorize(:red)
  puts "----------------------------".colorize(:blue)
  puts "What is your Workshop name?"
  $workshop_name = gets.chomp.to_s
  puts " "
  puts "Welcome #{$workshop_name}"
  puts "What is the Password"
  current_password = "dfe546gt"
  password = gets.chomp.to_s
  if password == current_password
    puts " "
    puts "Correct Password".colorize(:blue)
    sleep 2
    banner_title
    invoice_query
  elsif 
    system "clear"
    puts "Incorrect Password, Goodbye..".colorize(:red)
    puts " "
    sleep 2
  end



  
  








