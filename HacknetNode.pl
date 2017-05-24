#!/usr/bin/perl

use Tk;
use warnings;
use strict;
use diagnostics;
require Tk::Pane;
require Tk::HList;

package main;
my $mw = MainWindow->new();
	$mw->geometry( "1000x900" );
	$mw->optionAdd('*font' => 'fixed');
my $rows = 100;
my $allowDBMBool = "false";
my $trackerBool = 0;
my $deathRowDatabaseBool = 0;
my $academicDatabaseBool = 0;
my $ispSystemBool = 0;
my $medicalDatabaseBool = 0;
my $newAccountUsernameText;
my $newAccountUsernameEntry;
my $nodeAccountPasswordText;
my $nodeAccountPasswordEntry;
my $nodeAccountTypeText;
my $nodeAccountTypeEntry;
my $newFirewallLevelText;
my $newFirewallLevelEntry;
my $nodeFirewallSolutionText;
my $nodeFirewallSolutionEntry;
my $nodeFirewallTimeText;
my $nodeFirewallTimeEntry;
my $newFilePathText;
my $newFilePathEntry;
my $nodeFileNameText;
my $nodeFileNameEntry;
my $nodeFileContentsText;
my $nodeFileContentsEntry;
my $nodeAccountsHList;

my @r;
my @nodeAccounts;


for my $i(1..$rows){
	push @r, $i;
};
################################################################################################################################################################
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
	-offvalue =>"false",
	-onvalue =>"true",
	-variable => \$allowDBMBool,
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
	-command=> sub { &newAccount() }
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
	-command=>sub {&newFirewall()},
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
	-variable => \$trackerBool,
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

