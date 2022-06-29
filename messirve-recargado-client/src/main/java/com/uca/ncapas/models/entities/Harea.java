package com.uca.ncapas.models.entities;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "areas")
public class Harea {

	@Id
	@GeneratedValue
    @Basic(fetch = FetchType.EAGER)
    @Column(name = "id")
	private Integer id;
	
	@Column(name = "nombre")
	private String nombre;

	public Harea() {
		super();
	}

	public Harea(String nombre) {
		super();
		this.nombre = nombre;
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
