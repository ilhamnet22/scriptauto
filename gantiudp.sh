 echo "What OpenVPN UDP port would you like  to change to?"
            read -p "Port: " -e -i 1194 PORT
            sed -i "s/port [0-9]*/port $PORT/" /home/vps/public_html/udp.ovpn
            service openvpn restart
            echo "OpenVPN Updated : Port $PORT"
			