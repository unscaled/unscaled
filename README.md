unscaled
========

The worlds least scalable cloud computing platform. Hosts on your own servers.


## Incoherent thoughts

* One manager node that keeps a list of the processes that need to be run.
* Many runner nodes that run the processes assigned to them.
* Processes belong to an application. Applications have a bunch of environment variables that are given to the process when they start up. This is where you keep things like database config.
* Processes write logs to their STDOUT. The runners collect and manage these logs.
* Web-processes: how to auto-inject a port number, how to forward requests to them?
* Start with a simple custom loadbalancer? 
* Something with heartbeating processes.
