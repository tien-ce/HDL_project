################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/commucation/Src/dht20.c \
E:/commucation/Src/i2c-lcd.c \
E:/commucation/Src/i2c_master.c \
E:/commucation/Src/i2c_slave.c 

OBJS += \
./commucation/Src/dht20.o \
./commucation/Src/i2c-lcd.o \
./commucation/Src/i2c_master.o \
./commucation/Src/i2c_slave.o 

C_DEPS += \
./commucation/Src/dht20.d \
./commucation/Src/i2c-lcd.d \
./commucation/Src/i2c_master.d \
./commucation/Src/i2c_slave.d 


# Each subdirectory must supply rules for building sources it contributes
commucation/Src/dht20.o: E:/commucation/Src/dht20.c commucation/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"E:/SOW/Ins" -I"E:/NUCLEO/Digictal_project/Core/Inc" -I"E:/commucation/Ins" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
commucation/Src/i2c-lcd.o: E:/commucation/Src/i2c-lcd.c commucation/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"E:/SOW/Ins" -I"E:/NUCLEO/Digictal_project/Core/Inc" -I"E:/commucation/Ins" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
commucation/Src/i2c_master.o: E:/commucation/Src/i2c_master.c commucation/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"E:/SOW/Ins" -I"E:/NUCLEO/Digictal_project/Core/Inc" -I"E:/commucation/Ins" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
commucation/Src/i2c_slave.o: E:/commucation/Src/i2c_slave.c commucation/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"E:/SOW/Ins" -I"E:/NUCLEO/Digictal_project/Core/Inc" -I"E:/commucation/Ins" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

