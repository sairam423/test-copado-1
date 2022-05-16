trigger LEAD_TRIGGER on Lead (before insert,before update,after update,before delete,after delete) {
    if(trigger.isbefore && trigger.isinsert){
    leadtrigger_helper.method1(TRIGGER.NEW);
}
    if(trigger.isbefore && trigger.isupdate){
    leadtrigger_helper.method2(TRIGGER.NEW,trigger.oldmap);
}
    if(trigger.isafter && trigger.isupdate){
    leadtrigger_helper.method3(TRIGGER.NEW,trigger.oldmap);
} 
    if(trigger.isbefore && trigger.isdelete){
    leadtrigger_helper.method4(trigger.old);

    }
 	/*for(Lead l1: trigger.old){
            if(l1.LeadSource =='web'){
                l1.adderror('you cant delete leads generated from web');
            }
        } */

    if(trigger.isafter && trigger.isdelete){
        leadtrigger_helper.method5(trigger.old);
    }
}
       /* list<Messaging.SingleEmailMessage> emailaddress = new list<Messaging.SingleEmailMessage>();
         Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        for(Lead l1:trigger.old){
           // string userid = new string[];
           // userid.add(userinfo.getUserEmail());
            email.setToAddresses(new string[] {'sairamchilla1997@gmail.com',userinfo.getUserEmail()});
            email.setSubject('Dear the record' + l1.LastName +l1.Id + 'is deleted by ' +l1.LastModifiedById);
            email.setPlainTextBody('hello  sir' + 'your record with name '+l1.LastName +'is deleted');
            emailaddress.add(email);
        }
        Messaging.sendEmail(emailaddress);
        system.debug('the email sent to' +email);
    } */