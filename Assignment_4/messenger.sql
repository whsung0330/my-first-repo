CREATE TABLE `users`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `userID` VARCHAR(20) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `nickname` VARCHAR(20) NOT NULL,
    `profile_picture` VARCHAR(200) NOT NULL,
    `profile_message` VARCHAR(200) NOT NULL,
    `is_deleted` TINYINT(1) DEFAULT 0,
    `signup_date` DATE NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `channel_creator` INT NOT NULL,
    `channel_link` VARCHAR(200) NOT NULL,
    `number_of_people` INT NOT NULL,
    `is_deleted` TINYINT(1) DEFAULT 0,
    `created_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`channel_creator`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `chat_message` VARCHAR(200) NOT NULL,
    `chat_sender` INT NOT NULL,
    `channel` INT NOT NULL,
    `chat_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`chat_sender`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel`)
    REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`followee`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `block_by` INT NOT NULL,
    `blocked_user` INT NOT NULL,
    `block_date` DATE NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`block_by`)
    REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_user`)
    REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
