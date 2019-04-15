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