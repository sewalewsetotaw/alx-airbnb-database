insert into "User"(first_name,last_name,email,password_hash,phone_number,role) 
	values('Sewalew','Setotaw','sewalews29@gmail.com','Sew@unna123',0955400102,'n')
	
	select * from "User"
	
	insert into Location(sub_city,city,country) values('Arada','Addis Ababa','Ethiopia')
	
	select * from "location" l 
	
	insert into Property(host_id,name,description,location_id,pricepernight) values(
'80470fa7-7866-4a5d-8556-5baf8ce3d270','Cozy Apartment in Bole','A modern 2-bedroom apartment near restaurants and cafes.',
'00c22559-751a-4170-b81a-271cfdd6526e','1200.50')

select * from property p 

insert into Booking(property_id,user_id,start_date,end_date,total_price,status)values('1484a31f-e30d-4ab1-808c-7f21dbc64ea1','80470fa7-7866-4a5d-8556-5baf8ce3d270','2025-07-01','2025-07-05',2500,'confirmed')


select * from booking b

insert into Payment(booking_id,amount,payment_date,payment_method)values('ccc81935-a58b-461a-82ab-f0ca317e56bf','25000','2025-07-05','paypal')
