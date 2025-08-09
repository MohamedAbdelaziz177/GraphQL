# 📌 GraphQL Spring Boot Example

This is a simple **GraphQL API** built with **Spring Boot**.  
The application manages **Posts**, **Comments**, and **Authors**.  

It uses:
- **Spring Boot** for application setup.
- **Spring GraphQL** for API queries.
- **Flyway** for database migrations and seeding data.
- **MySQL** as the database.

---

## 🚀 Features
- Query a post by its ID along with its author and comments.
- Database migrations with **Flyway**.
- Pre-seeded data for quick testing.

---

## 📂 Database Migrations

### **`V1__Create_Table.sql`**
```sql
CREATE TABLE authors (
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
V2__Seed_Data.sql
sql
Copy
Edit
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
📜 GraphQL Schema
schema.graphqls
graphql
Copy
Edit
type Query {
    AllPosts: [Post]
    PostById(id: ID): Post
    PostsByAuthorId(authorId: ID): Post

    Authors: [Author]
    AuthorById(id: ID): Author

    AllComment: [Comment]
    CommentById(id: ID): Comment
    CommentsByPostId(PostId: ID): [Comment]

}

type Author {
    id: ID
    name: String
    phone: String
}

type Post {
    id: ID
    content: String
    comments: [Comment]
    author: Author
}

type Comment {
    id: ID
    content: String
}
🛠 Query Resolver
PostQueryResolver.java
java
Copy
Edit
package com.Abdelziz26.GraphQl;

import lombok.RequiredArgsConstructor;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;
import java.util.List;

public class PostQueryResolver {

    private final PostRepository postRepository;
    private final CommentRepository commentRepository;


    @QueryMapping
    public Post PostById(@Argument Long id)
    {
        return postRepository.findById(id).orElse(null);
    }

    @QueryMapping
    public List<Post> AllPosts()
    {
        return postRepository.findAll();
    }

    @QueryMapping
    public List<Post> postsByAuthorId(@Argument Long authorId)
    {
        return postRepository.findByAuthor_Id(authorId);
    }

    @SchemaMapping
    public List<Comment> comments(Post post)
    {
        return post.getComments();
    }

    @SchemaMapping
    public Author author(Post post)
    {
        return post.getAuthor();
    }
}
🧪 Example GraphQL Query & Output
Query: Get Post By ID
graphql
Copy
Edit
query {
  PostById(id: 1) {
    id
    content
    author {
      name
    }
    comments {
      content
    }
  }
}
Example Output

json
Copy
Edit
{
  "data": {
    "PostById": {
      "id": "1",
      "content": "Intro to GraphQL in Spring Boot",
      "author": { "name": "Ahmed Ali" },
      "comments": [
        { "content": "Great post, very useful!" },
        { "content": "Can you explain fetch joins?" }
      ]
    }
  }
}
▶️ Running the Project
Clone the repository:

bash
Copy
Edit
git clone https://github.com/your-username/graphql-springboot-example.git
Configure your application.properties for MySQL.

Run the application:

bash
Copy
Edit
mvn spring-boot:run
Access GraphQL Playground at:

bash
Copy
Edit
http://localhost:8080/graphiql
