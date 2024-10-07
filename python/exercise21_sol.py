import mysql.connector

# Establish a connection to MySQL
mydb = mysql.connector.connect(host="localhost", user="root", password="MeeSati4$")

# Create a cursor object
mycursor = mydb.cursor()


# Create database
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
def insert_data():
    sql = "INSERT INTO students (student_id, first_name, last_name, age, major, gpa) VALUES (%s, %s, %s, %s, %s, %s)"
    values = [
        (5829, "Manee", "Jaidee", 20, "Computer Science", 3.8),
        (1002, "Jane", "Smith", 22, "Engineering", 3.9),
        (1003, "Mike", "Johnson", 21, "Biology", 3.5),
    ]
    mycursor.executemany(sql, values)
    mydb.commit()
    print(f"{mycursor.rowcount} rows were inserted.")


# Problem 2: Select data with conditions
def select_data():
    mycursor.execute(
        "SELECT * FROM students WHERE major = 'Computer Science' OR gpa > 3.7"
    )
    result = mycursor.fetchall()
    for row in result:
        print(row)


# Problem 3: Update data
def update_data():
    sql = "UPDATE students SET age = %s WHERE student_id = %s"
    val = (23, 1002)
    mycursor.execute(sql, val)
    mydb.commit()
    print(f"{mycursor.rowcount} record(s) affected")


# Problem 4: Delete data
def delete_data():
    sql = "DELETE FROM students WHERE student_id = %s"
    val = (1003,)
    mycursor.execute(sql, val)
    mydb.commit()
    print(f"{mycursor.rowcount} record(s) deleted")


# Execute all functions
create_database()
create_table()
insert_data()
select_data()
update_data()
delete_data()

# Close the cursor and connection
mycursor.close()
mydb.close()
