FROM ghost:latest

# These are the railway values for the sql connection
# The template sets them automatically
# ${{MySQL.MYSQLHOST}}
# ${{MySQL.MYSQLPORT}}
# ${{MySQL.MYSQLUSER}}
# ${{MySQL.MYSQLPASSWORD}}
# ${{MySQL.MYSQL_DATABASE}}
ARG database__connection__host
ARG database__connection__port
ARG database__connection__user
ARG database__connection__password
ARG database__connection__database

ENV database__client=mysql
ENV database__connection__host=$database__connection__host
ENV database__connection__port=$database__connection__port
ENV database__connection__user=$database__connection__user
ENV database__connection__password=$database__connection__password
ENV database__connection__database=$database__connection__database

# This is the railway value for the app url (setted auto by the template as well)
# https://${{RAILWAY_PUBLIC_DOMAIN}}
ARG url
ENV url=$url
	  
ENV NODE_ENV=production

# If you want to see Ghost's debug logs (I don't recommend)
# ENV DEBUG=ghost:*

CMD ["node", "current/index.js"]
