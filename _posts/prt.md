root@esr0:~# service bind9 status
● named.service - BIND Domain Name Server
     Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor preset>
     Active: active (running) since Tue 2021-03-23 00:01:35 UTC; 3min 40s ago
       Docs: man:named(8)
   Main PID: 607 (named)
      Tasks: 5 (limit: 1073)
     Memory: 20.1M
     CGroup: /system.slice/named.service
             └─607 /usr/sbin/named -f -u bind

Mar 23 00:01:36 esr0 named[607]: network unreachable resolving './DNSKEY/IN': >
Mar 23 00:01:36 esr0 named[607]: network unreachable resolving './NS/IN': 2001>
Mar 23 00:01:36 esr0 named[607]: network unreachable resolving './DNSKEY/IN': >
Mar 23 00:01:36 esr0 named[607]: network unreachable resolving './NS/IN': 2001>
Mar 23 00:01:36 esr0 named[607]: network unreachable resolving './DNSKEY/IN': >
Mar 23 00:01:36 esr0 named[607]: network unreachable resolving './NS/IN': 2001>
Mar 23 00:01:36 esr0 named[607]: network unreachable resolving './DNSKEY/IN': >
Mar 23 00:01:36 esr0 named[607]: network unreachable resolving './NS/IN': 2001>
Mar 23 00:01:37 esr0 named[607]: managed-keys-zone: Key 20326 for zone . is no>
Mar 23 00:01:37 esr0 named[607]: resolver priming query complete

root@esr0:~# ss -tap | grep named
LISTEN   0      10                       192.168.122.232:domain         0.0.0.0:*               users:(("named",pid=607,fd=22),("named",pid=607,fd=21))                        
LISTEN   0      10                             127.0.0.1:domain         0.0.0.0:*               users:(("named",pid=607,fd=18),("named",pid=607,fd=17))                        
LISTEN   0      4096                           127.0.0.1:953            0.0.0.0:*               users:(("named",pid=607,fd=29))                                                
LISTEN   0      10      [fe80::5054:ff:fef6:4882]%enp1s0:domain            [::]:*               users:(("named",pid=607,fd=28),("named",pid=607,fd=27))                        
LISTEN   0      10                                 [::1]:domain            [::]:*               users:(("named",pid=607,fd=25),("named",pid=607,fd=24))                        
LISTEN   0      4096                               [::1]:953               [::]:*               users:(("named",pid=607,fd=30)) 
