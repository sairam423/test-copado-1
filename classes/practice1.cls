public class practice1 {
     //integer i;
    public static void method1(list<account>acclist){
        integer i;
        list<contact> cont = new list<contact>();
        for(account acc:acclist){
            if(acc.No_of_Related_Contacts__c != null){
            for(i=1;i<=acc.No_of_Related_Contacts__c;i++)
                {
                contact con = new contact();
                con.lastname = 'practice1';
                con.AccountId = acc.Id;
                con.LeadSource = 'web';
                cont.add(con);
                
            }
        }
        }
        
        insert cont;
    }

}