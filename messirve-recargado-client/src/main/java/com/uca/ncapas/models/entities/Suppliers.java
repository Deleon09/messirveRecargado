package com.uca.ncapas.models.entities;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "proveedores")
public class Suppliers {
	
	@Id
	@GeneratedValue
    @Basic(fetch = FetchType.EAGER)
    @Column(name = "id")
	private Integer id;
	
	@Column(name = "nombre")
	private String nombre;
	
	@Column(name = "pais_origen")
	private String pais_origen;
	
	public Suppliers(Integer proveedor_id, String nombre_proveedor, String pais_origen_proveedor) {
		super();
		this.nombre = nombre_proveedor;
		this.pais_origen = pais_origen_proveedor;
	}

	public Suppliers() {
		super();
	}

	public Suppliers(String nombre, String pais_origen) {
		super();
		this.nombre = nombre;
		this.pais_origen = pais_origen;
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

	public String getPais_origen() {
		return pais_origen;
	}

	public void setPais_origen(String pais_origen) {
		this.pais_origen = pais_origen;
	}

	
	
}
