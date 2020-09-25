package com.connecthink.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Position;
import com.connecthink.repository.PositionRepository;

@Service
public class PositionService {
	@Autowired
	private PositionRepository repository;
	
	public Optional<Position> findByNo(Integer positionNo) {
		return repository.findById(positionNo);
	}
}
