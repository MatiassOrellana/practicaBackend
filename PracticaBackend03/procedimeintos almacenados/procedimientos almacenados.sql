create proc MostrarUsuariosPorLibro
@id int
as
select u.*
from Users as u inner join Reserve on u.id = id_user
where id_book = @id

create proc MostrarUsuarios
as
select e.id, e.nameUser, e.faculty
from Users as e

create proc MostrarLibrosPorUsuario
@id int
as
select b.* from Books as b inner join Reserve as p on id = p.id_book
where p.id_user = @id

create proc MostrarLibros
as
select id, name_book, description
from Books

create proc ContarLibros
@id int
as
select COUNT(*) from Books inner join Reserve on id_book = id
where id_user = @id

create proc MostrarfechaMasReciente
@id int
as
select max(reserved) from Reserve
where id_user = @id