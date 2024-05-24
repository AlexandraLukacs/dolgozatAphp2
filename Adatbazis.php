<?php
class Adatbazis{
    private $host="localhost";
    private $felhasznaloNev="root";
    private $jelszo="";
    private $adatbazis="sport";
    private $kapcsolat;

    public function __construct(){
        $this->kapcsolat=new mysqli(
            $this->host,
            $this->felhasznaloNev,
            $this->jelszo,
            $this->adatbazis
        );
        $this->kapcsolat->query("SET NAMES UTF8");
    }

    public function beszur($orszagAzon, $nev){
        $sql="INSERT INTO orszag(orszagAzon, nev) VALUES ('$orszagAzon', '$nev')";
        return $this->kapcsolat->query($sql);
    }

    public function adatLeker($oszlop1, $oszlop2, $tabla){
        $sql="SELECT $oszlop1, $oszlop2 FROM $tabla";
        return $this->kapcsolat->query($sql);
    }
    
    public function megjelenit($matrix){
        echo "<article>";
        echo "<h2>orszagAzon</h2>";
        echo "<h2>nev</h2>";
        while($sor=$matrix->fetch_row()){
            echo "<div>$sor[0]</div>";
            echo "<div>$sor[1]</div>";
        }
        echo "</article>";
    }
    
    public function torles($tabla, $oszlop, $ertek){
        $sql="DELETE FROM $tabla WHERE $oszlop='$ertek'";
        return $this->kapcsolat->query($sql);
    }

    public function kapcsolatBezár(){
        $this->kapcsolat->close();
    }
}
?>