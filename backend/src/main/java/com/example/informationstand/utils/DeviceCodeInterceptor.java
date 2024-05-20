package com.example.informationstand.utils;

import com.example.informationstand.services.DeviceCodeService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;


@Component
@RequiredArgsConstructor
public class DeviceCodeInterceptor implements HandlerInterceptor {

    private final DeviceCodeService deviceCodeService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String deviceCode = request.getHeader("Device-Code");
        if (deviceCode == null || !deviceCodeService.existsDeviceCodeByCode(deviceCode)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid device code");
            return false;
        }
        return true;
    }
}

