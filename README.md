unscaled
========

A cloud platform for people who don't need to be webscale. Hosts on your own servers. 12-factor ready.

# The following is not implemented yet. README-driven development.

Consists of the following components.

## Cloud manager

You run this on some server. It provides APIs used by the other components.

## Process manager

This runs on every server that you want to run processes on.

* Queries the cloud manager to get a list of the processes it should be running. 
* Passes configuration as environment variables to the processes it runs.
* Captures the stdout/stderr streams and ships them back to the central service.

## HTTP Load Balancer

If you spin up another web process, you probably want it to receive web requests from your load balancer. 

* Your process sends heartbeats to the cloud manager. 
* Cloud manager then adds the process to your load balancer. 
* Plugins exist for several load balancers, like HAproxy and nginx.
* If heartbeats stop, process gets kicked out of the load balancer.



## Incoherent thoughts

* One manager node that keeps a list of the processes that need to be run.
* Many runner nodes that run the processes assigned to them.
* Processes belong to an application. Applications have a bunch of environment variables that are given to the process when they start up. This is where you keep things like database config.
* Processes write logs to their STDOUT. The runners collect and manage these logs.
* Web-processes: how to auto-inject a port number, how to forward requests to them?
* Start with a simple custom loadbalancer? 
* Something with heartbeating processes.
