use master
exec sp_dboption 'lportal', 'allow nulls by default' , true
go

exec sp_dboption 'lportal', 'select into/bulkcopy/pllsort' , true
go

use lportal

create table OAuth_OAuthApplication (
	oAuthApplicationId decimal(20,0) not null primary key,
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(75) null,
	description varchar(1000) null,
	consumerKey varchar(75) null,
	consumerSecret varchar(75) null,
	accessLevel int,
	logoId decimal(20,0),
	shareableAccessToken int,
	callbackURI varchar(1000) null,
	websiteURL varchar(1000) null
)
go

create table OAuth_OAuthUser (
	oAuthUserId decimal(20,0) not null primary key,
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	oAuthApplicationId decimal(20,0),
	accessToken varchar(75) null,
	accessSecret varchar(75) null
)
go




