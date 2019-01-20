mkdir -p ~/realtek_driver #https://github.com/lwfinger/rtlwifi_new.git
cd ~/realtek_driver
git clone https://github.com/lwfinger/rtlwifi_new.git
cd ./rtlwifi_new
make
make install
modprobe -rv rtl8723be
modprobe -v rtl8723be ant_sel=2
ip link set wlo1
if [ $? -eq 0 ]
then
    echo "OK"
else
    echo "Check iwconfig and change wl**"
fi
echo "options rtl8723be ant_sel=2" | sudo tee /etc/modprobe.d/50-rtl8723be.conf