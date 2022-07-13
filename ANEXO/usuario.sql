create database tiendita;
create user tiendita_mas identified by 'tiendita_mas';
grant all on tiendita.* to 'tiendita_mas'@'%';
flush privileges;