my $nodeDLinkEntry = $frame->Button(
	-text => "New",
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
	-command => sub{&newFile()}
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
	-variable => \$deathRowDatabaseBool,
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
	-variable => \$academicDatabaseBool,
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
	-variable => \$medicalDatabaseBool,
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
	-variable => \$ispSystemBool,
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
################################################################################################################################################################
################################################################################################################################################################
splice(@r,0,1);
my $generateButton = $frame->Button(
    -text    => 'Generate XML',
    -command => sub { &genXML() },
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
################################################################################################################################################################
################################################################################################################################################################
sub createAddOKButtons(){
	my $window = $_[0];
	my @nodeList = @{$_[1]};
	my $nodeHList = $_[2];
	my $addButton = $window->Button(
	    -text => 'Add',
	    -command => sub {&addPressed($window, \@nodeList, $nodeHList)},
	    )->grid(
		-row=>4,
		-column=>1,
		-columnspan=>2,
		);
	my $okButton = $window->Button(
	    -text => 'OK',
	    -command => sub {@{$_[1]} = &okPressed($window, \@nodeList)},
	    )->grid(
		-row=>5,
		-column=>1,
		-columnspan=>2,
		);
}
sub addPressed(){
	my $window = $_[0];
	my @nodeList = @{$_[1]};
	my $nodeHList = $_[2];
	&addRecord($window, \@nodeList, $nodeHList);
}
sub okPressed(){
	my $window = $_[0];
	my @nodeList = @{$_[1]};
	$window->destroy;
	return @nodeList;
}
sub addRecord{
	my $window = $_[0];
	my @list = @{$_[1]};
	my $listLength = scalar(@list)/3;
	my $nodeHList = $_[2];
	my @children = $window->children;
	foreach my $widget (@children) {
		if($widget->isa('Tk::Entry')){
			push @list, $widget->get;
		}
	}

	$nodeHList->add($list[$listLength]);
	$nodeHList->itemCreate($list[$listLength], 0, -text=>$list[0]);
	$nodeHList->itemCreate($list[$listLength], 1, -text=>$list[1]);
	$nodeHList->itemCreate($list[$listLength], 2, -text=>$list[2]);
}

sub showRecords{
	my $window = $_[0];
	my @list = @{$_[1]};
	my $listLength = scalar(@list)/3;
	my $HList = $_[2];
	print @{$_[1]}."\n";
	#foreach my $node (@nodeList){
	#	$nodeHList->add($node);
	#	$nodeHList->itemCreate($node, 0, -text=>$node);
	#}
}

sub newAccount{
	my $newAccountWindow = MainWindow->new(-title=>"New Account");
	$newAccountWindow->geometry( "1000x300+500+300" );
	$newAccountWindow->focusForce;
	$newAccountUsernameText = $newAccountWindow->Label(
		-text => 'Username: ',
		)->grid(
		-row=>1,
		-column=>1,
		-sticky=>"e",
		);

	$newAccountUsernameEntry = $newAccountWindow->Entry(
		-width => 20,
		)->grid(
		-row=>1,
		-column=>2,
		-sticky=>'w',
		);
	$nodeAccountPasswordText = $newAccountWindow->Label(
		-text => 'Password: ',
		)->grid(
		-row=>2,
		-column=>1,
		-sticky=>"e",
		);

	$nodeAccountPasswordEntry = $newAccountWindow->Entry(
		-width => 20,
		)->grid(
		-row=>2,
		-column=>2,
		-sticky=>'w',
		);
	$nodeAccountTypeText = $newAccountWindow->Label(
		-text => 'Account Type: ',
		)->grid(
		-row=>3,
		-column=>1,
		-sticky=>"e",
		);

	$nodeAccountTypeEntry = $newAccountWindow->Entry(
		-width => 20,
		)->grid(
		-row=>3,
		-column=>2,
		-sticky=>'w',
		);

	$nodeAccountsHList = $newAccountWindow->HList(
		-columns => 4,
		-header => -1,
		-width => 100,
		-command => sub{&deleteRecord($nodeAccountsHList)},
		)->grid(
		-row=>1,
		-column=>3,
		-rowspan=>3,
		-sticky=>'w',
		);

	$nodeAccountsHList->headerCreate(0, -text => "Username",);
	$nodeAccountsHList->headerCreate(1, -text => "Password",);
	$nodeAccountsHList->headerCreate(2, -text => "Type",);

	&createAddOKButtons($newAccountWindow, \@nodeAccounts, $nodeAccountsHList);

	&showRecords($newAccountWindow, \@nodeAccounts, $nodeAccountsHList);

}

sub deleteRecord{
	my $nodeHList = $_[0];
	my $path;
	$path=$nodeHList->selectionGet;
	$nodeHList->delete('entry', $path);
	##NEEDS TO DELETE FROM ARRAY
}

sub newFirewall{
	my $newFirewallWindow = MainWindow->new(-title=>"New Firewall");
	$newFirewallWindow->geometry( "400x200+500+400" );
	$newFirewallWindow->focusForce;
	$newFirewallLevelText = $newFirewallWindow->Label(
		-text => 'Level: ',
		)->grid(
		-row=>1,
		-column=>1,
		-sticky=>"e",
		);

	$newFirewallLevelEntry = $newFirewallWindow->Spinbox(
		-width=>3,
		-from=>0,
		-to=>99,
		)->grid(
		-row=>1,
		-column=>2,
		-sticky=>'w',
		);
	$nodeFirewallSolutionText = $newFirewallWindow->Label(
		-text => 'Solution: ',
		)->grid(
		-row=>2,
		-column=>1,
		-sticky=>"e",
		);

	$nodeFirewallSolutionEntry = $newFirewallWindow->Entry(
		-width => 20,
		)->grid(
		-row=>2,
		-column=>2,
		-sticky=>'w',
		);
	$nodeFirewallTimeText = $newFirewallWindow->Label(
		-text => 'Additional Time: ',
		)->grid(
		-row=>3,
		-column=>1,
		-sticky=>"e",
		);

	$nodeFirewallTimeEntry = $newFirewallWindow->Entry(
		-width => 20,
		)->grid(
		-row=>3,
		-column=>2,
		-sticky=>'w',
		);

	#&createAddOKButtons($newFirewallWindow);
}

sub newFile{
	my $newFileWindow = MainWindow->new(-title=>"New File");
	$newFileWindow->geometry( "400x200+500+450" );
	$newFileWindow->focusForce;
	$newFilePathText = $newFileWindow->Label(
		-text => 'Path: ',
		)->grid(
		-row=>1,
		-column=>1,
		-sticky=>"e",
		);

	$newFilePathEntry = $newFileWindow->Entry(
		-width=>50,
		)->grid(
		-row=>1,
		-column=>2,
		-sticky=>'w',
		);
	$nodeFileNameText = $newFileWindow->Label(
		-text => 'Name: ',
		)->grid(
		-row=>2,
		-column=>1,
		-sticky=>"e",
		);

	$nodeFileNameEntry = $newFileWindow->Entry(
		-width => 50,
		)->grid(
		-row=>2,
		-column=>2,
		-sticky=>'w',
		);
	$nodeFileContentsText = $newFileWindow->Label(
		-text => 'Contents: ',
		)->grid(
		-row=>3,
		-column=>1,
		-sticky=>"e",
		);

	$nodeFileContentsEntry = $newFileWindow->Entry(
		-width => 50,
		)->grid(
		-row=>3,
		-column=>2,
		-sticky=>'w',
		);
	#&createAddOKButtons($newFileWindow);
}

MainLoop;
################################################################################################################################################################
sub genXML{
	my $name = $nodeNameEntry->get;
	my $fileName = join "", $name, ".xml";
	open OUTFILE, '>', $fileName;
	print OUTFILE '<?xml version = "1.0" encoding = "UTF-8" ?>'."\n";

	print OUTFILE '<Computer id="'.$nodeIDEntry->get;
	print OUTFILE '" name="'.$nodeNameEntry->get;
	print OUTFILE '" ip="'.$nodeIPEntry->get;
	print OUTFILE '" security="'.$nodeSecurityEntry->get;
	print OUTFILE '" allowsDefaultBootModule="'.$allowDBMBool;
	print OUTFILE '" icon="'.$nodeIconEntry->get;
	print OUTFILE '" type="'.$nodeTypeEntry->get.'" >'."\n";

 	print OUTFILE "\t".'<adminPass pass="'.$nodePWEntry->get.'" />'."\n";

 	print OUTFILE "\t".'<ports>'.$nodePortsEntry->get.'</ports>'."\n";

 	print OUTFILE "\t".'<proxy time="'.$nodeProxyTimeEntry->get.'" />'."\n";

 	print OUTFILE "\t".'<portsForCrack val="'.$nodePortsNeededEntry->get.'" />'."\n";

 	print OUTFILE "\t".'<trace time ="'.$nodeTraceTimeEntry->get.'" />'."\n";

 	print OUTFILE "\t".'<portRemap>'.$nodePortRemapEntry->get.'</portRemap>'."\n";

 	#for (my $i = 0; $i < scalar(@nodeAccounts); $i += 3) {
 		print OUTFILE "\t".'<account username="'.$nodeAccounts[0].'" password="'.$nodeAccounts[1].'" type="'.$nodeAccounts[2].'" />'."\n";
	#}

 	#if(trackerBool){print OUTFILE "\t".'<tracker />'."\n";}else{print OUTFILE "\t".'<!--<tracker />-->'."\n";}

 	#if(deathRowDatabaseBool){print OUTFILE "\t".'<deathRowDatabase />'."\n";}else{print OUTFILE "\t".'<!--<deathRowDatabase />-->'."\n";}

 	#if(academicDatabaseBool){print OUTFILE "\t".'<academicDatabase />'."\n";}else{print OUTFILE "\t".'<!--<academicDatabase />-->'."\n";}

 	#if(ispSystemBool){print OUTFILE "\t".'<ispSystem />'."\n";}else{print OUTFILE "\t".'<!--<ispSystem />-->'."\n";}

	#if(medicalDatabaseBool){print OUTFILE "\t".'<medicalDatabase />'."\n";}else{print OUTFILE "\t".'<!--<medicalDatabase />-->'."\n";}








































 	print OUTFILE '</Computer>';

	close OUTFILE;
}