DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS software;
DROP TABLE IF EXISTS developers;
DROP TABLE IF EXISTS pcs;
DROP TABLE IF EXISTS admins;
DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_name TEXT NOT NULL UNIQUE
);

CREATE TABLE admins (
    admin_id INTEGER PRIMARY KEY AUTOINCREMENT,
    admin_name TEXT NOT NULL UNIQUE
);

CREATE TABLE pcs (
    pc_id INTEGER PRIMARY KEY AUTOINCREMENT,
    pc_name TEXT NOT NULL UNIQUE,
    pc_place TEXT
);

CREATE TABLE developers (
    developer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    developer_name TEXT NOT NULL UNIQUE
);

CREATE TABLE software (
    software_id INTEGER PRIMARY KEY AUTOINCREMENT,
    software_name TEXT NOT NULL,
    developer_id INTEGER,
    FOREIGN KEY (developer_id) REFERENCES developers (developer_id)
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    pc_id INTEGER NOT NULL,
    software_id INTEGER NOT NULL,
    processed_by_admin_id INTEGER,
    FOREIGN KEY (pc_id) REFERENCES pcs (pc_id)
    FOREIGN KEY (software_id) REFERENCES software (software_id)
    FOREIGN KEY (processed_by_admin_id) REFERENCES admins (admin_id)
);

INSERT INTO users (user_name)
VALUES ('Ivanov'), ('Petrov'), ('Sidorov');

INSERT INTO admins (admin_name)
VALUES ('Admin1'), ('Admin2');

INSERT INTO pcs (pc_name, pc_place)
VALUES ('PC1', 'Кабинет № 2'), ('PC2', 'Актовый зал');

INSERT INTO developers (developer_name)
VALUES ('Microsoft'), ('Oracle');

INSERT INTO software (software_name, developer_id)
VALUES ('Windows 11', 1);

INSERT INTO orders (user_id, pc_id, software_id, processed_by_admin_id)
VALUES (2, 1, 1, 1);
