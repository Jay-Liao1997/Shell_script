#!/bin/bash
read -p "请输入需要进行分区的设备：" disk
read -p "请输入主分区的数量（最多4个，至少1个）： " main
read -p "请输入扩展分区的数量：" extend
read -p "请输入逻辑分区的数量： " logical

