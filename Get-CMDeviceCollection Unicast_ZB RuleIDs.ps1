#Collection membership
$Members = (Get-CMDeviceCollectionDirectMembershipRule -CollectionName "COLLECTION_NAME").RuleName
$Members