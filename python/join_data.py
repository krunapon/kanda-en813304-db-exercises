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

        join_movies_query = """
        SELECT title, AVG(rating) as average_rating
        FROM ratings
        INNER JOIN movies
        ON movies.id = ratings.movie_id
        GROUP BY movie_id
        ORDER BY average_rating DESC
        """

        with connection.cursor() as cursor:
            cursor.execute(join_movies_query)
            result = cursor.fetchall()
            for row in result:
                print(row)
        print("Joining data successfully")
except Error as e:
    print(f"Database Error: {e}")
except ValueError as e:
    print(f"Configuration Error: {e}")
