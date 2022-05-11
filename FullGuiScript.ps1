Import-Module activedirectory

# Load the Winforms assembly
[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")

# Create the form
$Image = [system.drawing.image]::FromFile("C:\Users\Administrator\Desktop\CloudCrowd.png")
$form = New-Object Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(600,350)
$form.BackgroundImage = $image

#Set the dialog title
$form.text = "MSSA Group 2 Project"


# Create Main Form Label 
$mainlabel = New-Object Windows.Forms.Label
$mainlabel.Location = New-Object Drawing.Point 130,10
$mainlabel.Size = New-Object Drawing.Point 400,15
$mainlabel.text = "Use this program to manipulate user accounts in Active Directory"

# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.Location = New-Object Drawing.Point 150,75
$label.Size = New-Object Drawing.Point 110,15
$label.text = "Username (first last)"

# Create TextBox and set text, size and location
$global:textfield = New-Object Windows.Forms.TextBox
$global:textfield.Location = New-Object Drawing.Point 275,75
$global:textfield.Size = New-Object Drawing.Point 200,30
  



#Create Combo Box (Action List) 

$ActionBox = New-Object Windows.Forms.combobox
$ActionBox.text = "Action..."
$ActionBox.Location = New-Object Drawing.Point 275,110
$ActionBox.items.Add("Disable User")
$ActionBox.items.Add("Enable User")
$ActionBox.items.Add("Unlock User")
$ActionBox.items.Add("Lock User")

# Create Button and set text and location
$button = New-Object Windows.Forms.Button
$button.text = "Execute"
$button.Location = New-Object Drawing.Point 275,150

# Set up event handler to extarct text from TextBox and display it on the Label.
$button.add_click({

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


# Add the controls to the Form
$form.controls.add($button)
$form.controls.add($ActionBox)
$form.controls.add($mainlabel)
$form.controls.add($label)
$form.controls.add($global:textfield)

# Display the dialog
$form.ShowDialog()
