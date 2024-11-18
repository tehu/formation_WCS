# Exercice 2

## Fichier AddLocalUsers.ps1 corrigé

<#
Q2.1
Dans Main.ps1, changer  Temp/ par Scripts/

Q2.2
Sur la ligne $Users = Import-Csv... : remplacer -Skip 2 par -Skip 1

Q2.3
Dans le fichier CSV, les descriptions comportent des espaces.
Il faut entourer ce champ par les quotes.

Q2.4
Sur la ligne $Users = Import-Csv... : enlever tous les headers
qui suivent "description"

Q2.5
Après la ligne Write-Host "L'utilisateur ...", ajouter la ligne :
    Write-Host "Son mot de passe est $Password"

Q2.6
A la suite du Write-Host ...; ajouter la ligne :
    Log $LogFile "Création du compte utilisateur $Name"

Q2.7
Ajouter le bloc conditionnel :
    Else {
		Write-Host "L'utilisateur $Name existe déjà."
		Log $LogFile "Echec lors de la création : $Name existe déjà"
    }

Q2.8
Sur la ligne Add-LocalGroupMember -Group :
"Utilisateurs" à la place de "Utilisateur"

Q2.9
Remplacer les occurrences de $Prenom.$Nom par $Name

Q2.10
Basculer l'argument AccountNeverExpires de $false à $true

Q2.11
Sur la ligne de la fonction Random-Password :
passer $length de 6 à 10

#>

function Log
{
    param([string]$FilePath,[string]$Content)

    # Vérifie si le fichier existe, sinon le crée
    If (-not (Test-Path -Path $FilePath))
    {
        New-Item -ItemType File -Path $FilePath | Out-Null
    }

    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date;$User;$Content"

    # Ajoute la ligne de journal au fichier
    Add-Content -Path $FilePath -Value $logLine
}

Function Random-Password ($length = 10)
{
    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122

    $password = get-random -count $length -input ($punc + $digits + $letters) |`
        ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
    Return $password.ToString()
}

Function ManageAccentsAndCapitalLetters
{
    param ([String]$String)

    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","societe","fonction","service","description" -Encoding UTF8  | Select-Object -Skip 1

foreach ($User in $Users)
{
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.nom
    $Name = "$Prenom.$Nom"
    If (-not(Get-LocalUser -Name "$Name" -ErrorAction SilentlyContinue))
    {
        $Pass = Random-Password
        $Password = (ConvertTo-secureString $Pass -AsPlainText -Force)
        $Description = "$($User.description) - $($User.fonction)"
        $UserInfo = @{
            Name                 = "$Name"
            FullName             = "$Name"
            Password             = $Password
            Description          = $Description
            AccountNeverExpires  = $true
            PasswordNeverExpires = $true
        }

        New-LocalUser @UserInfo
        Add-LocalGroupMember -Group "Utilisateurs" -Member "$Name"
        Write-Host "L'utilisateur $Name a été créé"
        Write-Host "Son mot de passe est $Password"

        Log $LogFile "Création du compte utilisateur $Name"
    }
    Else {
		Write-Host "L'utilisateur $Name existe déjà."
		Log $LogFile "Echec lors de la création : $Name existe déjà"

    }

}
