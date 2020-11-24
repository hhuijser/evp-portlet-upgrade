use master
exec sp_dboption 'lportal', 'allow nulls by default' , true
go

exec sp_dboption 'lportal', 'select into/bulkcopy/pllsort' , true
go

use lportal

create table Ntfctns_UserNotificationEvent (
	notificationEventId decimal(20,0) not null primary key,
	companyId decimal(20,0),
	userId decimal(20,0),
	userNotificationEventId decimal(20,0),
	timestamp decimal(20,0),
	delivered int,
	actionRequired int,
	archived int
)
go




