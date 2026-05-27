package com.kakedev.examen.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kakedev.examen.entities.Vuelo;
import com.kakedev.examen.repositories.VueloRepository;

@Service
public class VueloService {
	
	  @Autowired
	    private VueloRepository repository;

	    public Vuelo guardar(Vuelo vuelo) {
	        return repository.save(vuelo);
	    }

	    public List<Vuelo> listar() {
	        return repository.findAll();
	    }

	    public Vuelo buscarPorId(Integer id) {
	        return repository.findById(id).orElse(null);
	    }

	    public Vuelo actualizar(Integer id, Vuelo vuelo) {

	        Vuelo encontrado = buscarPorId(id);

	        if(encontrado != null) {
	            encontrado.setCodigo(vuelo.getCodigo());
	            encontrado.setPrecioBoleto(vuelo.getPrecioBoleto());
	            encontrado.setAsientosDisponibles(vuelo.getAsientosDisponibles());

	            return repository.save(encontrado);
	        }

	        return null;
	    }

	    public boolean eliminar(Integer id) {

	        Vuelo encontrado = buscarPorId(id);

	        if(encontrado != null) {
	            repository.deleteById(id);
	            return true;
	        }

	        return false;
	    }
}
