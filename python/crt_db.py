# Import modules for secure input and MySQL connection
from getpass import getpass
from mysql.connector import connect, Error

# Initialize connection variable
connection = None

try:
    # Connect to MySQL server with user credentials
    connection = connect(
        host="localhost",
        user=input("Enter username: "),
        password=getpass("Enter password: "),  # Hidden password input
    )

    # SQL query to create database if it doesn't exist
    create_db_query = "CREATE DATABASE IF NOT EXISTS movies_db"

    # Execute the database creation query
    cursor = connection.cursor()
    cursor.execute(create_db_query)
    print("Database created successfully")

    # Close cursor
    cursor.close()

# Handle MySQL connection and execution errors
except Error as e:
    print(f"Error: {e}")

finally:
    # Ensure connection is closed even if error occurs
    if connection and connection.is_connected():
        connection.close()
        print("MySQL connection closed")
