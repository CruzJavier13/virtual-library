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
