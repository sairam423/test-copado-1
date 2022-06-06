@isTest
public class Test_practice1 {
    public static testmethod void method1(){
        integer i;
        list<contact>cont = new list<contact>();
        test.startTest();
        account acc = new account();
        acc.Name = 'test_practice';
        acc.No_of_Related_Contacts__c = 3;
        insert acc;
        
        for(i=1;i<=acc.No_of_Related_Contacts__c;i++){
            contact con = new contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            cont.add(con);
        }
        insert cont;
        test.stopTest();
        
        integer noof=[select count() from contact where name = 'test_practice'];
        system.assertEquals(3,noof);
       
    }

}