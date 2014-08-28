RESTful API
==================

Overview
--------
The RESTful API is a way to retrieve raw data in QRAAT's track system
database using get requests. It makes possible to fetch data for any desired table
and apply filters to it.

Nowadays the RESTful API is only available for admins and can be
accessed by appending ``/data`` to qraat's view url.

Working example
---------------

System Pages
############
The RESTful API is used by the System Status pages. The System Status pages are
pages where admins of the system can visualize charts of QRAAT's tracking
system status.

The System Pages fetch data from the RESTful API and represent this data as
charts. Below it's how this request is implemented in the System Pages using ``AJAX``.

.. code-block:: javascript
    
    //Serializes the form to make a request
    var form_data = $("#graph_form").serialize();

    var request = $.ajax({
            url: "{% url 'get-data' %}",
            data: form_data 
    });

    request.done(function(data){
    
    });
   

In this example *graph_form*, which has the desired rest parameters,  is serialized. After
seralizing the form a request is made using ``$.ajax``. The url in the request
is obtained with a Django's template function ``{% url 'get-data' %}``. The
data is the serialized form. When the request is done we call a function with
the data received.

Raw Data
########
Here is an example of a url used to fetch data in the System Pages example above: 

``http://localhost/data?obj=telemetry&field=siteID&filter_field=siteID%2C4&field=extemp&duration=day&date=timestamp&field=timestamp&start_date=07%2F01%2F2014+11%3A46%3A27&end_date=now``

Below is a sample of the data returned when this url is called. The data
returned is in JSON format.

.. code-block:: javascript 

   [{"timestamp": 1404154001.0, "extemp": 28.0, "siteID": 4},
    {"timestamp": 1404154303.0, "extemp": 27.9, "siteID": 4}]

See :ref:`get_parameters` for further information about the parameters used in
the url, and the data returned.


.. _get_parameters:
   
RESTful API Parameters
----------------------
The RESTFul API has  *HTTP GET* parameters that say to it from which table it should
retrieve the data, what are the desired fields, and how to filter the data.
These parameters are listed and described below.

    * **obj**

      * This parameter is **required** and it says to the api from which table it \
        should retrieve the data. 

    * **id**

      * This parameter is **optional** and is used when you want to filter the \
        *obj* passed for id. Ex: ``data?obj=telemetry&id=1&id=2``. This call \
        retrieves rows with id equals to 1 and 2 from the table telemetry.

    * **field**

      * field is an **optional** parameter used when you want to select
        only specific columns from a table. Ex:
        ``data?obj=telemetry&field=ID&field=timestamp``. This call retrieves
        the fields ID and timestamp from all telemetry entries. 

    * **n_items**

      * n_items is an **optional** parameter used when there is a large data set and
        you want to have only a certain size of this set. Ex:
        ``data?obj=telemetry&n_items=100``. This call retrieves the first 100
        entries from telemetry.

    * **offset**

      * offset is an **optional** parameter used to get a subset of data from
        offset to the last item. It can be combined with *n_items*. Ex:
        ``data?obj=telemetry&n_items=100&offset=20``. This call will retrieve \
        100 telemetry rows starting from row 20.

    * **distinct**

      * distinct is an **optional** parameter used to remove repeated entries
        for certain columns. Ex: ``data?obj=telemetry&distinct=siteID``.
        This call will retrieve telemetry entries removing those that have the
        same siteID. This means the list of *siteIDs* from telemetry.

    * **filter_field**

      * This is an **optional** parameter used to filter the data given an
        specific column value. Ex: ``data?obj=telemetry&filter_field=siteID,1``. This call \
        retrieves telemetry data for *siteID* 1.

    * **date**

      * This is an **optional** parameter used to filter data by date. It's
        value corresponds to a column where the date is stored. Ex:
        ``data?obj=telemetry&data=timestamp``. This call will retrieve
        telemetry entries from *YESTERDAY* to *NOW*. It can combined with 
        **start_date** and **end_date** parameters.

    * **start_date**

      * This parameter is **optional** and used when you want to provide
        a start date for the **date** filter. Ex: ``data?obj=telemetry&data=timestamp&start_date=11/23/2013``. This call will retrieve telemetry data from 11/23/2013 until *NOW*. 

    * **end_date**

      * This parameter is **optional** and used when you want to provide
        an end date for the **date** filter. It should be combined with *start_date*.
        Ex: ``data?obj=telemetry&data=timestamp&start_date=06/23/2014&end_date=08/29/2014``. This call will retrieve telemetry data from 06/23/2014 to 08/29/2014.


    * **duration**

      * This parameter is **optional** and should be used with **date**
        parameter. It provides a way to retrieve data from a previous date without passing 2 dates. It's values could be a number of days or aliases for time interval. Ex: ``data?obj=telemetry&date=timestamp&duration=month``. This call will retrieve telemetry data from the past 30 days to *NOW*.

* *NOW* is always the current day and time.

API Documentation
-----------------
.. automodule:: qraatview.rest_api
   :members:
   :show-inheritance:
   :noindex:

