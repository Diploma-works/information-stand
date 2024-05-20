package com.example.informationstand;

import com.example.informationstand.repositories.DeviceCodeRepository;
import com.example.informationstand.services.DeviceCodeService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class DeviceCodeServiceTest {

    @Mock
    private DeviceCodeRepository deviceCodeRepository;

    @InjectMocks
    private DeviceCodeService deviceCodeService;

    @Test
    public void testExistsDeviceCodeByCode_WhenDeviceCodeExists() {
        // Arrange
        String code = "exampleCode";

        // Мокируем поведение repository, чтобы возвращалось true, когда вызывается existsDeviceCodeByCode с аргументом "exampleCode"
        when(deviceCodeRepository.existsDeviceCodeByCode(code)).thenReturn(true);

        // Act
        boolean result = deviceCodeService.existsDeviceCodeByCode(code);

        // Assert
        assertTrue(result); // Убеждаемся, что результат true
        // Проверяем, что метод existsDeviceCodeByCode вызван с аргументом "exampleCode" ровно один раз
        verify(deviceCodeRepository, times(1)).existsDeviceCodeByCode(code);
    }

    @Test
    public void testExistsDeviceCodeByCode_WhenDeviceCodeDoesNotExist() {
        // Arrange
        String code = "nonExistingCode";

        // Мокируем поведение repository, чтобы возвращалось false, когда вызывается existsDeviceCodeByCode с аргументом "nonExistingCode"
        when(deviceCodeRepository.existsDeviceCodeByCode(code)).thenReturn(false);

        // Act
        boolean result = deviceCodeService.existsDeviceCodeByCode(code);

        // Assert
        assertFalse(result); // Убеждаемся, что результат false
        // Проверяем, что метод existsDeviceCodeByCode вызван с аргументом "nonExistingCode" ровно один раз
        verify(deviceCodeRepository, times(1)).existsDeviceCodeByCode(code);
    }
}
