  echo "What Squid3 port would you like to change to?"
            read -p "Port: " -e -i 8080 PORT
            sed -i "s/http_port [0-9]*/http_port $PORT/" /etc/squid3/squid.conf
            service squid3 restart
            echo "echo "Squid3 Updated : Port $PORT""
				