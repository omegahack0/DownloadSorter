#List of file Types to sort
$fileExtension = @(".exe",".msi",".pdf",".jpg",".png",".gif",".svg",".zip",".rar",".7z",".iso",".docx",".mp4",".mkv",".ttf")

#Names for file extensions
$fileNames = @("Executables","Executables","Pdfs","Pictures","Pictures","Pictures","Pictures","zips","zips","zips","iso","documents","videos","videos","Fonts")

#Makes array of elements in dir
$arrayOfDir = Get-ChildItem

#Cycles through all the files in the directory
For($i=0;$i -lt $arrayOfDir.length;$i++){
    
    #Cycles through each file type
    For($j=0;$j -lt $fileExtension.length;$j++){

        #Checks if the file Ext is equal to the fileExtension Array
        if(($arrayOfDir[$i].Extension) -eq $fileExtension[$j]){   
            
            #Testing if extra Var makes parsing easier
            $fileNameTest = ".\" + $fileNames[$j]

			    #Needs to check for path
			    If (!(Test-Path $fileNameTest)){
                    
                    Write-Host $fileNameTest
				    mkdir $fileNames[$j]
			        Write-Host "Making Dir" $fileNames[$j]	
			    }

            #Moves files to respective folders
            Move-Item -Path $arrayOfDir[$i].Name -Destination $fileNameTest
            Write-Host `n
            Write-Host "The file to be moved is " $arrayOfDir[$i].Name
            #Write-Host "This is a " $fileNames[$j]
            Write-Host "The file will be moved to "$fileNameTest
        }
    }
}

