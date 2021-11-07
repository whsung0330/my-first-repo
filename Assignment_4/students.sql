CREATE TABLE `student_number`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `year_admission` INT NOT NULL,
    `major` INT NOT NULL,
    `individual` INT NOT NULL
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `student`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(8) NOT NULL,
    `student_number` INT NOT NULL,
    `phone_number` INT NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `credits` INT DEFAULT 0,
    `average_grade` FLOAT NOT NULL,
    `is_enrolled` TINYINT(1) DEFAULT 1,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`student_number`)
    REFERENCES `student_number`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;