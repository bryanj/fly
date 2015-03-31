# Fly Programming Language

Fly Programming Language is an esoteric programming language where programs look like flight schedules.

## Basic Syntax

A program consists of several lines, where each line represents one instruction. The line below is from the very basic example of Hello World program.

    06:30 OZ562 From Rome

A line consists of four parts, separated by space character. The first part is time (or label), used for branching. The second part is flight number, which represents what operation should be done with this line. The third part is an indicator which shows the direction of the operation, and the last part is the name of the city which denotes the index of the variable.

## Operation List

Currently, there are six operations defined. Each operation is distinguished by the first letter of the flight number.

* Assignment

Assignment operation stores the integer value of the flight number. For example, the line below

    00:00 AA123 To New York

assigns the value 123 to New York.

* Input

Input operation stores the input. The type of the input is decided by the parity of the flight number, where odd value is for integer and even value is for character. For example, the line below

    01:00 IB031 To Madrid

gets the integral input and stores its value to Madrid.

* Output

Output operation prints the output. If the flight number is odd, the integral value itself is printed. Otherwise, the character corresponding the value is printed. For example, the line below

    02:00 OZ101 From Seoul

prints the integral value of Seoul.

* Push/Pop

Push/Pop operation deals with the stack. The type of the operation is decided by the indicator, where 'From' represents push operation and 'To' represents pop operation. For example, the lines below

    03:00 PA102 From Los Angeles
    03:10 PA103 To San Francisco

copy the value of Los Angeles to San Francisco.

* Calculate

Calculate operation performs binary operation with the stack values. The type of the operation is determined by the remainder of the flight number divided by 5. The remainder value of 0, 1, 2, 3, and 4 represents Addition, subtraction, multiplication, division, and modulo operation, respectively. For example, the lines below

    04:00 PA201 From London
    04:10 PA202 From Paris
    04:20 CA339 To Rome

store the remainder of London divided by Paris to Rome.

* Branch

Branch operation moves the pointer of the program conditionally. If the popped value from the stack is greater than 0, the program pointer moves to the line indicated by the flight number. For example, the line below

    05:00 BA200 From London

moves the pointer to the line with "02:00" if the popped value is greater than 0.

The lines where the flight number begins with characters not mentioned above are ignored.

## Example Program

The program shown below calculates the sum of two integer inputs.

    00:00 IB103 To Madrid
    00:30 IB107 To Frankfurt
    01:00 PA113 From Madrid
    01:30 PA115 From Frankfurt
    01:40 CA330 To Seoul
    02:00 OZ501 From Seoul
