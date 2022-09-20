sudo apt-get install libpcre3-dev libssl-dev perl make build-essential curl
wget https://openresty.org/download/openresty-1.21.4.1.tar.gz
tar -xvf openresty-1.21.4.1.tar.gz
cd openresty-1.21.4.1
./configure -j2

make -j2 
sudo make install
