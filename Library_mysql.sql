CREATE DATABASE db_library;

USE db_library;

CREATE TABLE tbl_user(
num_user INT PRIMARY KEY AUTO_INCREMENT,
user_card VARCHAR(16) NOT NULL,
first_name VARCHAR(80) NOT NULL,
last_name VARCHAR(80) NOT NULL,
address_user VARCHAR(255) NOT NULL,
cell_phone VARCHAR(20) NOT NULL,
email_user VARCHAR(255) NOT NULL,
CONSTRAINT uq_email_user UNIQUE(email_user),
CONSTRAINT uq_user_card UNIQUE(user_card)
);
CREATE TABLE tbl_author(
num_author INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
birthdate DATE NOT NULL,
nationality VARCHAR(120) NOT NULL,
gender_author CHAR(1),
CONSTRAINT chk_gender_author CHECK(gender_author IN('F', 'M'))
);

CREATE TABLE tbl_category(
num_category INT PRIMARY KEY AUTO_INCREMENT,
gender VARCHAR(40) NOT NULL,
CONSTRAINT uq_category_gender UNIQUE(gender)
);
CREATE TABLE tbl_editorial(
num_editorial INT PRIMARY KEY AUTO_INCREMENT,
name_editorial VARCHAR(40) NOT NULL,
address_editorial VARCHAR(255) NOT NULL,
email_editorial VARCHAR(255),
phone_number VARCHAR(16)
);
CREATE TABLE tbl_book(
num_book INT PRIMARY KEY AUTO_INCREMENT,
title_book VARCHAR(40) NOT NULL,
gender INT NOT NULL,
author INT NOT NULL,
edition_book CHAR(40) NOT NULL,
publication_date DATE NOT NULL,
editorial INT NOT NULL,
descriptions NVARCHAR(255),
CONSTRAINT fk_book_gender FOREIGN KEY (gender) REFERENCES tbl_category(num_category),
CONSTRAINT fk_book_author FOREIGN KEY (author) REFERENCES tbl_author(num_author),
CONSTRAINT fk_book_editorial FOREIGN KEY (editorial) REFERENCES tbl_editorial(num_editorial)
);
CREATE TABLE tbl_access(
num_access INT PRIMARY KEY AUTO_INCREMENT,
access VARCHAR(80) NOT NULL,
CONSTRAINT uq_access UNIQUE(access)
);
CREATE TABLE tbl_loan(
num_loan INT AUTO_INCREMENT PRIMARY KEY,
num_book INT NOT NULL,
num_user INT NOT NULL,
loan_date DATE NOT NULL,
expected_return_date DATE NOT NULL,
actual_return_date DATE NOT NULL,
access INT NOT NULL,
CONSTRAINT fk_loan_access FOREIGN KEY(access) REFERENCES tbl_access(num_access),
CONSTRAINT fk_loan_book FOREIGN KEY(num_book) REFERENCES tbl_book(num_book),
CONSTRAINT fk_loan_num_user FOREIGN KEY(num_user) REFERENCES tbl_user(num_user)
);
CREATE TABLE tbl_reviews(
num_reviews INT AUTO_INCREMENT PRIMARY KEY,
num_user INT NOT NULL,
num_book INT NOT NULL,
reviews VARCHAR(255),
score FLOAT NOT NULL,
CONSTRAINT fk_reviews_num_user FOREIGN KEY (num_user) REFERENCES tbl_user(num_user),
CONSTRAINT fk_reviews_num_book FOREIGN KEY (num_book) REFERENCES tbl_book(num_book)
);
CREATE TABLE tbl_booking(
num_booking INT AUTO_INCREMENT PRIMARY KEY,
num_book INT NOT NULL,
num_user INT NOT NULL,
date_booking DATE NOT NULL,
CONSTRAINT fk_booking_num_book FOREIGN KEY (num_book) REFERENCES tbl_book(num_book),
CONSTRAINT fk_booking_num_user FOREIGN KEY (num_user) REFERENCES tbl_user(num_user)
);
CREATE TABLE tbl_auth_user(
num_login INT AUTO_INCREMENT PRIMARY KEY,
num_user INT NOT NULL,
name_user VARCHAR(16) NOT NULL,
`password` VARCHAR(255) NOT NULL,
date_login DATE,
last_login DATE,
CONSTRAINT fk_auth_login_num_user FOREIGN KEY(num_user) REFERENCES tbl_user(num_user),
CONSTRAINT uq_auth_login_num_user UNIQUE(num_user),
CONSTRAINT uq_name_user UNIQUE(name_user)
);
CREATE TABLE tbl_action(
num_action INT AUTO_INCREMENT PRIMARY KEY,
action_name VARCHAR(20) NOT NULL,
CONSTRAINT uq_action UNIQUE(action_name)
);
CREATE TABLE tbl_resource(
num_resource INT AUTO_INCREMENT PRIMARY KEY,
resource_name VARCHAR(40) NOT NULL,
CONSTRAINT uq_resource UNIQUE(resource_name)
);
CREATE TABLE tbl_rol(
num_rol INT AUTO_INCREMENT PRIMARY KEY,
name_rol VARCHAR(40) NOT NULL,
CONSTRAINT uq_rol UNIQUE(name_rol)
);
CREATE TABLE tbl_auth(
num_auth INT AUTO_INCREMENT PRIMARY KEY,
num_user INT NOT NULL,
num_rol INT NOT NULL,
CONSTRAINT fk_auth_num_user FOREIGN KEY (num_user) REFERENCES tbl_user(num_user),
CONSTRAINT fk_num_rol FOREIGN KEY (num_rol) REFERENCES tbl_rol(num_rol),
CONSTRAINT uq_auth_num_user UNIQUE(num_user)
);
CREATE TABLE tbl_permission(
num_permission INT AUTO_INCREMENT PRIMARY KEY,
num_rol INT NOT NULL,
num_resource INT NOT NULL,
num_action INT NOT NULL,
CONSTRAINT fk_rol_num FOREIGN KEY (num_rol) REFERENCES tbl_rol(num_rol),
CONSTRAINT fk_num_resource FOREIGN KEY (num_resource) REFERENCES tbl_resource(num_resource),
CONSTRAINT fk_num_action FOREIGN KEY (num_action) REFERENCES tbl_action(num_action)
);
CREATE TABLE tbl_availability(
num_availability INT AUTO_INCREMENT PRIMARY KEY,
num_book INT NOT NULL,
amount INT NOT NULL,
num_access INT NOT NULL,
availability BOOLEAN,
CONSTRAINT FOREIGN KEY (num_book) REFERENCES tbl_book(num_book),
CONSTRAINT FOREIGN KEY (num_access) REFERENCES tbl_access(num_access),
CONSTRAINT ch_num_access CHECK(num_access=1)
);
INSERT INTO tbl_access (access) VALUES ('Fisico'), ('Dijital');

