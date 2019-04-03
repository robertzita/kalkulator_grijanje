<?php

class ServiserController extends ProtectedController
{
    
    function add()
    {
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Serviser::add();
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'serviseri/new',
                [
                "poruka"=>$kontrola
                ]
            );
        }

    }

    function edit($id)
    {
        $_POST["sifra"]=$id;
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Serviser::update($id);
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'serviseri/edit',
                [
                "poruka"=>$kontrola
                ]
            );
        }



    }


    function delete($id)
    {
        Serviser::delete($id);
        $this->index();
    }


    function kontrola()
    {
        if(Request::post("naziv")===""){
            return "Naziv je obavezan";
        }

        if(strlen(Request::post("naziv"))>100){
            return "Naziv ne smije biti veći od 100 znakova";
        }

        $db = Db::getInstance();
        $izraz = $db->prepare("select count(sifra) from serviser where naziv=:naziv and sifra<>:sifra");
        $izraz->execute(["naziv"=>Request::post("naziv"), "sifra"=> Request::post("sifra")]);
        $ukupno = $izraz->fetchColumn();
        if($ukupno>0){
            return "Naziv postoji, odaberite drugi";
        }

        if(strlen(Request::post("adresa"))>100){
            return "Adresa ne smije biti veća od 100 znakova";
        }

        if(intval(Request::post("postanskibroj"))<=0){
            return "Poštanski broj nije broj ili je manji od nula";
        }

        if(Request::post("brojtelefona")===""){
            return "Broj telefona je obavezan";
        }


        return true;


    }


    function prepareadd()
    {
        $view = new View();
        $view->render(
            'serviseri/new',
            [
            "poruka"=>""
            ]
        );

    }



    function prepareedit($id)
    {
        $view = new View();
        $serviser = Serviser::find($id);
        $_POST["naziv"]=$serviser->naziv;
        $_POST["adresa"]=$serviser->adresa;
        $_POST["postanskibroj"]=$serviser->postanskibroj;
        $_POST["brojtelefona"]=$serviser->brojtelefona;
        $_POST["email"]=$serviser->email;
        $_POST["sifra"]=$serviser->sifra;

        $view->render(
            'serviseri/edit',
            [
            "poruka"=>""
            ]
        );
     }



     function index($stranica=1)
     {
         if($stranica<=0){
             $stranica=1;
         }
         if($stranica===1){
             $prethodna=1;
         }else{
             $prethodna=$stranica-1;
         }
         $sljedeca=$stranica+1;

        $view = new View();
        $view->render(
            'serviseri/index',
            [
            "serviseri"=>Serviser::read($stranica),
            "prethodna"=>$prethodna,
            "sljedeca"=>$sljedeca
            ]
        );

    }


}