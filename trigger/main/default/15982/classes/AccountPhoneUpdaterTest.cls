@isTest
public class AccountPhoneUpdaterTest {
    // Comment Added - 18/06/2025
    // Test method to validate the updateAccountPhone functionality
    @isTest
    static void testUpdateAccountPhone() {
        // Step 1: Create test Account
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        // Step 2: Create test Contacts related to the Account
        Contact contact1 = new Contact(
            FirstName = 'John',
            LastName = 'Doe',
            AccountId = testAccount.Id,
            Phone = '123-456-7890'
        );
        Contact contact2 = new Contact(
            FirstName = 'Jane',
            LastName = 'Doe',
            AccountId = testAccount.Id,
            Phone = '987-654-3210'
        );
        insert new List<Contact>{contact1, contact2};

        // Step 3: Verify initial Account Phone (should be null)
        testAccount = [SELECT Id, Phone FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(null, testAccount.Phone, 'Initial Phone value of Account should be null');

        // Step 4: Update the Contacts and invoke the updateAccountPhone method
        contact1.Phone = '111-222-3333';  // Update contact1 phone
        contact2.Phone = '444-555-6666';  // Update contact2 phone

        update new List<Contact>{contact1, contact2};  // Update the contacts

        Test.startTest();
        AccountPhoneUpdater.updateAccountPhone(new List<Contact>{contact1, contact2});
        Test.stopTest();

        // Step 5: Verify the Account Phone after update (should take contact2's Phone)
        testAccount = [SELECT Id, Phone FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals('444-555-6666', testAccount.Phone, 'The Account Phone should be updated based on the Contact Phone');
    }

    // Test method to verify behavior when no contacts are updated
    @isTest
    static void testNoContacts() {
        // Step 1: Create test Account
        Account testAccount = new Account(Name = 'Test Account No Contacts');
        insert testAccount;

        // Step 2: Call the updateAccountPhone method with no contacts to update
        Test.startTest();
        AccountPhoneUpdater.updateAccountPhone(new List<Contact>());
        Test.stopTest();

        // Step 3: Verify that the Account Phone is still null (no changes)
        testAccount = [SELECT Id, Phone FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(null, testAccount.Phone, 'The Account Phone should remain null when no Contacts are provided');
    }

    // Test method to verify behavior with contacts that have no Phone
    @isTest
    static void testContactsWithoutPhone() {
        // Step 1: Create test Account
        Account testAccount = new Account(Name = 'Test Account No Phone');
        insert testAccount;

        // Step 2: Create Contacts without Phone number
        Contact contact1 = new Contact(
            FirstName = 'Alice',
            LastName = 'Smith',
            AccountId = testAccount.Id,
            Phone = null
        );
        Contact contact2 = new Contact(
            FirstName = 'Bob',
            LastName = 'Smith',
            AccountId = testAccount.Id,
            Phone = null
        );
        insert new List<Contact>{contact1, contact2};

        // Step 3: Verify initial Account Phone (should be null)
        testAccount = [SELECT Id, Phone FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(null, testAccount.Phone, 'Initial Phone value of Account should be null');

        // Step 4: Update the Contacts (with no Phone values) and invoke the updateAccountPhone method
        Test.startTest();
        AccountPhoneUpdater.updateAccountPhone(new List<Contact>{contact1, contact2});
        Test.stopTest();

        // Step 5: Verify that the Account Phone remains null (since no Contacts had Phone)
        testAccount = [SELECT Id, Phone FROM Account WHERE Id = :testAccount.Id];
        System.assertEquals(null, testAccount.Phone, 'The Account Phone should remain null when no Contacts have a Phone number');
    }
}