# Netowrk Virtualization in CORE

## This is the implemetation and documentation for implenemting OpenVirteX hypervisor in SDN data plane in CORE emulator for Master project

### The followings is the architectural overview of SDN network implementation

This approach is based on network virtualization. In this project, OpenVirteX hypervisor is considered to fulfil
the virtualization of network, switches and links. The virtualization of switches depends on a concept of BIG
switch. The topology of the physical network for this experiment is depicted in Figure. There are nine Open
vSwitches used to compose this topology which are connected to the local virtual machine that runs CORE
emulator. OpenVirteX runs on the other virtual machine, but is in the same network of the virtual machine runs
CORE. In this way, OpenVirteX hypervisor is connected to all the Open vSwitches for controlling the data
plane.

![openvirtex](https://user-images.githubusercontent.com/57096728/145964795-0357adb0-a02c-4c12-b78a-b85ae86b69ca.JPG)

OpenVirteX that is connected to all the Open vSwitches for controlling the data plane virtually and creates a
virtual network. OpenVirteX builds fully independent virtual network infrastructure, where tenant with a same
tenant id thinks the overall network to their own.
In this approach, in a same slice, switches that are connected to the tenants are considered as a single big switch.
OpenVirteX forms this big virtual switch with a tenant id by the instruction over REST API and handover the controlling functionality of these big switches to several SDN controllers. A number of Floodlight SDN controllers have been chosen to control different slices. The REST data is given in a json format to OpenVirteX.
In the json data, mac addresses of users in the first slice comprising User1, User2, Server2 and Server4, DPIDs
of the switches and port number of user’s connected Open vSwitch are given. Moreover, tenant id, which is 1 for
the first slice, network subnet, routing algorithm, and the address of SDN controller are also binded in the json
data.
For second slice, which has tenant id with 2, data containing mac addresses of User3, User4, Server3 and Server1, DPIDs of the switches connected to users, and port number of the respective switch connected to users is given with REST API. OpenVirteX then creates two independent virtual big switches, one virtual switch out of
switch number 7,8,9,3 for slice 1 and another including switches 7,8,9,5 for slice 2. In addition, OpenVirtex
initiates two Floodlight SDN controller for controlling these two different slices. Figure below summarises the
virtualization technique of creating single virtual switch composed out of multiple physical switches.

![virtualization](https://user-images.githubusercontent.com/57096728/145964818-3d6aba5c-5edf-4c54-99e5-63bb7a826ada.png)

With the routing algorithm information, OpenVirteX creates the route in the physical devices. If any interruptions occur in the physical path, there are a number of backup path will take responsibility that is also specified through REST API.


For the Implementation of the network check the documentation: [Project Documentation](https://github.com/sudo-riyad/OpenVirteX-Hypevisor-In-CORE/blob/15c2e701b4ad0e018ba997ec266048fbff0fecdd/Documentation/IndividualProject_Islam_Riyad-Ul-_1324662.pdf)
