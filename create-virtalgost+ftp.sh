                                                                                                                                                                                                 

#!/bin/bash
#echo $1


#Creación del usuario
echo "versión v2"

useradd $1

echo "sea ha creado el usuario: " $1

echo $1":asdasd" | chpasswd

echo "su contraseña se ha cambiado a: asdasd" 

#Creación de la estructura

mkdir -p /home/$1/public

mkdir -p /var/www/html/$1

touch /home/$1/public/index.html

chown $1:www-data /home/$1/public/index.html

echo "<h1> Página de prueba! </h1>" > /home/$1/public/index.html

ln -s /home/$1/public/index.html /var/www/html/$1/

chown $1:www-data /var/www/html/$1

chown $1:www-data /home/$1

chown $1:www-data /home/$1/public



#Creación del virtual host


echo "Alias /$1 /var/www/html/$1/
    <Directory /var/www/html/$1/>
      Options +Indexes +FollowSymLinks +MultiViews
    </Directory>" >>/etc/apache2/sites-available/list 


#> /etc/apache2/sites-available/$1.conf


#echo "se ha creado el sitio: xxxxxx/"$1

#a2ensite $1.conf

#Activamos el sitio:

service apache2 reload

#modo debug

#echo "-> borra el usuario:"

#echo "Página de prueba"


#deluser $1
