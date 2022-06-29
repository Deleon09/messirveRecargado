package com.uca.ncapas.models.entities;

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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "donaciones")
public class Donations {
	
	@Id
	@GeneratedValue
    @Basic(fetch = FetchType.EAGER)
    @Column(name = "id")
	private Integer id;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinColumns({@JoinColumn(name = "usuario_id", referencedColumnName = "id")})
	private User user;
	
	@Column(name = "monto_donacion")
	private double monto_donacion;
	
	@Column(name = "mensaje_donacion")
	private String mensaje_donacion;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnore
    @JoinColumns({@JoinColumn(name = "harea_id", referencedColumnName = "id")})
	private Harea harea;
	
	public Donations() {
		super();
	}

	public Donations(User user, double monto_donacion, String mensaje_donacion, Harea harea) {
		super();
		this.user = user;
		this.monto_donacion = monto_donacion;
		this.mensaje_donacion = mensaje_donacion;
		this.harea = harea;
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

	public Harea getHarea() {
		return harea;
	}

	public void setHarea(Harea harea) {
		this.harea = harea;
	}

}
