# GUI Automation Project
## Avery Anderson, Joshua Royal, and Olivia KaChenChai
### About
For this project we wanted to make a user-friendly interface for task automation. In administration roles, tasks like creating and disabling accounts can be simple. But when faced with disabling or enabling, for example 100 accounts, the task can become quite tedious. We have been working on creating a script to make these tasks run with a click of a button. This is an on-going project and many more tasks can be added to the script for automation depending on the administrative role the individual is in. 

#### Load the Winforms assembly
```
Import-Module activedirectory
[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")
```
[Link to Script](LoadWinformsAssembly.ps1)

#### Create the form
```
$Image = [system.drawing.image]::FromFile("C:\Users\Administrator\Desktop\CloudCrowd.png")
$form = New-Object Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(600,350)
$form.BackgroundImage = $image
```
[Link to Script](CreateForm.ps1)

#### Set the dialog title
```
$form.text = "MSSA Group 2 Project"
```
[Link to Script](DialogTitle.ps1)

#### Create Main Form Label 
```
$mainlabel = New-Object Windows.Forms.Label
$mainlabel.Location = New-Object Drawing.Point 130,10
$mainlabel.Size = New-Object Drawing.Point 400,15
$mainlabel.text = "Use this program to manipulate user accounts in Active Directory"
```
[Link to Script](CreateMainLabel.ps1)

#### Create the label control and set text, size and location
```
$label = New-Object Windows.Forms.Label
$label.Location = New-Object Drawing.Point 150,75
$label.Size = New-Object Drawing.Point 110,15
$label.text = "Username (first last)"
```
[Link to Script](CreateLabelTxtSzeLocation.ps1)

#### Create TextBox and set text, size and location
```
$global:textfield = New-Object Windows.Forms.TextBox
$global:textfield.Location = New-Object Drawing.Point 275,75
$global:textfield.Size = New-Object Drawing.Point 200,30
```
[Link to Script](CreateTxtbxSetSzeLocation.ps1)

#### Create Combo Box (Action List)
```
$ActionBox = New-Object Windows.Forms.combobox
$ActionBox.text = "Action..."
$ActionBox.Location = New-Object Drawing.Point 275,110
$ActionBox.items.Add("Disable User")
$ActionBox.items.Add("Enable User")
$ActionBox.items.Add("Unlock User")
$ActionBox.items.Add("Lock User")
```
[Link to Script](CreateComboBox.ps1)

#### Create Button and set text and location
```
$button = New-Object Windows.Forms.Button
$button.text = "Execute"
$button.Location = New-Object Drawing.Point 275,150
```
[Link to Script](CreateButton.ps1)

#### Set up event handler to extract text from TextBox and display it on the Label.
```
$button.add_click({
```
[Link to Script](SetEventHandler.ps1)

#### Disable User Script
```
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
```
[Link to Script](ScriptDisableEnable.ps1)

#### Add the controls to the Form
```
$form.controls.add($button)
$form.controls.add($ActionBox)
$form.controls.add($mainlabel)
$form.controls.add($label)
$form.controls.add($global:textfield)
```
[Link to Script](AddControlForm.ps1)

#### Display the dialog
```
$form.ShowDialog()
```
[Link to Script](ResponseDialog.ps1)
