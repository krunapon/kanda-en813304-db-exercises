from mysql.connector import Error
from db_connection import get_db_connection


def insert_movies():
    """Insert movie data with proper connection handling"""
    connection = None
    cursor = None

    try:
        connection = get_db_connection()
        cursor = connection.cursor()

        print(f"Connected successfully to {connection.server_host}")

        # Use parameterized query for security
        insert_movies_query = """
            INSERT INTO movies (title, release_year, genre, collection_in_mil)
            VALUES (%s, %s, %s, %s)
        """

        movies_data = [
            ("Forrest Gump", 1994, "Drama", 330.2),
            ("3 Idiots", 2009, "Drama", 2.4),
        ]

        print("Inserting data into table movies...")
        cursor.executemany(insert_movies_query, movies_data)
        connection.commit()
        print(f"Successfully inserted {cursor.rowcount} movies into table 'movies'")

    except Error as e:
        print(f"Database Error: {e}")
        if connection:
            connection.rollback()
        raise
    except Exception as e:
        print(f"Unexpected Error: {e}")
        if connection:
            connection.rollback()
        raise
    finally:
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()
            print("Database connection closed")


if __name__ == "__main__":
    insert_movies()
