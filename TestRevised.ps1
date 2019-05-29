#Array of file type
$fileTypes = @(".exe",".pdf",".jpg",".png",".gif",".zip",".iso",".docx",".mp4",".mkv")

#Full file name
$fileNames = @("Executables","pdf","Pictures","Pictures","Pictures","zips","iso","documents","videos","videos")

#Makes array of elements in dir
$filesTemp = Get-ChildItem

#Cycles through all the files in the directory
For($i=0;$i -lt $filesTemp.length;$i++){
    
    #Cycles through each file type
    For($j=0;$j -lt $fileTypes.length;$j++){

        #Checks if the file Ext is equal to the fileTypes Array
        if(($filesTemp[$i].Extension) -eq $fileTypes[$j]){   
            
            #Testing if extra Var makes parsing easier
            $fileNameTest = ".\" + $fileNames[$j]
            #Needs to check for path
            #If (!(Test-Path .\$fileNames[$j])) {
            #New-Item -ItemType directory -Path $targetdir
            
            #}


            #Moves files to respective folders
            Move-Item -Path $filesTemp[$i].Name -Destination $fileNameTest 
            $filesTemp[$i].Name
            $fileNames[$j]
            $fileNameTest
        }
    }
}

