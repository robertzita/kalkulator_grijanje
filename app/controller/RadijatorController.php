<?php

class RadijatorController extends ProtectedController
{
        function edit($id)
        {
            $_POST["sifra"]=$id;
            $kontrola = $this->kontrola();
            if($kontrola===true){
                Radijator::update($id);
                $this->index();
            }else{
                $view = new View();
                $view->render(
                    'radijatori/edit',
                    [
                    "poruka"=>$kontrola
                    ]
                );
            }
        }

        
        function delete($id)
        {   
            Radijator::delete($id);
            $this->index();
        }

        
        function kontrola()
        {
            if(Request::post("bojler")=="0"){
                return "Obavezan odabir kondenzacijskog uređaja";
            }
            return true;
        }

        

        function add()
        {
            $this->prepareedit(Radijator::add());
        }

        function prepareedit($id)
        {
            $view = new View();
            $rad = Radijator::find($id);
            $_POST["naziv"]=$rad->naziv;
            $_POST["tipradijatora"]=$rad->tipradijatora;
            $_POST["visina"]=$rad->visina;
            $_POST["duzina"]=$rad->duzina;
            $_POST["snaga"]=$rad->snaga;
            $_POST["zapremnina"]=$rad->zapremnina;
            $_POST["bojler"]=$rad->bojler;
            $_POST["sifra"]=$rad->sifra;

            $view->render(
                'radijatori/edit',
                [
                "poruka"=>""
                ]
            );
        }

        
        function index()
        {
            $view = new View();
            $view->render(
                'radijatori/index',
                [
                "radijatori"=>Radijator::read()
                ]
            );

        }

        

}