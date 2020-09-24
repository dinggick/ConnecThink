package com.connecthink.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.connecthink.entity.Position;


public interface PositionRepository extends JpaRepository<Position, Integer> {

}
