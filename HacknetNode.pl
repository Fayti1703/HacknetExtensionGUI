use Tk;
$mw = new MainWindow;
$mw->optionAdd('*font' => 'fixed');
$rows = 20;
@r;
for $i(1..$rows){
	push @r, $i;
};

$newCanvas = $mw->Canvas(
	)->grid(
	-row=>@r[0],
	-column=>1,
	);

$title = $newCanvas->Label(
	-text => "Hacknet Node\n",
	)->grid(
	-row=>@r[0],
	-column=>1,
	-columnspan=>3,
	);
splice(@r,0,1);
$nodeIDText = $newCanvas->Label(
	-text => 'ID: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodeIDInput = $newCanvas->Entry(
	-width => '20',
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
$nodeNameText = $newCanvas->Label(
	-text => 'Name: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodeNameInput = $newCanvas->Entry(
	-width => 20,
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
$nodeIPText = $newCanvas->Label(
	-text => 'IP: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodeIPInput = $newCanvas->Entry(
	-width => 20,
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
$nodeSecuritySpinboxText = $newCanvas->Label(
	-text => 'Security: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodeSecuritySpinbox = $newCanvas->Spinbox(
	-width=>3,
	-from => 0,
	-to => 6,
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>"w",
	);
splice(@r,0,1);
$nodeAllowDBMCheckbuttonText = $newCanvas->Label(
	-text => 'Allow Default Boot Module: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodeAllowDBM = $newCanvas->Checkbutton(
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>"w",
	);
splice(@r,0,1);
$nodeIPText = $newCanvas->Label(
	-text => 'Icon: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodeIPInput = $newCanvas->Entry(
	-width => 20,
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
$nodeIPText = $newCanvas->Label(
	-text => 'Type: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodeIPInput = $newCanvas->Entry(
	-width => 20,
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
$nodePWText = $newCanvas->Label(
	-text => 'Admin Password: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodePWInput = $newCanvas->Entry(
	-width => 20,
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
$nodeProxyTimeText = $newCanvas->Label(
	-text => 'Proxy Time: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodeProxyTimeInput = $newCanvas->Spinbox(
	-width => 2,
	-from => -1,
	-to => 99,
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
$nodePortsText = $newCanvas->Label(
	-text => 'Ports: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodePortsInput = $newCanvas->Entry(
	-width => 36,
	-textvariable => '21, 22, 25, 80, 1433, 104, 6881, 443, 192, 554',
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
$nodePortsNeededText = $newCanvas->Label(
	-text => 'Ports Needed: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodePortsNeededInput = $newCanvas->Spinbox(
	-width => 2,
	-from => -1,
	-to => 99,
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
$nodeTraceTimeText = $newCanvas->Label(
	-text => 'Trace Time: ',
	)->grid(
	-row=>@r[0],
	-column=>1,
	-sticky=>"e",
	);

$nodeTraceTimeInput = $newCanvas->Entry(
	-width => 20,
	)->grid(
	-row=>@r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);












$generateButton = $mw->Button(
    -text    => 'Generate XML',
    -command => sub { exit },
    )->grid(
	-row=>19,
	-column=>1,
	);

$quitButton = $mw->Button(
    -text    => 'Quit',
    -command => sub { exit },
    )->grid(
	-row=>20,
	-column=>1,
	);

MainLoop;