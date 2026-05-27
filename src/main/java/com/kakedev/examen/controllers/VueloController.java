package com.kakedev.examen.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kakedev.examen.entities.Vuelo;
import com.kakedev.examen.services.VueloService;

@RestController
@RequestMapping("/api/vuelos")
public class VueloController {
	@Autowired
    private VueloService service;

    @PostMapping
    public ResponseEntity<?> guardar(@RequestBody Vuelo vuelo){

        try {

            Vuelo nuevo = service.guardar(vuelo);

            return ResponseEntity.status(HttpStatus.CREATED).body(nuevo);

        } catch (Exception e) {

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al guardar");
        }
    }

    @GetMapping
    public ResponseEntity<?> listar(){

        try {

            List<Vuelo> lista = service.listar();

            return ResponseEntity.ok(lista);

        } catch (Exception e) {

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al listar");
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> buscar(@PathVariable Integer id){

        Vuelo vuelo = service.buscarPorId(id);

        if(vuelo != null) {
            return ResponseEntity.ok(vuelo);
        }

        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body("Vuelo no encontrado");
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> actualizar(@PathVariable Integer id,
                                        @RequestBody Vuelo vuelo){

        try {

            Vuelo actualizado = service.actualizar(id, vuelo);

            if(actualizado != null) {
                return ResponseEntity.ok(actualizado);
            }

            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body("Vuelo no encontrado");

        } catch (Exception e) {

            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Error al actualizar");
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> eliminar(@PathVariable Integer id){

        boolean eliminado = service.eliminar(id);

        if(eliminado) {
            return ResponseEntity.ok("Vuelo eliminado");
        }

        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body("Vuelo no encontrado");
    }

}
