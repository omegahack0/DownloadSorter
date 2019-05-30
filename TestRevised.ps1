#Array of file type
$fileExtension = @(".exe",".msi",".pdf",".jpg",".png",".gif",".svg",".zip",".iso",".docx",".mp4",".mkv")

#Full file name
$fileNames = @("Executables","Executables","Pdfs","Pictures","Pictures","Pictures","Pictures","zips","iso","documents","videos","videos")

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
				    mkdir $fileNames
			        Host-out "Make Dir"	
			    }


            #Moves files to respective folders
            Move-Item -Path $arrayOfDir[$i].Name -Destination $fileNameTest
            $arrayOfDir[$i].Name
            $fileNames[$j]
            $fileNameTest
        }
    }
}

