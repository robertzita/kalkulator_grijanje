<?php

class Radijator
{
    public static function read()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("
                    select 
                    sifra,
                    naziv,
                    tipradijatora,
                    visina,
                    duzina,
                    snaga,
                    zapremnina from 
                    radijator 
                    
                    
        ");
        $izraz->execute();
        return $izraz->fetchAll();
    }

    public static function find($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("select * from radijator where sifra=:sifra");
        $izraz->execute(["sifra"=>$id]);
        return $izraz->fetch();
    }

    public static function add()
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("insert into radijator(naziv,tipradijatora,visina,duzina,snaga,zapremnina,bojler)
        values ('','','','','','',null)");
        $izraz->execute();
        return $db->lastInsertId();
    }


    public static function update($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("update radijator set
        naziv=:naziv,
        tipradijatora=:tipradijatora,
        visina=:visina,
        duzina=:duzina,
        snaga=:snaga,
        zapremnina=:zapremnina,
        bojler=:bojler
        where sifra=:sifra");
        $podaci = self::podaci();
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }

    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from radijator where sifra=:sifra");
        $podaci = [];
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }

    private static function podaci()
    {
        return[
            "naziv"=>Request::post("naziv"),
            "tipradijatora"=>Request::post("tipradijatora"),
            "visina"=>Request::post("visina"),
            "duzina"=>Request::post("duzina"),
            "snaga"=>Request::post("snaga"),
            "zapremnina"=>Request::post("zapremnina"),
            "bojler"=>Request::post("bojler")
        ];
    }


}