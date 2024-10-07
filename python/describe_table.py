from getpass import getpass
from mysql.connector import connect, Error

try:
    with connect(
        host="localhost",
        user=input("Enter username: "),
        password=getpass("Enter password: "),
        database="movies_db",
    ) as connection:
        print(f"Connect successfully at {connection}")

        show_movies_table_query = "DESCRIBE movies"
        with connection.cursor() as cursor:
            cursor.execute(show_movies_table_query)
            description = cursor.fetchall()
            for row in description:
                print(row)

except Error as e:
    print(f"Error at {e}")
