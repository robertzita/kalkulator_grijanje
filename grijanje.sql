drop database if exists grijanje;
create database grijanje character set utf8 collate utf8_general_ci;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\php\kalkulator_grijanje\Grijanje.sql
use grijanje;


create table bojler (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
snaga int not null,
korisnik int not null
);


create table korisnik (
sifra int not null primary key auto_increment,
ime varchar (100) not null,
prezime varchar (100) not null,
ulica varchar (100) not null,
mjesto varchar (100) not null,
postanskibroj int not null,
email varchar (200) not null,
brojmobitela varchar (20) not null,
serviser int not null
);

create table radijator (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
tipradijatora varchar (100) not null,
visina int not null,
debljina int not null,
duzina int not null,
snaga int  not null,
zapremnina decimal (3,1) not null,
bojler int not null
);

create table serviser (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
adresa varchar (100) not null,
postanskibroj int not null,
brojtelefona varchar (100) not null
);

create table servis (
serviser int not null,
bojler int not null
);


alter table radijator add foreign key (bojler) references bojler (sifra);
alter table servis add foreign key (serviser) references serviser (sifra);
alter table servis add foreign key (bojler) references bojler (sifra);
alter table korisnik add foreign key (serviser) references serviser (sifra);
alter table bojler add foreign key (korisnik) references korisnik (sifra);
