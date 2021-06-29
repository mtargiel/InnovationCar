/**
 * @author Leszek Szczotka <leszek.szczotka@accenture.com>
 * @date 29/06/2021
 * @description Handler class for Dodaj Nowa Oferte trigger.
 */
public class DodajOferteHandler {
    /**
     * @author Leszek Szczotka <leszek.szczotka@accenture.com>
     * @date 29/06/2021
     * @description The method is checking vehicle when you are trying to create new offer is it already physically available.
     * @param wszystkieOferty List of all offerts.
     * @param listaNiedoostepnychPojazdow List of non available cars because they are already physically available.
     */
    public static void sprawdzDostepnoscPojazdu(List<Wirtualne_salony__c> wszystkieOferty){
        Set<Id> dostepnePojazdy = new Set<Id>();
        
        for(Wirtualne_salony__c oferta: wszystkieOferty){
            if(oferta.Rodzaj_oferty__c == 'fizyczna'){
                dostepnePojazdy.add(oferta.Pojazd__c);
            }
        }
        
        List<Pojazd__c> listaNiedoostepnychPojazdow = [SELECT Id, Name, Salon__c FROM Pojazd__c WHERE Id in:dostepnePojazdy];
 
        for(Wirtualne_salony__c ofertaWSalonie : wszystkieOferty){
            for(Pojazd__c pojazdNiedostepny : listaNiedoostepnychPojazdow){
                    if(ofertaWSalonie.Pojazd__c == pojazdNiedostepny.Id){
                        ofertaWSalonie.addError('Pojazd ' + pojazdNiedostepny.Name + ' jest juz dostepny fizycznie');
                        break;
                    }
                }
           }
      }
}