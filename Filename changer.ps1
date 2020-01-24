$directory = "Bad Wolves"
$originalArtistName = "bad_wolves"
$newArtistName = "Bad Wolves"

$directory = "D:\Music\New TMP\"+$directory
$newArtistName = $newArtistName+" -"

$files = Get-ChildItem -Path $directory 

ForEach ($file in $files)
{
    $newFilename = $file
    $newFilename = $newFilename -Replace $originalArtistName, ($newArtistName) 
    $newFilename = $newFilename -Replace "[0-9][0-9].",""
    $newFilename = $newFilename -Replace "_"," "
    $newFilename = $newFilename -Replace " myzuka",""

    $letterAfterDash = $newFilename.Substring($newArtistName.Length+1,1).ToUpper()
    $newFilename = $newFilename.Remove($newArtistName.Length+1,1)
    $newFilename = $newFilename.Insert($newArtistName.Length+1,$letterAfterDash)
    
    Rename-Item -Path $directory"\"$file -NewName $newFilename
}