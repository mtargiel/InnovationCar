/**
 * @author Leszek Szczotka <leszek.szczotka@accenture.com>
 * @date 29/06/2021
 * @description Trigger responsible for adding new offert.
 */
trigger DodajNowaOferte on Wirtualne_salony__c (before insert, after Insert) {
    if(trigger.isBefore){
        if(trigger.isInsert){
            DodajOferteHandler.sprawdzDostepnoscPojazdu(Trigger.New);
        }
    }
}