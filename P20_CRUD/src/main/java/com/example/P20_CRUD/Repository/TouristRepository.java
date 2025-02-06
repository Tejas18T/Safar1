package com.example.P20_CRUD.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.P20_CRUD.Entity.Tourist;

@Repository
public interface TouristRepository extends JpaRepository<Tourist, Integer> {
    // You can define custom query methods here if needed
}

