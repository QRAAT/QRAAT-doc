Installation guide
==================


Installation in Ubuntu 14.04 
----------------------

    **Dependencies:**
        ``Apache 2, lib wsgi``

        Installing dependencies:
        ``$ sudo apt-get install apache2 apache2-dev libapache2-mod-wsgi``

    **QRAAT View configuration**
        QRAAT View is a wsgi application. It is necessary to configure a wsgi
        file in order to have it working with apache.

        To keep it organized create a directory called apache in the root of the
        project.
       
        ``$ mkdir /<project_root>/apache``

        Then create a file called ``django.wsgi`` in this folder

        ``$ touch /<project_root>/apache/django.wsgi``
       
        Add into this file the following lines:
            .. code-block:: python

                import os                                                                            
                import sys                                                      
                              
                os.environ['DJANGO_SETTINGS_MODULE'] = '<app_name>.settings'                        
                import django.core.handlers.wsgi                                                    
                
                application = django.core.handlers.wsgi.WSGIHandler()                                                                                                                     
                
                path = '/<project_root>'                              

                if path not in sys.path:                                                            
                    sys.path.append(path)

        It's necessary to edit ``<app_name>`` and ``<project_root>``. Nowadays ``<app_name>`` is ``qraatview``.
    
    **Setting up static files:**
        To have apache serving static files for the application we need to
        follow some steps.

        First create a dir where the static files will be stored and set
        apache's user as it's owner.

            ``$ mkdir /<static_dir>``

            ``$ chown -R www-data:www-data /<static_dir>``

        Second, tell the system where that this dir is where it should place
        the static files. At the end of the settings.py file add:
            ``STATIC_ROOT = “/<static_dir>”``

        Properly edit ``<static_dir>``

        Third, from the project root call:
        ``$ python manage.py collectstatic``

        This command will copy all static files to the <static_dir>. **This
        command should be executed every time any static file is edited.**

    **Apache configuration:**
       Create apache's site configuration in ``/etc/apache2/sites-available``

       ``$ touch /etc/apache2/sites-available/qraat-site``

        Then edit this insert the following lines in this file:
            .. code-block:: apache

                WSGIPythonPath /<project_root> 
                                                                                                     
                 <VirtualHost *:80>                                                             

                    ServerAdmin <webmaster_email>                                                                                                                           
                    ErrorLog ${APACHE_LOG_DIR}/error.log CustomLog ${APACHE_LOG_DIR}/access.log combined                                                                                                                           
                    WSGIScriptAlias / /<project_root>/apache/django.wsgi                                                                                 
                    Alias /static/ /<static_dir>/                                                                                                                           
                          
                    <Directory /<static_dir>>
                       <IfVersion < 2.3>                                                          
                           Order allow,deny                                                        
                           Allow from all                                                          
                       </IfVersion>                                                                
                       <IfVersion >= 2.3>                                                          
                           Require all granted                                                     
                       </IfVersion>                                                               
                    </Directory>                                                                    

                    <Directory /<project_root>/apache>
                       <IfVersion < 2.3 >                                                          
                           Order allow,deny                                                        
                           Allow from all                                                          
                       </IfVersion>                                                                
                       <IfVersion >= 2.3>                                                          
                           Require all granted                                                     
                       </IfVersion>                                                               
                    </Directory>                                                                    

                   </VirtualHost>

        Make sure to edit ``<project_root>``, ``<static_dir>``, and
        ``<webmaster_email>``. Then run the following commands:

            ``$ sudo a2enmod wsgi``

            ``$ sudo a2ensite qraat-site``

            ``$ sudo /etc/init.d/apache2 restart``

    **HTTPS Configuration:**
        First enable Apache's ssl and rewrite module.

        ``$ sudo a2enmod rewrite``

        ``$ sudo a2enmod ssl``

        Second, you should create the certificate place the certificate in
        ``/etc/ssl/certs/`` and the key in ``/etc/ssl/private/``:
            https://help.ubuntu.com/14.04/serverguide/certificates-and-security.html

        Then it's necessary to edit apache's qraat-site file created previously.

        Under the line ``Alias /static/ /<static_dir>/`` add the following
        lines:

            .. code-block:: apache

                #Redirect http admin and auth pages to https
                RewriteEngine on
                RewriteCond %{HTTP:X-Forwarded-SSL} !on 
                RewriteCond %{REQUEST_URI} ^[/admin][/auth]      
                RewriteRule .* https://%{HTTP_HOST}%{REQUEST_URI} [R,L]

        Now add the following lines at the end of the file:
            .. code-block:: apache
                    
                <IfModule mod_ssl.c>

                    <VirtualHost _default_:443>
                        ServerAdmin <webmaster_email> 
                        WSGIScriptAlias / <project_root>apache/django.wsgi
                        Alias /static/ <static_dir>

                        ErrorLog ${APACHE_LOG_DIR}/error.log
                        CustomLog ${APACHE_LOG_DIR}/access.log combined
                        RewriteEngine on
                        RewriteCond %{HTTP:X-Forwarded-SSL} on
                        RewriteCond %{REQUEST_URI} !^[/admin][/auth]
                        RewriteRule .* http://%{HTTP_HOST}%{REQUEST_URI} [R,L]

                        SSLEngine on
                        SSLCertificateFile /etc/ssl/certs/<server.crt>
                        SSLCertificateKeyFile /etc/ssl/private/<server.key>
                        
                        SSLEngine on                                                                                                                                                    
                        SSLCertificateFile /etc/ssl/certs/<ssl-cert>.pem                    
                        SSLCertificateKeyFile /etc/ssl/private/<ssl-cert>.key

                        <FilesMatch "\.(cgi|shtml|phtml|php)$">                                    
                            SSLOptions +StdEnvVars                                              
                        </FilesMatch>                                            

                        <Directory /usr/lib/cgi-bin>                                               
                            SSLOptions +StdEnvVars                                         
                        </Directory> 
                                                                                                            
                        <Directory /<project_root>/apache>
                           <IfVersion < 2.3 >                                                          
                               Order allow,deny                                                        
                               Allow from all                                                          
                           </IfVersion>                                                                
                           <IfVersion >= 2.3>                                                          
                               Require all granted                                                     
                           </IfVersion>                                                               
                        </Directory>                                                                    

                        <Directory /<static_dir>>
                           <IfVersion < 2.3 >                                                          
                               Order allow,deny                                                        
                               Allow from all                                                          
                           </IfVersion>                                                                
                           <IfVersion >= 2.3>                                                          
                               Require all granted                                                     
                           </IfVersion>                                                               
                        </Directory>                                                                    

                    BrowserMatch "MSIE [2-6]" \
                                nokeepalive ssl-unclean-shutdown \
                                downgrade-1.0 force-response-1.0
                    # MSIE 7 and newer should be able to use keepalive
                    BrowserMatch "MSIE [17-9]" ssl-unclean-shutdown
                </VirtualHost>
            </IfModule>

    Finally reload apache
    ``$ sudo service apache2 reload``



