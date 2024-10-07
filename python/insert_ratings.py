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
        insert_ratings_query = """
        INSERT INTO ratings
        (rating, movie_id, reviewer_id)
        VALUES ( %s, %s, %s)
        """

        ratings_records = [
            (6.4, 1, 1),
            (5.6, 2, 2),
            (6.3, 1, 3),
            (5.1, 2, 4),
            (5.0, 1, 5),
        ]

        with connection.cursor() as cursor:
            cursor.executemany(insert_ratings_query, ratings_records)
            connection.commit()
        print("Inserting many rows into table 'reviewers' successfully")

except Error as e:
    print(f"Database Error: {e}")
except ValueError as e:
    print(f"Configuration Error: {e}")
