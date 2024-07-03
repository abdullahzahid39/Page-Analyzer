
def convert(s):
    f = float(s)
    c = (f - 32) * 5/9
    return c

# Taking user input
user_input = input("Enter temperature in Fahrenheit: ")

# Converting the user input and printing the result
print("Temperature in Celsius:", convert(user_input))
