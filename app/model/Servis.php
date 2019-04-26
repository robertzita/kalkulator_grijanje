<?php

class Servis
{   

    public static function dodajServisera($serviser)
    {
        $db = Db::getInstance();
        $db->beginTransaction();

        $izraz = $db->prepare("
                 select count(*) from servis where serviser=:serviser;
        ");
        $izraz->execute(["serviser"=>$serviser]);
        $ukupno = $izraz->fetchColumn();
        $vrati="";
        if($ukupno>0){
            $vrati= "Serviser postoji na servisu, nije dodan";
        }else{
            $izraz = $db->prepare("
            insert into servis(serviser) values (:serviser);
            ");
            $izraz->execute(["serviser"=>$serviser]);
            $vrati="OK";
        }

        
        $db->commit();
        return $vrati;
    }


    public static function obrisiServisera($serviser)
    {
        $db = Db::getInstance();

        $izraz = $db->prepare("
                delete from servis where  serviser=:serviser;
        ");
        $izraz->execute(["serviser"=>$serviser]);
       
        return "OK";
    }



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


        $izraz->bindParam("naziv",Request::post("naziv"),PDO::PARAM_STR);
        $izraz->bindParam("serviser",Request::post("serviser"),PDO::PARAM_INT);

        if(Request::post("bojler")=="0"){
            $izraz->bindValue("bojler",null,PDO::PARAM_NULL);
        }else{
            $izraz->bindParam("bojler",Request::post("bojler"),PDO::PARAM_INT);
        }

        $izraz->bindParam("cijena",Request::post("cijena"),PDO::PARAM_INT);

        if(Request::post("datumservisa")==""){
            $izraz->bindValue("datumservisa",null,PDO::PARAM_NULL);
        }else{
            $izraz->bindParam("datumservisa",Request::post("datumservisa"),PDO::PARAM_STR);
        }

        

        $izraz->bindParam("sifra",$id,PDO::PARAM_INT);


        $izraz->execute();
    }

    public static function delete($id)
    {
        $db = Db::getInstance();
        $izraz = $db->prepare("delete from servis where sifra=:sifra");
        $podaci = [];
        $podaci["sifra"]=$id;
        $izraz->execute($podaci);
    }


    
}