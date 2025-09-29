from mysql.connector import Error
from db_connection import get_db_connection


def update_data():
    connection = None
    cursor = None
    try:
        connection = get_db_connection()

        print(f"Connected successfully to {connection.server_host}")
        movie_id = input("Enter movie id: ")
        reviewer_id = input("Enter reviewer id: ")
        new_rating = input("Enter new rating: ")
        update_query = """
        UPDATE ratings
        SET rating = "%s"
        WHERE movie_id = "%s" AND reviewer_id = "%s";

        SELECT *
        FROM ratings
        WHERE
            movie_id = "%s" AND reviewer_id = "%s"
        """ % (
            new_rating,
            movie_id,
            reviewer_id,
            movie_id,
            reviewer_id,
        )
        with connection.cursor() as cursor:
            for result in cursor.execute(update_query, multi=True):
                if result.with_rows:
                    print(result.fetchall())
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
    update_data()
