FROM ghost:latest

# ${{MySQL.MYSQLHOST}}
# ${{MySQL.MYSQLPORT}}
# ${{MySQL.MYSQLUSER}}
# ${{MySQL.MYSQLPASSWORD}}
# ${{MySQL.MYSQL_DATABASE}}
ARG SQL_HOST
ARG SQL_PORT
ARG SQL_USER
ARG SQL_PW
ARG SQL_DB

ENV database__client=mysql
ENV database__connection__host=$SQL_HOST
ENV database__connection__port=$SQL_PORT
ENV database__connection__user=$SQL_USER
ENV database__connection__password=$SQL_PW
ENV database__connection__database=$SQL_DB

# https://${{RAILWAY_PUBLIC_DOMAIN}}
ARG SITE_URL
ENV url=$SITE_URL
	  
ENV NODE_ENV=production

# ENV DEBUG=ghost:*

CMD ["node", "current/index.js"]