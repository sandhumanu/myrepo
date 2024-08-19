#!/bin/bash

# Function to check if a number is prime
is_prime() {
    local num=$1

    # 1 is not a prime number
    if [ "$num" -le 1 ]; then
        echo "$num is not a prime number."
        return 1
    fi

    # 2 and 3 are prime numbers
    if [ "$num" -le 3 ]; then
        echo "$num is a prime number."
        return 0
    fi

    # Check divisibility by 2 or 3
    if [ $((num % 2)) -eq 0 ] || [ $((num % 3)) -eq 0 ]; then
        echo "$num is not a prime number."
        return 1
    fi

    # Check divisibility from 5 to sqrt(num)
    i=5
    while [ $((i * i)) -le "$num" ]; do
        if [ $((num % i)) -eq 0 ] || [ $((num % (i + 2))) -eq 0 ]; then
            echo "$num is not a prime number."
            return 1
        fi
        i=$((i + 6))
    done

    echo "$num is a prime number."
    return 0
}

# Read number from user
read -p "Enter a number: " number

# Call the function and check if the number is prime
is_prime "$number"

