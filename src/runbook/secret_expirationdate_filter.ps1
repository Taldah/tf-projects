#secret expiration date filter (for example 30 days)
$LimitExpirationDays = 30

#Retrieving the list of secrets that expires in the above range of days
$SecretsToExpire = Get-AzureADApplication -All:$true | Where-Object {($_.AppId -like "2a78d784-aead-47c1-b798-27680eb83710") -or ($_.DisplayName -eq "BI_App")} | ForEach-Object {
#$SecretsToExpire = Get-AzureADApplication -ObjectId "472c22e7-80bd-41ed-9f61-1f616941b8e2" | ForEach-Object {
#$SecretsToExpire = Get-AzureADApplication -All:$true | ForEach-Object {
    $app = $_
    @(
        Get-AzureADApplicationPasswordCredential -ObjectId $_.ObjectId
        Get-AzureADApplicationKeyCredential -ObjectId $_.ObjectId
    ) | Where-Object {
        $_.EndDate -gt (Get-Date).AddDays($LimitExpirationDays)
    } | ForEach-Object {
        $id = "Not set"
        if($_.CustomKeyIdentifier) {
            $id = [System.Text.Encoding]::UTF8.GetString($_.CustomKeyIdentifier)
        }
        [PSCustomObject] @{
            App = $app.DisplayName
            ObjectID = $app.ObjectId
            AppId = $app.AppId
            Type = $_.GetType().name
            KeyIdentifier = $id
            EndDate = $_.EndDate
        }
    }
}
#Printing the list of secrets that are near to expire
if($SecretsToExpire.Count -EQ 0) {
    Write-Output "No secrets found that will expire in this range"
}
else {
    Write-Output "Secrets that will expire in this range:"
    Write-Output $SecretsToExpire.Count
    Write-Output $SecretsToExpire
}