 echo "What Dropbear port would you like to change to?"
            read -p "Port: " -e -i 443 PORT
            sed -i "s/DROPBEAR_PORT=[0-9]*/DROPBEAR_PORT=$PORT/" /etc/default/dropbear
            service dropbear restart
            echo "Dropbear Updated : Port $PORT"
			;;