telegraf &
sed -i 's,\r,,;s, *$,,' /etc/vsftpd/vsftpd.conf
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf