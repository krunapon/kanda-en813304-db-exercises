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

        insert_reviewers_query = """
        INSERT INTO reviewers
        (first_name, last_name)
        VALUES ( %s, %s )
        """

        reviewers_records = [
            ("Chaitanya", "Baweja"),
            ("Mary", "Cooper"),
            ("John", "Wayne"),
            ("Thomas", "Stoneman"),
            ("Penny", "Hofstadter"),
        ]

        with connection.cursor() as cursor:
            cursor.executemany(insert_reviewers_query, reviewers_records)
            connection.commit()
        print("Inserting many rows into table 'reviewers' successfully")

except Error as e:
    print(f"Database Error: {e}")
except ValueError as e:
    print(f"Configuration Error: {e}")
