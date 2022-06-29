package com.uca.ncapas.models.dtos;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class OrdersDTO implements Serializable {
	
	@Id
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "usuario_id")
	private Integer usuario_id;

	@Column(name = "usuario")
	private String usuario;
	
	@Column(name = "direccion_orden")
	private String direccion_orden;
	
	@Column(name = "precio_total_orden")
	private double precio_total_orden;
	
	@Column(name = "metodo_pago_orden")
	private String metodo_pago_orden;
	
	@Column(name = "pagada_orden")
	private Boolean pagada_orden;
	
	@Column(name = "enviada_orden")
	private Boolean enviada_orden;

	@Column(name = "fecha_creacion")
	Date fecha_creacion;
	
	public Date getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

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

	public String getDireccion_orden() {
		return direccion_orden;
	}

	public void setDireccion_orden(String direccion_orden) {
		this.direccion_orden = direccion_orden;
	}

	public double getPrecio_total_orden() {
		return precio_total_orden;
	}

	public void setPrecio_total_orden(double precio_total_orden) {
		this.precio_total_orden = precio_total_orden;
	}

	public String getMetodo_pago_orden() {
		return metodo_pago_orden;
	}

	public void setMetodo_pago_orden(String metodo_pago_orden) {
		this.metodo_pago_orden = metodo_pago_orden;
	}

	public Boolean getPagada_orden() {
		return pagada_orden;
	}

	public void setPagada_orden(Boolean pagada_orden) {
		this.pagada_orden = pagada_orden;
	}

	public Boolean getEnviada_orden() {
		return enviada_orden;
	}

	public void setEnviada_orden(Boolean enviada_orden) {
		this.enviada_orden = enviada_orden;
	}

}
