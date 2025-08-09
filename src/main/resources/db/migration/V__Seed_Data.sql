USE graphql;

INSERT INTO authors (id, name, phone) VALUES
                                          (1, 'Ahmed Ali', '01012345678'),
                                          (2, 'Sara Mohamed', '01123456789'),
                                          (3, 'Omar Hassan', '01234567890');

INSERT INTO posts (id, title, content, author_id) VALUES
                                                        (1, 'GraphQL with Spring Boot', 'Intro to GraphQL in Spring Boot', 1),
                                                        (2, 'JPA Lazy vs Eager', 'Understanding fetch types in JPA', 1),
                                                        (3, 'MySQL Tips', 'Best practices for MySQL performance', 2),
                                                        (4, 'Java Streams', 'Working with Java 8 streams effectively', 3);

INSERT INTO comments (id, content, author_id, post_id) VALUES
                                                               (1, 'Great post, very useful!', 2, 1),
                                                               (2, 'Can you explain fetch joins?', 3, 1),
                                                               (3, 'This helped me understand lazy loading.', 1, 2),
                                                               (4, 'Nice tips!', 1, 3),
                                                               (5, 'I love streams in Java!', 2, 4),
                                                               (6, 'Could you show more examples?', 3, 4);
