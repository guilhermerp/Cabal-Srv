#!/bin/sh
clear
  echo -en "\n\033[1;32m==========================================="
  echo -en "\n\033[1;32m==\033[1;31mCABAL EP8 Server repack v0.9 Beta\033[1;32m=="
  echo -e "\n\033[1;32m===========================================\033[0m"

  echo -en "\n\033[0;33mRequired OS version: CentOS 6.4 64bit(x86_64)\033[0m" 
  echo -e "\n\033[0;33mYour OS version: $(cat /etc/centos-release) $(uname -m)\033[0m"


   echo -e -n "\n\033[1;32mWould you like to begin the installation? [Y]/[N]: \033[0m"
   read ready
   if [[ -z $ready || $ready == "n" || $ready == "N" ]]; then
    echo -e "\n\033[1;31mYou have cancelled the installation!\033[0m"
    exit 1;
   fi

   echo -e -n "\n\033[1;33mInstall the RPM's? Only do once on a fresh CentOS![Y]/[N]: \033[0m"
   read ready
   if [[ -z $ready || $ready == "y" || $ready == "Y" ]]; then
      echo -e "\n*\033[1;32mInstalling the required rpm's!\033[0m"
      cp --force /root/rpm-install64/CentOS-Base.repo /etc/yum.repos.d/
      rpm --force --nodeps -Uvh --nosignature /root/rpm-install64/openssl097a-0.9.7a-9.x86_64.rpm
      rpm --force --nodeps -Uvh --nosignature /root/rpm-install64/openssl098e-0.9.8e-17.el6.centos.2.x86_64.rpm
      rpm --force --nodeps -Uvh --nosignature /root/rpm-install64/Packages/*
      rpm --force --nodeps -Uvh --nosignature /root/rpm-install64/freetds-0.64-1.el6.rf.x86_64.rpm
      rpm --force --nodeps -Uvh --nosignature /root/rpm-install64/libstdc++6-4.2.2-3mdv2008.0.x86_64.rpm
      rpm --force --nodeps -Uvh --nosignature /root/rpm-install64/krb5-libs-1.10.3-10.el6_4.3.x86_64.rpm
      rpm --force --nodeps -Uvh --nosignature /root/rpm-install64/krb5-libs-1.10.3-10.el6_4.3.i686.rpm
      rpm --force --nodeps -Uvh --nosignature /root/rpm-install64/zlib-1.2.5-codice.4.1.i386.rpm
      rpm --force --nodeps -Uvh --nosignature /root/rpm-install64/openssl098e-0.9.8e-17.el6.centos.2.i686.rpm
      rpm --force --nodeps -Uvh --nosignature /root/rpm-install64/openssl097a-0.9.7a-11.el5_8.2.i386.rpm
   fi

  echo -e "\n*\033[1;31mStopping and deleting previus installations!\033[0m"
  file="/home/cabal/cabal_stop.sh"
  if [ -f "$file" ]
  then
  /home/cabal/cabal_stop.sh
  else
  echo "First time installation, file cabal_stop.sh does not exist yet."
  fi
  rm -rf /etc/cabal

  echo -e "\n*\033[1;32mInstalling base CABAL files!\033[0m"
  rpm --force -Uvh cabal-server-ph-1.0-1.i386.rpm
  
  echo -e "\n*\033[1;31mDeleting files from the base CABAL installation!\033[0m"
  rm -f /var/log/cabal/*
  rm -f /etc/cron.d/*
  rm -rf /home/cabal
  rm -rf /etc/cabal

echo -e "\n*\033[1;32mUpdating the base CABAL files to the latest version!\033[0m"
tar xzf /root/cabal-ep8.tar.gz -C /

echo -e "\n*\033[1;32mSetting first-time permissions and linking commands to files!\033[0m"
chmod -R 0700 /home/cabal/
chmod -R 0644 /etc/cron.d/
chmod -R 0700 /etc/cabal/
chmod -R 0700 /etc/logrotate.d/
chmod -R 0700 /var/log/cabal

chmod 0700 /etc/odbc.ini

ln -sf /usr/bin/DBAgent /usr/bin/CashDBAgent
ln -sf /usr/bin/DBAgent /usr/bin/DBAgent_01
ln -sf /usr/bin/DBAgent /usr/bin/GlobalDBAgent
ln -sf /usr/bin/DBAgent /usr/bin/PCBangDBAgent
ln -sf /usr/bin/DBAgent /usr/bin/EventDBAgent
ln -sf /usr/bin/ChatNode /usr/bin/ChatNode_01
ln -sf /usr/bin/AgentShop /usr/bin/AgentShop_01
ln -sf /usr/bin/LoginSvr /usr/bin/LoginSvr_01
ln -sf /usr/bin/PartySvr /usr/bin/PartySvr_01
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_01
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_02
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_03
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_04
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_05
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_06
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_07
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_08
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_09
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_10
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_11
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_12
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_13
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_14
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_15
ln -sf /usr/bin/WorldSvr /usr/bin/WorldSvr_01_16

chmod 0700 /usr/bin/AuthDBAgent
chmod 0700 /usr/bin/RockAndRollITS
chmod 0700 /usr/bin/DBAgent*
chmod 0700 /usr/bin/GlobalDBAgent
chmod 0700 /usr/bin/GlobalMgrSvr
chmod 0700 /usr/bin/ChatNode*
chmod 0700 /usr/bin/CashDBAgent
chmod 0700 /usr/bin/PCBangDBAgent
chmod 0700 /usr/bin/EventDBAgent
chmod 0700 /usr/bin/EventMgrSvr
chmod 0700 /usr/bin/AgentShop*
chmod 0700 /usr/bin/LoginSvr*
chmod 0700 /usr/bin/PartySvr*
chmod 0700 /usr/bin/WorldSvr*

rm -f /etc/init.d/AuthDBAgent
rm -f /etc/init.d/RockAndRollITS
rm -f /etc/init.d/DBAgent*
rm -f /etc/init.d/GlobalDBAgent
rm -f /etc/init.d/GlobalMgrSvr
rm -f /etc/init.d/ChatNode*
rm -f /etc/init.d/CashDBAgent
rm -f /etc/init.d/PCBangDBAgent
rm -f /etc/init.d/EventDBAgent
rm -f /etc/init.d/EventMgrSvr
rm -f /etc/init.d/AgentShop*
rm -f /etc/init.d/LoginSvr*
rm -f /etc/init.d/PartySvr*
rm -f /etc/init.d/WorldSvr*

ln -sf /etc/init.d/cabal_server /etc/init.d/AuthDBAgent
ln -sf /etc/init.d/cabal_server /etc/init.d/RockAndRollITS
ln -sf /etc/init.d/cabal_server /etc/init.d/DBAgent_01
ln -sf /etc/init.d/cabal_server /etc/init.d/GlobalDBAgent
ln -sf /etc/init.d/cabal_server /etc/init.d/GlobalMgrSvr
ln -sf /etc/init.d/cabal_server /etc/init.d/ChatNode_01
ln -sf /etc/init.d/cabal_server /etc/init.d/CashDBAgent
ln -sf /etc/init.d/cabal_server /etc/init.d/PCBangDBAgent
ln -sf /etc/init.d/cabal_server /etc/init.d/EventDBAgent
ln -sf /etc/init.d/cabal_server /etc/init.d/EventMgrSvr
ln -sf /etc/init.d/cabal_server /etc/init.d/AgentShop_01
ln -sf /etc/init.d/cabal_server /etc/init.d/LoginSvr_01
ln -sf /etc/init.d/cabal_server /etc/init.d/PartySvr_01
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_01
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_02
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_03
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_04
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_05
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_06
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_07
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_08
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_09
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_10
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_11
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_12
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_13
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_14
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_15
ln -sf /etc/init.d/cabal_server /etc/init.d/WorldSvr_01_16

chmod 0700 /etc/init.d/AuthDBAgent
chmod 0700 /etc/init.d/RockAndRollITS
chmod 0700 /etc/init.d/DBAgent*
chmod 0700 /etc/init.d/GlobalDBAgent
chmod 0700 /etc/init.d/GlobalMgrSvr
chmod 0700 /etc/init.d/ChatNode*
chmod 0700 /etc/init.d/CashDBAgent
chmod 0700 /etc/init.d/PCBangDBAgent
chmod 0700 /etc/init.d/EventDBAgent
chmod 0700 /etc/init.d/EventMgrSvr
chmod 0700 /etc/init.d/AgentShop*
chmod 0700 /etc/init.d/LoginSvr*
chmod 0700 /etc/init.d/PartySvr*
chmod 0700 /etc/init.d/WorldSvr*
chmod 077 /etc/init.d/cabal
chmod 077 /etc/init.d/cabal_server

ln -sf /home/cabal/cabal_rates.sh /usr/bin/cabal_rates
ln -sf /home/cabal/cabal_config.sh /usr/bin/cabal_config
ln -sf /home/cabal/start_war.sh /usr/bin/war_start
ln -sf /home/cabal/stop_war.sh /usr/bin/war_stop
ln -sf /home/cabal/start_saint.sh /usr/bin/saint_start
ln -sf /home/cabal/stop_saint.sh /usr/bin/saint_stop
ln -sf /home/cabal/cabal_start.sh /usr/bin/cabal_start
ln -sf /home/cabal/cabal_stop.sh /usr/bin/cabal_stop
ln -sf /home/cabal/cabal_restart.sh /usr/bin/cabal_restart
ln -sf /home/cabal/cabal_restartlog.sh /usr/bin/cabal_restartlog
ln -sf /home/cabal/cabal_status.sh /usr/bin/cabal_stat

ln -sf /etc/cabal/Templates/template1.sh /usr/bin/cabal_chan1
ln -sf /etc/cabal/Templates/template2.sh /usr/bin/cabal_chan2
ln -sf /etc/cabal/Templates/template3.sh /usr/bin/cabal_chan3
ln -sf /etc/cabal/Templates/template4.sh /usr/bin/cabal_chan4
ln -sf /etc/cabal/Templates/template5.sh /usr/bin/cabal_chan5
ln -sf /etc/cabal/Templates/template6.sh /usr/bin/cabal_chan6
ln -sf /etc/cabal/Templates/template7.sh /usr/bin/cabal_chan7
ln -sf /etc/cabal/Templates/template8.sh /usr/bin/cabal_chan8
ln -sf /etc/cabal/Templates/template9.sh /usr/bin/cabal_chan9
ln -sf /etc/cabal/Templates/template10.sh /usr/bin/cabal_chan10
ln -sf /etc/cabal/Templates/template11.sh /usr/bin/cabal_chan11
ln -sf /etc/cabal/Templates/template12.sh /usr/bin/cabal_chan12
ln -sf /etc/cabal/Templates/template13.sh /usr/bin/cabal_chan13
ln -sf /etc/cabal/Templates/template14.sh /usr/bin/cabal_chan14
ln -sf /etc/cabal/Templates/template15.sh /usr/bin/cabal_chan15
ln -sf /etc/cabal/Templates/template16.sh /usr/bin/cabal_chan16
ln -sf /etc/cabal/Templates/template17.sh /usr/bin/cabal_chan17
ln -sf /etc/cabal/Templates/template18.sh /usr/bin/cabal_chan18
ln -sf /etc/cabal/Templates/template19.sh /usr/bin/cabal_chan19
ln -sf /etc/cabal/Templates/template20.sh /usr/bin/cabal_chan20

  echo -e "\n*\033[1;32mAuto configuring services, ignore errors.\033[0m"
chkconfig auditd on
chkconfig messagebus on
chkconfig restorecond on
chkconfig haldaemon on

chkconfig sshd on
service sshd start

chkconfig iptables off
service iptables stop
chkconfig ip6tables off
service ip6tables stop

chkconfig crond off
service crond stop

chkconfig netfs off
chkconfig NetworkManager on
chkconfig blk-availability off
chkconfig cabal off
chkconfig lvm2-monitor off
chkconfig mdmonitor off
chkconfig postfix off
chkconfig spice-vdagentd off
chkconfig udev-post off

      cp --force /root/rpm-install64/original_CentOS-Base.repo/CentOS-Base.repo /etc/yum.repos.d/

/etc/cabal/Templates/template20.sh

