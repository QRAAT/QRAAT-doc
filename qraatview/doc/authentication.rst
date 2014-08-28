Authentication System
=====================
    This Authentication System is based on Django’s authentication system. The
    system has Users, Permissions, and Groups.
        
User
----
        QRAAT Site uses a default Django's user object that comes with the
        following attributes:
            +--------------+----------------+
            | Field        | Type           |
            +==============+================+
            | id           |   int(11)      |
            +--------------|----------------+
            | password     |   varchar(128) |
            +--------------|----------------+
            | las_login    |   dateteime    |
            +--------------|----------------+
            | is_superuser |   tinyint(1)   |
            +--------------|----------------+
            | username     |   varchar(30)  |
            +--------------|----------------+
            | first_name   |   varchar(30)  |
            +--------------|----------------+
            | last_name    |   varchar(30)  |
            +--------------|----------------+
            | email        |   varchar(75)  |
            +--------------|----------------+
            | is_staff     |   tinyint(1)   |
            +--------------|----------------+
            | is_active    |   tinyint(1)   |
            +--------------|----------------+
            | date_joined  |   datetime     |
            +--------------+----------------+


Permissions
-----------

    QRAAT Site handles permissions in two different levels. The first
    level is Django’s default permission system, which permits
    assigning permissions to users and groups of users. We can check
    the permission with a method called has_perm(permission). The
    Second permission level implemented in QRAAT System, is
    a mechanism that uses Django’s Groups to handle each project set of
    permissions.

    **Django’s Permissions:**
        For each model created in Django, there are add,
        change and delete permissions for default. Those permissions can be checked
        by calling a method has_perm(“app_name.permission_model”) for a given
        user object.
        For example:
                For the app qraatview and model Location if we want
                to check if a user can add location we should call
                ``user.has_perm(“qraatview.add_location”)``

    **QRAAT’s Permissions:**
        QRAAT Site checks individual permissions for
        each project created. Each QRAAT Project has
        its Owner and two different groups of users
        which are Collaborators, Viewers. For
        implementation reasons we keep the information
        of this groups stored in Django’s Groups and
        two tables in qraat’s system database.
        **auth_project_collaborator**  and
        **auth_project_viewer**
        These tables have the columns: ID,
        groupID, projectID. The column groupID stores
        Django’s groupID created for the project. See :ref:`project_creation` .
        The column projectID is a reference for the project ID.


Handling authentication
-----------------------

    When the browser makes a request to the
    system, it passes in the request object
    a field called user. Django’s handles this request
    creates a Django’s user object. If the user is not
    logged in, it is called Anonymous User. 
    QRAAT System checks Anonymous
    users. If an Anonymous user tries to
    perform an action restricted for registered
    users, the system blocks the action and
    redirects the user to a login page.
    
    More information is available here: https://docs.djangoproject.com/en/dev/topics/auth/

Handling permissions
--------------------

    All users of the system can visualize
    public projects. However only the project owner or
    users in the project’s viewers or
    collaborators groups can visualize
    restricted projects.

    When a user wants to visualize
    a restricted project, QRAAT
    system checks if this user has
    permission to visualize the
    project. The function that
    checks this is in
    qraatview.views and it’s called
    ``can_view(project, user)``

    There are similar checks
    for editing and deleting
    data. See :ref:`auth_api` .

        
                    
.. _auth_api:

API Documentation
-----------------
.. toctree::
    :maxdepth: 2


**qraatview.views**

.. autofunction:: qraatview.views.can_view
   :noindex:

.. autofunction:: qraatview.views.can_change
   :noindex:

.. autofunction:: qraatview.views.can_delete
   :noindex:

