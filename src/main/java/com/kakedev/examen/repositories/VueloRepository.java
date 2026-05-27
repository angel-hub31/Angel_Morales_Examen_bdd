package com.kakedev.examen.repositories;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.kakedev.examen.entities.Vuelo;

public interface VueloRepository extends JpaRepository<Vuelo, Integer>{
	
	List<Vuelo> findByPrecioBoletoLessThan(BigDecimal precio);

	
}
