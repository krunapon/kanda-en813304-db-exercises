import mysql.connector

# Establish a connection to MySQL
mydb = mysql.connector.connect(host="localhost", user="", password="")

# Create a cursor object
mycursor = mydb.cursor()


# create a database named "<your_name>_<your_id>_db", # such as “manee_5829_db”
def create_database():
    mycursor.execute("CREATE DATABASE manee_5829_db")
    print("Database created successfully")


# Create table
def create_table():
    mycursor.execute("USE manee_5829_db")
    mycursor.execute(
        """
    CREATE TABLE students (
        student_id INT PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        age INT,
        major VARCHAR(50),
        gpa FLOAT
    )
    """
    )
    print("Table 'students' created successfully")


# Problem 1: Insert data
# (5829, "Manee", "Jaidee", 20, "Computer Science", 3.8)
# (1002, "Jane", "Smith", 22, "Engineering", 3.9)
# (1003, "Mike", "Johnson", 21, "Biology", 3.5)


# Problem 2: Select data with conditions


# Problem 3: Update data


# Problem 4: Delete data


# Execute all functions
create_database()
create_table()
# insert_data()
# select_data()
# update_data()
# delete_data()

# Close the cursor and connection
mycursor.close()
mydb.close()
