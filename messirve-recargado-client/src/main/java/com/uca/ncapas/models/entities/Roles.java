package com.uca.ncapas.models.entities;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "roles")
public class Roles {
	
	@Id
	@GeneratedValue
    @Basic(fetch = FetchType.EAGER)
    @Column(name = "id")
	private Integer id;
	
	@Column(name = "nombre")
	private String nombre;
	
	public Roles(String nombre) {
		super();
		this.nombre = nombre;
	}

	public Roles() {
		super();
	}

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
	
	
}
