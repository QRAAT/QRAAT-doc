.. QRAAT Site documentation master file, created by
   sphinx-quickstart on Fri Aug 22 10:38:35 2014.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to QRAAT View's documentation!
======================================


Contents:

* :ref:`project_overview`

  * :ref:`root_directories`

.. toctree::
   :maxdepth: 2

   models
   authentication
   views
   rest_api
   installation

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`


.. _project_overview:

Project Overview
================
QRAAT View is a Django based project for scientists and
general public to access and manipulate the central database
of the QRAAT animal tracking project.

.. _root_directories:

Root directories
----------------
        * www/
            * qraat_auth
                Application to handle this system authentication

            * qraat_ui
                Application for data visualization

            * qraatview
                Main application with models, forms, templates, etc.

                * static
                    Dir where static files are stored. These could be js, css, images, etc.

                * templates
                    Dir where all template's html files are stored.

                * templatetags
                    Templates filters are placed in this dir.

                * admin.py
                    Module where Django's admin forms are placed.

                * forms.py
                    Module where the Model's forms are placed.

                * models.py
                    Module where all Models used in this system are placed.

                * rest_api.py
                    RESTFul api module.

                * router.py
                    Module to router djago's database conectors.

                * settings.py
                    Django project's settings.

                * tests.py
                    Unit tests.

                * urls.py
                    Django's URLS.

                * utils.py
                    Project utillities, mostly for data management.

                * views.py
                    Module where the main site views are place.
