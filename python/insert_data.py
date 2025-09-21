import os
from dotenv import load_dotenv
from mysql.connector import connect, Error

# Load environment variables from .env file
env_path = os.path.join(os.path.dirname(__file__), ".env")
print(f"env_path is {env_path}")
load_dotenv(dotenv_path=env_path, override=True)


def get_db_connection():
    """Create database connection with proper configuration"""
    return connect(
        host=os.environ.get("DB_HOST", "localhost"),
        user=os.environ["DB_USERNAME"],
        password=os.environ["DB_PASSWORD"],
        database=os.environ.get("DB_NAME", "movies_db"),
        autocommit=False,
        charset="utf8mb4",
    )


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
        # Ensure proper cleanup
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()
            print("Database connection closed")


if __name__ == "__main__":
    insert_movies()
