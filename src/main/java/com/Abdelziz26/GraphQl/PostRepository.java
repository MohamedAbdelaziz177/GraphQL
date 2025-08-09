package com.Abdelziz26.GraphQl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface PostRepository extends JpaRepository<Post, Long> {

    @Query("SELECT p from Post p WHERE p.author.id = :authorId")
    List<Post> findByAuthor_Id(@Param("authorId") Long authorId);
}
