# Create the form
$Image = [system.drawing.image]::FromFile("C:\Users\Administrator\Desktop\CloudCrowd.png")
$form = New-Object Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(600,350)
$form.BackgroundImage = $image
