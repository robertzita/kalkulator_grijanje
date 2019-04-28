<?php

class Korisnik
{
    public static function read()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("
            select
            a.sifra, 
            a.ime,
            a.prezime,
            a.adresa,
            a.postanskibroj,
            a.email,
            a.brojtelefona,
            count(b.korisnik) as ukupno 
            from korisnik a
            left join bojler b on a.sifra=b.korisnik
            group by
            a.sifra,
            a.ime,
            a.prezime,
            a.adresa,
            a.postanskibroj,
            a.email,
            a.brojtelefona
            
        
        
        ");
        $izraz->execute();
        return $izraz->fetchAll();
    }

    public static function find($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("select * from korisnik where sifra=:sifra");
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
    }

    public static function add()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("insert into korisnik(ime,prezime,adresa,postanskibroj,email,brojtelefona)
        values ('','','','',null,null)");
        $izraz->execute();
        return $db->lastInsertId();
    }


    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update korisnik set
        ime=:ime,
        prezime=:prezime,
        adresa=:adresa,
        postanskibroj=:postanskibroj,
        email=:email,
        brojtelefona=:brojtelefona
        where sifra=:sifra");
        $podaci = self::podaci();
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }


    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from korisnik where sifra=:sifra");
        $podaci = [];
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }

    private static function podaci()
    {
        return[
            "ime"=>Request::post("ime"),
            "prezime"=>Request::post("prezime"),
            "adresa"=>Request::post("adresa"),
            "postanskibroj"=>Request::post("postanskibroj"),
            "email"=>Request::post("email"),
            "brojtelefona"=>Request::post("brojtelefona")
        ];
    }

}