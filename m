Return-Path: <linux-kbuild+bounces-4383-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2D79B54BC
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 22:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BB6F28412F
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 21:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55BC2076A8;
	Tue, 29 Oct 2024 21:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S6jF3v8Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BFF20402B
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Oct 2024 21:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730236342; cv=none; b=gxpMiDv14ylaYlxFYLkuZk9KxKDM9Yn7/BWx3v5Fgc2ZzH9IVHIKZUpjF2BVeaHW6NYxpaeTonZauaqLEL7qfeLHlcrVZVmU9xN0zQ/2xy23ahvka2C5WD4w7X8VV7hMWwpcn56gw7sPB1bKkVZbqn29G50lZ0je8aD3ATN/2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730236342; c=relaxed/simple;
	bh=jsJdW77K/F27zI3fAtOfpDr+t87mADEpuKcLTwvGZKs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FOkMES3VRgV4gPgP7Cpk8CVyqZy3xbGmwZWMxrgaCf8LTVQA1PWX9N4Agx8AxpzvosGLmIW3zwHL9USMDVjwGTFh58Lt8iEvc6Kb0+F3QVsVVjH84eceCVupk6NBWjrM6+wScq3YgTQHKTYiiD//Xw5dHdrYUjewt9LusaFJLg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S6jF3v8Y; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e315a5b199so108371027b3.2
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Oct 2024 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730236339; x=1730841139; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FPhiy+s+yCTJqEn5/E+L2J/2UCA8LWK4fta0QlMSnic=;
        b=S6jF3v8YEcMZ5gXCcxeRW8unqI66219XGIvYrhVMnddT8TrTIZNRhYkU09G9v/fX7n
         NxrSnAa3fImv4MY6OiVogfmigUYTZlq31iliH/D7+9PBIHaUgdUwJiKreMuB6ODvTEZX
         AB36KpMdmRH2RAzr7cSGmin0Vwj7VknHw7Q+RckzwiyO59+Bw5WNS9g2rF0cd0MP1YUl
         O5IZ1dzQT5RI/IeRfX4jKoG6GdTlScq6W80xjzDY/9+oxa4aEBlPf97VsJukdU6PfCuv
         C/jbAATQBbckT1oHh+aGefO7/cajRRUjVkPUrAnG9NznFUxPu00V8NnCnPITHRq+UtMh
         2BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730236339; x=1730841139;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPhiy+s+yCTJqEn5/E+L2J/2UCA8LWK4fta0QlMSnic=;
        b=qOQvqiZpHAQgI5WVe8CI7gm/PuO/XMWy+zcmPqS/CkLoB6qKZSq/i8oI/+xoecbzLh
         ImR3ql9DudiJi9JTkdDCtnEN2yK4Yvjt9E/Jln0g6jhXXDug3wzMEu1P/MxJlEaRwCB6
         9l2dPRed3vTItIaqTF3V7qZUF0UiX1fG669EsOvqwKJ4G3xUpw/unbiaf5JvOu1GUWUp
         AWzxE2FROVD8/VNvxljLuF/QaxpFVwleBeXj4uQFCiZBPR1h6qB9eSEslSwmUD/DMpxJ
         jC3YYc6Bs4KO5xtf/tdxU+vz8tvpNTaz76LVHXtB/mwwa3WKwqr1an+0MrvprPW+5wO6
         uOVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/+1dY6eQzDSEShNKvcgdAktd3LKytuCGNpquSGG3w+K3L/+t8pJYywuHA/f4rQS7pibZZ32KBTzT2ObU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAnakk8ulUdwdhK90TQkgceuRfbUxCNbgD1bsG0FkN7IxMBWQS
	+VuLXN3yeMmhw+MLtYHKOZCB/xdisOYu8axlQsKNdYxTuiMNxgWlvwWZUXb5gwL+F61lu4LI+Dh
	8u9nSMw==
X-Google-Smtp-Source: AGHT+IF/0bGeYrUGkOHkdN/vXLCX587JqgdQHIHT6TdmwV/CsfY5GUUMX2vNyykt2EABfkhMtirshhyO8pXT
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:a8c4:0:b0:6e3:2693:ca6b with SMTP id
 00721157ae682-6e9d897c43cmr3222487b3.2.1730236339381; Tue, 29 Oct 2024
 14:12:19 -0700 (PDT)
