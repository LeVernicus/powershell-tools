$AddComps `
| ForEach-Object {Add-CMDeviceCollectionDirectMembershipRule -CollectionName "COLLECTION_NAME" -ResourceID (Get-CMDevice -Name $_).ResourceID
echo "$_ added!"}