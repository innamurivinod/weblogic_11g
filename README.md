# weblogic_11g
Install weblogic 11g silent installization 


install weblogic 11g silent installization********************

url : https://oracle-base.com/articles/11g/weblogic-silent-installation-11g

******** install java in ubuntu 14.04 ****************

url : https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get


=============================
	steps
=============================

step 1: Edit local host (vi /etc/hosts)
        192.168.56.103 ol6.localdomain ol6

step 2: Create a group and user
        useradd -u 1100 -g ubuntu oracle
	passwd oracle
        
step 3: Create the directories in which the Oracle software will be installed.
        mkdir -p /u01/app/oracle/middleware
	mkdir -p /u01/app/oracle/config/domains
	mkdir -p /u01/app/oracle/config/applications
	chown -R oracle:ubuntu /u01
	chmod -R 775 /u01/

step 4: Insstall jdk
	sudo apt-get install python-software-properties
	sudo add-apt-repository ppa:webupd8team/java
        sudo apt-get upadte
 
step 5: run below commangs 
	export MW_HOME=/u01/app/oracle/middleware
	export WLS_HOME=$MW_HOME/wlserver_10.3
	export WL_HOME=$WLS_HOME
# Set to the appropriate JAVA_HOME.
	export JAVA_HOME=/usr/lib/jvm/java-8-oracle
	export PATH=$JAVA_HOME/bin:$PATH

step 6: copy weblogic 11g file into cd /u01/software
 
	 cd /u01/
 	 mkdir software
         cd software/
         touch silent.xml
 	 chmod 777 silent.xml
	vi silent.xml

=========================================================
<?xml version="1.0" encoding="UTF-8"?>
   <bea-installer> 
     <input-fields>
       <data-value name="BEAHOME" value="/u01/app/oracle/middleware" />
       <data-value name="WLS_INSTALL_DIR" value="/u01/app/oracle/middleware/wlserver_10.3" />
       <data-value name="COMPONENT_PATHS"
        value="WebLogic Server/Core Application Server|WebLogic Server/Administration Console|WebLogic Server/Configuration Wizard and Upgrade Framework|WebLogic Server/Web 2.0 HTTP Pub-Sub Server|WebLogic Server/WebLogic JDBC Drivers|WebLogic Server/Third Party JDBC Drivers|WebLogic Server/WebLogic Server Clients|WebLogic Server/WebLogic Web Server Plugins|WebLogic Server/UDDI and Xquery Support|Oracle Coherence/Coherence Product Files" />
       <data-value name="INSTALL_NODE_MANAGER_SERVICE" value="yes" />
       <data-value name="NODEMGR_PORT" value="5556" />
       <data-value name="INSTALL_SHORTCUT_IN_ALL_USERS_FOLDER" value="no"/>
       <data-value name="LOCAL_JVMS" value="/usr/lib/jvm/java-8-oracle"/>
   </input-fields> 
</bea-installer>
========================================================= 

step 7: weblogic silent installization
        java -Xmx1024m -jar /u01/software/wls1036_generic.jar -mode=silent -silent_xml=/u01/software/silent.xml

step 8: you can test the WebLogic version using the following command
        . $WLS_HOME/server/bin/setWLSEnv.sh
	java weblogic.version

step 9: weblogic installization follow below instructions
       vim /u01/app/oracle/middleware/wlserver_10.3/common/bin/./config.sh


=========================================================================================
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=128m; sup                                          port was removed in 8.0
Unable to instantiate GUI, defaulting to console mode.
Java HotSpot(TM) 64-Bit Server VM warning: You have loaded library /u01/app/orac                                          le/middleware/wlserver_10.3/common/lib/libjni.so which might have disabled stack                                           guard. The VM will try to fix the stack guard now.
It's highly recommended that you fix the library with 'execstack -c <libfile>',                                           or link it with '-z noexecstack'.





<------------------- Fusion Middleware Configuration Wizard ------------------>

Welcome:
--------

Choose between creating and extending a domain. Based on your selection,
the Configuration Wizard guides you through the steps to generate a new or
extend an existing domain.

 ->1|Create a new WebLogic domain
    |    Create a WebLogic domain in your projects directory.

   2|Extend an existing WebLogic domain
    |    Use this option to add new components to an existing domain and modify                                               |configuration settings.





