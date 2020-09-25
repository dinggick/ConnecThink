package com.connecthink.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.connecthink.entity.Customer;
import com.connecthink.entity.CustomerAuth;
import com.connecthink.repository.CustomerAuthRepository;
import com.connecthink.repository.CustomerRepository;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private CustomerRepository customerRepository;

	@Autowired
	private CustomerAuthRepository customerAuthRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By Email : " + username);
		
		Customer c = customerRepository.findByEmail(username);
		if(c.getDropStatus() == 0) {
			throw new UsernameNotFoundException("로그인 실패");
		}
		CustomerAuth ca = customerAuthRepository.findById(username).get();
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(ca.getAuth()));
		
		
		return c == null ? null : new CustomUser(c, authorities);
	}

}
