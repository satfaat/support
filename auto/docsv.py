import csv
from IPython.display import clear_output


# handle user registration and writing to csv
# Open in append mode. If file doesn’t exist, it creates one
def registerUser( ):
    with open("users.csv", mode="a", newline="") as f:
        writer = csv.writer(f, delimiter=",")
        print("To register, please enter your info:")
        email = input("E-mail: ")
        password = input("Password: ")
        password2 = input("Re-type password: ")
        clear_output( )
        if password == password2:
            writer.writerow( [email, password] )


# ask for user info and return true to login or false if incorrect info
# This is the default mode. It opens the file for reading only
def loginUser( ):
    print("To login, please enter your info:")
    email = input("E-mail: ")
    password = input("Password: ")
    clear_output( )

    with open("users.csv", mode="r") as f:
        reader = csv.reader(f, delimiter=",")
        for row in reader:
            if row == [email, password]:
                print("You are now logged in!")
                return True
            print("Something went wrong, try again.")
            return False


# variables for main loop
active = True
logged_in = False

# main loop
while active:
    if logged_in:
        print("1. Logout\n2. Quit")
    else:
        print("1. Login\n2. Register\n3. Quit")
    choice = input("What would you like to do? ").lower( )
    clear_output( )

    if choice == "register" and logged_in == False:
        registerUser( )
    elif choice == "login" and logged_in == False:
        logged_in = loginUser( )
    elif choice == "quit":
        active = False
        print("Thanks for using our software!")
    elif choice == "logout" and logged_in == True:
        logged_in = False
        print("You are now logged out.")
    else:
        print("Sorry, please try again!")