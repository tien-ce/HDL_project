/*
 * HDl_dht20.c
 *
 *  Created on: Oct 16, 2024
 *      Author: thuyh
 */
#include "HDL_dht20.h"
 I2C_HandleTypeDef hi2c1;


 DHT20_state state;         // Định nghĩa biến trạng thái
 status_active active;      // Định nghĩa biến trạng thái hoạt động
 DHT20_t dht20;             // Định nghĩa cấu trúc DHT20
void HDL_DHT20_init(){
	state = INIT_DHT20;
	active = DHT20_OK;
}

void HDL_DHT20_run(){
	switch(state){
	case INIT_DHT20:
		 DHT20_Init(&dht20, &hi2c1);
	 	 HAL_Delay(100);
		 state = CHECK_CONNECTION;
	 	 break;
	case CHECK_CONNECTION:
		if(DHT20_IsConnected(&dht20) ){
			active = DHT20_OK;
			state = CHECK_READY;
		}
		else{
			active = DHT20_ERROR_CONNECT;
			state = ERROR_STATE;
		}
		break;
	case CHECK_READY:
		if((DHT20_ReadStatus(&dht20) & 0x18) != 0x18){
			DHT20_ResetSensor(&dht20);
		 	HAL_Delay(1000);
			state = CHECK_CONNECTION;
		}
		else {
			HAL_Delay(10);
			state = REQUEST_DATA;
		}
		break;
	case REQUEST_DATA:
		if(HAL_GetTick() - dht20.lastRead >= 1000){
			active = DHT20_RequestData(&dht20);
			if (active == DHT20_OK){
				HAL_Delay(80);
				state = READ_DATA;
			}
		}
		else{
			active = DHT20_ERROR_LASTREAD;
		}
		break;
	case READ_DATA:
		if(HAL_GetTick() - dht20.lastRequest < 1000){
			active = DHT20_ReadData(&dht20);
			if(active == DHT20_OK){
				state = CONVERT_DATA;
			}
			else{
				state = REQUEST_DATA;
			}
		}
		else{
			active = DHT20_ERROR_READ_TIMEOUT;
		}
		break;
	case CONVERT_DATA:
		active = DHT20_Convert(&dht20);
		if(active == DHT20_OK){
			state = DONE;
		}
		break;
	case DONE:
	{
	    char temp_str[6];      // Chuỗi để lưu giá trị nhiệt độ
	    char humidity_str[6];  // Chuỗi để lưu giá trị độ ẩm

	    // Chuyển đổi giá trị float thành chuỗi
	    float_to_str(dht20.temperature, temp_str, 2);
	    float_to_str(dht20.humidity, humidity_str, 2);
	    // Hiển thị giá trị lên màn hình LCD
	    lcd_goto_XY(1, 0);
        lcd_send_string("HUM:");
	    lcd_goto_XY(1, 4);
	    lcd_send_string(humidity_str);

	    HAL_Delay(50);

	    lcd_goto_XY(2, 0);
	    lcd_send_string("TEMP:");
	    lcd_goto_XY(2, 5);
	    lcd_send_string(temp_str);

		HAL_Delay(1000);
		HAL_GPIO_TogglePin(GPIOA, LED_GREEN_Pin);
		state = CHECK_READY;
		break;
	}
	case ERROR_STATE:
			if(active == DHT20_ERROR_CONNECT){
	/*
	 * 		do{
				  HAL_Delay(100);
			  }while(!DHT20_IsConnected(&dht20));
			  active = DHT20_OK;
			 */
			  state = INIT_DHT20;
		  }
		else{
		  }
	    break;
	default :
		break;
	}

}
