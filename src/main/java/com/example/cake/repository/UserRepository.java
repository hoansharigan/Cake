package com.example.cake.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.cake.domain.User;
import java.util.List;


@Repository
public interface UserRepository  extends JpaRepository<User ,Long> {
    User save(User user);
    List<User> findByEmail(String email);
}
