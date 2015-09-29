create table selling(email nvarchar(max),state varchar(max),district varchar(max),property varchar(max),price varchar(max),imagename varchar(50) null,imagepath nvarchar(max),contact nvarchar(max))

select * from selling


delete from selling


drop table selling




select * from selling where state='kerala' and District='kasargod' and property='land' and price='5 lakh'