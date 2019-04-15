<?php

class Bojler
{
    public static function read()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("select a.sifra,
                                      a.naziv,
                                      a.ucinaknagrijanju,
                                      a.ucinaknatoplojvodi,
                                      concat(b.ime, ' ',b.prezime) as korisnik
                                      from bojler a 
                                      left join korisnik b on a.korisnik=b.sifra
                                      group by
                                      a.sifra,
                                      a.naziv,
                                      a.ucinaknagrijanju,
                                      a.ucinaknatoplojvodi,
                                      concat(b.ime, ' ',b.prezime)
                                      ");
        $izraz->execute();
        return $izraz->fetchAll();
    }

    public static function find($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("select * from bojler where sifra=:sifra");
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
    }

    public static function add()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("insert into bojler (naziv,ucinaknagrijanju,ucinaknatoplojvodi,korisnik)
        values('','','',null)");
        $izraz->execute();
        return $db->lastInsertId();
    }

    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update bojler set
        naziv=:naziv,
        ucinaknagrijanju=:ucinaknagrijanju,
        ucinaknatoplojvodi=:ucinaknatoplojvodi,
        korisnik=:korisnik
        where sifra=:sifra");
        $podaci = self::podaci();
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }

    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from bojler where sifra=:sifra");
        $podaci = [];
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }

    private static function podaci()
    {
        return [
            "naziv"=>Request::post("naziv"),
            "ucinaknagrijanju"=>Request::post("ucinaknagrijanju"),
            "ucinaknatoplojvodi"=>Request::post("ucinaknatoplojvodi"),
            "korisnik"=>Request::post("korisnik")
        ];
        
    }
}