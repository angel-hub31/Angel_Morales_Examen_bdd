package com.kakedev.examen.vuelos;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = "com.kakedev.examen")
@EntityScan(basePackages = "com.kakedev.examen.entities") // Asegura que encuentre 'Vuelo'
@EnableJpaRepositories(basePackages = "com.kakedev.examen.repositories")
public class VuelosApplication {

	public static void main(String[] args) {
		SpringApplication.run(VuelosApplication.class, args);
	}

}
