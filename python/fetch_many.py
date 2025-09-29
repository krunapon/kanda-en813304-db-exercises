from mysql.connector import Error
from db_connection import get_db_connection


def get_movies(limit=2):
    """Get movies from the database with optional limit."""

    query = """
    SELECT *
    FROM movies
    LIMIT %s
    """

    try:
        with get_db_connection() as connection:
            with connection.cursor() as cursor:
                cursor.execute(query, (limit,))
                return cursor.fetchall()
    except Error as e:
        print(f"Database Error: {e}")
        return []


def get_all_movies():
    """Get all movies from the database."""

    query = """
    SELECT *
    FROM movies
    """

    try:
        with get_db_connection() as connection:
            with connection.cursor() as cursor:
                cursor.execute(query)
                return cursor.fetchall()
    except Error as e:
        print(f"Database Error: {e}")
        return []


def main():
    try:
        # Get limited number of movies
        movies = get_movies(2)

        print("Movies (limited):")
        for row in movies:
            print(row)

        print(f"\nFound {len(movies)} movies")
        print("Filtering data from table 'movies' successfully")

    except ValueError as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    main()
