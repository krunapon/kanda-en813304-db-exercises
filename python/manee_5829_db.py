from mysql.connector import Error
from db_connection import get_db_connection


def create_database():
    """Create a database named manee_5829_db"""
    mydb = get_db_connection()
    try:
        with mydb.cursor() as cursor:
            cursor.execute("CREATE DATABASE IF NOT EXISTS manee_5829_db")
            print("Database created successfully")
    finally:
        mydb.close()


def create_table():
    """Create students table in the database"""
    mydb = get_db_connection(db_name="manee_5829_db")
    try:
        with mydb.cursor() as cursor:
            cursor.execute(
                """
                CREATE TABLE IF NOT EXISTS students (
                    student_id INT PRIMARY KEY,
                    first_name VARCHAR(50),
                    last_name VARCHAR(50),
                    age INT,
                    major VARCHAR(50),
                    gpa FLOAT
                )
            """
            )
            mydb.commit()
            print("Table 'students' created successfully")
    finally:
        mydb.close()


def insert_data():
    """Problem 1: Insert data into students table"""
    mydb = get_db_connection(db_name="manee_5829_db")
    try:
        with mydb.cursor() as cursor:
            students_data = [
                (5829, "Manee", "Jaidee", 20, "Computer Science", 3.8),
                (1002, "Jane", "Smith", 22, "Engineering", 3.9),
                (1003, "Mike", "Johnson", 21, "Biology", 3.7),
            ]

            insert_query = """    
                INSERT INTO students 
                (student_id, first_name, last_name, age, major, gpa) 
                VALUES (%s, %s, %s, %s, %s, %s)
            """

            cursor.executemany(insert_query, students_data)
            mydb.commit()
            print(f"Inserted {cursor.rowcount} records successfully")
    finally:
        mydb.close()


def select_data():
    """Problem 2: Select data with conditions"""
    mydb = get_db_connection(db_name="manee_5829_db")
    try:
        with mydb.cursor() as cursor:
            # Example: Select students with GPA > 3.6
            cursor.execute(
                """
                SELECT student_id, first_name, last_name, major, gpa 
                FROM students 
                WHERE gpa > %s
                ORDER BY gpa DESC
            """,
                (3.6,),
            )

            results = cursor.fetchall()
            print("\nStudents with GPA > 3.6:")
            print(
                f"{'ID':<5}{'First Name':<15}{'Last Name':<15}{'Major':<20}{'GPA':<5}"
            )
            print("-" * 70)
            for row in results:
                print(f"{row[0]:<5}{row[1]:<15}{row[2]:<15}{row[3]:<20}{row[4]:<5}")
    finally:
        mydb.close()


def update_data():
    """Problem 3: Update data"""
    mydb = get_db_connection(db_name="manee_5829_db")
    try:
        with mydb.cursor() as cursor:
            # Example: Update Mike's GPA to 3.7
            cursor.execute(
                """
                UPDATE students 
                SET age = %s 
                WHERE student_id = %s
            """,
                (23, 1002),
            )

            mydb.commit()
            if cursor.rowcount > 0:
                print(f"Updated {cursor.rowcount} record(s) successfully")
            else:
                print("No records were updated")
    finally:
        mydb.close()


def delete_data():
    """Problem 4: Delete data"""
    mydb = get_db_connection(db_name="manee_5829_db")
    try:
        with mydb.cursor() as cursor:
            # Example: Delete students with age < 21
            cursor.execute("DELETE FROM students WHERE student_id = %s", (1003,))
            mydb.commit()
            if cursor.rowcount > 0:
                print(f"Deleted {cursor.rowcount} record(s) successfully")
            else:
                print("No records were deleted")
    finally:
        mydb.close()


def show_all_students():
    """Display all students in the table"""
    mydb = get_db_connection(db_name="manee_5829_db")
    try:
        with mydb.cursor() as cursor:
            cursor.execute("SELECT * FROM students ORDER BY student_id")
            results = cursor.fetchall()

            print("\nAll Students:")
            print(
                f"{'ID':<5}{'First Name':<15}{'Last Name':<15}{'Age':<10}{'Major':<20}{'GPA':<5}"
            )
            print("-" * 70)
            for row in results:
                print(
                    f"{row[0]:<5}{row[1]:<15}{row[2]:<15}{row[3]:<10}{row[4]:<20}{row[5]:<5}"
                )
    finally:
        mydb.close()


# Execute all functions
if __name__ == "__main__":

    print("Creating database...")
    create_database()

    print("\nCreating table...")
    create_table()

    print("\nInserting data...")
    insert_data()

    print("\nShowing all students after insert:")
    show_all_students()

    print("\nSelecting data with conditions...")
    select_data()

    print("\nUpdating data...")
    update_data()

    print("\nShowing all students after update:")
    show_all_students()

    print("\nDeleting data...")
    delete_data()

    print("\nShowing all students after delete:")
    show_all_students()
