#!/system/bin/sh

REG_PATH=/sys/bus/i2c/drivers/sx9310/8-0028/reg
BOARD_ID_PATH=/sys/devices/soc0/platform_lenovo_hardware_tpye

BOARD_ID="$(cat $BOARD_ID_PATH 2>/dev/null)"

# Karate-a48	K33a48_DS	Lenovo K33a48	Lenovo K6	S82937AA1
# Karate-a48 Single	K33a48_SS	Lenovo K33a48	Lenovo K6	S82937CA1
# Karate-b36	K33b36_DS	Lenovo K33b36	Lenovo K6	S82937DA1
# Karate-b37	K33b37_SS	Lenovo K33b37	Lenovo K6	S82937EA1
# KaratePower(Karate-a42) DualSim# K33a42_DS	Lenovo K33a42	Lenovo K6 Power S82938AA1 S82938BA1
# Karate plus-a48 Dual SIM	K53a48_DS	Lenovo K53a48	Lenovo K6 NOTE	S82939AA1
# Karate plus-a48 Single SIM	K53a48_SS	Lenovo K53a48	Lenovo K6 NOTE	S82939CA1
# Karate plus-b36 K53b36_DS	Lenovo K53b36	Lenovo K6 NOTE	S82939FA1
# Karate plus-b37 K53b37_SS	Lenovo K53b37	Lenovo K6 NOTE	S82939GA1

BOARD_ID="S82938BA1"

if [ "$BOARD_ID" = "S82939AA1" ] || [ "$BOARD_ID" = "S82939CA1" ]  || [ "$BOARD_ID" = "S82939FA1" ] || [ "$BOARD_ID" = "S82939GA1" ] ; then
	echo karate plus
	echo 0x03,0x70 > $REG_PATH
	echo 0x04,0x00 > $REG_PATH
	echo 0x11,0x00 > $REG_PATH
	echo 0x12,0x04 > $REG_PATH
	echo 0x13,0x0c > $REG_PATH
	echo 0x14,0x0d > $REG_PATH
	echo 0x15,0x81 > $REG_PATH
	echo 0x16,0x20 > $REG_PATH
	echo 0x17,0x4c > $REG_PATH
	echo 0x18,0x9e > $REG_PATH
	echo 0x19,0x7d > $REG_PATH
	echo 0x1a,0x1a > $REG_PATH
	echo 0x10,0x51 > $REG_PATH
elif [ "$BOARD_ID" = "S82938AA1" ] || [ "$BOARD_ID" = "S82938BA1" ] ; then
	echo karate power
	echo 0x03,0x70 > $REG_PATH
	echo 0x04,0x00 > $REG_PATH
	echo 0x11,0x00 > $REG_PATH
	echo 0x12,0x04 > $REG_PATH
	echo 0x13,0x0c > $REG_PATH
	echo 0x14,0x0d > $REG_PATH
	echo 0x15,0x81 > $REG_PATH
	echo 0x16,0x20 > $REG_PATH
	echo 0x17,0x4c > $REG_PATH
	echo 0x18,0x9e > $REG_PATH
	echo 0x19,0x7d > $REG_PATH
	echo 0x1a,0x1a > $REG_PATH
	echo 0x10,0x51 > $REG_PATH
else
	echo karate
	echo 0x03,0x70 > $REG_PATH
	echo 0x04,0x00 > $REG_PATH
	echo 0x11,0x00 > $REG_PATH
	echo 0x12,0x04 > $REG_PATH
	echo 0x13,0x0c > $REG_PATH
	echo 0x14,0x0d > $REG_PATH
	echo 0x15,0x81 > $REG_PATH
	echo 0x16,0x20 > $REG_PATH
	echo 0x17,0x4c > $REG_PATH
	echo 0x18,0x9e > $REG_PATH
	echo 0x19,0x7d > $REG_PATH
	echo 0x1a,0x1a > $REG_PATH
	echo 0x10,0x51 > $REG_PATH
fi
