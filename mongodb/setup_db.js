try {
  db = db.getSiblingDB("sample_db");

  db.users.insertMany([
    { name: "John Doe", age: 30 },
    { name: "Jane Smith", age: 25 },
  ]);

  db.products.createIndex({ name: 1 });

  print("Database setup completed successfully.");
} catch (error) {
  print("An error occurred during database setup:");
  print(error);
}
