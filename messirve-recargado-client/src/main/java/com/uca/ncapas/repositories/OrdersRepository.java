package com.uca.ncapas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.ncapas.models.entities.Orders;

public interface OrdersRepository extends JpaRepository<Orders, Integer> {

}
