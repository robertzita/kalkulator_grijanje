<?php 

class Kalkulator
{
    var $a;
    var $b;

    function checkopration($oprator)
    {
        switch($oprator)
        {
            case 'bezizolacije':
            return $this->a * $this->b * 100;
            break;

            case 'djelomicnoizolirana':
            return $this->a * $this->b * 80;
            break;

            case 'potpunoizolirana':
            return $this->a * $this->b * 60;
            break;

           /*   case 'ukupno':
            return $this->a * $this->b * 60;
            break;  */

            default:
            
            break;
        }   
    }
    function getresult($a, $b, $c)
    {
        $this->a = $a;
        $this->b = $b;
        return $this->checkopration($c);
    }
}

$cal = new Kalkulator();
if(isset($_POST['submit']))
{   
    $rezdnevna = $cal->getresult($_POST['n1'],$_POST['n2'],$_POST['op']);
    $rezkuhinja= $cal->getresult($_POST['n3'],$_POST['n4'],$_POST['op']);
    $rezblagavaonica = $cal->getresult($_POST['n5'],$_POST['n6'],$_POST['op']);
    $rezspavacasoba1 = $cal->getresult($_POST['n7'],$_POST['n8'],$_POST['op']);
    $rezspavacasoba2 = $cal->getresult($_POST['n9'],$_POST['n10'],$_POST['op']);
    $rezkupaonica = $cal->getresult($_POST['n11'],$_POST['n12'],$_POST['op']);
    $rezwc = $cal->getresult($_POST['n13'],$_POST['n14'],$_POST['op']);
    $rezdjecjasoba1 = $cal->getresult($_POST['n15'],$_POST['n16'],$_POST['op']);
    $rezdjecjasoba2 = $cal->getresult($_POST['n17'],$_POST['n18'],$_POST['op']);
    $rezhodnik = $cal->getresult($_POST['n19'],$_POST['n20'],$_POST['op']);
    $rezstubiste = $cal->getresult($_POST['n21'],$_POST['n22'],$_POST['op']);
    
}



$ukupan=$rezstubiste+$rezhodnik+
$rezdjecjasoba2+$rezdjecjasoba1+
$rezwc+$rezkupaonica+$rezspavacasoba2+
$rezspavacasoba1+$rezblagavaonica+
$rezkuhinja+$rezdnevna;

$ukupankw=$ukupan/1000;