Enter index number to select OR [Exit][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Select Domain Source:
---------------------

Select the source from which the domain will be created. You can create the
domain by selecting from the required components or by selecting from a
list of existing domain templates.

 ->1|Choose Weblogic Platform components
    |    You can choose the Weblogic component(s) that you want supported in
    |your domain.

   2|Choose custom template
    |    Choose this option if you want to use an existing  template. This
    |could be a custom created template using the Template Builder.





Enter index number to select OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Application Template Selection:
-------------------------------



    Available Templates
    |_____Basic WebLogic Server Domain - 10.3.6.0 [wlserver_10.3]x
    |_____Basic WebLogic SIP Server Domain - 10.3.6.0 [wlserver_10.3] [2]
    |_____WebLogic Advanced Web Services for JAX-RPC Extension - 10.3.6.0 [wlser                                          ver_10.3] [3]
    |_____WebLogic Advanced Web Services for JAX-WS Extension - 10.3.6.0 [wlserv                                          er_10.3] [4]



Enter number exactly as it appears in brackets to toggle selection OR [Exit][Pre                                          vious][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Edit Domain Information:
------------------------

    |  Name  |    Value    |
   _|________|_____________|
   1| *Name: | base_domain |




Enter value for "Name" OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Select the target domain directory for this domain:
---------------------------------------------------

    "Target Location" = [Enter new value or use default
"/u01/app/oracle/middleware/user_projects/domains"]




Enter new Target Location OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Administrator User Name and Password:
-----------------------------------------------

Create a user to be assigned to the Administrator role. This user is the
default administrator used to start development mode servers.

    |          Name           |                  Value                  |
   _|_________________________|_________________________________________|
   1|         *Name:          |                weblogic                 |
   2|     *User password:     |                                         |
   3| *Confirm user password: |                                         |
   4|      Description:       | This user is the default administrator. |

Use above value or select another option:
    1 - Modify "Name"
    2 - Modify "User password"
    3 - Modify "Confirm user password"
    4 - Modify "Description"




Enter option number to select OR [Exit][Previous][Next]> 2





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Administrator User Name and Password:
-----------------------------------------------

Create a user to be assigned to the Administrator role. This user is the
default administrator used to start development mode servers.

    "*User password:" = []




Enter new *User password: OR [Exit][Reset][Accept]> weblogic123





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Administrator User Name and Password:
-----------------------------------------------

Create a user to be assigned to the Administrator role. This user is the
default administrator used to start development mode servers.

    |          Name           |                  Value                  |
   _|_________________________|_________________________________________|
   1|         *Name:          |                weblogic                 |
   2|     *User password:     |               ***********               |
   3| *Confirm user password: |                                         |
   4|      Description:       | This user is the default administrator. |

Use above value or select another option:
    1 - Modify "Name"
    2 - Modify "User password"
    3 - Modify "Confirm user password"
    4 - Modify "Description"
    5 - Discard Changes




Enter option number to select OR [Exit][Previous][Next]> 3





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Administrator User Name and Password:
-----------------------------------------------

Create a user to be assigned to the Administrator role. This user is the
default administrator used to start development mode servers.

    "*Confirm user password:" = []




Enter new *Confirm user password: OR [Exit][Reset][Accept]> weblogic123





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Administrator User Name and Password:
-----------------------------------------------

Create a user to be assigned to the Administrator role. This user is the
default administrator used to start development mode servers.

    |          Name           |                  Value                  |
   _|_________________________|_________________________________________|
   1|         *Name:          |                weblogic                 |
   2|     *User password:     |               ***********               |
   3| *Confirm user password: |               ***********               |
   4|      Description:       | This user is the default administrator. |

Use above value or select another option:
    1 - Modify "Name"
    2 - Modify "User password"
    3 - Modify "Confirm user password"
    4 - Modify "Description"
    5 - Discard Changes




Enter option number to select OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Domain Mode Configuration:
--------------------------

Enable Development or Production Mode for this domain.

 ->1|Development Mode

   2|Production Mode




Enter index number to select OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Java SDK Selection:
-------------------

 ->1|Sun SDK 1.8.0_191 @ /usr/lib/jvm/java-8-oracle
   2|Other Java SDK




Enter index number to select OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Select Optional Configuration:
------------------------------

   1|Administration Server [ ]
   2|Managed Servers, Clusters and Machines [ ]
   3|RDBMS Security Store [ ]



Enter index number to select OR [Exit][Previous][Next]> 1





<------------------- Fusion Middleware Configuration Wizard ------------------>

Select Optional Configuration:
------------------------------

   1|Administration Server [x]
   2|Managed Servers, Clusters and Machines [ ]
   3|RDBMS Security Store [ ]



Enter index number to select OR [Exit][Previous][Next]> 2





<------------------- Fusion Middleware Configuration Wizard ------------------>

Select Optional Configuration:
------------------------------

   1|Administration Server [x]
   2|Managed Servers, Clusters and Machines [x]
   3|RDBMS Security Store [ ]



Enter index number to select OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure the Administration Server:
------------------------------------

Each WebLogic Server domain must have one Administration Server. The
Administration Server is used to perform administrative tasks.

    |       Name       |        Value        |
   _|__________________|_____________________|
   1|      *Name:      |     AdminServer     |
   2| *Listen address: | All Local Addresses |
   3|   Listen port:   |        7001         |
   4| SSL listen port: |         N/A         |
   5|   SSL enabled:   |        false        |

Use above value or select another option:
    1 - Modify "Name"
    2 - Modify "Listen address"
    3 - Modify "Listen port"
    4 - Modify "SSL enabled"




Enter option number to select OR [Exit][Previous][Next]> 4





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure the Administration Server:
------------------------------------

Each WebLogic Server domain must have one Administration Server. The
Administration Server is used to perform administrative tasks.

    *Enter index number to modify "Value"

   1|true
 ->2|false
   3|Unspecified




Enter index number to select OR [Exit][Reset][Accept]> 1





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure the Administration Server:
------------------------------------

Each WebLogic Server domain must have one Administration Server. The
Administration Server is used to perform administrative tasks.

    |       Name       |        Value        |
   _|__________________|_____________________|
   1|      *Name:      |     AdminServer     |
   2| *Listen address: | All Local Addresses |
   3|   Listen port:   |        7001         |
   4| SSL listen port: |        7002         |
   5|   SSL enabled:   |        true         |

Use above value or select another option:
    1 - Modify "Name"
    2 - Modify "Listen address"
    3 - Modify "Listen port"
    4 - Modify "SSL listen port"
    5 - Modify "SSL enabled"
    6 - Discard Changes




Enter option number to select OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Managed Servers:
--------------------------

Add or delete configuration information for Managed Servers. A typical
production environment has one or more Managed Servers. Each Managed Server
is an instance of WebLogic Server used to host enterprise applications.

    | Name* | Listen address* | Listen port | SSL listen port | SSL enabled |
   _|_______|_________________|_____________|_________________|_____________|




Enter name for a new  OR [Exit][Previous][Next]> ms1





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Managed Servers:
--------------------------

Add or delete configuration information for Managed Servers. A typical
production environment has one or more Managed Servers. Each Managed Server
is an instance of WebLogic Server used to host enterprise applications.

    |Name* |  Listen address*   |Listen port |SSL listen port |SSL enabled |
   _|______|____________________|____________|________________|____________|
 1->| ms1  |All Local Addresses |    7003    |      N/A       |   false    |

Use above value or select another option:
    1 - Modify "Name"
    2 - Modify "Listen address"
    3 - Modify "Listen port"
    4 - Modify "SSL enabled"
    5 - Done




Enter option number to select OR [Exit][Previous][Next]> 4





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Managed Servers:
--------------------------

Add or delete configuration information for Managed Servers. A typical
production environment has one or more Managed Servers. Each Managed Server
is an instance of WebLogic Server used to host enterprise applications.

    *Enter index number to modify "SSL enabled"

   1|true
 ->2|false
   3|Unspecified




Enter index number to select OR [Exit][Reset][Accept]> 1





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Managed Servers:
--------------------------

Add or delete configuration information for Managed Servers. A typical
production environment has one or more Managed Servers. Each Managed Server
is an instance of WebLogic Server used to host enterprise applications.

    |Name* |  Listen address*   |Listen port |SSL listen port |SSL enabled |
   _|______|____________________|____________|________________|____________|
 1->| ms1  |All Local Addresses |    7003    |      7503      |    true    |

Use above value or select another option:
    1 - Add
    2 - Modify
    3 - Delete
    4 - Discard Changes




Enter option number to select OR [Exit][Previous][Next]> 2





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Managed Servers:
--------------------------

Add or delete configuration information for Managed Servers. A typical
production environment has one or more Managed Servers. Each Managed Server
is an instance of WebLogic Server used to host enterprise applications.

    |Name* |  Listen address*   |Listen port |SSL listen port |SSL enabled |
   _|______|____________________|____________|________________|____________|
 1->| ms1  |All Local Addresses |    7003    |      7503      |    true    |




Enter row number to modify OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Clusters:
-------------------

Add or delete configuration information for clusters. A cluster consists of
multiple server instances working together to provide increased scalability
and reliability.

    |Name*|Cluster messaging...|Multicast add...|Multicast ...|Cluster add...|
   _|_____|____________________|________________|_____________|______________|




Enter name for a new Cluster OR [Exit][Previous][Next]> ms1





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Clusters:
-------------------

Add or delete configuration information for clusters. A cluster consists of
multiple server instances working together to provide increased scalability
and reliability.

    |Name*|Cluster messaging...|Multicast add...|Multicast ...|Cluster add...|
   _|_____|____________________|________________|_____________|______________|


    ** CFGFWK-64019:  Invalid input "ms1". CFGFWK-60051:  Property "Name" of
    ** Cluster with original name "" is invalid.
    ** CFGFWK-64015:  The property value is duplicated.




Enter name for a new Cluster OR [Exit][Previous][Next]> 4





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Clusters:
-------------------

Add or delete configuration information for clusters. A cluster consists of
multiple server instances working together to provide increased scalability
and reliability.

    |Name*|Cluster messaging...|Multicast add...|Multicast ...|Cluster add...|
   _|_____|____________________|________________|_____________|______________|
 1->|  4  |      unicast       |      N/A       |     N/A     |              |

Use above value or select another option:
    1 - Modify "Name"
    2 - Modify "Cluster messaging mode"
    3 - Modify "Cluster address"
    4 - Done




Enter option number to select OR [Exit][Previous][Next]> ms1





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Clusters:
-------------------

Add or delete configuration information for clusters. A cluster consists of
multiple server instances working together to provide increased scalability
and reliability.

    |Name*|Cluster messaging...|Multicast add...|Multicast ...|Cluster add...|
   _|_____|____________________|________________|_____________|______________|
 1->|  4  |      unicast       |      N/A       |     N/A     |              |

Use above value or select another option:
    1 - Modify "Name"
    2 - Modify "Cluster messaging mode"
    3 - Modify "Cluster address"
    4 - Done


    ** Invalid input, only integer selection or page movement command are
    ** accepted: ["ms1"]




Enter option number to select OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Assign Servers to Clusters:
---------------------------

Assign Managed Servers to a cluster in the domain.

    Cluster
    |_____4 [1]




Enter number exactly as it appears in brackets to toggle selection OR [Exit][Pre                                          vious][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Machines:
-------------------

Add or delete machines. A machine hosts one or more WebLogic Server
instances. The Admin Server and Node Manager use this machine definition to
start remote servers.

    | Name* | Node manager listen address | Node manager listen port |
   _|_______|_____________________________|__________________________|




Enter name for a new Machine OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Configure Unix Machines:
------------------------

Add or delete machines. A machine hosts one or more WebLogic Server
instances. The Admin Server and Node Manager use this machine definition to
start remote servers.

    | Name |
   _|______|




Enter name for a new Unix Machine OR [Exit][Previous][Next]> n





<------------------- Fusion Middleware Configuration Wizard ------------------>

Creating Domain...

0%          25%          50%          75%          100%
[------------|------------|------------|------------]
[***************************************************]


**** Domain Created Successfully! ****

=========================================================================================

step 10: Start weblogic
        /u01/app/oracle/middleware/user_projects/domains/base_domain/bin/./startWebLogic.sh

step 11: https://ip-add:7001/console

step 12: weblogic configuration file path
cd /u01/app/oracle/middleware/user_projects/domains/base_domain/config

Step 13: Access the log path
cd /u01/app/oracle/middleware/user_projects/domains/base_domain/servers/AdminServer/logs

Step 14: Boot identity file path
 cd /u01/app/oracle/middleware/user_projects/domains/base_domain/servers/AdminServer/security
         
 
