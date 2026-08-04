CREATE TABLE employees (
  id         INTEGER PRIMARY KEY,
  name       TEXT NOT NULL,
  department TEXT,
  salary     NUMERIC
);
INSERT INTO employees (id, name, department, salary) VALUES
  (1,'Anan','Sales',      45000),
  (2,'Bee', 'sales',      52000),   -- lowercase
  (3,'Chai',' Sales',     60000),   -- leading space
  (4,'Dara','Marketing',  NULL),    -- null salary
  (5,'Ekk', 'Marketing',  38000),
  (6,'Fon', NULL,         70000),   -- null department
  (7,'Gan', 'Engineering',40000),
  (8,'Hli', 'Engineering',60000);

CREATE TABLE projects (
  pid INTEGER PRIMARY KEY,
  pname TEXT NOT NULL,
  lead_emp_id INTEGER REFERENCES employees(id)
);
INSERT INTO projects VALUES (1,'Website',5), (2,'Campaign',4);