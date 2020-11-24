create database 'lportal.gdb' page_size 8192 user 'sysdba' password 'masterkey';
connect 'lportal.gdb' user 'sysdba' password 'masterkey';
create table Ntfctns_UserNotificationEvent (notificationEventId int64 not null primary key,companyId int64,userId int64,userNotificationEventId int64,timestamp int64,delivered smallint,actionRequired smallint,archived smallint);
