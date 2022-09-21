sudo apt-get install libpcre3-dev libssl-dev perl make build-essential curl
wget https://openresty.org/download/openresty-1.21.4.1.tar.gz
tar -xvf openresty-1.21.4.1.tar.gz

wget https://github.com/chobits/ngx_http_proxy_connect_module/archive/refs/heads/master.zip
unzip master.zip
mv ngx_http_proxy_connect_module-master/ ngx_http_proxy_connect_module/

cd openresty-1.21.4.1
./configure -j2 --add-module=../ngx_http_proxy_connect_module

patch -d build/nginx-1.21.4/ -p 1 < ../ngx_http_proxy_connect_module/patch/proxy_connect_rewrite_102101.patch

make -j2 
sudo make install

cp /usr/local/openresty/nginx/conf/nginx.conf ./nginx.conf.bk
cp nginx.conf /usr/local/openresty/nginx/conf/nginx.conf


