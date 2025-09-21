import os
from getpass import getpass
from mysql.connector import connect, Error

delete_query = """
DELETE FROM ratings WHERE reviewer_id = 2
"""

try:
    username = os.environ.get("DB_USERNAME")
    password = os.environ.get("DB_PASSWORD")

    if not username or not password:
        raise ValueError("Database credentials not set")
    with connect(
        host="localhost",
        user=username,
        password=password,
        database="movies_db",
    ) as connection:
        with connection.cursor() as cursor:
            cursor.execute(delete_query)
            connection.commit()
except Error as e:
    print(e)
