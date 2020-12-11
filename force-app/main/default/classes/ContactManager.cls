public with sharing class ContactManager {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return [select id, LastName, Phone from Contact LIMIT 20];
    }
}