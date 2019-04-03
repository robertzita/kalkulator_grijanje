<?php

class KorisnikController extends ProtectedController
{
        function edit($id)
        {
            $_POST["sifra"]=$id;
            $kontrola = $this->kontrola();
            if($kontrola===true){
                Korisnik::update($id);
                $this->index();
            }else{
                $view = new View();
                $view->render(
                    'korisnici/edit',
                    [
                    "poruka"=>$kontrola
                    ]
                );
            }
        }

        
        function delete($id)
        {   
            Korisnik::delete($id);
            $this->index();
        }

        
        private function kontrola()
        {
            return true;
        }

        

        function add()
        {
            $this->prepareedit(Korisnik::add());
        }

        function prepareedit($id)
        {
            $view = new View();
            $entitet = Korisnik::find($id);
            $_POST["ime"]=$entitet->ime;
            $_POST["prezime"]=$entitet->prezime;
            $_POST["adresa"]=$entitet->adresa;
            $_POST["postanskibroj"]=$entitet->postanskibroj;
            $_POST["email"]=$entitet->email;
            $_POST["brojtelefona"]=$entitet->brojtelefona;
            $_POST["serviser"]=$entitet->serviser;
            $_POST["sifra"]=$entitet->sifra;

            $view->render(
                'korisnici/edit',
                [
                "poruka"=>""
                ]
            );
        }

        
        function index()
        {
            $view = new View();
            $view->render(
                'korisnici/index',
                [
                "korisnici"=>Korisnik::read()
                ]
            );

        }

        

}