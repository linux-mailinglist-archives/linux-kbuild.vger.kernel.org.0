Return-Path: <linux-kbuild+bounces-9205-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70FABEB027
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 19:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E37B33B0B30
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Oct 2025 17:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5420A2F8BD0;
	Fri, 17 Oct 2025 17:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b="yD2Inv0H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="heGY6KZ9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2B72FB084
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Oct 2025 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760720662; cv=none; b=Rly8gNSwlwC+bNQgD1D/qq1UCWgiLm7drdUWigQCt1XFzI5ql3HpDTG6DqzX6R/ejRm7yMswgfJ605wKw1hZqMVzXSEM9gVdKvACJqd1rMIFrgO+aY0FaOV+15Yc+Wn2Qd5HDKmNvdt2JMUEqZy0FPH6uFxvgLW8Ze3qqh7wPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760720662; c=relaxed/simple;
	bh=hkVYZwwTIqJX+AD6rRlrPp5VJMkQzIuranL8dmST85E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKBMciN2BLjFklOj5RjSQEbbuCxmO5o0rK8SPmjR0isiCs+CpKWqOvgsQ2WZM00l31R2Knfji9XJric36gbNgXtzo6mkjDInelaIzIDAdhMTPBqFAIaZMC6W2HDET+qyR75f283xNnkMFunEjnTgacQQjNegDyrmQmCWxdX3TOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io; spf=pass smtp.mailfrom=likewhatevs.io; dkim=pass (2048-bit key) header.d=likewhatevs.io header.i=@likewhatevs.io header.b=yD2Inv0H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=heGY6KZ9; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=likewhatevs.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=likewhatevs.io
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id E8957EC0188;
	Fri, 17 Oct 2025 13:04:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 17 Oct 2025 13:04:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=likewhatevs.io;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1760720658; x=1760807058; bh=HVyFze63xR
	sE7ia7Tf2PiNRaCep9PeIEpAANIm7HBgw=; b=yD2Inv0H0WiPdCqxAaZOiuwC1B
	l3rnmum0M0NAM2xWD2KU8+qkr0LvdR3z800N61XZpmJWljG/JzclNdw62mAQ3E2z
	1ALrkY3VO7agoy34xUFwojuDszWMSKF7LYnzPEmkCyiFBnBdDdI1K+gtfg7AIGvu
	xIrd4jt50Ny24xzmccfDHVKgvQ1kVrrkZqBegOi5hmwC1LCULOhZrUYWkxeCYDTf
	aXfi+UCqUutZzy0sjBdzJKAIncHUH4z8cVhImuten61nUozU87lov0rHcUa5osDG
	omXOnBcVRCpQ49uUUpSxyZ9iWqUDRvuo1/dMbRKD+2z97zvrbs4f254H2VVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760720658; x=1760807058; bh=HVyFze63xRsE7ia7Tf2PiNRaCep9PeIEpAA
	NIm7HBgw=; b=heGY6KZ9bBNoOumMXnXrvPFsMorqNZhlSehrBRhuzYwlZNcpXyr
	wz/G3jagNyhUeQw8Cy3j+7q85JYb24jBoue+0WEbrOi460CPnVqV+8soNHPrUn58
	oEF6fOwac4Grvsj5QfHZbHZDOAkZDZhWUGC18SGfEcWHDvx0CuoMvNQjRqMABUdj
	GWAEoHpJhsx4jrivichxu61be6TwdrfZkB+mTNURc1MUXOUaM8XImMvjswQeULs0
	EUUIs4IEBp9zF8FgsSg2DP7aELIZoV+FsgcLJoj5+EU1fSPwAZwklr/VtZjiaxHp
	0hDw3TS8rXQzJZXSa8PPhgX1EtKSlofiS1Q==
X-ME-Sender: <xms:EnfyaKCJCyPhM5_sjT0VwESqVZ1wTVj68gIYKqMLTxSxT3aXLz8s6g>
    <xme:EnfyaLgZPkzQ82whA7hSJLln51mvuPAwS7-Rh1JKKwrxoDTaFv7cN302LSs5P3aCF
    ZxN4-S2YNTLRiebc-qnbtXfSnOcE9sci8P7G4ABVJCFB2BN9ksbxxE>
