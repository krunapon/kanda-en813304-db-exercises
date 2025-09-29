from mysql.connector import Error
from db_connection import get_db_connection


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
