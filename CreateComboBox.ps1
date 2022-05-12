#Create Combo Box (Action List) 

$ActionBox = New-Object Windows.Forms.combobox
$ActionBox.text = "Action..."
$ActionBox.Location = New-Object Drawing.Point 275,110
$ActionBox.items.Add("Disable User")
$ActionBox.items.Add("Enable User")
$ActionBox.items.Add("Unlock User")
$ActionBox.items.Add("Lock User")
