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

        insert_movies_query = """
            INSERT INTO movies (title, release_year, genre, collection_in_mil)
            VALUES
            ("Forrest Gump", 1994, "Drama", 330.2),
            ("3 Idiots", 2009, "Drama", 2.4)
        """

        print("Trying to insert data into table movies")
        with connection.cursor() as cursor:
            cursor.execute(insert_movies_query)
            connection.commit()
        print("Inserting data into table 'movies' successfully")

except Error as e:
    print(f"Database Error: {e}")
except ValueError as e:
    print(f"Configuration Error: {e}")
