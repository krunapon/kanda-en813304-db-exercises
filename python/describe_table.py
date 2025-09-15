from getpass import getpass
from mysql.connector import connect, Error

try:
    with connect(
        host="localhost",
        user=input("Enter username: "),
        password=getpass("Enter password: "),
        database=input("Enter database name: "),
    ) as connection:
        print(f"Connect successfully at {connection}")
        show_movies_table_query = "DESCRIBE courses"
        with connection.cursor() as cursor:
            cursor.execute(show_movies_table_query)
            description = cursor.fetchall()
            for row in description:
                print(row)

except Error as e:
    # Handle any connection errors that might occur
    print(f"Connection error: {e}")

finally:
    # Always close connection to prevent resource leaks
    if connection and connection.is_connected():
        connection.close()
        print("Database connection closed.")
