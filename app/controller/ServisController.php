<?php

class ServisController extends ProtectedController
{
    function dodajServisera()
    {

        echo Servis::dodajServisera(Request::post("servis"),Request::post("serviser"));

    }

    function obrisiServisera()
    {

        echo Servis::obrisiServisera(Request::post("servis"),Request::post("serviser"));

    }





    function edit($id)
    {
        $_POST["sifra"]=$id;
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Servis::update($id);
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'servisi/edit',
                [
                "poruka"=>$kontrola
                ]
            );
        }
    }

    function delete($id)
    {
        Servis::delete($id);
        $this->index();
    }


    function kontrola()
    {
        if(Request::post("naziv")===""){
            return "Naziv obavezno";
        }

        if(strlen(Request::post("naziv"))>70){
            return "Naziv ne smije biti veći od 70 znakova";
        }

        if(Request::post("bojler")=="0"){
            return "Obavezan odabir kondenzacijskog uređaja";
        }
        if(Request::post("serviser")===""){
            return "Serviser obavezan";
        }

        return true;
    }

    function add()
    {
        $this->prepareedit(Servis::add());
    }

    function prepareedit($id)
    {
        $view = new View();
        $serv = Servis::find($id);
        $_POST["naziv"]=$serv->naziv;
        $_POST["serviser"]=$serv->serviser;
        $_POST["bojler"]=$serv->bojler;
        $_POST["cijena"]=$serv->cijena;
        $_POST["datumservisa"]=$serv->datumservisa;
        $_POST["sifra"]=$serv->sifra;

        $view->render(
            'servisi/edit',
            [
            "poruka"=>""
            ]
        );
    }

    function index(){
        $view = new View();
        $view->render(
            'servisi/index',
            [
            "servisi"=>Servis::read()
            ]
        );
    }

}