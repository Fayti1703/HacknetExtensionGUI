#!/usr/bin/perl
use strict;
use warnings;

use Tk;
my $mw = MainWindow->new();
$mw->geometry( "750x1000" );
$mw->optionAdd('*font' => 'fixed');
my $rows = 100;
my @r;
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

my $nodeIDInput = $frame->Entry(
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

my $nodeNameInput = $frame->Entry(
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

my $nodeIPInput = $frame->Entry(
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

my $nodeSecuritySpinbox = $frame->Spinbox(
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

my $nodeAllowDBMBool = $frame->Checkbutton(
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

my $nodeIconInput = $frame->Entry(
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

my $nodeTypeInput = $frame->Entry(
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

my $nodePWInput = $frame->Entry(
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
	-width => 10,
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
	-width => 10,
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

my $nodeProxyTimeInput = $frame->Spinbox(
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

my $nodePortsInput = $frame->Entry(
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

my $nodePortsNeededInput = $frame->Spinbox(
	-width => 2,
	-from => -1,
	-to => 99,
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

my $nodeTraceTimeInput = $frame->Entry(
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

my $nodePortRemapInput = $frame->Entry(
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

my $nodeTrackerBool = $frame->Checkbutton(
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

my $nodeDLinkInput = $frame->Entry(
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
	-width => 10,
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
	-width => 10,
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
	-width => 10,
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
	-width => 10,
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
	-width => 10,
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
	-width => 10,
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
	-width => 10,
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
	-width => 10,
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

my $nodeDeathRowDatabaseBool = $frame->Checkbutton(
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

my $nodeAcademicDatabaseBool = $frame->Checkbutton(
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

my $nodeMedicalDatabaseBool = $frame->Checkbutton(
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

my $nodeISPSystemBool = $frame->Checkbutton(
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
	-width => 10,
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
	-width => 10,
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

my $nodePointClickerBool = $frame->Checkbutton(
	)->grid(
	-row=>$r[0],
	-column=>2,
	-sticky=>'w',
	);































splice(@r,0,1);
my $generateButton = $frame->Button(
    -text    => 'Generate XML',
    -command => sub { exit },
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