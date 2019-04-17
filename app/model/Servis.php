<?php

class Servis
{
    public static function read()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("select
        a.sifra, 
        a.naziv,
        b.naziv as serviser,
        c.naziv as bojler,
        a.cijena,
        a.datumservisa
        from servis a 
        left join serviser b on a.serviser=b.sifra
        left join bojler c on a.bojler=c.sifra
        group by a.sifra,a.naziv,b.naziv,c.naziv,a.cijena,a.datumservisa");

        $izraz->execute();
        return $izraz->fetchAll();
    }

    public static function find($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("select * from servis where sifra=:sifra");
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
    }

    public static function add()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("insert into servis (naziv,serviser,bojler,cijena,datumservisa)
        values ('',null,null,'',now())");
        $izraz->execute();
        return $db->lastInsertId();
    }

    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update servis set
        naziv=:naziv,
        serviser=:serviser,
        bojler=:bojler,
        cijena=:cijena,
        datumservisa=:datumservisa
        where sifra=:sifra");
        $podaci = self::podaci();
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }

    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from servis where sifra=:sifra");
        $podaci = [];
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }


    private static function podaci(){
        return [
            "naziv"=>Request::post("naziv"),
            "serviser"=>Request::post("serviser"),
            "bojler"=>Request::post("bojler"),
            "cijena"=>Request::post("cijena"),
            "datumservisa"=>Request::post("datumservisa")
        ];
    }
}