#
# Copiar ficheros de configuración de apache2 que incluyen:
#
# - apache2.conf,
# - apolo.olimpo.test.conf
# - atenea.olimpo.test.conf
#
# Copiar apache2.conf
cp -v /vagrant/files/apache-config/apache2.conf /etc/apache2/apache2.conf

# Copiar VirtualHosts
cp -v /vagrant/files/apache-config/apolo.olimpo.test.conf /etc/apache2/sites-available/
cp -v /vagrant/files/apache-config/atenea.olimpo.test.conf /etc/apache2/sites-available/

#
# Habilitar los servidores virtuales
#

a2ensite apolo.olimpo.test.conf
a2ensite atenea.olimpo.test.conf

#
# Reiniciar el servicio
#

systemctl reload apache2
