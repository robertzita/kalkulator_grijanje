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

}