#Disable User Script
  if ($ActionBox.SelectedItem -like "Disable User"){
       $global:textfieldcontents = $global:textfield.Text
       Disable-ADAccount $global:textfieldcontents   
 }

 elseif ($ActionBox.SelectedItem -like "Enable User"){
        Enable-ADAccount $global:textfieldcontents
        }

 else{
    write-host "nothing was performed"
    }
 
  $feedback = Get-ADUser $global:textfield.text | select name,enabled
  write-host $feedback
  })
