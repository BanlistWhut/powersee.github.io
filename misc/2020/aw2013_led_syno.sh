#!/bin/sh


do_i2cset()
{
    # i2cset [-f] [-y] [-m MASK] [-r]
    # I2CBUS CHIP-ADDRESS DATA-ADDRESS [VALUE] ... [MODE]
    i2cset -y -f 0 0x45 0x00 0x55 #软件复位

    i2cset -y -f 0 0x45 0x01 0x01 #开启 LED 控制器
    i2cset -y -f 0 0x45 0x30 0x07 #不呼吸

    i2cset -y -f 0 0x45 0x31 0x63 #最大电流 (呼吸)
    i2cset -y -f 0 0x45 0x32 0x63 #最大电流 (呼吸)
    i2cset -y -f 0 0x45 0x33 0x63 #最大电流 (呼吸)

    # i2cset -y -f 0 0x45 0x37 0x44
    # i2cset -y -f 0 0x45 0x3a 0x55
    # i2cset -y -f 0 0x45 0x3d 0x66

    # i2cset -y -f 0 0x45 0x38 0x44
    # i2cset -y -f 0 0x45 0x3b 0x55
    # i2cset -y -f 0 0x45 0x3e 0x66

    # i2cset -y -f 0 0x45 0x39 0x00
    # i2cset -y -f 0 0x45 0x3c 0x00
    # i2cset -y -f 0 0x45 0x3f 0x00

    i2cset -y -f 0 0x45 0x34 $1       #R
    i2cset -y -f 0 0x45 0x35 $2       #G
    i2cset -y -f 0 0x45 0x36 $3       #B
}



case $1 in
    red)
        do_i2cset 255 0 0
        ;;

    green)
        do_i2cset 0 255 0
        ;;

    blue)
        do_i2cset 0 0 255
        ;;
    *)
        i2cset -y -f 0 0x45 0x00 0x55
        ;;
esac

