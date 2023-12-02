USE db_library;

DELIMITER //

CREATE PROCEDURE InsertOrUpdateUser(
    IN p_user_card VARCHAR(16),
    IN p_first_name VARCHAR(80),
    IN p_last_name VARCHAR(80),
    IN p_address_user VARCHAR(255),
    IN p_cell_phone VARCHAR(20),
    IN p_email_user VARCHAR(255)
)
BEGIN
    DECLARE user_exists INT;

    -- Verificar si el usuario ya existe
    SELECT COUNT(*) INTO user_exists FROM tbl_user WHERE user_card = p_user_card;

    IF user_exists > 0 THEN
        -- Actualizar el usuario existente
        UPDATE tbl_user
        SET
            first_name = p_first_name,
            last_name = p_last_name,
            address_user = p_address_user,
            cell_phone = p_cell_phone,
            email_user = p_email_user
        WHERE user_card = p_user_card;
    ELSE
        -- Insertar nuevo usuario
        INSERT INTO tbl_user (user_card, first_name, last_name, address_user, cell_phone, email_user)
        VALUES (p_user_card, p_first_name, p_last_name, p_address_user, p_cell_phone, p_email_user);
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE InsertOrUpdateAuthUser(
    p_num_user INT,
    p_name_user VARCHAR(16),
    p_password VARCHAR(255),
    p_date_login DATE,
    p_last_login DATE
)
BEGIN
    DECLARE user_count INT;

    -- Verificar si el usuario existe
    SELECT COUNT(*) INTO user_count
    FROM tbl_auth_user
    WHERE num_user = p_num_user;

    -- Si el usuario existe, actualizar
    IF user_count > 0 THEN
        UPDATE tbl_auth_user
        SET
            name_user = p_name_user,
            password = p_password,
            date_login = p_date_login,
            last_login = p_last_login
        WHERE num_user = p_num_user;
    ELSE
        -- Si el usuario no existe, insertar
        INSERT INTO tbl_auth_user (num_user, name_user, password, date_login, last_login)
        VALUES (p_num_user, p_name_user, p_password, p_date_login, p_last_login);
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE InsertOrUpdateAuthor(
    p_num_author INT,
    p_first_name VARCHAR(255),
    p_last_name VARCHAR(255),
    p_birthdate DATE,
    p_nationality VARCHAR(120),
    p_gender_author VARCHAR(1)
)
BEGIN
    DECLARE author_count INT;

    -- Verificar si el autor existe
    SELECT COUNT(*) INTO author_count
    FROM tbl_author
    WHERE num_author = p_num_author;

    -- Si el autor existe, actualizar
    IF author_count > 0 THEN
        UPDATE tbl_author
        SET
            first_name = p_first_name,
            last_name = p_last_name,
            birthdate = p_birthdate,
            nationality = p_nationality,
            gender_author = p_gender_author
        WHERE num_author = p_num_author;
    ELSE
        -- Si el autor no existe, insertar
        INSERT INTO tbl_author (num_author, first_name, last_name, birthdate, nationality, gender_author)
        VALUES (p_num_author, p_first_name, p_last_name, p_birthdate, p_nationality, p_gender_author);
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE InsertOrUpdateAvailability(
    p_num_book INT,
    p_amount INT,
    p_num_access INT,
    p_availability INT
)
BEGIN
    DECLARE availability_count INT;

    -- Verificar si la disponibilidad existe
    SELECT COUNT(*) INTO availability_count
    FROM tbl_availability
    WHERE num_book_id = p_num_book;

    -- Si la disponibilidad existe, actualizar
    IF availability_count > 0 THEN
        UPDATE tbl_availability
        SET
            amount = p_amount,
            num_access_id = p_num_access,
            availability = p_availability
        WHERE num_book_id = p_num_book;
    ELSE
        -- Si la disponibilidad no existe, insertar
        INSERT INTO tbl_availability (num_book_id, amount, num_access_id, availability)
        VALUES (p_num_book, p_amount, p_num_access, p_availability);
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE InsertOrUpdateBook(
    p_title_book VARCHAR(40),
    p_gender_id INT,
    p_author_id INT,
    p_edition_book VARCHAR(8),
    p_publication_date DATE,
    p_editorial_id INT,
    p_descriptions VARCHAR(255)
)
BEGIN
    DECLARE book_count INT;

    -- Verificar si el libro existe
    SELECT COUNT(*) INTO book_count
    FROM tbl_book
    WHERE title_book = p_title_book;

    -- Si el libro existe, actualizar
    IF book_count > 0 THEN
        UPDATE tbl_book
        SET
            gender_id = p_gender_id,
            author_id = p_author_id,
            edition_book = p_edition_book,
            publication_date = p_publication_date,
            editorial_id = p_editorial_id,
            descriptions = p_descriptions
        WHERE title_book = p_title_book;
    ELSE
        -- Si el libro no existe, insertar
        INSERT INTO tbl_book (title_book, gender_id, author_id, edition_book, publication_date, editorial_id, descriptions)
        VALUES (p_title_book, p_gender_id, p_author_id, p_edition_book, p_publication_date, p_editorial_id, p_descriptions);
    END IF;
END //

DELIMITER ;

CREATE PROCEDURE InsertForNumBook(
    P_num_book INT,
    p_title_book VARCHAR(40),
    p_gender_id INT,
    p_author_id INT,
    p_edition_book VARCHAR(8),
    p_publication_date DATE,
    p_editorial_id INT,
    p_descriptions VARCHAR(255)
)
BEGIN
    UPDATE tbl_book
        SET
            title_book = p_title_book
            gender_id = p_gender_id,
            author_id = p_author_id,
            edition_book = p_edition_book,
            publication_date = p_publication_date,
            editorial_id = p_editorial_id,
            descriptions = p_descriptions
         WHERE num_book = P_num_book;
END;


