@isTest
public class Testclass_leadtrigger {
    @isTest
    public static void sai(){
        Lead l1 = new Lead();
        l1.LastName = 'testclassforlead';
        l1.Company = 'salesforce';
        l1.Status = 'Open - Not Contacted';
        string nameuser = l1.LastName;
     
    test.startTest();        
    try {
        l1.LeadSource = 'other';
    insert l1;
    }catch(Exception e){
        System.assert(e.getMessage().contains('DEAR' +nameuser+ 'you cant create lead from other lead source, please select other lead source'));
    }
    test.stopTest();
    }
  @istest
    public static void ram(){
        Lead l1 = new Lead();
        l1.LastName = 'testclassforlead';
        l1.Company = 'salesforce';
        l1.Status = 'Open - Not Contacted';
        l1.Phone='09090990';
        insert l1;
        
        lead l2 = [select id,LastName,phone from Lead where LastName='testclassforlead'];
        test.startTest();
        try{
            l2.LastName = 'sairam';
            update l2;
        }catch(Exception e){
            system.assert(e.getMessage().contains('dear' +l1.LastName +'you cant edit the name'));
        }
        Lead led = new Lead();
        led.LastName = 'testclasslead';
        led.Company = 'salesforce';
        led.Status = 'Open - Not Contacted';
        led.Phone='09090990';
        led.Street = 'lead street';
        led.Country = 'india';
        string nameuser = led.LastName;
        insert led;
                Lead l6 =[select id,name,phone,description,Street,Country,City from lead where name='testclassforlead'];
          l6.Phone = '1221222121';
       		update l6;
        
        Lead l3=[select id,phone,description,Street,Country,City from Lead where phone ='1221222121'];
        system.assertEquals(l3.Description,'the old phone number is' +led.Phone +'updated with new phone is' +l6.Phone);

    }
     @istest
    public static void chilla(){
        Lead led = new Lead();
        led.LastName = 'testclassforlead';
        led.Company = 'salesforce';
        led.Status = 'Open - Not Contacted';
        led.Phone='09090990';
        led.Street = 'lead street';
        led.Country = 'india';
        string nameuser = led.LastName;
        insert led;
        
        account acc = new account();
        acc.Name='testclass1';
       	acc.ShippingCountry= 'account street';
        acc.ShippingCountry = 'account country';
        acc.Description = 'account description';
        acc.Rating = 'hot';
        insert acc;
        
        test.startTest();
        
        Lead l2 =[select id,name,phone,description,Street,Country,City from lead where name='testclassforlead'];
        l2.Street = 'sairam';
        l2.Country = 'chilla';
        update l2;
        
        test.stopTest();
        
        account act =[select id,shippingcity,shippingcountry,Description from account where rating='hot'];
        system.assertEquals(act.ShippingCity,l2.City);
        system.assertEquals(act.ShippingCountry,l2.Country);
        system.assertEquals(act.Description ,'account shipping city and shipping country updated from lead');
            
    }
    @isTest
    public static void method5(){
        Lead l9 = new Lead();
        l9.LastName = 'testclassforlead';
        l9.Company = 'salesforce';
        l9.Status = 'Open - Not Contacted';
        l9.LeadSource='web';
        string nameuser = l9.LastName;
        insert l9;
        
        Test.startTest();
        Lead leadto = [select id,name,LeadSource from lead where LeadSource='web'];
        try{
            delete leadto;
        }catch(exception e){
            system.assert(e.getMessage().contains('you cant delete web leads'));
        }
       Test.stopTest();
        
    }
    @isTest
    public static void method6(){
        Lead l9 = new Lead();
        l9.LastName = 'testclassforlead';
        l9.Company = 'salesforce';
        l9.Status = 'Open - Not Contacted';
       l9.Email = 'test1@dgma.com';
        insert l9;
        
       Lead l7 = [select id,LastName from Lead where LastName='testclassforlead'];
        list<Messaging.SingleEmailMessage> emaildetails = new list<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage emaillist = new Messaging.SingleEmailMessage();
        emaillist.setToAddresses(new string[]{'sairamchilla1997@salesforce.com'});
        emaillist.setSubject('hii');
        emaillist.setPlainTextBody('hello');
        emaildetails.add(emaillist);
        
        
        
        Test.startTest();
        delete l7;
      messaging.sendEmail(emaildetails);
         System.assertEquals(2,Limits.getEmailInvocations());
        //leadtrigger_helper.method5(emaildetails);
       Test.stopTest();
       
        
    }
}