Views and Templating
====================
.. toctree::
    :maxdepth: 2

Views system
------------
For each application in Qraat's view system there is a module called views.
This is where all the views in the system are placed.

The views are called by urls and are responsible to render HttpRequest objects.
A view can render an html template, which is placed in the templates directory, or render any string desired.


Templates
---------
The templates are html files that can generally be rendered by a view.
All templates for this system are placed in a directory called templates in qraatview dir.

Templates inheritance
^^^^^^^^^^^^^^^^^^^^^
All templates extend a template called base.html this main template has some
static html that will be applied to all it's children and some blocks,
which are overriden by it's children. You can see how to extend this is
implemented here: :ref:`template_inheritance_example`

For more information about templates see: https://docs.djangoproject.com/en/dev/ref/templates/

CSS
---
The css used in this system is mostly from `Bootstrap <http://getbootstrap.com/>`_.
Bootstrap provides a bunch of classes that are used in the templates. The
container class, which wraps all html content, is an example. In this system, all the content is placed inside
a div that is composed by this container class.

    .. code-block:: html

        <body>
            <div id="container" class="container">
                        .
                        .
                        .
            </div>
        </body>

Extra style, as divs width and height, are placed in a file called style.css.
Each app has it's own style.css placed in ``qraatview/static/app_name/css``.


.. _template_inheritance_example:

Template inheritance example
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The base.html template imports basic css and js necessary to important
UI functionalities. These css, and js are under qraatview/static directory and
are the following: jquery.min.js, style.css, bootstrap.min.css,
bootstrap.min.js.

In Django, a template X that extend's a template Y can override template Y's blocks.
This way base.html file also has some blocks that can be overriden by the files
that extend it. Those blocks are: ``css, script, title, topbar, sidebar,
content``

Working example:
################
Presented as example, there is a template that is used in qraat_ui
application. This template is qraat_ui's base.html. It inherits from
qraatview's  base.html and overrides the blocks css, script, and title.

    .. code-block:: django
       
        {% extends "qraat_site/base.html" %}
        {% block css %}
            <!-- <link href="/static/qraat_ui/css/style.css" rel="stylesheet" /> -->
            {% block extracss %} {% endblock %}
        {% endblock %}

        {% block script %}

            {% block extrascript %} {% endblock %}

        {% endblock %}

        {% block title %} Qraat Ui {% endblock %}

These blocks are overriden to add extra blocks, which are extracss,
extrascript, and title that changes the page's title to Qraat Ui.


Main Application Api Documentation
----------------------------------
.. automodule:: qraatview.views
   :members:
   :show-inheritance:
   :noindex:

Auth Application Api Documentation
----------------------------------
.. automodule:: qraat_auth.views
    :members:
    :show-inheritance:
    :noindex:

UI Application Api Documentation
--------------------------------
.. automodule:: qraat_ui.views
    :members:
    :show-inheritance:
    :noindex:

