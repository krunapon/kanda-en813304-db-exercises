from getpass import getpass
from mysql.connector import connect, Error

# Initialize connection variable for proper cleanup
connection = None

try:
    # Establish database connection
    # Never hardcode credentials - always prompt user
    connection = connect(
        host="localhost",
        user=input("Enter username: "),
        password=getpass("Enter password: "),  # Hidden password input
        database=input("Enter database name: "),
    )

    # Verify successful connection
    if connection.is_connected():
        print("Database connection successful!")
        # Your database operations would go here

except Error as e:
    # Handle any connection errors that might occur
    print(f"Connection error: {e}")

finally:
    # Always close connection to prevent resource leaks
    if connection and connection.is_connected():
        connection.close()
        print("Database connection closed.")
