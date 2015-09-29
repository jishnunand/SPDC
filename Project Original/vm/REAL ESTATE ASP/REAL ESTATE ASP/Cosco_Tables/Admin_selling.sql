select * from selling


select signup.Fname,signup.Lname,signup.Age,signup.Gender,signup.Ph_No,selling.state,selling.district,selling.property,selling.price,selling.imagepath from signup inner join selling on signup.Email=selling.email