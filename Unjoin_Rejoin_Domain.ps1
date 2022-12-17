Remove-Computer -ComputerName "Computer01" -UnjoinDomaincredential "Domain01\Admin01" -PassThru -Verbose -Restart

Add-Computer -ComputerName "Computer01" -LocalCredential "Computer01\Administrator" -DomainName "Domain01" -Credential "Domain01\Admin01" -Force -Verbose -Restart