INSERT INTO tbl_user ( user_card, first_name, last_name , address_user, cell_phone, email_user) VALUES   
                     ('udem', 'universidad','managua', 'Managua Belmonte', '+505 00000000', 'udem@edu.com.ni'),
                     ('121247', 'Erick','Cruz', 'Managua Los Martinez', '+505 84259646', 'erickcroz2013@gmail.com'),
                     ('181247', 'Alberto','Linarez', 'Masaya Las Rosas Casa#25', '+505 77240010', 'linarez@gmail.com');

INSERT INTO tbl_auth_user (num_user, name_user, `password`) VALUES
                          (1, 'admin', 'admin'),
                          (2, '121247', '1234');
SELECT * FROM tbl_auth_user;
update tbl_auth_user set `password` = '1234'
--DROP USER db_library@'%';
--drop database db_library;
--USE db_library;
--SHOW TABLES;
--SELECT * FROM tbl_access;
--SELECT * FROM tbl_user;
CREATE USER 'admin_library'@'%';
GRANT USAGE ON db_library.* TO 'admin_library' IDENTIFIED BY 'udem';
--GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON db_library.* TO admin_library IDENTIFIED BY 'udem';
SELECT * FROM mysql.USER;
--DROP USER 'library_user'@'%';
-- Crea el usuario
--CREATE USER 'db_library'@'%' IDENTIFIED BY '1234';
--SHOW GRANTS FOR 'library_user'@'%';
-- Otorga privilegios básicos
--GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE  ON db_library.* TO 'library_user'@'%';
--REVOKE
-- Otorga privilegios para procedimientos almacenados
--GRANT EXECUTE ON PROCEDURE db_library.* TO 'library_user'@'%';

-- Otorga privilegios para funciones
--GRANT EXECUTE ON FUNCTION db_library.* TO 'library_user'@'%';

-- Otorga privilegios para vistas
--GRANT SELECT ON db_library.* TO 'library_user'@'%';

-- Otorga privilegios para triggers
--GRANT TRIGGER ON db_library.* TO 'library_user'@'%';

-- Refresca los privilegios
--FLUSH PRIVILEGES;
