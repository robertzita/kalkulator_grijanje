<?php

class Serviser
{
    public static function read($stranica)
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
                count(b.sifra) as ukupno from
                serviser a left join korisnik b on a.sifra=b.serviser
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


    private static function podaci()
    {
        return [
            "naziv"=>Request::post("naziv"),
            "adresa"=>Request::post("adresa"),
            "postanskibroj"=>Request::post("postanskibroj"),
            "brojtelefona"=>Request::post("brojtelefona"),
            "email"=>Request::post("email")
        ];
    }




    



}