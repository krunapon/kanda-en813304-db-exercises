# Import modules for secure input and MySQL connection
from getpass import getpass
from mysql.connector import connect, Error

try:
    # Connect to MySQL database (connection auto-closes with 'with' statement)
    with connect(
        host="localhost",
        user=input("Enter username: "),
        password=getpass("Enter password: "),  # Hidden password input
        database="movies_db",
    ) as connection:
        print(f"Connected successfully to {connection.database}")

        # Create movies table with auto-increment primary key
        create_movies_table_query = """
            CREATE TABLE IF NOT EXISTS movies(
            id INT AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(100),
            release_year YEAR(4),
            genre VARCHAR(100),
            collection_in_mil INT
        )  
        """
        with connection.cursor() as cursor:
            cursor.execute(create_movies_table_query)
            connection.commit()  # Save changes to database
        print("Table 'movies' created successfully")

        # Create reviewers table with personal info
        create_reviewers_table_query = """
            CREATE TABLE IF NOT EXISTS reviewers(
            id INT AUTO_INCREMENT PRIMARY KEY,
            first_name VARCHAR(100),
            last_name VARCHAR(100)
        )  
        """

        with connection.cursor() as cursor:
            cursor.execute(create_reviewers_table_query)
            connection.commit()  # Save changes to database
        print("Table 'reviewers' created successfully")

        # Create ratings table with foreign key relationships
        create_ratings_table_query = """
            CREATE TABLE IF NOT EXISTS ratings(
            movie_id INT,
            reviewer_id INT,
            rating DECIMAL(2,1),
            FOREIGN KEY(movie_id) REFERENCES movies(id),
            FOREIGN KEY(reviewer_id) REFERENCES reviewers(id),
            PRIMARY KEY(movie_id, reviewer_id)
        ) 
        """

        with connection.cursor() as cursor:
            cursor.execute(create_ratings_table_query)
            connection.commit()  # Save changes to database
        print("Table 'ratings' created successfully")

        print("All tables created successfully!")

# Handle MySQL connection and execution errors
except Error as e:
    print(f"Error: {e}")
    # Connection is still automatically closed even if error occurs

finally:
    # Ensure connection is closed even if error occurs
    if connection and connection.is_connected():
        connection.close()
        print("MySQL connection closed")
