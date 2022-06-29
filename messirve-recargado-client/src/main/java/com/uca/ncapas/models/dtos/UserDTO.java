package com.uca.ncapas.models.dtos;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class UserDTO implements Serializable {
	
	@Id
	@Column(name = "id")
	Integer id;
	@Column(name = "nombre")
    String nombre;
	@Column(name = "rol_id")
    Integer rol_id;
	@Column(name = "rol")
    String rol;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Integer getRol_id() {
		return rol_id;
	}
	public void setRol_id(Integer rol_id) {
		this.rol_id = rol_id;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}
	
	
}
