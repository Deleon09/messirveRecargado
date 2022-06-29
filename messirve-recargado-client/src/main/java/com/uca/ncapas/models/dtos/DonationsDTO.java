package com.uca.ncapas.models.dtos;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class DonationsDTO implements Serializable {
	
	@Id
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "usuario_id")
	private Integer usuario_id;
	
	@Column(name = "usuario")
	private String usuario; 
	
	@Column(name = "monto_donacion")
	private double monto_donacion;
	
	@Column(name = "mensaje_donacion")
	private String mensaje_donacion;
	
	@Column(name = "harea_id")
	private Integer harea_id;
	
	@Column(name = "harea")
	private String harea;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUsuario_id() {
		return usuario_id;
	}

	public void setUsuario_id(Integer usuario_id) {
		this.usuario_id = usuario_id;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public double getMonto_donacion() {
		return monto_donacion;
	}

	public void setMonto_donacion(double monto_donacion) {
		this.monto_donacion = monto_donacion;
	}

	public String getMensaje_donacion() {
		return mensaje_donacion;
	}

	public void setMensaje_donacion(String mensaje_donacion) {
		this.mensaje_donacion = mensaje_donacion;
	}

	public Integer getHarea_id() {
		return harea_id;
	}

	public void setHarea_id(Integer harea_id) {
		this.harea_id = harea_id;
	}

	public String getHarea() {
		return harea;
	}

	public void setHarea(String harea) {
		this.harea = harea;
	} 

	

}
