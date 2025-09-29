from mysql.connector import Error
from python.db_connection import get_db_connection


def select_movies():
    """Select and display all movies from the database"""
    try:
        with get_db_connection() as connection:
            with connection.cursor() as cursor:
                select_movies_query = "SELECT * FROM movies ORDER BY release_year DESC"
                print("Executing query to fetch all movies...")
                cursor.execute(select_movies_query)
                result = cursor.fetchall()

                if result:
                    print(f"\nFound {len(result)} movies:")
                    print("-" * 80)

                    # Get column names for better display
                    column_names = [desc[0] for desc in cursor.description]
                    print(
                        f"{'ID':<5} {'Title':<25} {'Year':<6} {'Genre':<15} {'Collection (M)':<15}"
                    )
                    print("-" * 80)
                    for row in result:
                        print(
                            f"{row[0]:<5} {row[1]:<25} {row[2]:<6} {row[3]:<15} ${row[4]:<14}"
                        )
                else:
                    print("No movies found in the database")
            print(f"\nReading data from table 'movies' completed successfully")
    except Error as e:
        print(f"Database Error: {e}")
        if hasattr(e, "errno"):
            print(f"Error Code: {e.errno}")
    except Exception as e:
        print(f"Unexpected Error: {e}")
    finally:
        print("Database operation completed")


if __name__ == "__main__":
    select_movies()
