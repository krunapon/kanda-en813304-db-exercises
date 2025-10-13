db.users.insertMany([
  {
    name: "John Doe",
    age: 30,
    email: "john@example.com",
    status: "active",
    tags: ["sports", "music"],
    address: { city: "New York", country: "USA" },
    scores: [85, 90, 78]
  },
  {
    name: "Jane Smith",
    age: 25,
    email: "jane@example.com",
    status: "inactive",
    tags: ["reading", "art"],
    address: { city: "London", country: "UK" },
    scores: [92, 88, 95]
  },
  {
    name: "Bob Johnson",
    age: 35,
    email: "bob@example.com",
    status: "active",
    tags: ["music", "technology"],
    address: { city: "Paris", country: "France" },
    scores: [75, 80, 85]
  },
  {
    name: "Alice Brown",
    age: 28,
    email: "alice@example.com",
    status: "active",
    tags: ["sports", "technology"],
    address: { city: "Tokyo", country: "Japan" },
    scores: [95, 92, 98]
  },
  {
    name: "Charlie Wilson",
    age: 40,
    email: "charlie@example.com",
    status: "inactive",
    tags: ["reading", "sports"],
    scores: [70, 75, 68]
  }
])
