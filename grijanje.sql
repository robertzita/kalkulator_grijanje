drop database if exists grijanje;
create database grijanje character set utf8 collate utf8_general_ci;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\php\kalkulator_grijanje\Grijanje.sql
use grijanje;


create table bojler (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
snaga int not null,
korisnik int not null,
slika varchar (200) not null
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
bojler int not null,
slika varchar (200) not null
);

create table serviser (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
adresa varchar (100) not null,
postanskibroj int not null,
brojtelefona varchar (100) not null,
email varchar (150)
);

create table servis (
sifra int not null primary key auto_increment,
serviser int not null,
bojler int not null,
cijena decimal (8,2) not null,
datumservisa datetime not null
);


alter table radijator add foreign key (bojler) references bojler (sifra);
alter table servis add foreign key (serviser) references serviser (sifra);
alter table servis add foreign key (bojler) references bojler (sifra);
alter table korisnik add foreign key (serviser) references serviser (sifra);
alter table bojler add foreign key (korisnik) references korisnik (sifra);

insert into serviser (sifra,naziv,adresa,postanskibroj,brojtelefona,email) values
#zagrebacka zupanija
(null,'Akm Bokun','Josipa Zorića 154, Dugo Selo',10370,'01/27-55-364','info@akm-bokun.hr'),
(null,'Asgard','Đure Josipovića 3, Velika Gorica',10410,'099/8092727','asgardhrvatska@gmail.com'),
(null,'Centroplin plus','Ivana Draškovića 20, Vrbovec',10340,'01/2792-788','nijaz.novljakovic@optinet.hr'),
(null,'Centro-plin sam','Pavlova 4, Hrastina, Samobor',10430,'01/3380-691','centroplinsam@gmail.com'),
(null,'De Lisjak','Matije Gubca 37, Ivanić Grad',10310,'01/28030-358','	info@delisjak.hr'),
(null,'Elektroservis','Komin 2a, Komin',10383,'01/2067-125','goran.knez@zg.t-com.hr'),
(null,'El-term','Radoišće 3, Radoišće',10383,'01/2067-560','elterm@elterm.hr'),
(null,'Instalacije 5M','Donjozelinska 61, Sv.Ivan Zelina',10380,'01/2065-233','instalacije5m@hotmail.com'),
(null,'Instalo Adma','Mihanovićeva ulica 54b, Igrišće, Jakovlje',10297,'01/3351-841','instaloadma@gmail.com'),
(null,'Iva-Z','Majdekova ul. 7, Ivanić Grad',10310,'01/2821-733','tehnika@iva-z.hr'),
(null,'Jurić-elektrotehnik','Vjekoslava Babukića 5, Zaprešić',10290,'01/3313-395','juricelteh@gmail.com'),
(null,'Megovec','Nova ulica 6, Brdovec',10291,'01/3397-411','megovecservis@gmail.com'),
(null,'Mesarić plin','Zagrebačka 100 , Velika Gorica',10410,'01/622-55-05','capa.plin5@gmail.com'),
(null,'Perković','Stubička 188, Zaprešić',10298,'01/3358-176','info@servis-perkovic.hr'),
(null,'PGS','Vrbovečki pavlovec 22, Vrbovec',10340,'01/2791-618','p.g.s@zg.t-com.hr'),
(null,'Plinoservis Međimorec','Zdenačka 65, Zdenci Brdovečki',10291,'01/3397-391','sanjaidrago@gmail.com'),
(null,'Plinoservis Vlahoviček','Videkovići 3, Sveta Nedjelja',10431,'01/3367-200','plinoservis.vlahovicek@gmail.com'),
(null,'Servis Dojčić','Bregovita 81, Brdovec',10291,'01/3359-157','dojcic.k@gmail.com'),
(null,'Suša','Česmanska 106, Okešinec, Novoselec',10315,'01/2891-572','marin.susa@gmail.com'),
(null,'Termomont Seničić','Ul. Svete Doroteje 140, Jakovlje',10297,'01/3351-248','sen@hi.t-com.hr'),
(null,'Termostat','Zanatska 2, Ključ Brdovečki, Brdovec',10291,'091/3395-928','k.sintic@hotmail.com'),
(null,'Termotehnika Tuksar','Mažuranićeva III/5, Samobor',10430,'01/3336-333','termotehnika@tuksar.hr'),
(null,'Tim Vlahoviček','Tuđani 6, Sveta Nedjelja',10431,'01/3373-200','tim.vlahovicek@zg.t-com.hr'),
(null,'V.L. Automatika','Ul. Lovasići 43, Strmec, Sv. Nedjelja',10434,'01/3385-191','info@vlautomatika.hr'),
#krapinsko-zagorska zupanija
(null,'Androić','Frkuljevac Peršaveski 27, Mače',49251,'049/439-175','dragutin.androic@gmail.com'),
(null,'Bubi-prom','Zagrebačka 7, Lobor',49253,'049/430-071','bubi.prom@gmail.com'),
(null,'Central-term','Doliće 1c, Krapina',49000,'049/371-923','goran.krklec@central-term.hr'),
(null,'Centroplin','Gregurovec 28, Krapinske toplice',49217,'049/232-030','centroplin@kr.t-com.hr'),
(null,'Elektroinstal','Tkalci 17, Krapina',49000,'098/1948-131','info@elektroinstal.com.hr'),
(null,'Emos-promet','Velika Ves 106 H, Krapina',49000,'049/372-293','krunoslav.florjan@emos.com.hr'),
(null,'Gabo','Vojnovec 140, Lobor',49253,'049/430-248','davor.galunic@kr.htnet.hr'),
(null,'MA-NI Insart','Cigrovec 17, Pregrada',49218,'049/377-022','nvnvesligaj@gmail.com'),
(null,'Plinoelektro Jadan','Bregovita 4, Zabok',49210,'049/223-336','nikola.jadan@kr.t-com.hr'),
(null,'Požgaj-promet','Marije J. Zagorke 81, Sveti Križ Začretje',49223,'049/228-749','ivica@pozgaj-promet.hr'),
(null,'Preglej-kpv','Plavić 30, Zagorska sela',49296,'049/552-160','drago.preglej@gmail.com'),
#sisacko-moslavacka zupanija
(null,'Elemeh','Odra, 1. lijevi odvojak 12, Sisak',44000,'044/720-265',null),
(null,'I-Plin','Vatrogasna 10, Lekenik',44272,'098/750 015','iplindoo@gmail.com'),
(null,'Servis i instalacije Crnković','Ivana Hangije 19, Petrinja',44250,'044/812-640','serviscrnkovic@gmail.com'),
(null,'Start S','Kolodvorska 28, Kutina',44320,'040/682-695','start.sdoo@gmail.com'),
(null,'Termocentral Batković','Šaratovačka ulica 16 a, Kutina',44320,'098/1929 726','batkovicmario@gmail.com'),
(null,'Termoprodukt','Sigetac 4, Novska',44330,'044/612-213','josiphrastovic1@gmail.com'),
(null,'Tvim-Tonković','Kolodvorska 56, Kutina',44320,'044/682-444','servis@tvim-tonkovic.hr'),
#karlovacka zupanija
(null,'Ds mont','Mala Jelsa 2 g, Karlovac',47000,'099/8004 433','dsmont.karlovac@gmail.com'),
(null,'Eldam','Mala Švarča 23, Karlovac',47000,'047/601-601','eldam.eldam@gmail.com'),
(null,'F.i.d.e.s. Geyser 1967','Vrh 2, Draganići',47201,'098/913 9921','fidesgeyser@gmail.com'),
(null,'Frak','Jelaši 28f, Karlovac',47000,'047/641-400','info@frak.hr'),
(null,'Instalacijski obrt Bertović','Trg Franje Tuđmana 2, Ogulin',47300,'047/537-460','info@bertovic.hr'),
(null,'Klek-mont','Ivana Gorana Kovačića 13, Ogulin',47300,'047/531-564','vlado.kirasic@gmail.com'),
(null,'Servis plamenika','N.Š. Zrinskog 21, Ozalj',47280,'047/731-383','servis.plamenika@gmail.com'),
#varazdinska zupanija
(null,'Eimont','Trenkova 29, Varaždin',42000,'040/897-001','info@eimont.hr'),
(null,'Elektro-mont','Strmec Remetinečki 106, Novi Marof',42220,'042/601-034','kreso.domovic@post.t-com.hr'),
(null,'Energo-S','Trg. A.G. Matoša 3, Varaždin',42000,'042/200-572','info@energo-s.hr'),
(null,'Instalacijski sustavi Fištrek','Varaždinska 52, Ivanec',42240,'042/783-360','isf.fistrek@gmail.com'),
(null,'Mikroklima','Lepoglavska 30, Varaždin',42000,'042/241-090','mikroklima.vz@gmail.com'),
(null,'Plin-mont','V.Nazora 70, Žigrovec',42214,'042/686-177','plin-mont@vz.t-com.hr'),
(null,'Plinoservis Valjak','Željeznica 9, Radovan',42242,'091/539 2265','kresimir63@gmail.com'),
(null,'Servis i montaža Hutinski','Kumičićeva 52, Varaždin',42000,'042/233-125','danilo.hutinski@gmail.com	'),
(null,'Termoplin','V.Špinčića 78, Varaždin',42000,'042/231-444','sanjek@termoplin.com'),
#koprivnicko-krizevacka zupanija
(null,'Centro servis','Varaždinska cesta 155, Koprivnica',48000,'098/876 822','centroservis@gmail.com'),
(null,'Instalcije Horvat','Petefi Šandora 30, Legrad',48317,'048/835-138','info@instalacije-horvat.hr'),
(null,'Mdb service','Kosovec 83, Križevci',48260,'095/505 9827','mdbservice1@gmail.com'),
(null,'Vgp-mont','Vinogradska 28, Đurđevac',48350,'048/811-395','tim5@net.hr'),
(null,'Voda-plin','Ul.Ante Starčevića 14, Koprivnica',48000,'048/222-800','info@voda-plin.hr'),
#bjelovarsko-bilogorska zupanija
(null,'Automatika','Kneza Mislava 3, Hrastovac, Garešnica',43280,'043/326-382','mhasanac@yahoo.com'),
(null,'Darkom','Josipa Kozarca 19, Daruvar',43500,'043/440-776',null),
(null,'Elektromehanika','Gundulićeva 11, Bjelovar',43000,'043/333-189','elektromehanika@bj.t-com.hr'),
(null,'Hajnal','Vukovarska 37, Garešnica',43280,'043/531-647','djuro.hajnal@bj.t-com.hr'),
(null,'Mas montaža','Vidikovac ulica 61, Bjelovar',43000,'043/235-644','mail@masmontaza.hr'),
(null,'MIG','Kokinac 54, Bjelovar',43000,'043/882-045','goran.santekovic@gmail.com'),
(null,'Njofra','Željka Markovića 7, Bjelovar',43000,'098/651 636','njofra.bjelovar@gmail.com'),
(null,'Sgh Bakeš','77.sam. batauljna ZNG 19, Grubišno Polje',43290,'043/331-784','elvis.bakes@gmail.com'),
(null,'Termoplin PIM','Ulica hrvatskog proljeća 6, Bjelovar',43000,'043/244-596','termoplin@bj.t-com.hr');
