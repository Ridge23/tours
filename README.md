For deployment, run:

``cap production deploy``

After this MANUAL restart of puma and nginx required on server.

SSH to the server.

``cd /var/www/TravelApp/current``
``sudo /etc/init.d/nginx restart``

Kill puma process:

``ps aux | grep puma``
``kill {process_id}``

Create pid file:

``mkdir tmp/pid``
``touch tmp/pids/puma.pid``