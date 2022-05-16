public class leadtrigger_helper {
    public static void method1(list<Lead>list1){
        string nameuser;
        for(Lead led : list1){
            nameuser=led.lastname;
            if(led.leadsource =='other'){
                led.adderror('DEAR' +nameuser+ 'you cant create lead from other lead source, please select other lead source');
            }
        }
    }
    public static void method2(list<Lead>list1,map<id,Lead>oldlist){
        for(Lead led : list1){
            Lead l1 = oldlist.get(led.Id);
            if(led.LastName !=l1.LastName){
                led.adderror('dear' +l1.LastName +'you cant edit the name');
            }
            if(led.Phone !=l1.Phone){
                led.Description= 'the old phone number is' +l1.Phone +'updated with new phone is' +led.Phone;
            }
            
        }
    }
    public static void method3(list<Lead>newlist,map<id,Lead>oldlist){
        list<Account> acc = new list<Account>();
        list<Account> ac1 =[select id,shippingcity,shippingcountry from account where rating='hot'];
        {
            for(Lead l1:newlist){
                Lead oldvalues = oldlist.get(l1.Id);
                if(l1.Street !=oldvalues.Street || l1.Country!= oldvalues.Country ){
                    for(Account a1:ac1){
                  a1.ShippingCity=l1.City;
                  a1.ShippingCountry = l1.Country;
                  a1.Description = 'account shipping city and shipping country updated from lead';
                  acc.add(a1);
                }
                }
               
    }
             update acc;
}
}
	public static void method4(list<Lead>oldlist){
        for(Lead l1:oldlist){
            if(l1.LeadSource =='web'){
            l1.adderror('you cant delete web leads');
        }
        }
    } 
    public static void method5(list<Lead> oldlist){
        
        list<Messaging.SingleEmailMessage> emaillist = new list<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage emailaddress = new Messaging.SingleEmailMessage();
        for(Lead l1 : oldlist){
        // string userid= userinfo.getUserEmail();
            emailaddress.setToAddresses(new string[] {'sairamchilla1997@gmail.com'});
            emailaddress.setSubject('the record is deleted' +l1.Name);
            emailaddress.setPlainTextBody('dear' +userinfo.getUserName() + 'you just now deleted record' +l1.Name);
            emaillist.add(emailaddress);
        }
        Messaging.sendEmail(emaillist);
        
    }
}