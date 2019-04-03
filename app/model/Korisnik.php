<?php

class Korisnik
{
    public static function read()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("
            select 
            a.ime,
            a.prezime,
            a.adresa,
            a.postanskibroj,
            a.email,
            a.brojtelefona,
            b.naziv as serviser
            from korisnik a
            left join serviser b on a.serviser =b.sifra
            group by
            a.ime,
            a.prezime,
            a.adresa,
            a.postanskibroj,
            a.email,
            a.brojtelefona,
            b.naziv
        
        
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
        $izraz = $db->prepare("insert into korisnik(ime,prezime,adresa,postanskibroj,email,brojtelefona,serviser)
        values ('','','','','','',null)");
        $izraz->execute();
    }


    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update grupa set
        ime=:ime,
        prezime=:prezime,
        adresa=:adresa,
        postanskibroj=:postanskibroj,
        email=:email,
        brojtelefona=:brojtelefona,
        serviser=:serviser
        where sifra=:sifra");
        $podaci = self::podaci();
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }


    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from smjer where sifra=:sifra");
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
            "brojtelefona"=>Request::post("brojtelefona"),
            "serviser"=>Request::post("serviser")
        ];
    }

}