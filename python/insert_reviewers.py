from mysql.connector import Error
from db_connection import get_db_connection


def insert_reviewers():
    """Insert reviewer data with proper connection handling"""
    connection = None
    cursor = None

    try:
        connection = get_db_connection()
        cursor = connection.cursor()

        print(f"Connected successfully to {connection.server_host}")

        # Use parameterized query for security
        insert_reviewers_query = """
            INSERT INTO reviewers (first_name, last_name)
            VALUES (%s, %s)
        """

        reviewers_data = [
            ("Chaitanya", "Baweja"),
            ("Mary", "Cooper"),
            ("John", "Wayne"),
            ("Thomas", "Stoneman"),
            ("Penny", "Hofstadter"),
        ]

        print("Inserting data into table reviewers...")
        cursor.executemany(insert_reviewers_query, reviewers_data)
        connection.commit()
        print(
            f"Successfully inserted {cursor.rowcount} reviewers into table 'reviewers'"
        )

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
    insert_reviewers()
