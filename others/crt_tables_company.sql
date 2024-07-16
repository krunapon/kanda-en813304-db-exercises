CREATE TABLE Emp (
    eid INTEGER PRIMARY KEY,
    ename VARCHAR(255),
    age INTEGER,
    salary REAL
);

CREATE TABLE Dept (
    did INTEGER PRIMARY KEY,
    dname VARCHAR(255),
    budget REAL,
    managerid INTEGER,
    FOREIGN KEY (managerid) REFERENCES Emp(eid) ON DELETE SET NULL
);

CREATE TABLE Works (
    eid INTEGER,
    did INTEGER,
    pcttime INTEGER,
    PRIMARY KEY (eid, did),
    FOREIGN KEY (eid) REFERENCES Emp(eid) ON DELETE CASCADE,
    FOREIGN KEY (did) REFERENCES Dept(did) ON DELETE CASCADE
);
