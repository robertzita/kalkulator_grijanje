drop database if exists grijanje;
create database grijanje character set utf8 collate utf8_general_ci;
# c:\xampp\mysql\bin\mysql -uedunova -pedunova --default_character_set=utf8 < d:\php\kalkulator_grijanje\Grijanje.sql
use grijanje;


create table bojler (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
ucinaknagrijanju decimal (4,2) not null,
ucinaknatoplojvodi decimal (4,2) not null,
slika varchar (200) not null,
korisnik int
)engine=innodb;


create table korisnik (
sifra int not null primary key auto_increment,
ime varchar (100) not null,
prezime varchar (100) not null,
adresa varchar (100) not null,
postanskibroj int not null,
email varchar (200),
brojtelefona varchar (50),
serviser int 
)engine=innodb;
create table radijator (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
tipradijatora varchar (50) not null,
visina int not null,
duzina int not null,
snaga int  not null,
zapremnina decimal (3,1) not null,
bojler int,
slika varchar (200) not null
)engine=innodb;

create table serviser (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
adresa varchar (100) not null,
postanskibroj int not null,
brojtelefona varchar (50) not null,
email varchar (150)
)engine=innodb;

create table servis (
sifra int not null primary key auto_increment,
naziv varchar (100) not null,
serviser int ,
bojler int ,
cijena decimal (8,2) not null,
datumservisa datetime not null
)engine=innodb;


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
(null,'Termoplin PIM','Ulica hrvatskog proljeća 6, Bjelovar',43000,'043/244-596','termoplin@bj.t-com.hr'),
#primorsko-goranska zupanija
(null,'Automatika Plus','Franje Čandeka 23a, Rijeka',51000,'091/769 9258','jdubravac5@gmail.com'),
(null,'Centroplin','Istarska 3, Nerezine',51554,'051/237-189','centroplin.nerezine@gmail.com'),
(null,'Elektroservis Hržić','B. Župana 3, Malinska',51511,'091/8821 780','alen.hrzic@ri.t-com.hr'),
(null,'Excellent','Dr. I. Poščića 5, Opatija',51410,'051/701-578','kservis@net.hr'),
(null,'Fiamma','Put k igralištu 15, Rijeka',51000,'091/1516 412','kristianliguori@gmail.com'),
(null,'Tecpoint','Drage Gušč 37, Rijeka',51000,'051/458-193','info@tecpoint.hr'),
(null,'Termo-Ado','Pionirska 9, Rijeka',51000,'051/262-567','termo.ado@gmail.com'),
(null,'VGS Šimić','Braće Cetine 3, Rijeka',51000,'051/262-340','simicinjo@gmail.com'),
#viroviticko-podravska zupanija
(null,'Centro-plin','Trg kralja Petra Svačića 40, Virovitica',33000,'033/722-822','centroplin.vt@gmail.com'),
(null,'Elips','Mlinska 51, Slatina',33520,'033/551-087','elips@vt.t-com.hr'),
(null,'Munta','	Brune Bušića 37, Slatina',33520,'099/6855 347','munta7@gmail.com'),
(null,'Orban-mont','Podravska 4, Virovitica',33000,'033/787-204','orbanmont@yahoo.com'),
#pozesko-slavonska zupanija
(null,'Gema usluge','Petra Preradovića 5, Pakrac',34550,'034/421-884','info@servis-zandona.hr'),
(null,'H&B instalacije','Hrvatskih branitelja 73, Požega',34000,'034/272-862','branimirbrkovick@net.hr'),
(null,'TLN instalacije','Ivana Gundulića 12, Požega',34000,'034/410-142','tlninstalacije@gmail.com'),
#brodsko-posavska zupanija
(null,'DND servis','Vida Došena 72, Slavonski Brod',35000,'035/256-214','dndorlovic@gmail.com'),
(null,'Grijanje Opačak','Osječka 165, Slavonski Brod',35000,'035/255-233','goran.opacak@sb.t-com.hr'),
(null,'MB instalacije','B.J.Jelačića 30, Nova Gradiška',35400,'035/364-693','mb.instalacije@gmail.com'),
(null,'NG plin','Željeznička 31, Nova Gradiška',35400,'091/4035 008','info@ngplin.hr'),
(null,'SB Termoservis','Hrvatskih branitelja 60, Ruščica',35208,'035/457-253','davorin.jurcic@net.hr'),
(null,'Servis Dabić','Kneza Domagoja 21, Slavonski Brod',35000,'035/440-583','rajko.dabic26@gmail.com'),
(null,'Servis za plinska trošila','Josipa Pleše 17, Slavonski Brod',35000,'091/7632 373','servis.sedlo@gmail.com'),	
(null,'Termo-Brod','Vladimira Filikovca 15, Slavonski Brod',35000,'035/462-259','mladen-djuric@net.hr'),	
(null,'Termocentar','Karla Dieneša 29, Nova Gradiška',35400,'035/361-697','termocentar@sb.t-com.hr'),		
(null,'Termomont','Ante Starčevića 113, Okučani',35430,'035/372-036','termomont@net.hr'),
(null,'Termoservis','Firov kraj 93, Bukovlje',35209,'035/276-744','martin.mataic@gmail.com'),	
(null,'Time','Jakova Užarevića 4, Slavonski Brod',35000,'035/625-800','timeservis.sb@gmail.com'),		
(null,'T-montaža','Giletinci 67, Cernik',35404,'035/369-590','ivan_terzic20@hotmail.com'),		
(null,'Vodo i plinoinstalaterski obrt','Antuna Padovanskog 119, Garčin',35212,'035/423-974','ivan.cavara1@gmail.com'),
#zadarska zupanija
(null,'Murk','Antuna Barca 3A, Zadar',23000,'023/240-514','murk@xnet.hr'),		
(null,'Petar Martinović','Lička 26, Zadar',23000,'023/341-083','petarmartinovic123@icloud.com'),
(null,'Silva Calor','Ninski stanovi, ulica I., Nin',23232,'091/282 8120','goran.keri@gmail.com'),
(null,'VM FRIGO','Murvica 200, Zadar',23000,'023/276-250','vm.frigo@zd.t-com.hr'),
#osjecko-baranjska zupanija
(null,'Dam-plin','Josipa Kozarca 1, Đakovo',31400,'031/836-112','grizelj.darko@gmail.com'),
(null,'DMK Servisi','Biljska cesta 66, Osijek',31000,'031/208-833','nenad.jankovic@dmkservisi.com'),
(null,'Euro-plin','Kralja Tomislava 7, Đakovo',31400,'031/820-444','euro.plin@gmail.com'),
(null,'Kovačević instalacijski obrt','Gundulićeva 22, Donji Miholjac',31540,'031/630-055','miroslav.kovacevic@inet.hr'),
(null,'Miconic-dizala','Paška 5, Osijek',31000,'031/503-407','miconic@miconic-dizala.hr'),
(null,'Montis','P. Dobrovića 1, Beli Manastir',31300,'099/2141 347','montis.nikola@gmail.com'),
(null,'Plinoservis','Braće Radića 23, Našice',31500,'031/613-505','hupa@net.hr	www.plinoservis-zavada.hr'),
(null,'Plinoservis Vučković','Pavićeva 11, Đakovo',31400,'031/812-612','plinoservisvuckovic@gmail.com'),
(null,'Servis Buhin','Psunjska 78, Osijek',31000,'031/301-622','servis.buhin@gmail.com'),
(null,'Termo-plin','Jakova Gotovca 9, Našice',31500,'031/681-362','pavo.ljulj@os.t-com.hr'),
(null,'Thermo-OS','Bana Josipa Jelačića 47, Višnjevac',31220,'031/281-628','thermo.osijek@gmail.com'),
#sibensko-kninska zupanija
(null,'Elektrolux trgovina i servis','Pod Vidilicom 2, Šibenik',22000,'022/351-900','info@elektrolux.hr'),
(null,'Instalacije Burić','Puz kroz Meterize 12, Šibenik',22000,'098/1847 586','buricinstalacije@hotmail.com'),
(null,'MG','Aleksandra Curavića 21, Šibenik, Brodarica',22010,'022/350-291','mg-obrt@si.t-com.hr'),
#vukovarsko-srijemska zupanija
(null,'Astaloš servis','H.V. Hrvatinića 96, Vinkovci',32100,'032/306-052','astalosz@gmail.com'),
(null,'Bakrovod','Dubrovačka 27, Županja',32270,'032/833-777','bakrovod1@vu.t-com.hr'),
(null,'Đuka-plin','Požeška 36, Vinkovci',32100,'032/301-149','djst1961@gmail.com'),
(null,'Impuls','Ukrajinska 44, Vukovar',32000,'032/569-359','ito.impuls@gmail.com'),
(null,'Instalacije Boroš','Mala Kućišta 27, Županja',32270,'098/934 5452','instalacije.boros@gmail.com'),
(null,'Lpc','Velika skela 24, Vukovar',32000,'032/413-046','lpc@vu.t-com.hr'),
(null,'NS servis','K.A.Stepinca 34, Vukovar',32000,'032/430-044','ns.servis.vu@gmail.com'),
(null,'PC servis','Široki put 67, Stari Mikanovci',32284,'032/413-046','pcservis.vukovar@gmail.com'),
(null,'Plinoterm','Trpinjska cesta 24, Vukovar',32000,'032/421-023','ivbusic@inet.hr'),
(null,'Regulator','Bana Jelačića 13, Vukovar',32000,'032/331-382','servis@regulator-vk.hr'),
(null,'Top-lina','J.J.Strosmayera 8, Privlaka',32251,'032/398-248','kreso.kostanjcar@vu.t-com.hr'),
(null,'ZM modern','B.Jelačića 4, Ilok',32236,'032/596-303','z.milko@gmail.com'),
#splitsko-dalmatinska zupanija
(null,'Aquamax','Sv. Florijana 3, Makarska',21300,'091/3333 888','aquamax007@gmail.com'),
(null,'Elektromehanika','Domovinskog rata 58, Klis',21231,'021/332-643','tomislavduzevic@yahoo.com'),
(null,'Fenoled','Varoš 50, Klis',21231,'021/240-461','tomislav.glavina@st.t-com.hr'),
(null,'Plining','Zrinsko Frankopanska 18, Makarska',21300,'021/610-419','petar.barisic@st.t-com.hr'),
(null,'Zmijavci','Zmijavci bb, Zmijavci',21266,'021/840-475','pgudelj00@gmail.com'),
#istarska zupanija
(null,'Demarchi','Palih boraca 2, Brtonigla',52470,'098/1807 616','demarchi.d.o.o.@pu.t-com.hr'),
(null,'El-dom servis','Riva 4, Pula',52100,'052/540-568','eldomservis@gmail.com'),
(null,'Elspeed','Istarska 26a, Rovinj',52210,'052/813-551','elspeed@pu.htnet.hr'),
(null,'Grijanje Nikolić','Guiseppe Verdi 11, Buje',52460,'052/772-640','ante.nikolic@pu.t-com.hr'),
(null,'Klimamerks','Borik 60, Pula',52100,'052/534-450','klimamerks@hi.t-com.hr'),
(null,'Palman-thermo','M.Vlašića 39, Poreč',52440,'052/432-008','palman.thermo@pu.t-com.hr'),
(null,'Peharda klimatizacija','Monfiorenzo 69, Rovinj',52210,'052/817-248','peharda.klima@gmail.com'),
(null,'Plin projekt','Marčana 83 a, Marčana',52206,'052/571-090','mario@plin-projekt.com'),
(null,'Plinara','Industrijska 17, Pula',52100,'052/534-944','plinara@plinara.hr'),
(null,'Shiterm','Katuni Lindarski 58 c, Pazin',52000,'052/693-036','shiterm.pazin@gmail.com'),
(null,'Termo servis','Jelušićev prilaz 3, Pula',52100,'091/4009 405','termoservispula@gmail.com'),
(null,'Ukota','Glavani 25, Barban',52207,'052/580-147','edi.ukota@gmail.com'),
#dubrovacko-neretvanska zupanija
(null,'Central Term','Andrije Hebranga 12, Metković',20350,'020/686-718','rade.volarevic@gmail.com'),
(null,'New Energy','Zrinskih i Frankopana 23, Metković',20350,'095/7306 025','info@new-energy.hr'),
(null,'Plinoservis','Predolac 4, Metković',20350,'020/681-752','tboras@yahoo.com'),
#medimurska zupanija
(null,'Elka-teh','Gardinovec 299, Belica',40319,'040/843-070','elkateh@gmail.com'),
(null,'Instalomont termocentar','Kralja Tomislava 7, Čakovec',40000,'040/310-165','termocentar@email.t-com.hr'),
(null,'Kos','Kralja Tomislava 139, Kotoriba',40329,'040/682-113','info@kos.com.hr	www.kos.com.hr'),
(null,'Lapuh','Katarine Zrinski 29, Sveta Marija',40326,'040/660-255','info@lapuh.hr'),
(null,'Mika','Josipa Bedekovića 2/a, Šenkovec, Čakovec',40000,'040/343-747','mika.servis@gmail.com'),
(null,'Mirakul','Jug II 10, Prelog',40323,'040/682-637','marjan.francic@gmail.com'),
(null,'Sabol','Glavna 18 D, Sveta Marija',40326,'040/660-359','zdravko.sabol@vz.t-com.hr'),
(null,'Termoservis','Ivane Brlić Mažuranić 26, Čakovec',40000,'040/395-970','mario.toplek.termoservis@gmail.com'),
#grad zagreb
(null,'Aduro','Ulica Kralja Zvonimira 41, Zagreb',10000,'01/2305-613','adurotehnika@gmail.com'),
(null,'Aki-d-vod','Prva Gupčeva 4, Sesvete',10360,'01/2004-469','servis@akidvod.hr'),
(null,'Anđelo','Ilica 235, Zagreb',10000,'01/3906-836','andjelozagreb@gmail.com'),
(null,'Babić Zg plinoservis','Medveščak 23, Zagreb',10000,'01/4666-568','babic.zg@plinoservis.hr'),
(null,'Bojler-plin','Trdice 49/1, Zagreb',10000,'01/3453-942','info@bojlerplin.hr'),
(null,'Branko Lujanac','Jordanovac 113, Zagreb',10000,'01/2346-397','brankolujanac@gmail.com'),
(null,'Darmat','Jurja Ves 28a, Zagreb',10000,'01/2340-460','darmatzg@gmail.com'),
(null,'Denmar-prom','Našička 13, Zagreb',10000,'01/6145-464','denmar@denmar.hr'),
(null,'DF instalacije','VII. Podbrežje 29, Novi Zagreb',10020,'01/6566-666','info@df-instalacije.hr'),
(null,'Domin-plin','Remetinečka cesta 7a, Zagreb',10000,'01/6536-962','ivan.domin@zg.t-com.hr'),
(null,'Eko plinar','Ive Kerdića 43, Sesvete',10360,'01/2924-748','barlek03@gmail.com'),
(null,'Ekoterm','Hercegovačka 5, Sesvete',10360,'01/2006-015','ekoterm.sesvete@gmail.com'),
(null,'Elektro Perković','Lavoslava Ružićke 32, Zagreb',10000,'098/823812','darinko.perkovic1@gmail.com'),
(null,'EL-MA servis','Brazilska 18, Zagreb',10000,'01/3499-431','el-ma@el-ma.hr'),
(null,'El-plin','Postojnska 2, Zagreb',10000,'01/3079-487','el-plin@el-plin.hr'),
(null,'Energoterm Bartolić','Švarčanska 14, Zagreb',10000,'091/5257 809','hrvoje.bartolic1@gmail.com'),
(null,'Europlin','Zagrebačka 70/3, Sesvete',10360,'01/2012-622','zdenko.mikus@gmail.com'),
(null,'Fi 22','Fallerovo šetalište 16, Zagreb',10000,'01/3688-888','goran.borcic@gmail.com'),
(null,'Hudek plin','Jurja Dalmatinca 6, Zagreb',10000,'01/2330-230','hudekplin@gmail.com'),
(null,'Instalater','Side Košutić 20, Zagreb',10000,'01/3462-283','robert.hasanagic2@gmail.com'),
(null,'Instalograd promet','Slavonska avenija 11, Zagreb',10000,'01/2370-950','info@instalogradpromet.hr'),
(null,'Iskrica','Grge Novaka 28, Sesvete-Kraljevec',10361,'01/2913-857','info@plinoservisiskrica.hr'),
(null,'Koren plin','Bukovac ul. 115, Zagreb',10000,'01/2340-747','korenplin@gmail.com'),
(null,'Luka term','Vrapčanska draga 45, Zagreb',10000,'01/3483-832','lukaterm1@gmail.com'),
(null,'Mont Ra','2. Barilovička 5, Zagreb',10000,'01/3097-983','babic.montra@gmail.com'),
(null,'P.E.C.','Tvrtkova 4, Zagreb',10000,'01/4614-392','kmarinkovic@yahoo.com'),
(null,'Petrokov - Servisi','2.Maksimirsko naselje 17, Zagreb',10000,'01/2323-877','petrokov-servisi@zg.t-com.hr'),
(null,'Plinoinst','Zlatarska 55b , Sesvete',10360,'01/2044-189','plinoinst@gmail.com'),
(null,'Plinoinst. Servis Juranić','Buconjićeva 32, Zagreb',10000,'01/2323-877','plinoservis@juranic.tcloud.hr'),
(null,'Plinoinstalater Ivanović','Belečka 5, Sesvete',10360,'01/2002-474','servis.marko1@gmail.com'),
(null,'Plinoservis Grgičević','Radnička cesta 1 , Zagreb',10000,'01/6184-625','mario.grgicevic@zg.t-com.hr'),
(null,'Plinoservis Slunjski','Banjolska 15, Zagreb',10000,'098/1915 866','zlatko.slunjski@zg.t-com.hr'),
(null,'Plinoservis Topić','Heinzelova 1, Zagreb',10000,'01/4650-009','info@plinoservis-topic.hr'),
(null,'Plinoservis Žganjer','Vinička ulica 24, Zagreb',10000,'01/3026-426','plinoservis.zganjer@gmail.com'),
(null,'Prosinečki','Nova cesta 184, Zagreb',10000,'01/6190-710','prosinecki@prosinecki.hr'),
(null,'Pucko usluge','Tupekova 4, Sesvete',10360,'01/2005-581','puckousluge@gmail.com'),
(null,'Retel','Sveti Duh 2-10, Zagreb',10000,'01/3909-966','zdravko.petrovic@retel.hr'),
(null,'Sendi LD plin','Pirovec 16, Zagreb',10000,'01/4674-991','sendi.plin@gmail.com'),
(null,'Servis Ciković','Popovečka 10, Sesvete',10360,'01/2048-056','drago.cikovic@gmail.com'),
(null,'Servis Validžić','Vinodolska 90a, Zagreb',10000,'01/2915-545','servis.validzic@gmail.com'),
(null,'Servoplin','Breza 36b, Zagreb',10000,'01/2930-438','servoplin@net.amis.hr'),
(null,'Solis Romano','Grebenščica 11, Zagreb',10000,'01/4637-591','servis@solis-romano.hr'),
(null,'Solterm','Jarnovićeva 3, Zagreb',10000,'01/3885-559','solterm.zg@gmail.com'),
(null,'Sruk elektron','Mljekarska 17, Zagreb',10000,'01/2866-670','zeljko.sruk5@zg.t-com.hr'),
(null,'STP','Zlatarova zlata 65 b, Novi Zagreb',10020,'01/6553-455','stp@zg.t-com.hr'),
(null,'T.M. Montaža','Barutanski jarak 115 a, Zagreb',10000,'01/2310-832','tm-montaza@inet.hr'),
(null,'Termika','Josipa Strganca 2, Zagreb',10000,'01/2989-784','termika.plin@mail.inet.hr'),
(null,'Termomonting','Nova cesta 192, Zagreb',10000,'01/3688-733','termomonting@zg.t-com.hr'),
(null,'Termosistemi','Augusta Šenoe 10, Sesvete',10360,'01/2044-224','tomislav@termosistemi.hr'),
(null,'Termo-svip','Tratinska 25, Zagreb',10000,'01/3094-836','termosvip@gmail.com'),
(null,'Uslužni obrt i grijanje Jurić','Karla Bošnjaka 11, Ivanja Reka',10373,'01/2010-456','juric.grijanje@gmail.com'),
(null,'Zagrebgradnja','5. Ravnice 6, Zagreb',10000,'01/2351-700','zdenko.severin@zagrebgradnja.hr'),
(null,'Zeko zna','Frana Alfirevića 61, Zagreb',10000,'01/2304-555','info@zeko-zna.hr');

