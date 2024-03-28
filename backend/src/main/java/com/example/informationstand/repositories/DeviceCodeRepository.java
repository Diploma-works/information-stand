package com.example.informationstand.repositories;

import com.example.informationstand.models.DeviceCode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface DeviceCodeRepository extends JpaRepository<DeviceCode, Long> {
    Optional<DeviceCode> findByCode(String code);
    boolean existsDeviceCodeByCode(String code);
}
