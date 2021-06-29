/**
 * @author Leszek Szczotka <leszek.szczotka@accenture.com>
 * @date 29/06/2021
 * @description Handler class for Usun Pojazd trigger.
 */
public with sharing class PojazdHandler {
    /**
     * @author Leszek Szczotka <leszek.szczotka@accenture.com>
     * @date 29/06/2021
     * @description The method is removing telemetry related with car.
     * @param pojazdyUsuwane List of removed cars.
     */
    public static void usunTelemetrie(List<Pojazd__c> pojazdyUsuwane) {
        List<Telemetria__c> usuwaneTelemetri = [SELECT Id FROM Telemetria__c WHERE Pojazdd__c IN :pojazdyUsuwane];
        delete usuwaneTelemetri;
    }
}