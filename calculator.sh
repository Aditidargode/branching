#!/bin/bash
while true; do
    # Prompt user for input
    read -p "Please enter the first number: " num1
    read -p "Please enter the second number: " num2
    # Display menu
    echo "Choose an arithmetic operator: "
    echo "1) ADD (+)"
    echo "2) SUBTRACT (-)"
    echo "3) MULTIPLY (*)"
    echo "4) DIVIDE (/)"
    echo "5) EXPONENTIATION (^)"
    echo "6) EXIT"
    read -p "Enter your choice: " Choice
    # Perform calculations based on user choice
    case $Choice in
        1) echo "ADDITION"
           echo "$num1 + $num2 = $((num1 + num2))" ;;
        2) echo "SUBTRACTION"
           echo "$num1 - $num2 = $((num1 - num2))" ;;
        3) echo "MULTIPLICATION"
           echo "$num1 * $num2 = $((num1 * num2))" ;;
        4) echo "DIVISION"
           if [[ $num2 -eq 0 ]]; then
               echo "Error: Division by zero is not allowed."
           else
               echo "$num1 / $num2 = $(echo "scale=2; $num1 / $num2" | bc)"
           fi ;;
        5) echo "EXPONENTIATION"
           echo "$num1 ^ $num2 = $(echo "$num1^$num2" | bc)" ;;
        6) echo "Exiting the calculator. Goodbye!" 
           exit 0 ;;
        *) echo "Invalid choice. Please select a valid operation." ;;
    esac
    echo -e "\nWould you like to perform another calculation? (yes/no)"
    read -p "Enter your choice: " continue_choice
    if [[ "$continue_choice" != "yes" ]]; then
        echo "Exiting the calculator. Goodbye!"
        exit 0
    fi
done

