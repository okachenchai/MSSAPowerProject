# Create the label control and set text, size and location
$label = New-Object Windows.Forms.Label
$label.Location = New-Object Drawing.Point 150,75
$label.Size = New-Object Drawing.Point 110,15
$label.text = "Username (first last)"