insert into korisnik(sifra,ime,prezime,adresa,postanskibroj,email,brojtelefona,serviser) values
(null,'Robert','Zita','Hrvatskih branitelja 6, Valpovo',31550,'zitaa91@gmail.com','0915654643',111),
(null,'Marko','Palić','Buconjićeva 55, Zagreb',10000,'mpalic@gmail.com','0988453643',188),
(null,'Valentina','Konić','H.V. Hrvatinića 5, Vinkovci',32100,'konicv91@gmail.com','099325987',120),
(null,'Tihana','Erić','Mala Jelsa 18, Karlovac',47000,'erictihana@gmail.com','092479864',46);

insert into bojler(sifra,naziv,ucinaknagrijanju,ucinaknatoplojvodi,slika,korisnik) values
(null,'VAILLANT PLIN KOTAO VUW 116/5-3',11,23,'D:/VUW INT 116–246.jpg',1),
(null,'VAILLANT PLIN KOTAO VUW 186/5-3',18.5,23,'D:/VUW INT 116–246.jpg',2),
(null,'VAILLANT PLIN KOTAO VUW 206/5-5',20,24,'D:/VUW INT 206-306.jpg',3),
(null,'VAILLANT PLIN KOTAO VUW 246/5-3',24,28,'D:/VUW INT 116–246.jpg',4),
(null,'VAILLANT PLIN KOTAO VUW 256/5-5',25,30,'D:/VUW INT 206-306.jpg',2),
(null,'VAILLANT PLIN KOTAO VUW 306/5-5',30,34,'D:/VUW INT 206-306.jpg',1);


