#!/usr/bin/perl

use Tk;
use warnings;
use strict;
use diagnostics;
use Try::Tiny;
require Tk::Pane;
require Tk::HList;

package main;
my $mw = MainWindow->new();
	$mw->geometry( "1000x900" );
	$mw->optionAdd('*font' => 'fixed');

my $newWindowSize = "1000x700+500+100";
my $newHListWidth = 100;
my $newHListHeight = 30;


my $bAllowDBM = "false";
my $bTracker = 0;
my $bDeathRowDatabase = 0;
my $bAcademicDatabase = 0;
my $bISPSystem = 0;
my $bMedicalDatabase = 0;
my $bResetPassword = "false";
my $bIsSuper = "false";

my $nodeAccountsHList;
my $nodeFirewallsHList;
my $nodeFilesHList;
my $nodeAdminTypesHList;
my $nodeDLinksHList;
my $nodeCustomThemeFilesHList;

my $rows = 200;
my @r;
my @nodeAccounts = ();
my @nodeFirewalls = ();
my @nodeFiles = ();
my @nodeAdminTypes = ();
my @nodeDLinks = ();
my @nodeCustomThemeFiles = ();

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
	-variable => \$bAllowDBM,
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
my $nodeAdminTypeText = $frame->Label(
	-text => 'Admin Type: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeAdminTypeEntry = $frame->Button(
	-text => 'New',
	-command=> sub { &newAdminType() },
	-state => "disabled",
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
	-variable => \$bTracker,
	-state => "disabled",
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
	-command => sub{&newDLink()},
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
	-state => "disabled",
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
my $nodeCustomThemeFileText = $frame->Label(
	-text => 'Custom Theme: ',
	)->grid(
	-row=>$r[0],
	-column=>1,
	-sticky=>"e",
	);

my $nodeCustomThemeFileNewButton = $frame->Button(
	-text => 'New',
	-command => sub{&newCustomThemeFile()}
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-variable => \$bDeathRowDatabase,
	-state => "disabled",
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
	-variable => \$bAcademicDatabase,
	-state => "disabled",
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
	-variable => \$bMedicalDatabase,
	-state => "disabled",
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
	-variable => \$bISPSystem,
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
	-state => "disabled",
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
sub createAddOKButtons{
	my $window = shift;
	my $nodeHList = shift;
	my @list = @_;	
	my $addButton = $window->Button(
	    -text => 'Add',
	    -command => sub {&addPressed($window, $nodeHList, @list)},
	    -width => 20,
	    -height => 3,
	    )->grid(
		-row=>4,
		-column=>1,
		-columnspan=>2,
		);
	my $okButton = $window->Button(
	    -text => 'OK',
	    -command => sub {&okPressed($window, $nodeHList, @list)},
	    -width => 20,
	    -height => 3,
	    )->grid(
		-row=>5,
		-column=>1,
		-columnspan=>2,
		);
}

sub addPressed{
	my $window = shift;
	my $nodeHList = shift;
	my @list = @_;	
	&addRecord($window, $nodeHList, @list);
}

sub okPressed{
	my $window = shift;
	my $nodeHList = shift;
	my @list = @_;
	$window->destroy;
}

sub deleteRecord{
	my $window = shift;
	my $nodeHList = shift;
	my @list = @_;
	my $pathRef = $nodeHList->selectionGet;
	my $path = @$pathRef;

	if($window->title ne "New DLink"){
		splice (@list,$path-1,3);
	}else{
		splice (@list,$path-1,1);
	}

	
	$nodeHList->delete('entry', $pathRef);

	if($window->title eq "New Account"){
		@nodeAccounts = @list;
	}
	if($window->title eq "New Firewall"){
		@nodeFirewalls = @list;
	}
	if($window->title eq "New File"){
		@nodeFiles = @list;
	}
	if($window->title eq "New Admin Type"){
		@nodeAdminTypes = @list;
	}
	if($window->title eq "New DLink"){
		@nodeDLinks = @list;
	}
	if($window->title eq "New Custom Theme File"){
		@nodeCustomThemeFiles = @list;
	}
}

sub addRecord{
	my $window = shift;
	my $nodeHList = shift;
	my @list = @_;
	my @tempList = ();
	my @children = $window->children;

	foreach my $widget (@children) {
		if($widget->isa('Tk::Entry')){
			my $entry = $widget->get;
			if($entry ne ""){ 
				push @tempList, $entry;
			}		
		}
		if($widget->isa('Tk::Checkbutton')){
			my $entry = $widget->get;
			if($entry ne ""){ 
				push @tempList, $entry;
			}		
		}
	}

	if($window->title eq "New DLink"){
		if(scalar(@tempList) > 0){
			my $length = scalar(@list);
			if($nodeHList->infoExists($length)){
				$length++;
			}
			$nodeHList->add($tempList[$length]);
			$nodeHList->itemCreate($tempList[$length], 0, -text=>$tempList[0]);
			push @nodeDLinks, @tempList;
		}
	}else{
		if(scalar(@tempList)%3 == 0 and scalar(@tempList) > 2){
			my $length = scalar(@list)/3;
			if($nodeHList->infoExists($length)){
				$length++;
			}
			if($window->title eq "New Admin Type" and $length>2){
				return;
			}
			$nodeHList->add($tempList[$length]);
			$nodeHList->itemCreate($tempList[$length], 0, -text=>$tempList[0]);
			$nodeHList->itemCreate($tempList[$length], 1, -text=>$tempList[1]);
			$nodeHList->itemCreate($tempList[$length], 2, -text=>$tempList[2]);

			if($window->title eq "New Account"){
				push @nodeAccounts, @tempList;
			}
			if($window->title eq "New Firewall"){
				push @nodeFirewalls, @tempList;
			}
			if($window->title eq "New File"){
				push @nodeFiles, @tempList;
			}
			if($window->title eq "New Admin Type"){
				push @nodeAdminTypes, @tempList;
			}
			if($window->title eq "New Custom Theme File"){
				push @nodeCustomThemeFiles, @tempList;
			}
		}		
	}
}

sub showRecords{
	my $window = shift;
	my $nodeHList = shift;
	my @list = @_;
	my $length = 0;
	my $bPathCheck = $nodeHList->infoExists($length);
	if($window->title eq "New DLink"){
		for(my $i=0;$i<scalar(@list);$i++){
			$nodeHList->add($list[$length]);
			$nodeHList->itemCreate($list[$length], 0, -text=>$list[$i]);
			$length++;
		}
	}else{
		for(my $i=0;$i<scalar(@list);$i+=3){
			$nodeHList->add($list[$length]);
			$nodeHList->itemCreate($list[$length], 0, -text=>$list[$i]);
			$nodeHList->itemCreate($list[$length], 1, -text=>$list[$i+1]);
			$nodeHList->itemCreate($list[$length], 2, -text=>$list[$i+2]);
			$length++;
		}
	}
}

sub newAccount{
	my $newAccountUsernameText;
	my $newAccountUsernameEntry;
	my $nodeAccountPasswordText;
	my $nodeAccountPasswordEntry;
	my $nodeAccountTypeText;
	my $nodeAccountTypeEntry;
	my $newAccountWindow = MainWindow->new(-title=>"New Account");
	$newAccountWindow->geometry($newWindowSize);
	$newAccountWindow->focusForce;
	$newAccountUsernameText = $newAccountWindow->Label(
		-text => 'Username: ',
		)->grid(
		-row=>1,
		-column=>1,
		-sticky=>"se",
		);

	$newAccountUsernameEntry = $newAccountWindow->Entry(
		-width => 20,
		)->grid(
		-row=>1,
		-column=>2,
		-sticky=>'sw',
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
		-sticky=>"ne",
		);

	$nodeAccountTypeEntry = $newAccountWindow->Entry(
		-width => 20,
		)->grid(
		-row=>3,
		-column=>2,
		-sticky=>'nw',
		);

	$nodeAccountsHList = $newAccountWindow->HList(
		-columns => 4,
		-header => -1,
		-width => $newHListWidth,
		-height => $newHListHeight,
		-command => sub{&deleteRecord($newAccountWindow, $nodeAccountsHList, @nodeAccounts)},
		)->grid(
		-row=>1,
		-column=>3,
		-rowspan=>3,
		-sticky=>'w',
		);

	$nodeAccountsHList->headerCreate(0, -text => "Username",);
	$nodeAccountsHList->headerCreate(1, -text => "Password",);
	$nodeAccountsHList->headerCreate(2, -text => "Type",);

	&createAddOKButtons($newAccountWindow, $nodeAccountsHList, @nodeAccounts);

	&showRecords($newAccountWindow, $nodeAccountsHList, @nodeAccounts);
}

sub newFirewall{
	my $nodeFirewallSolutionText;
	my $nodeFirewallSolutionEntry;
	my $nodeFirewallTimeText;
	my $nodeFirewallTimeEntry;
	my $newFirewallLevelText;
	my $newFirewallLevelEntry;
	my $newFirewallWindow = MainWindow->new(-title=>"New Firewall");
	$newFirewallWindow->geometry($newWindowSize);
	$newFirewallWindow->focusForce;
	$nodeFirewallSolutionText = $newFirewallWindow->Label(
		-text => 'Solution: ',
		)->grid(
		-row=>1,
		-column=>1,
		-sticky=>"se",
		);

	$nodeFirewallSolutionEntry = $newFirewallWindow->Entry(
		-width => 20,
		)->grid(
		-row=>1,
		-column=>2,
		-sticky=>'sw',
		);
	$nodeFirewallTimeText = $newFirewallWindow->Label(
		-text => 'Additional Time: ',
		)->grid(
		-row=>2,
		-column=>1,
		-sticky=>"e",
		);

	$nodeFirewallTimeEntry = $newFirewallWindow->Entry(
		-width => 20,
		)->grid(
		-row=>2,
		-column=>2,
		-sticky=>'w',
		);
	
	$newFirewallLevelText = $newFirewallWindow->Label(
		-text => 'Level: ',
		)->grid(
		-row=>3,
		-column=>1,
		-sticky=>"ne",
		);

	$newFirewallLevelEntry = $newFirewallWindow->Spinbox(
		-width=>3,
		-from=>0,
		-to=>99,
		)->grid(
		-row=>3,
		-column=>2,
		-sticky=>'nw',
		);
	
	$nodeFirewallsHList = $newFirewallWindow->HList(
		-columns => 4,
		-header => -1,
		-width => $newHListWidth,
		-height => $newHListHeight,
		-command => sub{&deleteRecord($newFirewallWindow, $nodeFirewallsHList, @nodeFirewalls)},
		)->grid(
		-row=>1,
		-column=>3,
		-rowspan=>3,
		-sticky=>'w',
		);

	$nodeFirewallsHList->headerCreate(0, -text => "Solution",);
	$nodeFirewallsHList->headerCreate(1, -text => "Additional Time",);
	$nodeFirewallsHList->headerCreate(2, -text => "Level",);

	&createAddOKButtons($newFirewallWindow, $nodeFirewallsHList, @nodeFirewalls);

	&showRecords($newFirewallWindow, $nodeFirewallsHList, @nodeFirewalls);
}

sub newFile{
	my $newFilePathText;
	my $newFilePathEntry;
	my $nodeFileNameText;
	my $nodeFileNameEntry;
	my $nodeFileContentsText;
	my $nodeFileContentsEntry;
	my $newFileWindow = MainWindow->new(-title=>"New File");
	$newFileWindow->geometry($newWindowSize);
	$newFileWindow->focusForce;
	$newFilePathText = $newFileWindow->Label(
		-text => 'Path: ',
		)->grid(
		-row=>1,
		-column=>1,
		-sticky=>"se",
		);

	$newFilePathEntry = $newFileWindow->Entry(
		-width=>50,
		)->grid(
		-row=>1,
		-column=>2,
		-sticky=>'sw',
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
		-sticky=>"ne",
		);

	$nodeFileContentsEntry = $newFileWindow->Entry(
		-width => 50,
		)->grid(
		-row=>3,
		-column=>2,
		-sticky=>'nw',
		);
	$nodeFilesHList = $newFileWindow->HList(
		-columns => 4,
		-header => -1,
		-width => $newHListWidth,
		-height => $newHListHeight,
		-command => sub{&deleteRecord($newFileWindow, $nodeFilesHList, @nodeFiles)},
		)->grid(
		-row=>1,
		-column=>3,
		-rowspan=>3,
		-sticky=>'w',
		);

	$nodeFilesHList->headerCreate(0, -text => "Path",);
	$nodeFilesHList->headerCreate(1, -text => "Name",);
	$nodeFilesHList->headerCreate(2, -text => "Contents",);

	&createAddOKButtons($newFileWindow, $nodeFilesHList, @nodeFiles);

	&showRecords($newFileWindow, $nodeFilesHList, @nodeFiles);
}

sub newAdminType{
	my $newTypeText;
	my $newTypeEntry;
	my $nodeResetPasswordText;
	my $nodeResetPasswordEntry;
	my $nodeIsSuperText;
	my $nodeIsSuperEntry;
	my $newAdminTypeWindow = MainWindow->new(-title=>"New Admin Type");
	$newAdminTypeWindow->geometry($newWindowSize);
	$newAdminTypeWindow->focusForce;
	$newTypeText = $newAdminTypeWindow->Label(
		-text => 'Admin Type: ',
		)->grid(
		-row=>1,
		-column=>1,
		-sticky=>"se",
		);

	$newTypeEntry = $newAdminTypeWindow->Entry(
		-width=>50,
		)->grid(
		-row=>1,
		-column=>2,
		-sticky=>'sw',
		);
	$nodeResetPasswordText = $newAdminTypeWindow->Label(
		-text => 'Reset Password: ',
		)->grid(
		-row=>2,
		-column=>1,
		-sticky=>"e",
		);

	$nodeResetPasswordEntry = $newAdminTypeWindow->Checkbutton(
		-offvalue =>"false",
		-onvalue =>"true",
		-variable => \$bResetPassword,
		)->grid(
		-row=>2,
		-column=>2,
		-sticky=>"w",
		);
	$nodeIsSuperText = $newAdminTypeWindow->Label(
		-text => 'Is Super?: ',
		)->grid(
		-row=>3,
		-column=>1,
		-sticky=>"ne",
		);

	$nodeIsSuperEntry = $newAdminTypeWindow->Checkbutton(
		-offvalue =>"false",
		-onvalue =>"true",
		-variable => \$bIsSuper,
		)->grid(
		-row=>3,
		-column=>2,
		-sticky=>"nw",
		);
	$nodeAdminTypesHList = $newAdminTypeWindow->HList(
		-columns => 4,
		-header => -1,
		-width => $newHListWidth,
		-height => $newHListHeight,
		-command => sub{&deleteRecord($newAdminTypeWindow, $nodeAdminTypesHList, @nodeAdminTypes)},
		)->grid(
		-row=>1,
		-column=>3,
		-rowspan=>3,
		-sticky=>'w',
		);

	$nodeAdminTypesHList->headerCreate(0, -text => "Admin Type",);
	$nodeAdminTypesHList->headerCreate(1, -text => "Reset Pasword",);
	$nodeAdminTypesHList->headerCreate(2, -text => "Is Super?",);

	&createAddOKButtons($newAdminTypeWindow, $nodeAdminTypesHList, @nodeAdminTypes);

	&showRecords($newAdminTypeWindow, $nodeAdminTypesHList, @nodeAdminTypes);
}
sub newDLink{
	my $newDLinkTargetText;
	my $newDLinkTargetEntry;
	my $newDLinkWindow = MainWindow->new(-title=>"New DLink");
	$newDLinkWindow->geometry($newWindowSize);
	$newDLinkWindow->focusForce;
	$newDLinkTargetText = $newDLinkWindow->Label(
		-text => 'Target IP: ',
		)->grid(
		-row=>2,
		-column=>1,
		-sticky=>"e",
		);

	$newDLinkTargetEntry = $newDLinkWindow->Entry(
		-width=>50,
		)->grid(
		-row=>2,
		-column=>2,
		-sticky=>'w',
		);

	$nodeDLinksHList = $newDLinkWindow->HList(
		-columns => 1,
		-header => -1,
		-width => $newHListWidth,
		-height => $newHListHeight,
		-command => sub{&deleteRecord($newDLinkWindow, $nodeDLinksHList, @nodeDLinks)},
		)->grid(
		-row=>1,
		-column=>3,
		-rowspan=>3,
		-sticky=>'w',
		);

	$nodeDLinksHList->headerCreate(0, -text => "Target",);

	&createAddOKButtons($newDLinkWindow, $nodeDLinksHList, @nodeDLinks);

	&showRecords($newDLinkWindow, $nodeDLinksHList, @nodeDLinks);
}
sub newCustomThemeFile{
	my $newFilePathText;
	my $newFilePathEntry;
	my $nodeFileNameText;
	my $nodeFileNameEntry;
	my $nodeThemePathText;
	my $nodeThemePathEntry;
	my $newCustomThemeFileWindow = MainWindow->new(-title=>"New Custom Theme File");
	$newCustomThemeFileWindow->geometry($newWindowSize);
	$newCustomThemeFileWindow->focusForce;
	$newFilePathText = $newCustomThemeFileWindow->Label(
		-text => 'Path: ',
		)->grid(
		-row=>1,
		-column=>1,
		-sticky=>"se",
		);

	$newFilePathEntry = $newCustomThemeFileWindow->Entry(
		-width=>50,
		)->grid(
		-row=>1,
		-column=>2,
		-sticky=>'sw',
		);
	$nodeFileNameText = $newCustomThemeFileWindow->Label(
		-text => 'Name: ',
		)->grid(
		-row=>2,
		-column=>1,
		-sticky=>"e",
		);

	$nodeFileNameEntry = $newCustomThemeFileWindow->Entry(
		-width => 50,
		)->grid(
		-row=>2,
		-column=>2,
		-sticky=>'w',
		);
	$nodeThemePathText = $newCustomThemeFileWindow->Label(
		-text => 'Theme Path: ',
		)->grid(
		-row=>3,
		-column=>1,
		-sticky=>"ne",
		);

	$nodeThemePathEntry = $newCustomThemeFileWindow->Entry(
		-width => 50,
		)->grid(
		-row=>3,
		-column=>2,
		-sticky=>'nw',
		);
	$nodeCustomThemeFilesHList = $newCustomThemeFileWindow->HList(
		-columns => 4,
		-header => -1,
		-width => $newHListWidth,
		-height => $newHListHeight,
		-command => sub{&deleteRecord($newCustomThemeFileWindow, $nodeCustomThemeFilesHList, @nodeCustomThemeFiles)},
		)->grid(
		-row=>1,
		-column=>3,
		-rowspan=>3,
		-sticky=>'w',
		);

	$nodeCustomThemeFilesHList->headerCreate(0, -text => "Path",);
	$nodeCustomThemeFilesHList->headerCreate(1, -text => "Name",);
	$nodeCustomThemeFilesHList->headerCreate(2, -text => "Theme Path",);

	&createAddOKButtons($newCustomThemeFileWindow, $nodeCustomThemeFilesHList, @nodeCustomThemeFiles);

	&showRecords($newCustomThemeFileWindow, $nodeCustomThemeFilesHList, @nodeCustomThemeFiles);
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
	print OUTFILE '" allowsDefaultBootModule="'.$bAllowDBM;
	print OUTFILE '" icon="'.$nodeIconEntry->get;
	print OUTFILE '" type="'.$nodeTypeEntry->get.'" >'."\n";

 	print OUTFILE "\t".'<adminPass pass="'.$nodePWEntry->get.'" />'."\n";

 	print OUTFILE "\t".'<ports>'.$nodePortsEntry->get.'</ports>'."\n";

 	print OUTFILE "\t".'<proxy time="'.$nodeProxyTimeEntry->get.'" />'."\n";

 	print OUTFILE "\t".'<portsForCrack val="'.$nodePortsNeededEntry->get.'" />'."\n";

 	print OUTFILE "\t".'<trace time ="'.$nodeTraceTimeEntry->get.'" />'."\n";

 	print OUTFILE "\t".'<portRemap>'.$nodePortRemapEntry->get.'</portRemap>'."\n";

 	for (my $i = 0; $i < scalar(@nodeAccounts); $i += 3) {
 		print OUTFILE "\t".'<account username="'.$nodeAccounts[$i].'" password="'.$nodeAccounts[$i+1].'" type="'.$nodeAccounts[$i+2].'" />'."\n";
	}

	for (my $i = 0; $i < scalar(@nodeFirewalls); $i += 3) {
 		print OUTFILE "\t".'<firewall level="'.$nodeFirewalls[$i].'" solution="'.$nodeFirewalls[$i+1].'" additionalTime="'.$nodeFirewalls[$i+2].'" />'."\n";
	}
	for (my $i = 0; $i < scalar(@nodeFiles); $i += 3) {
 		print OUTFILE "\t".'<file path="'.$nodeFiles[$i].'" name="'.$nodeFiles[$i+1].'">'.$nodeFiles[$i+2].'</file>'."\n";
	}
	for (my $i = 0; $i < scalar(@nodeAdminTypes); $i += 3) {
 		print OUTFILE "\t".'<admin type="'.$nodeAdminTypes[$i].'" resetPassword="'.$nodeAdminTypes[$i+1].'" isSuper="'.$nodeAdminTypes[$i+2].'" />'."\n";
	}
	for (my $i = 0; $i < scalar(@nodeDLinks); $i++) {
 		print OUTFILE "\t".'<dlink target="'.$nodeDLinks[$i].'" />'."\n";
	}

 	#if(bTracker){print OUTFILE "\t".'<tracker />'."\n";}else{print OUTFILE "\t".'<!--<tracker />-->'."\n";}

 	#if(bDeathRowDatabase){print OUTFILE "\t".'<deathRowDatabase />'."\n";}else{print OUTFILE "\t".'<!--<deathRowDatabase />-->'."\n";}

 	#if(bAcademicDatabase){print OUTFILE "\t".'<academicDatabase />'."\n";}else{print OUTFILE "\t".'<!--<academicDatabase />-->'."\n";}

 	#if(bISPSystem){print OUTFILE "\t".'<ispSystem />'."\n";}else{print OUTFILE "\t".'<!--<ispSystem />-->'."\n";}

	#if(bMedicalDatabase){print OUTFILE "\t".'<medicalDatabase />'."\n";}else{print OUTFILE "\t".'<!--<medicalDatabase />-->'."\n";}








































 	print OUTFILE '</Computer>';

	close OUTFILE;
}