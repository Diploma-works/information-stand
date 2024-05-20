package com.example.informationstand.services;

import com.example.informationstand.repositories.DeviceCodeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DeviceCodeService {

    private final DeviceCodeRepository deviceCodeRepository;

    public boolean existsDeviceCodeByCode(String code) {
        return deviceCodeRepository.existsDeviceCodeByCode(code);
    }

}
