#!/usr/bin/perl

use Tk;
require Tk::Pane;
my $mw = MainWindow->new();
$mw->geometry( "750x1000" );
$mw->optionAdd('*font' => 'fixed');
my $rows = 100;
my @r;
my $AllowDBMBool = "false";

for my $i(1..$rows){
	push @r, $i;
};

my $frame = $mw->Scrolled(
    'Frame',
    -scrollbars => "e",
	-height => 900,
	)->grid(
	-row=>$r[0],
	-column=>1,
	);
my $title = $frame->Label(
	-text => "Hacknet Node\n",
	)->grid(
	-row=>$r[0],
	-column=>1,
	-columnspan=>3,
	);
splice(@r,0,1);
my $nodeIDText = $frame->Label(
	-text => 'ID: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeIDEntry = $frame->Entry(
	-width => '20',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeNameText = $frame->Label(
	-text => 'Name: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeNameEntry = $frame->Entry(
	-width => 20,
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeIPText = $frame->Label(
	-text => 'IP: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeIPEntry = $frame->Entry(
	-width => 15,
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeSecuritySpinboxText = $frame->Label(
	-text => 'Security: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeSecurityEntry = $frame->Spinbox(
	-width=>3,
	-from => 0,
	-to => 6,
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>"w",
	);
splice(@r,0,1);
my $nodeAllowDBMCheckbuttonText = $frame->Label(
	-text => 'Allow Default Boot Module: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeAllowDBMCheckbutton = $frame->Checkbutton(
	-onvalue => "true",
	-offvalue => "false",
	-variable => $AllowDBMBool,
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>"w",
	);
splice(@r,0,1);
my $nodeIconText = $frame->Label(
	-text => 'Icon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeIconEntry = $frame->Entry(
	-width => 20,
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeTypeText = $frame->Label(
	-text => 'Type: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeTypeEntry = $frame->Entry(
	-width => 20,
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodePWText = $frame->Label(
	-text => 'Admin Password: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodePWEntry = $frame->Entry(
	-width => 20,
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeAccountText = $frame->Label(
	-text => 'Account: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeAccountNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeMailAccountText = $frame->Label(
	-text => 'Mail Account: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeMailAccountNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeProxyTimeText = $frame->Label(
	-text => 'Proxy Time: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeProxyTimeEntry = $frame->Spinbox(
	-width => 2,
	-from => -1,
	-to => 99,
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodePortsText = $frame->Label(
	-text => 'Ports: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodePortsEntry = $frame->Entry(
	-width => 36,
	-textvariable => '21, 22, 25, 80, 1433, 104, 6881, 443, 192, 554',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodePortsNeededText = $frame->Label(
	-text => 'Ports For Crack: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodePortsNeededEntry = $frame->Spinbox(
	-width => 2,
	-from => 0,
	-to => 99,
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeFirewallText = $frame->Label(
	-text => 'Firewall: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeFirewallEntry = $frame->Button(
	-text=>"New",
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeTraceTimeText = $frame->Label(
	-text => 'Trace Time: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeTraceTimeEntry = $frame->Entry(
	-width => 20,
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodePortRemapText = $frame->Label(
	-text => 'Port Remap: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodePortRemapEntry = $frame->Entry(
	-width => 20,
	-textvariable => "web=1234,22=2",
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeTrackerCheckbuttonText = $frame->Label(
	-text => 'Tracker: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeTrackerCheckbutton = $frame->Checkbutton(
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>"w",
	);
splice(@r,0,1);
my $nodeDLinkText = $frame->Label(
	-text => 'DLink Target (Linked Computer): ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeDLinkEntry = $frame->Entry(
	-width => 20,
	-textvariable => "advExamplePC2",
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodePositionText = $frame->Label(
	-text => 'Position Near: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodePositionNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeFileText = $frame->Label(
	-text => 'File: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeFileNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeCustomThemeText = $frame->Label(
	-text => 'Custom Theme: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeCustomThemeNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeDECFileText = $frame->Label(
	-text => 'Encrypted File: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeDECFileNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeEOSDeviceText = $frame->Label(
	-text => 'EOS Device: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeEOSDeviceNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeMailServerText = $frame->Label(
	-text => 'Mail Server: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeMailServerNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeUploadServerDaemonText = $frame->Label(
	-text => 'Upload Server Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeUploadServerDaemonNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeWebServerText = $frame->Label(
	-text => 'Web Server: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeWebServerNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeDeathRowDatabaseText = $frame->Label(
	-text => 'DeathRow Database: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeDeathRowDatabaseCheckbutton = $frame->Checkbutton(
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>"w",
	);
splice(@r,0,1);
my $nodeAcademicDatabaseText = $frame->Label(
	-text => 'Academic Database: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeAcademicDatabaseCheckbutton = $frame->Checkbutton(
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>"w",
	);
splice(@r,0,1);
my $nodeMedicalDatabaseText = $frame->Label(
	-text => 'Medical Database: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeMedicalDatabaseCheckbutton = $frame->Checkbutton(
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>"w",
	);
splice(@r,0,1);
my $nodeISPSystemText = $frame->Label(
	-text => 'ISP System: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeISPSystemCheckbutton = $frame->Checkbutton(
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>"w",
	);
splice(@r,0,1);
my $nodeMessageBoardText = $frame->Label(
	-text => 'Message Board: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeMessageBoardNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeHeartMonitorText = $frame->Label(
	-text => 'Heart Monitor: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeHeartMonitorNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodePointClickerText = $frame->Label(
	-text => 'PointClicker Database: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodePointClickerCheckbutton = $frame->Checkbutton(
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodePSongChangerDaemonText = $frame->Label(
	-text => 'Song Changer Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeSongChangerDaemonCheckbutton = $frame->Checkbutton(
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeMissionListingServerText = $frame->Label(
	-text => 'Mission Listing Server: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeMissionListingServerNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeMissionHubServerText = $frame->Label(
	-text => 'Mission Hub Server: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeMissionHubServerNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeCreditsDaemonText = $frame->Label(
	-text => 'Credits Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeCreditsDaemonNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeMemoryDumpFileText = $frame->Label(
	-text => 'Memory Dump File: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeMemoryDumpFileNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeMemoryText = $frame->Label(
	-text => 'Memory: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeMemoryNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeDHSDaemonText = $frame->Label(
	-text => 'DHS Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeDHSDaemonNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeCustomConnectDisplayDaemonText = $frame->Label(
	-text => 'Custom Connect Display Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeCustomConnectDisplayDaemonNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeLogoDaemonText = $frame->Label(
	-text => 'Logo Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeLogoDaemonNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeLogoCustomConnectDisplayDaemonText = $frame->Label(
	-text => 'Logo Custom Connect Display Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeLogoCustomConnectDisplayDaemonNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeDatabaseDaemonText = $frame->Label(
	-text => 'Database Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeDatabaseDaemonNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeWhitelistAuthenticatorDaemonText = $frame->Label(
	-text => 'Whitelist Authenticator Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeWhitelistAuthenticatorDaemonNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeMarkovTextDaemonText = $frame->Label(
	-text => 'Markov Text Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeMarkovTextDaemonNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $nodeIRCDaemonText = $frame->Label(
	-text => 'IRC Daemon: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeIRCDaemonNewButton = $frame->Button(
	-text => 'New',
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);
splice(@r,0,1);
my $generateButton = $frame->Button(
    -text    => 'Generate XML',
    -command => sub { genXML() },
    )->grid(
	-row=>$r[0],
	-column=>1,
	-columnspan=>3,
	);
splice(@r,0,1);
my $quitButton = $frame->Button(
    -text    => 'Quit',
    -command => sub { exit },
    )->grid(
	-row=>$r[0],
	-column=>1,
	-columnspan=>3,
	);

MainLoop;

sub genXML{
	my $name = $nodeNameEntry->get;
	my $fileName = join "", $name, ".xml";
	open OUTFILE, '>', $fileName;
	print OUTFILE '<?xml version = "1.0" encoding = "UTF-8" ?>'."\n";

	print OUTFILE '<Computer id="'.$nodeIDEntry->get;
	print OUTFILE '" name="'.$nodeNameEntry->get;
	print OUTFILE '" ip="'.$nodeIPEntry->get;
	print OUTFILE '" security="'.$nodeSecurityEntry->get;
	print OUTFILE '" allowsDefaultBootModule="'.$AllowDBMBool;
	print OUTFILE '" icon="'.$nodeIconEntry->get;
	print OUTFILE '" type="'.$nodeTypeEntry->get.'" >'."\n";

 	print OUTFILE "\t".'<adminPass pass='.'"'.$nodePWEntry->get.'" />'."\n";

 	print OUTFILE "\t".'<ports>'.$nodePortsEntry->get.'</ports>'."\n";

 	print OUTFILE "\t".'<portsForCrack val='.'"'.$nodePortsNeededEntry->get.'" />'."\n";

 	print OUTFILE "\t".'<trace time ='.'"'.$nodeTraceTimeEntry->get.'" />'."\n";

 	print OUTFILE '</Computer>';

	close OUTFILE;
}