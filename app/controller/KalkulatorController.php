<?php

class KalkulatorController
{
    function index()
    {
        $view = new View();
        $view->render(
            'kalkulatori/index'
        
    );

    }

    function nadiradijator($snaga){
        $brojRadijatora=1;
        while(true){



///select *, snaga*$brojRadijatora from radijator where snaga**$brojRadijatora>$snaga order by snaga limit 1

            $brojRadijatora++;
        }


    }

}