X-ME-Received: <xmr:EnfyaClRFvXHPIkj7TMyy7BtJ1V6YbpIGVvVb3nGcLp5Onmd0jBOx2TPxVZvERxtbEyGnPomDQahxD_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvdeljedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpefrrghtucfuohhmrghruhcuoehprghtshhosehlihhkvgifhhgrthgv
    vhhsrdhioheqnecuggftrfgrthhtvghrnhepfeevieevieejgfeutedtjeelleeifedvtd
    ekkeduudevteevuedtheffieeuhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgrthhsoheslhhikhgvfihhrghtvghvshdrihhopdhnsg
    gprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehnrghthhgr
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslhgvrd
    gvuhdprhgtphhtthhopehlihhnuhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehprghtshhosehlihhkvgifhhgrthgvvhhsrdhioh
X-ME-Proxy: <xmx:EnfyaHpyV6ASU0HomoDazfx6u-IaZnN04IDozsdDrVN3vzScD_Ip3Q>
    <xmx:EnfyaLGPztfivInOhmYFZSUJWlcxrxiTcToHiLntbmnJ85a3Q2CpQg>
    <xmx:EnfyaDyCzrsCcmRBYMkbbvPpZh1qP1AlR7sLYTJpJ9rWgNlnDeAhwg>
    <xmx:EnfyaApvKh8Yd4PnQ4nqZt7DSdWxxAE__onMldTqMvDwAMS9XRydzg>
    <xmx:EnfyaKwXpEudYvJkc10hQEQS-POWi5zXew5l0dwhwboNeoTYv5LylVsy>
Feedback-ID: i7f194913:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Oct 2025 13:04:18 -0400 (EDT)
From: Pat Somaru <patso@likewhatevs.io>
To: nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org,
	Pat Somaru <patso@likewhatevs.io>
Subject: [PATCH] scripts: Add check-build-warnings.pl for tracking kernel build warnings
Date: Fri, 17 Oct 2025 13:03:54 -0400
Message-ID: <20251017170354.2660704-1-patso@likewhatevs.io>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add scripts/check-build-warnings.pl to automate the guidance in
Documentation/process/maintainer-netdev.rst regarding new-warning-free
code submissions. The netdev maintainers require that patches do not
introduce new compiler warnings, and this script provides an
automated/fool-proof way to do this with paste-into-commit-msg friendly
output. This is not so much for netdev (which has it's own out-of-tree
automation for this) but for folks who want to apply that bar to their
contributions elsewhere and to have an easy way to communicate that with
reviewers.

This script builds the kernel with specified targets and warning levels,
saving warnings as baselines that can be checked against later builds to
detect newly introduced warnings. This allows developers to easily
verify their changes don't add new warnings before submitting patches.

Key features:
- Automatic baseline creation and comparison per-target and
  per-warning-level
- Warning files stored alongside build artifacts (like .cmd files)
- CONFIG_WERROR automatically disabled to capture warnings without build
  failure
- Support for W=1, W=2, W=3 extra warning levels
- Clean by default to ensure all warnings are captured (not just changed
  files)
- Optional --no-clean for faster iterative development

Usage examples:
  # Save initial baseline for a driver
  scripts/check-build-warnings.pl --save-baseline drivers/net/ethernet/intel/

  # Check for new warnings after making changes
  scripts/check-build-warnings.pl --check drivers/net/ethernet/intel/

  # Use stricter W=1 warnings (separate baseline)
  scripts/check-build-warnings.pl --save-baseline --warn=1 drivers/net/

Signed-off-by: Pat Somaru <patso@likewhatevs.io>
---
 scripts/check-build-warnings.pl | 376 ++++++++++++++++++++++++++++++++
 1 file changed, 376 insertions(+)
 create mode 100755 scripts/check-build-warnings.pl