Date: Tue, 29 Oct 2024 21:12:17 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALBPIWcC/x3MOwqAMBCE4avI1gY0vtCriIXGURfUhI0EQby7w
 Wr4ivkf8hCGpy55SBDYsz0j8jQhs43nCsVzNOlMl3mmWyU4bIDC7axcUf+4XTVFXZnajMUEUHw 7wcL3X+6H9/0AfvrzB2kAAAA=
X-Change-Id: 20241029-remove-export-report-pl-7365c6ca3bee
X-Mailer: b4 0.15-dev
Message-ID: <20241029-remove-export-report-pl-v1-1-9cd6ccf93493@google.com>
Subject: [PATCH] scripts: Remove export_report.pl
From: Matthew Maurer <mmaurer@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This script has been broken for 5 years with no user complaints.

It first had its .mod.c parser broken in commit a3d0cb04f7df ("modpost:
use __section in the output to *.mod.c"). Later, it had its object file
enumeration broken in commit f65a486821cf ("kbuild: change module.order
to list *.o instead of *.ko"). Both of these changes sat for years with
no reports.

Rather than reviving this script as we make further changes to `.mod.c`,
this patch gets rid of it because it is clearly unused.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/export_report.pl | 186 -----------------------------------------------
 1 file changed, 186 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
deleted file mode 100755
index feb3d5542a62d90b7af4f041d98a3c4b5ac386c0..0000000000000000000000000000000000000000
--- a/scripts/export_report.pl
+++ /dev/null
@@ -1,186 +0,0 @@
-#!/usr/bin/env perl
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# (C) Copyright IBM Corporation 2006.
-#	Author : Ram Pai (linuxram@us.ibm.com)
-#
-# Usage: export_report.pl -k Module.symvers [-o report_file ] -f *.mod.c
-#
-
-use warnings;
-use Getopt::Std;
-use strict;
-
-sub numerically {
-	my $no1 = (split /\s+/, $a)[1];
-	my $no2 = (split /\s+/, $b)[1];
-	return $no1 <=> $no2;
-}
-
-sub alphabetically {
-	my ($module1, $value1) = @{$a};
-	my ($module2, $value2) = @{$b};
-	return $value1 <=> $value2 || $module2 cmp $module1;
-}
-
-sub print_depends_on {
-	my ($href) = @_;
-	print "\n";
-	for my $mod (sort keys %$href) {
-		my $list = $href->{$mod};
-		print "\t$mod:\n";
-		foreach my $sym (sort numerically @{$list}) {
-			my ($symbol, $no) = split /\s+/, $sym;
-			printf("\t\t%-25s\n", $symbol);
-		}
-		print "\n";
-	}
-	print "\n";
-	print "~"x80 , "\n";
-}
-
-sub usage {
-        print "Usage: @_ -h -k Module.symvers  [ -o outputfile ] \n",
-	      "\t-f: treat all the non-option argument as .mod.c files. ",
-	      "Recommend using this as the last option\n",
-	      "\t-h: print detailed help\n",
-	      "\t-k: the path to Module.symvers file. By default uses ",
-	      "the file from the current directory\n",
-	      "\t-o outputfile: output the report to outputfile\n";
-	exit 0;
-}
-
-sub collectcfiles {
-    my @file;
-    open my $fh, '< modules.order' or die "cannot open modules.order: $!\n";
-    while (<$fh>) {
-	s/\.ko$/.mod.c/;
-	push (@file, $_)
-    }
-    close($fh);
-    chomp @file;
-    return @file;
-}
-
-my (%SYMBOL, %MODULE, %opt, @allcfiles);
-
-if (not getopts('hk:o:f',\%opt) or defined $opt{'h'}) {
-        usage($0);
-}
-
-if (defined $opt{'f'}) {
-	@allcfiles = @ARGV;
-} else {
-	@allcfiles = collectcfiles();
-}
-
-if (not defined $opt{'k'}) {
-	$opt{'k'} = "Module.symvers";
-}
-
-open (my $module_symvers, '<', $opt{'k'})
-    or die "Sorry, cannot open $opt{'k'}: $!\n";
-
-if (defined $opt{'o'}) {
-    open (my $out, '>', $opt{'o'})
-	or die "Sorry, cannot open $opt{'o'} $!\n";
-
-    select $out;
-}
-
-#
-# collect all the symbols and their attributes from the
-# Module.symvers file
-#
-while ( <$module_symvers> ) {
-	chomp;
-	my (undef, $symbol, $module, $gpl, $namespace) = split('\t');
-	$SYMBOL { $symbol } =  [ $module , "0" , $symbol, $gpl];
-}
-close($module_symvers);
-
-#
-# collect the usage count of each symbol.
-#
-my $modversion_warnings = 0;
-
-foreach my $thismod (@allcfiles) {
-	my $module;
-
-	unless (open ($module, '<', $thismod)) {
-		warn "Sorry, cannot open $thismod: $!\n";
-		next;
-	}
-
-	my $state=0;
-	while ( <$module> ) {
-		chomp;
-		if ($state == 0) {
-			$state = 1 if ($_ =~ /static const struct modversion_info/);
-			next;
-		}
-		if ($state == 1) {
-			$state = 2 if ($_ =~ /__attribute__\(\(section\("__versions"\)\)\)/);
-			next;
-		}
-		if ($state == 2) {
-			if ( $_ !~ /0x[0-9a-f]+,/ ) {
-				next;
-			}
-			my $sym = (split /([,"])/,)[4];
-			my ($module, $value, $symbol, $gpl) = @{$SYMBOL{$sym}};
-			$SYMBOL{ $sym } =  [ $module, $value+1, $symbol, $gpl];
-			push(@{$MODULE{$thismod}} , $sym);
-		}
-	}
-	if ($state != 2) {
-		warn "WARNING:$thismod is not built with CONFIG_MODVERSIONS enabled\n";
-		$modversion_warnings++;
-	}
-	close($module);
-}
-
-print "\tThis file reports the exported symbols usage patterns by in-tree\n",
-	"\t\t\t\tmodules\n";
-printf("%s\n\n\n","x"x80);
-printf("\t\t\t\tINDEX\n\n\n");
-printf("SECTION 1: Usage counts of all exported symbols\n");
-printf("SECTION 2: List of modules and the exported symbols they use\n");
-printf("%s\n\n\n","x"x80);
-printf("SECTION 1:\tThe exported symbols and their usage count\n\n");
-printf("%-25s\t%-25s\t%-5s\t%-25s\n", "Symbol", "Module", "Usage count",
-	"export type");
-
-#
-# print the list of unused exported symbols
-#
-foreach my $list (sort alphabetically values(%SYMBOL)) {
-	my ($module, $value, $symbol, $gpl) = @{$list};
-	printf("%-25s\t%-25s\t%-10s\t", $symbol, $module, $value);
-	if (defined $gpl) {
-		printf("%-25s\n",$gpl);
-	} else {
-		printf("\n");
-	}
-}
-printf("%s\n\n\n","x"x80);
-
-printf("SECTION 2:\n\tThis section reports export-symbol-usage of in-kernel
-modules. Each module lists the modules, and the symbols from that module that
-it uses.  Each listed symbol reports the number of modules using it\n");
-
-print "\nNOTE: Got $modversion_warnings CONFIG_MODVERSIONS warnings\n\n"
-    if $modversion_warnings;
-
-print "~"x80 , "\n";
-for my $thismod (sort keys %MODULE) {
-	my $list = $MODULE{$thismod};
-	my %depends;
-	$thismod =~ s/\.mod\.c/.ko/;
-	print "\t\t\t$thismod\n";
-	foreach my $symbol (@{$list}) {
-		my ($module, $value, undef, $gpl) = @{$SYMBOL{$symbol}};
-		push (@{$depends{"$module"}}, "$symbol $value");
-	}
-	print_depends_on(\%depends);
-}

---
base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
change-id: 20241029-remove-export-report-pl-7365c6ca3bee

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


