package com.uca.ncapas.models.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "usuarios")
public class User implements Serializable {
	
	@Id
	@GeneratedValue
	private Integer id;
	
	@Column(unique=true)
	private String nombre;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinColumns({@JoinColumn(name = "rol_id", referencedColumnName = "id")})
	private Roles roles;
	
	@Column(name = "contrasena")
	private String contrasena;
	
	public User() {
		super();
	}

	public User(String nombre, Roles roles, String contrasena) {
		super();
		this.nombre = nombre;
		this.roles = roles;
		this.contrasena = contrasena;
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

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public Roles getRoles() {
		return roles;
	}

	public void setRoles(Roles roles) {
		this.roles = roles;
	}

}
