CREATE TABLE  authors (
                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(255),
                         phone VARCHAR(255)
);

CREATE TABLE posts (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(255),
                       content TEXT,
                       author_id BIGINT,
                       FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE comments (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          content TEXT,
                          author_id BIGINT,
                          post_id BIGINT,
                          FOREIGN KEY (author_id) REFERENCES authors(id),
                          FOREIGN KEY (post_id) REFERENCES posts(id)
);

