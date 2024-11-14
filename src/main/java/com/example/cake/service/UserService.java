package com.example.cake.service;

import java.util.*;

import org.springframework.stereotype.Service;

import com.example.cake.domain.Role;
import com.example.cake.domain.User;
import com.example.cake.domain.dto.RegisterDTO;
import com.example.cake.repository.RoleRepository;
import com.example.cake.repository.UserRepository;

@Service
public class UserService {
    public final UserRepository userRepository;
    public final RoleRepository roleRepository;
    public RegisterDTO registerDTO;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public void registerUser() {
        registerDTO = new RegisterDTO();
        // Sử dụng registerDTO tại đây
    }

    public User handleSaveUser(User user) {
        return userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public List<User> getAllUsersByEmail() {
        return userRepository.findAll();
    }

    public User getUserById(long id) {
        return userRepository.findById(id);
    }

    public void deleteUserById(long id) {
        userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return roleRepository.findByName(name);
    }

    public User RegisterDTOtoUser(RegisterDTO dto) {
        User user = new User();
        user.setFullName(dto.getFirstName() + " " + dto.getLastName());
        user.setEmail(dto.getEmail());
        user.setPassword(dto.getPassword());
        return user;
    }

    public boolean checkEmailExist(String email) {
        return userRepository.existsByEmail(email);
    }
}
