Database Models
==================

Models
------

QRAAT's web system uses a representation of Django's models to create
Objects for qraat's database tables.

Those objects are created extending django's database model as following:
    .. code-block:: python

        from django.db import models 

        class ObjectExample(models.Model):
            class Meta:
                app_label = QRAAT_APP_LABEL
                db_table = "object_example"
            
            ID = models.AutoField(primary_key=True)
            objexampleyID = models.ForeignKey(ObjExampleY, db_column="objexampleyID")
    
In this example the **class Meta**, a django model's intern class, is
overridden. This is done because we need to specify the fields
``db_table`` and ``app_label``. The field ``db_table`` will say to Django
that our model refers to this table name in the database. While ``app_label``
is used by the database router to properly configure the database connectors. 

It is also important mention how to define a foreign key for this system. In
the example above we set a foreign key *objexampleyID* for the ObjectExample.
Pay attention to the parameter **db_column**, it defines the column name
in the legacy database.

.. _project_creation:

Project
-------
    Projects can be created by any logged in user, who is set as the project owner.
    When a project is created, the system automatically creates two django's groups
    that are used to set models access permissions. It is also created one entry in 
    **qraat.auth_project_collaborator** and one entry in **qraat.auth_project_viewer**.
    Together they're responsible for QRAAT System project's access control.

    **Project's related objects:**
        Every project in the system has it's own locations, transmitters, targets, and deployments.
        Users can only create those objects if they're the project owner, 
        project collaborators, or system admins (by using the admin interface).

        Locations, transmitters, targets, and deployments cannot be delete by users. Although there
        is an interface to delete objects, when a user deletes any object this
        object and it's `related objects\*` 
        the object will be checked as hidden. When an object is set as hidden it will not be shown anymore,
        but it will still stay stored in the database.

        #ref get_related_objs and hide code

        *\*i.e. transmitters have deployments as related objects*

Transmitter
-----------
    All transmitters created in the system are associated with a project. This
    condition is ensured by a ForeignKey constraint in the model.

    Transmitters can be deployed. If for some reason a target is set as
    hidden. The deployments associated with this target will be set as hidden
    too.

    **Tx Parameters:**
        When a transmitter is created the system automatically sets some
        parameters for this transmitter. These parameters are read from
        tx_make_parameters and stored in tx_parameters. A new entry in
        tx_parameters is created for each parameter in tx_make_parameters.

        #ref TxTransmitterForm save method. TODO: Encapsulate this in the
        transmitter model


Target
------
    All targets created in the system are associated with a project. This
    condition is ensured by a ForeignKey constraint in the model.

    Targets can be deployed. If for some reason a target is set as
    hidden. The deployments associated with this target will be set as hidden
    too.

Deployment
----------
    All deployments created in the system are associated with a project,
    a transmitter, and a target. This
    conditions is ensured by  ForeignKey constraints in the model.

    *Deployments are objects related to targets and transmitters. Whenever any
    target or transmitter is set to hidden. All of it's related deployments
    will be set as hidden recursively*
    

Implemented Models API
-----------------
.. toctree::
   :maxdepth: 2

**qraatview.models**

.. automodule:: qraatview.models
    :members:
    :show-inheritance:
    :noindex:
