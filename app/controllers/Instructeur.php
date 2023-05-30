<?php

class Instructeur extends BaseController
{
    private $instructeurModel;

    public function __construct()
    {
        $this->instructeurModel = $this->model('InstructeurModel');
    }

    public function overzichtInstructeur()
    {
        $result = $this->instructeurModel->getInstructeurs();

        //  var_dump($result);
        $rows = "";
        foreach ($result as $instructeur) {
            /**
             * Datum in het juiste formaat gezet
             */
            $date = date_create($instructeur->DatumInDienst);
            $formatted_date = date_format($date, 'd-m-Y');

            $rows .= "<tr>
                        <td>$instructeur->Voornaam</td>
                        <td>$instructeur->Tussenvoegsel</td>
                        <td>$instructeur->Achternaam</td>
                        <td>$instructeur->Mobiel</td>
                        <td>$formatted_date</td>            
                        <td>$instructeur->AantalSterren</td>            
                        <td>
                            <a href='" . URLROOT . "/instructeur/overzichtvoertuigen/$instructeur->Id'>
                                <i class='bi bi-car-front'></i>
                            </a>
                        </td>            
                      </tr>";
        }
        
        $data = [
            'title' => 'Instructeurs in dienst',
            'rows' => $rows
        ];

        $this->view('Instructeur/overzichtinstructeur', $data);
    }

    public function overzichtVoertuigen($Id)
    {

        $instructeurInfo =  $this->instructeurModel->getInstructeurById($Id);
        var_dump($instructeurInfo);
        
        $naam = $instructeurInfo->Voornaam . " " . $instructeurInfo->Tussenvoegsel . " " . $instructeurInfo->Achternaam;
        $datumInDienst = $instructeurInfo->DatumInDienst;
        $aantalSterren = $instructeurInfo->AantalSterren;
        
        
        /**
         * We laten de model alle gegevens ophalen uit de database
         */
        $result = $this->instructeurModel->getToegewezenVoertuigen($Id);


        if (empty($result)) {
            $tableRows = " <tr>
                                <td colspan='6'>Deze instructeur heeft geen voertuigen toegewezen gekregen</td>
                            </tr>
                    
            ";
        } else { $tableRows = "";
            foreach ($result as $voertuig) {
    
    
                /**
                 * Datum in het juiste formaat gezet
                 */
                $date_formatted = date_format(date_create($voertuig->Bouwjaar), 'd-m-Y');
    
                $tableRows .= "<tr>
                                <td>$voertuig->TypeVoertuig</td>
                                <td>$voertuig->Type</td>
                                <td>$voertuig->Kenteken</td>
                                <td>$date_formatted</td>
                                <td>$voertuig->Brandstof</td>
                                <td>$voertuig->RijbewijsCategorie</td>
                              </tr>";
            }}

        

        

        $data = [
            'title' => 'Door instructeur gebruikte voertuigen',
            'tableRows' => $tableRows,
            'naam' => $naam,
            'datumInDienst' => $datumInDienst,
            'aantalSterren' => $aantalSterren

        ];

        $this->view('Instructeur/overzichtVoertuigen', $data);


    }

    public function overzichtrijles()
    {
        $test = "<tr><td colspan='7'>test 123 Hallo</td></tr>";
        $data = [
            'title' => 'Overzicht Rijlespakkddddetten Leerlingen',
            'test' => $test
        ];

        $this->view('Instructeur/overzichtrijles', $data);

    }

    public function overzichtafgenomenexamens()
    {
        $result = $this->instructeurModel->getExamens();

        //  var_dump($result);
        $rows = "";
        foreach ($result as $afgenomenexamens) {
            /**
             * Datum in het juiste formaat gezet
             */
            $date = date_create($afgenomenexamens->DatumInDienst);
            $formatted_date = date_format($date, 'd-m-Y');

            $rows .= "<tr>
                        <td>$afgenomenexamens->Voornaam</td>
                        <td>$afgenomenexamens->Tussenvoegsel</td>
                        <td>$afgenomenexamens->Achternaam</td>
                        <td>$afgenomenexamens->Mobiel</td>
                        <td>$formatted_date</td>            
                        <td>$afgenomenexamens->AantalSterren</td>            
                        <td>
                            <a href='" . URLROOT . "/instructeur/overzichtvoertuigen/$afgenomenexamens->Id'>
                                <i class='bi bi-car-front'></i>
                            </a>
                        </td>            
                      </tr>";
        }
        
        $data = [
            'title' => 'Afgenomen examens',
            'rows' => $rows
        ];
    
        $this->view('Instructeur/overzichtafgenomenexamens', $data);
    }
}
