/*
 * HDL_dht20.h
 *
 *  Created on: Oct 16, 2024
 *      Author: thuyh
 */

#ifndef INC_HDL_DHT20_H_
#define INC_HDL_DHT20_H_
#include "i2c-lcd.h"

#include "dht20.h"
#include "main.h"
#include "stdio.h"
void float_to_str(float num, char *str, int decimal);
void HDL_DHT20_init();
void HDL_DHT20_run();
#endif /* INC_HDL_DHT20_H_ */
