CREATE TABLE IF NOT EXISTS `attorneys` (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100) DEFAULT NULL,
    lastname VARCHAR(100) DEFAULT NULL,


);

CREATE TABLE IF NOT EXISTS `clients` (
    attorney_id INT UNSIGNED NOT NULL,

    FOREIGN KEY (attorney_id)
        REFERENCES `attorneys`(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `cases` (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    taken_date DATETIME DEFAULT NULL,
    settled_date DATETIME DEFAULT NULL,
);

-- Case can have multiple settlements
CREATE TABLE IF NOT EXISTS `settlements` (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    case_id INT UNSIGNED NOT NULL,

    settled_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (case_id)
        REFERENCES `cases`(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `articles` (

    min_sentence_days INT UNSIGNED DEFAULT NULL,
    max_sentence_days INT UNSIGNED DEFAULT NULL,

);

CREATE TABLE IF NOT EXISTS `cases_to_articles` (
    case_id INT UNSIGNED NOT NULL,
    article_id INT UNSIGNED NOT NULL,

    FOREIGN KEY (case_id)
        REFERENCES `cases`(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    FOREIGN KEY (article_id)
        REFERENCES `articles`(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
);
