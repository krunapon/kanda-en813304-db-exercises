import os
from mysql.connector import connect, Error

try:
    username = os.environ.get("DB_USERNAME")
    password = os.environ.get("DB_PASSWORD")

    if not username or not password:
        raise ValueError("Database credentials not set in environment variables")

    with connect(
        host="localhost",
        user=username,
        password=password,
        database="movies_db",
    ) as connection:
        print(f"Connected successfully at {connection}")

        filter_movies_query = """
        SELECT title, collection_in_mil
        FROM movies
        WHERE collection_in_mil > 300
        """

        with connection.cursor() as cursor:
            cursor.execute(filter_movies_query)
            result = cursor.fetchall()
            for row in result:
                print(row)
        print("Filtering data from table 'movies' successfully")
except Error as e:
    print(f"Database Error: {e}")
except ValueError as e:
    print(f"Configuration Error: {e}")
