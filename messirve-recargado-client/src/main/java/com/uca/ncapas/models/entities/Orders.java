package com.uca.ncapas.models.entities;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "ordenes")
public class Orders {
	
	@Id
	@GeneratedValue
    @Basic(fetch = FetchType.EAGER)
    @Column(name = "id")
	private Integer id;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinColumns({@JoinColumn(name = "usuario_id", referencedColumnName = "id")})
	private User user;
	
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

	@Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
    @JsonFormat(pattern = "dd/MM/yyyy  HH:mm", timezone = "GMT-6")
    @Column(name = "fecha_creacion", nullable = true, updatable = false)
    @CreationTimestamp
    Date fecha_creacion;
	
	public Orders() {
		super();
	}

	public Orders(User user, String direccion_orden, double precio_total_orden, String metodo_pago_orden,
			Boolean pagada_orden, Boolean enviada_orden, Date fecha_creacion) {
		super();
		this.user = user;
		this.direccion_orden = direccion_orden;
		this.precio_total_orden = precio_total_orden;
		this.metodo_pago_orden = metodo_pago_orden;
		this.pagada_orden = pagada_orden;
		this.enviada_orden = enviada_orden;
		this.fecha_creacion = fecha_creacion;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public Date getFecha_creacion() {
		return fecha_creacion;
	}

	public void setFecha_creacion(Date fecha_creacion) {
		this.fecha_creacion = fecha_creacion;
	}

	
}
