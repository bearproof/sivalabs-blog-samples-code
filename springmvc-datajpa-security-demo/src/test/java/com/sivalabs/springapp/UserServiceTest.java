/**
 *
 */
package com.sivalabs.springapp;

import com.sivalabs.springapp.config.AppConfig;
import com.sivalabs.springapp.entities.Role;
import com.sivalabs.springapp.entities.User;
import com.sivalabs.springapp.services.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.*;

/**
 * @author Siva
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class)
public class UserServiceTest {

    @Autowired
    private UserService userService;

    @Test
    public void findAllUsers() {
        List<User> users = userService.findAll();
        assertNotNull(users);
        assertTrue(!users.isEmpty());
    }

    @Test
    public void findUserById() {
        User user = userService.findUserById(1);
        assertNotNull(user);
    }

    @Test
    public void createUser() {
        List<User> users = userService.findAll();
        if (users != null && users.size() > 0) return;


        User adminUser = new User(0, "Admin User", "admin@admin.com",getHashedPassword("admin") , null);
        Set<Role> adminRolesSet = new HashSet<Role>() {{
            add(new Role("ROLE_ADMIN"));
            add(new Role("ROLE_USER"));
        }};
        adminUser.setRoles(adminRolesSet);
        User savedUser = userService.create(adminUser);
        User newUser = userService.findUserById(savedUser.getId());
        assertEquals("Admin User", newUser.getName());
        assertEquals("admin@admin.com", newUser.getEmail());

        User userUser = new User(0, "User", "user@user.com",getHashedPassword("user") , null);
        Set<Role> userRolesSet = new HashSet<Role>() {{
            add(new Role("USER"));
        }};
        userUser.setRoles(userRolesSet);
        User savedUser2 = userService.create(userUser);
        User newUser2 = userService.findUserById(savedUser2.getId());
        assertEquals("User", newUser2.getName());
        assertEquals("user@user.com", newUser2.getEmail());




    }

    private String getHashedPassword(String blankPassword) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder.encode(blankPassword);
    }


}
