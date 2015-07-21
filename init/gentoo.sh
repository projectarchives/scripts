#!/sbin/runscript

depend() {
  need localmount
}

start() {
    ebegin "Starting jrat."
      start-stop-daemon --start \
          --pidfile /var/run/jrat.pid --background --make-pidfile \
	  --exec /bin/bash -- -c "exec /usr/sbin/jrat > 
/var/log/headached.log 2>&1"
    eend $?
}

stop() {
  ebegin "Stopping jrat"
    start-stop-daemon --stop --exec /usr/sbin/jrat \
        --pidfile /var/run/jrat.pid
  eend $?
  
}
