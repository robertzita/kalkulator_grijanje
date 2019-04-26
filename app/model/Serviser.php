<?php

class Serviser
{
    public static function read($stranica=1)
    {
        $poStranici=10;
        $db = Db::getInstance();
        $izraz = $db->prepare("
        
                select
                a.sifra,
                a.naziv,
                a.adresa,
                a.postanskibroj,
                a.brojtelefona,
                a.email,
                count(b.serviser) as ukupno from
                serviser a left join servis b on a.sifra=b.serviser
                group by
                a.sifra,
                a.naziv,
                a.adresa,
                a.postanskibroj,
                a.brojtelefona,
                a.email
                order by a.naziv
                limit " . (($stranica*$poStranici) - $poStranici) . ",$poStranici
        
        ");
        $izraz->execute();
        return $izraz->fetchAll();
    }

    public static function find($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("select * from serviser where sifra=:sifra");
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
    }

    public static function add()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("insert into serviser (naziv,adresa,postanskibroj,brojtelefona,email)
        values (:naziv,:adresa,:postanskibroj,:brojtelefona,:email)");
        $izraz->execute(self::podaci());
    }

    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update serviser set 
        naziv=:naziv,
        adresa=:adresa,
        postanskibroj=:postanskibroj,
        brojtelefona=:brojtelefona,
        email=:email
        where sifra=:sifra");
        $podaci = self::podaci();
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }


    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from serviser where sifra=:sifra");
        $podaci = [];
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }


    public static function traziServiser($uvjet)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare(" select
                                    a.sifra,
                                    a.naziv,
                                    a.adresa,
                                    a.postanskibroj,
                                    a.brojtelefona,
                                    a.email,
                                    count(b.serviser) as ukupno from
                                    serviser a left join servis b on a.sifra=b.serviser
                                    where concat(a.naziv, ' ', a.adresa, ' ', a.brojtelefona) like :uvjet
                                    group by
                                    a.sifra,
                                    a.naziv,
                                    a.adresa,
                                    a.postanskibroj,
                                    a.brojtelefona,
                                    a.email
                                    
        ");
        $izraz->execute(["uvjet"=>"%" . $uvjet . "%"])  ;
        return $izraz->fetchAll(); 
    }


    public static function readServisers($serviser)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare(" select 
                                a.sifra,
                                a.naziv,
                                a.adresa,
                                a.postanskibroj,
                                a.brojtelefona,
                                a.email
                                from serviser a 
                                inner join servis b on a.sifra=b.serviser
                                where b.serviser=:serviser
                                
        
        ");
        $izraz->execute(["serviser"=>$serviser]);
        return $izraz->fetchAll();
    }



    



}