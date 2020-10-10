# Set the password policies
$pwHistory = "10"
$minAge = "30"
$maxAge = "90"
$minLength = "10"

# Can set with net accounts command
NET ACCOUNTS /UNIQUEPW:$pwHistory /MINPWAGE:$minAge /MAXPWAGE:$maxAge /MINPWLEN:$minLength

# Or set with secedit import (more options possible)
#$newdb = "$($env:windir)\security\new.sdb"
#secedit /import /db $newdb /cfg ../training/security.cfg /areas securitypolicy