insert into servis (sifra,naziv,serviser,bojler,cijena,datumservisa) values
(null,'Redovan servis',111,1,300,'2018-11-25 14:30:00'),
(null,'Promjena plinskog ventila',111,6,950,'2018-12-27 11:00:00'),
(null,'Redovan servis',188,2,450,'2017-01-27 13:44:00'),
(null,'Izmjena matične ploče',188,5,3500.50,'2016-07-01 16:25:00'),
(null,'Redovan servis',120,3,250,'2015-08-25 17:45:30'),
(null,'Redovan servis',46,4,350,'2018-08-25 18:21:48');

insert into radijator (sifra,naziv,tipradijatora,visina,duzina,snaga,zapremnina,bojler,slika) values
(null,'VAILLANT 11K 600x500','TIP 11',600,500,609,2.9,1,"D:/radijator vaillant.jpg"),
(null,'VAILLANT 21K 500x1200','TIP 21',500,1200,1819,4.9,1,"D:/radijator vaillant.jpg"),
(null,'VAILLANT 21K 600x400','TIP 21',600,400,696,5.8,1,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 21K 600x600','TIP 21',600,600,1044,5.8,1,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 21K 600x800','TIP 21',600,800,1392,5.8,1,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 21K 600x900','TIP 21',600,900,1566,5.8,1,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 21K 600x1000','TIP 21',600,1000,1740,5.8,1,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 21K 600x1200','TIP 21',600,1200,2088,5.8,1,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 21K 600x1400','TIP 21',600,1400,2436,5.8,2,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 21K 900x400','TIP 21',900,400,940,8.3,2,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 21K 900x500','TIP 21',900,500,1175,8.3,2,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 21K 900x600','TIP 21',900,600,1410,8.3,2,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 21K 900x800','TIP 21',900,800,1880,8.3,2,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 22K 400x600','TIP 22',400,600,1005,3.9,2,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 22K 500x600','TIP 22',500,600,1197,4.8,2,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 22K 500x800','TIP 22',500,800,1596,4.8,2,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 22K 500x1000','TIP 22',500,1000,1995,4.8,2,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 500x1100','TIP 22',500,1100,2195,4.8,2,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 500x1200','TIP 22',500,1200,2394,4.8,2,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 500x1400','TIP 22',500,1400,2793,4.8,3,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 500x1600','TIP 22',500,1600,3192,4.8,3,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 22K 500x2400','TIP 22',500,2400,4788,4.8,3,'D:/radijator vaillant.jpg'),
(null,'VAILLANT 22K 600x400','TIP 22',600,400,920,5.7,3,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x500','TIP 22',600,500,1150,5.7,3,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x600','TIP 22',600,600,1380,5.7,3,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x700','TIP 22',600,700,1610,5.7,3,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x800','TIP 22',600,800,1840,5.7,3,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x900','TIP 22',600,900,2070,5.7,3,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x1000','TIP 22',600,1000,2300,5.7,4,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x1100','TIP 22',600,1100,2530,5.7,4,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x1200','TIP 22',600,1200,2760,5.7,4,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x1300','TIP 22',600,1300,2990,5.7,4,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x1400','TIP 22',600,1400,3220,5.7,4,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x1500','TIP 22',600,1500,3450,5.7,4,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x1600','TIP 22',600,1600,3680,5.7,4,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x1800','TIP 22',600,1800,4140,5.7,5,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x2000','TIP 22',600,2000,4600,5.7,5,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 600x2200','TIP 22',600,2200,5060,5.7,5,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 900x400','TIP 22',900,400,1255,8.7,4,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 900x500','TIP 22',900,500,1569,8.7,4,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 900x600','TIP 22',900,600,1882,8.7,5,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 900x700','TIP 22',900,700,2196,8.7,5,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 900x800','TIP 22',900,800,2510,8.7,5,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 900x900','TIP 22',900,900,2823,8.7,5,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 900x1000','TIP 22',900,1000,3137,8.7,6,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 900x1200','TIP 22',900,1200,3764,8.7,6,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 22K 900x1400','TIP 22',900,1400,4392,8.7,6,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 33K 600x800','TIP 33',900,800,2601,8.7,6,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 33K 600x1000','TIP 33',600,1000,3251,8.7,6,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 33K 600x1200','TIP 33',600,1200,3901,8.7,6,'D:/radijator vaillant.jpg'), 
(null,'VAILLANT 33K 600x1400','TIP 33',600,1400,4551,8.7,6,'D:/radijator vaillant.jpg');


CREATE TABLE `operater` (
  `sifra` int(11) not null primary key auto_increment,
  `ime` varchar(50) not null,
  `prezime` varchar(50) not null,
  `email` varchar(100) not null,
  `lozinka` char(60) not null
) engine=innodb;

INSERT INTO `operater` (`sifra`, `ime`, `prezime`, `email`, `lozinka`) VALUES
(1, 'Robert', 'Zita', 'zitaa91@gmail.com', '$2y$10$djsCQDphHsPVr2FFGZMjI.jFQAjHk8aHQPgMBhrrhPc99x2D3I75a');