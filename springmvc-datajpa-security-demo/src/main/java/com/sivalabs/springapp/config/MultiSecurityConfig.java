package com.sivalabs.springapp.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * User: Adi Ursu
 * Date: 6/10/2014
 * Time: 4:32 PM
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class MultiSecurityConfig {
    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    // Since MultiSecurityConfig does not extend GlobalMethodSecurityConfiguration and
    // define an AuthenticationManager, it will try using the globally defined
    // AuthenticationManagerBuilder to create one

    // The @Enable*Security annotations create a global AuthenticationManagerBuilder
    // that can optionally be used for creating an AuthenticationManager that is shared
    // The key to using it is to use the @Autowired annotation
    @Autowired
    public void registerSharedAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(customUserDetailsService).passwordEncoder(new BCryptPasswordEncoder());
    }

    @Configuration
    @Order(1)
    public static class ApiWebSecurityConfigurationAdapter extends WebSecurityConfigurerAdapter {
        // Since we didn't specify an AuthenticationManager for this class,
        // the global instance is used


        protected void configure(HttpSecurity http) throws Exception {
            http.antMatcher("/rest/**").httpBasic();
        }
    }

    @Configuration
    public static class FormWebSecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {
        // Since we didn't specify an AuthenticationManager for this class,
        // the global instance is used

        public void configure(WebSecurity web) throws Exception {
            web.ignoring().antMatchers("/resources/**"); // #3
        }

        protected void configure(HttpSecurity http) throws Exception {
            http.csrf().disable().authorizeRequests().antMatchers("/login", "/login/form**", "/register", "/logout").permitAll() // #4
                    .antMatchers("/admin", "/admin/**").hasRole("ADMIN") // #6
                    .anyRequest().authenticated() // 7
                    .and().formLogin()  // #8
                    .loginPage("/login/form") // #9
                    .loginProcessingUrl("/login").failureUrl("/login/form?error").permitAll(); // #5
        }
    }

}