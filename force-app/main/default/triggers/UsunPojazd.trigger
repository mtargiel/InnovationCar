/**
 * @author Leszek Szczotka <leszek.szczotka@accenture.com>
 * @date 29/06/2021
 * @description Trigger responsible for removing telemetry while removing car.
 */
trigger UsunPojazd on Pojazd__c (before delete) {
    if (trigger.isBefore) {
        if (trigger.isDelete) {
            PojazdHandler.usunTelemetrie(Trigger.Old);
        }
    }
}