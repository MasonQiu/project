trigger DefaultEntitlement on Case(Before Insert, Before Update) {

    List<Id>  contactIds = new List<Id>();
    List<Id>  acctIds = new List<Id>();
    List <EntitlementContact> entlContacts = [Select e.EntitlementId, e.ContactId, e.Entitlement.AssetId
														      From EntitlementContact e
														      Where e.ContactId in: contactIds
														      And e.Entitlement.EndDate >= Today
														      And e.Entitlement.StartDate <= Today ];
        
    if (!entlContacts.isEmpty()) {
        for (Case c: Trigger.new) {
            if (c.EntitlementId == null && c.ContactId != null) {
                for (EntitlementContact ec: entlContacts) {
                    if (ec.ContactId == c.ContactId) {
                        c.EntitlementId = ec.EntitlementId;
                        if (c.AssetId == null && ec.Entitlement.AssetId != null)
                            c.AssetId = ec.Entitlement.AssetId;
                        break;
                    }
                }
            }
        }
    } 

    else {
        List <Entitlement> entls = [Select e.StartDate, e.Id, e.EndDate,
                                        e.AccountId, e.AssetId
                                        From Entitlement e
                                        Where e.AccountId in: acctIds And e.EndDate >= Today
                                        And e.StartDate <= Today];
        if (!entls.isEmpty()) {
            for (Case c: Trigger.new) {
                if (c.EntitlementId == null && c.AccountId != null) {
                    for (Entitlement e: entls) {
                        if (e.AccountId == c.AccountId) {
                            c.EntitlementId = e.Id;
                            if (c.AssetId == null && e.AssetId != null)
                                c.AssetId = e.AssetId;
                            break;
                        }
                    }
                }
            }
        }
    }
}