<?php

class KorisnikController extends ProtectedController
{       
        function spremiSliku($id)
        {


            $img = Request::post("slika"); // Your data 'data:image/png;base64,AAAFBfj42Pj4';
            $img = str_replace('data:image/png;base64,', '', $img);
            $img = str_replace(' ', '+', $img);

            $data = base64_decode($img);

            file_put_contents(App::config("path") . "public/img/korisnici/" . $id . ".png",$data);

            echo "OK";
        }

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

        
        function kontrola()
        {
            if(Request::post("ime")===""){
                return "Ime obavezno";
            }
    
            if(strlen(Request::post("ime"))>20){
                return "Ime ne smije biti veći od 20 znakova";
            }

            if(Request::post("prezime")===""){
                return "Prezime obavezno";
            }
    
            if(strlen(Request::post("prezime"))>20){
                return "Prezime ne smije biti veći od 20 znakova";
            }

            if(Request::post("adresa")===""){
                return "Adresa obavezna";
            }
    
            if(strlen(Request::post("adresa"))>70){
                return "Adresa ne smije biti veća od 70 znakova";
            }

            if(intval(Request::post("postanskibroj"))<=0){
                return "Poštanski broj nije broj ili je manje od nula";
            }

            if(Request::post("email")===""){
                return "Email obavezan";
            }

            $db = Db::getInstance();
            $izraz = $db->prepare("select count(sifra) from korisnik where email=:email and sifra<>:sifra");
            $izraz->execute(["email"=>Request::post("email"), "sifra" => Request::post("sifra")]);
            $ukupno = $izraz->fetchColumn();
            if($ukupno>0){
                return "Email postoji, odaberite drugi";
            }

            if(Request::post("brojtelefona")===""){
                return "Broj telefona obavezan";
            }
            
    
            return true;
        }

        function prepareedit($id){

            $view = new View();
            $korisnik = Korisnik::find($id);
            $_POST = (array)$korisnik;
        
            $view->render(
                'korisnici/edit',
                [
                "poruka"=>""
                ]
            );
        }

        function add(){
            header("location: " . App::config("url")."korisnik/prepareedit/".Korisnik::add());
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