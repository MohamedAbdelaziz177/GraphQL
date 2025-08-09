package com.Abdelziz26.GraphQl;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.graphql.data.method.annotation.SchemaMapping;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Transactional
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
