#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
sleep 2;
for i in `seq $cont_count`
do
	echo "=============================="
    echo "Creating www.unix$i container.."
    sleep 1
   sudo docker run --name www.unix$i -d -it --rm mano8888/mydoc /bin/bash
    echo "www.unix$i container has been created!"
	echo "=============================="
done
