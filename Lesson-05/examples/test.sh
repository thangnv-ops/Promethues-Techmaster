#! /bin/bash


echo "# HELP test_first_test"
echo "# TYPE test_first_test gauge"
echo "first_test{label1=\"test_1_label_1\"} 1"

echo "# HELP test_thangnv"
echo "# TYPE test_thangnv gauge"
echo "thangnv{label1=\"test_1_label_1\"} 99"


echo "# HELP check"
echo "# TYPE check counter"
a="$(cat /tmp/a)"
a="$(expr $a + 2)"
echo $a > /tmp/a
echo "check $a"

echo "# HELP IO"
echo "# TYPE IO gauge"
ID="$(sudo systemctl show --property MainPID ssh --value)"
read="$(sudo iotop -bp $ID -n 1 | grep $ID | awk '{ print $4 }')"
echo "read{service=\"ssh\"} $read"


echo "# TYPE IO_service gauge"

read_service="$(sudo iotop -bk -n 2| grep rsync | awk '{ print $4 }' | paste -s -d+ - | bc)"
echo "read{service=\"rsync\"} $read_service"

write_service="$(sudo iotop -bk -n 2| grep rsync | awk '{ print $6 }' | paste -s -d+ - | bc)"
echo "write{service=\"rsync\"} $write_service"

