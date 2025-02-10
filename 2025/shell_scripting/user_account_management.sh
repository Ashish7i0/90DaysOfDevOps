#!/bin/bash

# Function for User Account Management
function UserAccountManagement {

    # Account Creation
    if [ "$1" == "-c" ] || [ "$1" == "--create" ]; then
        read -p "Enter the username you want to create: " username
        if [[ -z "$username" ]]; then
            echo "Username cannot be empty."
            exit 1
        fi
        userValidation=$(getent passwd "$username" | wc -l)

        if [ $userValidation -gt 0 ]; then
            echo "User already exists."
            exit 1
        else
            echo "User does not exist. Creating the user: $username."
            useradd -m "$username" > /dev/null
            if [ $? -ne 0 ]; then
                echo "Failed to create user."
                exit 1
            fi
            read -sp "Enter a password for user $username: " passwd
            echo
            if [[ -z "$passwd" ]]; then
                echo "Password cannot be empty."
                exit 1
            fi
            echo -e "$passwd\n$passwd" | passwd "$username" > /dev/null
            if [ $? -ne 0 ]; then
                echo "Failed to set password."
                exit 1
            fi
            echo "User created successfully."
            grep "$username" /etc/passwd
        fi

    # Account Deletion
    elif [ "$1" == "-d" ] || [ "$1" == "--delete" ]; then
        read -p "Enter the username you want to delete: " username
        if [[ -z "$username" ]]; then
            echo "Username cannot be empty."
            exit 1
        fi
        userValidation=$(getent passwd "$username" | wc -l)

        if [ $userValidation -gt 0 ]; then
            echo "User exists. Deleting the user: $username along with their home directory."
            userdel -r "$username"
            if [ $? -ne 0 ]; then
                echo "Failed to delete user."
                exit 1
            fi
        else
            echo "User does not exist."
            exit 1
        fi

    # Password Reset
    elif [ "$1" == "-r" ] || [ "$1" == "--reset" ]; then
        read -p "Enter the username for which you want to reset the password: " username
        if [[ -z "$username" ]]; then
            echo "Username cannot be empty."
            exit 1
        fi
        userValidation=$(getent passwd "$username" | wc -l)

        if [ $userValidation -gt 0 ]; then
            echo "User exists."
            read -sp "Enter a new password for user $username: " passwd
            echo
            if [[ -z "$passwd" ]]; then
                echo "Password cannot be empty."
                exit 1
            fi
            echo -e "$passwd\n$passwd" | passwd "$username" > /dev/null
            if [ $? -ne 0 ]; then
                echo "Failed to reset password."
                exit 1
            fi
            echo "Password reset successfully."
        else
            echo "User does not exist."
            exit 1
        fi

    # List User Accounts
    elif [ "$1" == "-l" ] || [ "$1" == "--list" ]; then
        (echo -e "Username\tUser ID\tHome Directory"; awk -F ':' '{print $1, $3, $6}' /etc/passwd) | column -t

    # Help Option
    elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
        echo "User Account Management Script"
        echo "This script allows you to create, delete, list users, and reset user passwords."
        echo "Usage:"
        echo "  -c, --create    Create a new user account."
        echo "  -d, --delete    Delete an existing user account."
        echo "  -r, --reset     Reset the password of an existing user."
        echo "  -l, --list      List all available user accounts."
        echo "  -h, --help      Display this help message."

    # Invalid Option
    else
        echo "Invalid option. Please use -h or --help for guidance. Example: sh AccountCreation.sh -h or ./AccountCreation.sh -h"
        exit 1
    fi
}

# Calling the main function with the provided argument
UserAccountManagement "$1"