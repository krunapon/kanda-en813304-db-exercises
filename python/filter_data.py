from mysql.connector import Error
from python.db_connection import get_db_connection


def get_high_grossing_movies(min_collection=300):
    """Get movies with collection above threshold."""

    query = """
    SELECT title, collection_in_mil 
    FROM movies 
    WHERE collection_in_mil > %s
    ORDER BY collection_in_mil DESC
    """

    try:
        with get_db_connection() as connection:
            with connection.cursor() as cursor:
                cursor.execute(query, (min_collection,))
                return cursor.fetchall()
    except Error as e:
        print(f"Database Error: {e}")
        return []


def main():
    try:
        movies = get_high_grossing_movies()
        for title, collection in movies:
            print(f"{title}: ${collection}M")
        print(f"Found {len(movies)} high-grossing movies")
    except ValueError as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    main()
