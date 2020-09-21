#!/bin/bash
for i in {1..255}
do
    result=`arping 192.168.186.$i -c 1`
    mac=`echo $result | awk '{print $10}'`
    [ "$mac" != "broadcast(s))" ] && [ -n "$mac" ]  && echo "192.168.186.$i is alive." && echo " 192.168.186.$i  $mac" >> /tmp/host
done

    