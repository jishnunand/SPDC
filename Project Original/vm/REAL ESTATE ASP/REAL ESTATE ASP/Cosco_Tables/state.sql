create table state(State_Id int,State_Name varchar(50))


insert into state values(01,'Kerala')
insert into state values(02,'TamilNadu')
insert into state values(03,'Karnataka')
insert into state values(04,'AndhraPradesh')



select * from state


select district.city_name,state.State_Name from district inner join state on district.state_id = state.State_Id 