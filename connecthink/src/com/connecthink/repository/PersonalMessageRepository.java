package com.connecthink.repository;

import org.springframework.data.repository.CrudRepository;

import com.connecthink.entity.PersonalMessage;

public interface PersonalMessageRepository extends CrudRepository<PersonalMessage, Integer> {

}