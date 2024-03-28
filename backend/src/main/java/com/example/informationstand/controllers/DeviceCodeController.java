package com.example.informationstand.controllers;

import com.example.informationstand.services.DeviceCodeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping("/imei")
@Slf4j
public class DeviceCodeController {

    private final DeviceCodeService deviceCodeService;

    @GetMapping("/check")
    public boolean licenceCheck(@RequestHeader("Device-Code") String deviceCode) {
        return deviceCodeService.existsDeviceCodeByCode(deviceCode);
    }
}
