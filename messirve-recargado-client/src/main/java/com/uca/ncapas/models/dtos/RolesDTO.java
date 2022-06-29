package com.uca.ncapas.models.dtos;

public class RolesDTO {
	private Integer rol_id;
	private String nombre_rol;
	
	public RolesDTO(Integer rol_id, String nombre_rol) {
		super();
		this.rol_id = rol_id;
		this.nombre_rol = nombre_rol;
	}

	public RolesDTO() {
		super();
	}

	public Integer getRol_id() {
		return rol_id;
	}

	public void setRol_id(Integer rol_id) {
		this.rol_id = rol_id;
	}

	public String getNombre_rol() {
		return nombre_rol;
	}

	public void setNombre_rol(String nombre_rol) {
		this.nombre_rol = nombre_rol;
	}
}