diff --git a/scripts/check-build-warnings.pl b/scripts/check-build-warnings.pl
new file mode 100755
index 000000000000..92be1d72afdd
--- /dev/null
+++ b/scripts/check-build-warnings.pl
@@ -0,0 +1,376 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0
+#
+# check-build-warnings.pl - Compare kernel build warnings against a baseline
+#
+# This script builds the kernel and records warnings or checks warnings
+# against previously recorded warnings. The idea here is to capture
+# guidance in Documentation/process/maintainer-netdev.rst in a script
+# wrt/ not making new errors and to provide output simple to include on
+# patches.
+#
+# Usage:
+#	scripts/check-build-warnings.pl [options] [make-target]
+#
+# Examples:
+#	# Save baseline
+#	scripts/check-build-warnings.pl --save-baseline
+#
+#	# Check for new warnings after making changes
+#	scripts/check-build-warnings.pl --check
+#
+#	# Build with W=1 warnings enabled
+#	scripts/check-build-warnings.pl --check --warn=1
+#
+#	# Just show current warnings without comparison
+#	scripts/check-build-warnings.pl --list
+
+use strict;
+use warnings;
+use Getopt::Long qw(:config no_ignore_case);
+use File::Basename;
+use Cwd qw(abs_path);
+
+my $scriptname = basename($0);
+my $objtree = $ENV{'O'} || $ENV{'KBUILD_OUTPUT'} || '.';
+my $srctree = abs_path(dirname($0) . "/..");
+
+# Default options
+my $help = 0;
+my $save_baseline = 0;
+my $check_warnings = 0;
+my $list_only = 0;
+my $warn_level = "";
+my $jobs = "";
+my $no_clean = 0;
+my $build_target = "all";
+
+sub show_usage {
+	print << "EOF";
+Usage: $scriptname [options] [make-target]
+
+Compare kernel build warnings against a baseline to detect new warnings.
+Baselines are automatically created per target and warning level.
+
+Options:
+    -s, --save-baseline     Build and save current warnings as baseline
+    -c, --check             Build and compare against baseline, error if new warnings
+    -l, --list              Build and list all warnings without comparison
+    -w, --warn=LEVEL        Set warning level (1, 2, 3, 12, 123, etc.)
+    -j, --jobs=N            Number of parallel jobs (passed to make -j)
+    -n, --no-clean          Skip cleaning before build (faster but may miss warnings)
+    -h, --help              Show this help message
+
+Examples:
+    # Initial setup - save baseline for default target
+    $scriptname --save-baseline
+
+    # After making changes - check for new warnings
+    $scriptname --check
+
+    # Use stricter warning levels (creates separate baseline)
+    $scriptname --save-baseline --warn=1
+    $scriptname --check --warn=1
+
+    # Build specific target with warning check
+    $scriptname --check drivers/dma/
+
+Exit codes:
+    0 - Success (no new warnings)
+    1 - New warnings found (when using --check)
+    2 - Build failed
+    3 - Missing baseline (when using --check)
+
+Note: By default, the script cleans the build target before building to ensure
+      all warnings are captured (cached object files won't emit warnings). This
+      can be skipped with --no-clean for faster builds, but may miss warnings
+      from unchanged files. CONFIG_WERROR is automatically disabled to capture
+      warnings without failing the build.
+EOF
+}
+
+# Parse command line options
+GetOptions(
+	'save-baseline|s' => \$save_baseline,
+	'check|c' => \$check_warnings,
+	'list|l' => \$list_only,
+	'warn|w=s' => \$warn_level,
+	'jobs|j=s' => \$jobs,
+	'no-clean|n' => \$no_clean,
+	'help|h' => \$help,
+) or die("Error in command line arguments\n");
+
+if ($help) {
+	show_usage();
+	exit(0);
+}
+
+# Handle build target
+if (@ARGV) {
+	$build_target = join(' ', @ARGV);
+}
+
+# Add warning flags
+my $warn_flags = "";
+if ($warn_level) {
+	$warn_flags .= "W=$warn_level";
+}
+
+# Generate baseline filename based on target and flags (kernel-style)
+# Store warnings alongside the build artifacts, like .cmd files
+sub get_baseline_filename {
+	my ($target, $flags) = @_;
+
+	# Split target into directory and basename
+	my $dir = dirname($target);
+	my $base = basename($target);
+
+	# Add warning level suffix if present
+	my $suffix = "";
+	if ($flags) {
+		$suffix = ".$flags";
+		$suffix =~ s/=//g;  # W=1 becomes .W1
+	}
+
+	# For targets in root directory (all, vmlinux, bzImage, etc.)
+	if ($dir eq ".") {
+		return "$objtree/.$base$suffix.warnings";
+	}
+
+	# For targets in subdirectories, store alongside like .cmd files
+	return "$objtree/$dir/.$base$suffix.warnings";
+}
+
+my $baseline_file = get_baseline_filename($build_target, $warn_flags);
+
+# Construct make command
+my $make_cmd = "make";
+$make_cmd .= " -j$jobs" if $jobs;
+
+# Disable CONFIG_WERROR to allow warnings without failing the build
+$make_cmd .= " KCFLAGS=-Wno-error";
+
+if ($warn_flags) {
+	$make_cmd .= " $warn_flags";
+}
+
+$make_cmd .= " $build_target";
+
+# Function to extract and normalize warnings from build output
+sub extract_warnings {
+	my ($output) = @_;
+	my @warnings;
+	my %seen;
+
+	foreach my $line (split(/\n/, $output)) {
+		# Match common warning/error patterns with line numbers
+		# Examples:
+		#   path/to/file.c:123:45: warning: something
+		#   path/to/file.c:123: warning: something
+		#   WARNING: at the start of line (modpost, etc.)
+		#   path/to/file.c:123:45: error: something (compilation errors)
+		my $is_warning = 0;
+
+		# Format: file.c:123:45: warning: or file.c:123: warning:
+		if ($line =~ /:\d+:(?:\d+:)?\s*warning:/) {
+			$is_warning = 1;
+		}
+		# Format: WARNING: at start of line (kernel build system warnings)
+		elsif ($line =~ /^WARNING:/) {
+			$is_warning = 1;
+		}
+		# Format: file.c:123:45: error: (compilation errors)
+		elsif ($line =~ /:\d+:(?:\d+:)?\s*error:/) {
+			$is_warning = 1;
+		}
+
+		next unless $is_warning;
+
+		# Normalize the warning message
+		my $normalized = $line;
+		$normalized =~ s/^\s+|\s+$//g;  # Trim whitespace
+
+		# Skip duplicate warnings
+		next if exists $seen{$normalized};
+		$seen{$normalized} = 1;
+
+		push @warnings, $normalized;
+	}
+
+	return @warnings;
+}
+
+# Function to run build and capture warnings
+sub build_and_capture {
+	# Clean the target first unless --no-clean is specified
+	unless ($no_clean) {
+		print "Cleaning build artifacts...\n";
+		`make clean 2>&1`;
+	}
+
+	print "Building kernel with: $make_cmd\n";
+
+	my $output = "";
+	my $exit_code;
+
+	# Capture output without displaying
+	$output = `$make_cmd 2>&1`;
+	$exit_code = $? >> 8;
+
+	return ($output, $exit_code);
+}
+
+# Function to save warnings to file with metadata
+sub save_warnings {
+	my ($file, $target, $wflags, @warnings) = @_;
+
+	open(my $fh, '>', $file) or die "Cannot write to $file: $!\n";
+
+	# Write metadata as comments
+	print $fh "# BUILD_TARGET=$target\n";
+	print $fh "# WARN_FLAGS=$wflags\n";
+	print $fh "#\n";
+
+	foreach my $warning (sort @warnings) {
+		print $fh "$warning\n";
+	}
+	close($fh);
+}
+
+# Function to load warnings from file and extract metadata
+sub load_warnings {
+	my ($file) = @_;
+	my @warnings;
+	my %metadata;
+
+	return (\@warnings, \%metadata) unless -f $file;
+
+	open(my $fh, '<', $file) or die "Cannot read from $file: $!\n";
+	while (my $line = <$fh>) {
+		chomp($line);
+
+		# Parse metadata comments
+		if ($line =~ /^# BUILD_TARGET=(.*)$/) {
+			$metadata{target} = $1;
+		} elsif ($line =~ /^# WARN_FLAGS=(.*)$/) {
+			$metadata{warn_flags} = $1;
+		} elsif ($line =~ /^#/) {
+			# Skip other comments
+			next;
+		} elsif ($line) {
+			# Regular warning line
+			push @warnings, $line;
+		}
+	}
+	close($fh);
+
+	return (\@warnings, \%metadata);
+}
+
+# Function to compare warnings
+sub compare_warnings {
+	my ($baseline_ref, $current_ref) = @_;
+	my %baseline = map { $_ => 1 } @$baseline_ref;
+	my @new_warnings;
+	my @fixed_warnings;
+
+	# Find new warnings
+	foreach my $warning (@$current_ref) {
+		push @new_warnings, $warning unless exists $baseline{$warning};
+	}
+
+	# Find fixed warnings
+	my %current = map { $_ => 1 } @$current_ref;
+	foreach my $warning (@$baseline_ref) {
+		push @fixed_warnings, $warning unless exists $current{$warning};
+	}
+
+	return (\@new_warnings, \@fixed_warnings);
+}
+
+# Main logic
+if ($save_baseline) {
+	print "Building and saving baseline...\n";
+	my ($output, $exit_code) = build_and_capture();
+
+	if ($exit_code != 0) {
+		print STDERR "Build failed with exit code $exit_code\n";
+		exit(2);
+	}
+
+	my @warnings = extract_warnings($output);
+	save_warnings($baseline_file, $build_target, $warn_flags, @warnings);
+
+	printf("Baseline saved to %s (%d warnings)\n", $baseline_file, scalar(@warnings));
+	printf("  Target: %s\n", $build_target);
+	printf("  Flags:  %s\n", $warn_flags || "none");
+	exit(0);
+}
+elsif ($check_warnings) {
+	unless (-f $baseline_file) {
+		print STDERR "Error: Baseline file not found: $baseline_file\n";
+		print STDERR "Run with --save-baseline first to create a baseline\n";
+		exit(3);
+	}
+
+	print "Building and checking for new warnings...\n";
+	my ($output, $exit_code) = build_and_capture();
+
+	if ($exit_code != 0) {
+		print STDERR "Build failed with exit code $exit_code\n";
+		exit(2);
+	}
+
+	my ($baseline_ref, $baseline_meta) = load_warnings($baseline_file);
+	my @current = extract_warnings($output);
+
+	my ($new_warnings_ref, $fixed_warnings_ref) = compare_warnings($baseline_ref, \@current);
+
+	printf("\nWarning summary:\n");
+	printf("  Baseline warnings: %d\n", scalar(@$baseline_ref));
+	printf("  Current warnings:  %d\n", scalar(@current));
+	printf("  New warnings:      %d\n", scalar(@$new_warnings_ref));
+	printf("  Fixed warnings:    %d\n", scalar(@$fixed_warnings_ref));
+
+	if (@$fixed_warnings_ref) {
+		print "\nFixed warnings:\n";
+		foreach my $warning (@$fixed_warnings_ref) {
+			print "  [-] $warning\n";
+		}
+	}
+
+	if (@$new_warnings_ref) {
+		print "\nNew warnings introduced:\n";
+		foreach my $warning (@$new_warnings_ref) {
+			print "  [+] $warning\n";
+		}
+		print "\nERROR: New warnings detected!\n";
+		exit(1);
+	}
+
+	print "\nSUCCESS: No new warnings introduced\n";
+	exit(0);
+}
+elsif ($list_only) {
+	print "Building and listing warnings...\n";
+	my ($output, $exit_code) = build_and_capture();
+
+	if ($exit_code != 0) {
+		print STDERR "Build failed with exit code $exit_code\n";
+		exit(2);
+	}
+
+	my @warnings = extract_warnings($output);
+
+	printf("\nTotal warnings: %d\n\n", scalar(@warnings));
+	foreach my $warning (@warnings) {
+		print "$warning\n";
+	}
+
+	exit(0);
+}
+else {
+	print STDERR "Error: Must specify one of --save-baseline, --check, or --list\n\n";
+	show_usage();
+	exit(1);
+}
-- 
2.51.0


