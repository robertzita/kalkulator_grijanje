<?php 

class BojlerController extends ProtectedController
{
    function edit($id)
    {
        $_POST["sifra"]=$id;
        $kontrola = $this->kontrola();
        if($kontrola===true){
            Bojler::update($id);
            $this->index();
        }else{
            $view = new View();
            $view->render(
                'bojleri/edit',
                [
                "poruka"=>$kontrola
                ]
            );
        }
    }

    function delete($id)
    {
        Bojler::delete($id);
        $this->index();
    }


    function kontrola()
    {   
        if(Request::post("naziv")===""){
            return "Naziv obavezno";
        }

        if(strlen(Request::post("naziv"))>50){
            return "Naziv ne smije biti veći od 50 znakova";
        }

        if(Request::post("korisnik")=="0"){
            return "Obavezan odabir korisnika";
        }
        
        return true;
    }


    function add()
    {
        $this->prepareedit(Bojler::add());
    }


    function prepareedit($id)
    {
        $view = new View();
        $uredaj = Bojler::find($id);
        $_POST["naziv"]=$uredaj->naziv;
        $_POST["ucinaknagrijanju"]=$uredaj->ucinaknagrijanju;
        $_POST["ucinaknatoplojvodi"]=$uredaj->ucinaknatoplojvodi;
        $_POST["korisnik"]=$uredaj->korisnik;
        $_POST["sifra"]=$uredaj->sifra;

        $view->render(
            'bojleri/edit',
            [
                "poruka"=>""
                ]
            );
    }

    function index()
    {
        $view = new View();
        $view->render(
            'bojleri/index',
            [
            "bojleri"=>Bojler::read()
            ]
        );
    }


}