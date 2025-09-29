from mysql.connector import Error
from db_connection import get_db_connection


def delete_data():
    connection = None
    cursor = None
    try:
        connection = get_db_connection()

        print(f"Connected successfully to {connection.server_host}")
        delete_query = """
        DELETE FROM ratings WHERE reviewer_id = 2
        """
        with connection.cursor() as cursor:
            cursor.execute(delete_query)
            connection.commit()
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
    delete_data()
