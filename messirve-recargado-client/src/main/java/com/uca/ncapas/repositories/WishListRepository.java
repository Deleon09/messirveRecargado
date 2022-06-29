package com.uca.ncapas.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.uca.ncapas.models.entities.WishList;

public interface WishListRepository extends JpaRepository<WishList, Integer> {

}
