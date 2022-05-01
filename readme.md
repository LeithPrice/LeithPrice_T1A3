

## Leith Price T1A3 assessment Read Me file ##

- My T1A3 terminal Application is a basic take on Mechanical Workshop Software. Allowing the user, a workshop, to generate an invoice containing all the customer information and sales information and display a complete sales invoice on the screen. The great thing about my software is that all customer data input is saved to a .txt file to be able to be accessed at a later time. This removed repetition and for the user with regular customers. The main menu allows you to choose if the customer is existing or not and search the vehicle registration number. If the Rego number is in the system already then it will use that previously entered and saved customer information to proliferate the sales invoice to be displayed. 

When you begin the application, the Workshop name can be what ever you like however there is a specific password.

Password = dfe546gt

# R4 Link to Source Control Repository #

https://github.com/LeithPrice/LeithPrice_T1A3

# R5 Identify any code style guide or styling conventions that the application will adhere to. #


- The Application code adheres to the Ruby Style Guide, 
-  https://github.com/rubocop/ruby-style-guide

# R6 Develop a list of features that will be included in the application. It must include: #
# - at least THREE features #
# - describe each feature #

- Feature 1, Customer Data input and saving to file.

In the customer_information method starting on line 115, the user is asked about themselves and their vehicle to create a file regarding themselves. Each time this information is obtained it is saved to a Gloval Variable called $input. It is then cleaned with a gets.chomp, converted to uppercase, and has all whitespace removed from the input. Finally it is pushed to an array called $customer_details.  This process is repeated for the all requested variable information.

Input is easy to recieve when it is string data however when it needs to be an integer in data type there are loops and error handling in place to ensure accurate input. Line 134 in the code shows the first of 2 integer error handling loops. The input is assessed to be an integer or not. If it is falsy then request for information must be repeateded till the input to global variable $input is integer in data type. Then it will be saved to global array $customer_details.

At the end of the of the method at line 162 a file open/write action commences.  Customized to be append so as to nor overwrite previously entered information, all information is taken from global array $customer_details and pushed into a waiting text file called customer.txt. A DO loop is inplace to control the format of which the information is pushed, ensuring that the individual information in the array is saved with seperation by semi-colon (;). When the array has been uploaded to the .txt file, the do loop ends and a final ("\n") is uploaded to move the curser in the .txt file to the next line to await new file writing.

- Feature 2, Invoice generation

The invoice is displayed in a format that is pre designed by a serious of put and print statements and in - string global arrays. It takes the information the previous method had filled inside an global array called $customer_details and prints out the information in an invoice format.

- Feature 3, Existing customer search

In the existing_customer method starting on line 171 is about searching the saved .txt file for specific details and pulling the associated array.  The customer is asked for the registration number they are searching and then the input is saved to a global variable $old_input, cleaned up and held.

The .txt file is then read and saved to a global array called $file_data. A do loop then begins where each piece of information is split up into individual data pieces, and compared to the saved value in $old_input.  If the data matches, then a secondary If condition starts where the user is notified of  of the matching data, and the local array the matching data is apart of is then saved to the global array $customers_details.

Loop conditions end and control flow continiues on.

- Feature 4, Menu Interactions

WHen i originally set up the menu options, i had error handling  for each answer in the fashion of the following. 

while (input !='yes' && input != 'no' )
    if (input !='yes' && input != 'no' )
        puts "Please answer yes or no"
        input = gets.chomp.downcase
    end
end

However once i installed the Ruby Gems, specifically the TTY-Prompt, it removed user input options and limited them to up/down arrows and the enter key.

The menus consist of the method invoice_query and leave_software. If asks for user input and then has conditional IFs afterwards. If value = yes, IF value = no. Dependant on which answers are selected in the TTY-Prompt questions, determines which course of action is taken and which methods are called.

These IF, ELSE  conditions always loop because because the Methods at the end of instructions chains always call the main method again.

# Develop an implementation plan which: #
# - outlines how each feature will be implemented and a checklist of tasks for each feature #
# - prioritise the implementation of different features, or checklist items within a feature #
# - provide a deadline, duration or other time indicator for each feature or checklist/checklist-item #

 The trello workboard i used shows the order in which i performed the tasks. 
 - i got approval for the idea
 - drew up a flowchart
 - performed all the coding and error testing
 - wrote my readme.md file
 - took images of my slides and trollo board
 - wrote my rspec file

# Design help documentation which includes a set of instructions which accurately describe how to use and install the application. #

# You must include: #
# - steps to install the application #
# - any dependencies required by the application to operate #
# - any system/hardware requirements #
# - how to use any command line arguments made for the application #


- steps to install the application.
 First you must have the installed software to run the file. First you have to install either Ubuntu on Windows machine or Homebrew on Mac OS
    - The Link for instructions to install Homebrew for Mac is https://www.digitalocean.com/community/tutorials/how-to-install-and-use-homebrew-on-macos
    - The Link for instructions to install Ubuntu for Windows Machine is https://www.windowscentral.com/how-install-ubuntu-2110-wsl-windows-10-and-11

    If you have Windows 11 on your terminal you may need to follow the following steps to install Ubuntu due to BIOS and HYPER-V mods that are required.
    - https://beebom.com/how-enable-hyper-v-windows-11-home/#:~:text=Hyper%2DV%20is%20a%20native,Home%20edition%20of%20Windows%2011


 Next you need to install your Ruby virtual machine. This involves downloading RVM or rbenv on your terminal. And then install Ruby.
 Rvm for Windows based machines, and Rbenv for Mac OS based machines. 
   - The Link for instructions for MAC is https://medium.com/@gratefulcheddar/installing-rbenv-and-updating-to-the-newest-ruby-version-22c465063450
   - The Link for structions for windows is https://www.digitalocean.com/community/tutorials/how-to-install-ruby-and-set-up-a-local-programming-environment-on-windows-10

You can use your code editer of choice.

In terminal, you can do a git clone of the repository ( im assuming you already have it to be reading this,)
 to do this you must enter the following, 

  git clone https://github.com/LeithPrice/LeithPrice_T1A3

- any dependencies required by the application to operate 
The program uses a range of Gems to enhance user experience. When you open the file with ./run_app.sh, It will automatically download the needed Gems and fire up the program.

- any system/hardware requirements 
System requirements arent very high.  As a minimium you will need Windows 10 for any WIndows machine, or Mac OS 11 for any Apple Mac computer.

- how to use any command line arguments made for the application 
There are no command line arguements for the application. Once you start the program with ./run_app.sh, you will be asked to login from there. 
The Password is at the top of this Readme.md document.


# Screenshots #
![Control Flowchart](/docs/flowchart.png)
![Trello screenshot](/docs/trelloscreenshot.png)
![Welcome screen screenshot](/docs/welcome_screenshot.png)
![Menu screen screenshot][/docs/Menu_screenshot.png]
![Invoice Display screenshot](/docs/Invoicedisplay_screenshot.png)