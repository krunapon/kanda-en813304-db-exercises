from mysql.connector import Error
from db_connection import get_db_connection


def query_movie_ratings():
    """Query movie ratings with proper connection handling"""
    connection = None
    cursor = None

    try:
        connection = get_db_connection()
        cursor = connection.cursor()

        print(f"Connected successfully to {connection.server_host}")

        # Query to get average ratings for movies
        join_movies_query = """
            SELECT title, AVG(rating) as average_rating
            FROM ratings
            INNER JOIN movies
            ON movies.id = ratings.movie_id
            GROUP BY movie_id
            ORDER BY average_rating DESC
        """

        print("Executing query to get movie ratings...")
        cursor.execute(join_movies_query)
        result = cursor.fetchall()

        print(f"Found {len(result)} movies with ratings:")
        print("-" * 50)
        for title, avg_rating in result:
            print(f"{title}: {avg_rating:.2f}")

        print("Query executed successfully")

    except Error as e:
        print(f"Database Error: {e}")
        raise
    except Exception as e:
        print(f"Unexpected Error: {e}")
        raise
    finally:
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()
            print("Database connection closed")


if __name__ == "__main__":
    query_movie_ratings()
