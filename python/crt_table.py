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

        create_movies_table_query = """
            CREATE TABLE IF NOT EXISTS movies(
            id INT AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(100),
            release_year YEAR(4),
            genre VARCHAR(100),
            collection_in_mil INT
        )
        """

        with connection.cursor() as cursor:
            cursor.execute(create_movies_table_query)
            connection.commit()
        print("Table 'movies' created successfully")

except Error as e:
    print(f"Error at {e}")
