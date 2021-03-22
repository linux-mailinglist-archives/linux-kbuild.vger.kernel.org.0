Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDBCA3451F0
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Mar 2021 22:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230079AbhCVVky (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Mar 2021 17:40:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:59902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230046AbhCVVke (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Mar 2021 17:40:34 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 47F49619A3;
        Mon, 22 Mar 2021 21:40:33 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.94)
        (envelope-from <rostedt@goodmis.org>)
        id 1lOSHo-001aOh-8f; Mon, 22 Mar 2021 17:40:32 -0400
Message-ID: <20210322214032.133596267@goodmis.org>
User-Agent: quilt/0.66
Date:   Mon, 22 Mar 2021 17:38:07 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Subject: [PATCH 1/2] streamline_config.pl: Make spacing consistent
References: <20210322213806.089334551@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

As Perl code tends to have 4 space indentation, but uses tabs for every 8
spaces, make that consistent in the streamline_config.pl code.
Replace all 8 spaces with a single tab.

Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
---
 scripts/kconfig/streamline_config.pl | 78 ++++++++++++++--------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index 1c78ba49ca99..059061b6daef 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -601,12 +601,12 @@ if (defined($ENV{'LMC_KEEP'})) {
 sub in_preserved_kconfigs {
     my $kconfig = $config2kfile{$_[0]};
     if (!defined($kconfig)) {
-        return 0;
+	return 0;
     }
     foreach my $excl (@preserved_kconfigs) {
-        if($kconfig =~ /^$excl/) {
-            return 1;
-        }
+	if($kconfig =~ /^$excl/) {
+	    return 1;
+	}
     }
     return 0;
 }
@@ -629,52 +629,52 @@ foreach my $line (@config_file) {
     }
 
     if (/CONFIG_MODULE_SIG_KEY="(.+)"/) {
-        my $orig_cert = $1;
-        my $default_cert = "certs/signing_key.pem";
-
-        # Check that the logic in this script still matches the one in Kconfig
-        if (!defined($depends{"MODULE_SIG_KEY"}) ||
-            $depends{"MODULE_SIG_KEY"} !~ /"\Q$default_cert\E"/) {
-            print STDERR "WARNING: MODULE_SIG_KEY assertion failure, ",
-                "update needed to ", __FILE__, " line ", __LINE__, "\n";
-            print;
-        } elsif ($orig_cert ne $default_cert && ! -f $orig_cert) {
-            print STDERR "Module signature verification enabled but ",
-                "module signing key \"$orig_cert\" not found. Resetting ",
-                "signing key to default value.\n";
-            print "CONFIG_MODULE_SIG_KEY=\"$default_cert\"\n";
-        } else {
-            print;
-        }
-        next;
+	my $orig_cert = $1;
+	my $default_cert = "certs/signing_key.pem";
+
+	# Check that the logic in this script still matches the one in Kconfig
+	if (!defined($depends{"MODULE_SIG_KEY"}) ||
+	    $depends{"MODULE_SIG_KEY"} !~ /"\Q$default_cert\E"/) {
+	    print STDERR "WARNING: MODULE_SIG_KEY assertion failure, ",
+		"update needed to ", __FILE__, " line ", __LINE__, "\n";
+	    print;
+	} elsif ($orig_cert ne $default_cert && ! -f $orig_cert) {
+	    print STDERR "Module signature verification enabled but ",
+		"module signing key \"$orig_cert\" not found. Resetting ",
+		"signing key to default value.\n";
+	    print "CONFIG_MODULE_SIG_KEY=\"$default_cert\"\n";
+	} else {
+	    print;
+	}
+	next;
     }
 
     if (/CONFIG_SYSTEM_TRUSTED_KEYS="(.+)"/) {
-        my $orig_keys = $1;
-
-        if (! -f $orig_keys) {
-            print STDERR "System keyring enabled but keys \"$orig_keys\" ",
-                "not found. Resetting keys to default value.\n";
-            print "CONFIG_SYSTEM_TRUSTED_KEYS=\"\"\n";
-        } else {
-            print;
-        }
-        next;
+	my $orig_keys = $1;
+
+	if (! -f $orig_keys) {
+	    print STDERR "System keyring enabled but keys \"$orig_keys\" ",
+		"not found. Resetting keys to default value.\n";
+	    print "CONFIG_SYSTEM_TRUSTED_KEYS=\"\"\n";
+	} else {
+	    print;
+	}
+	next;
     }
 
     if (/^(CONFIG.*)=(m|y)/) {
-        if (in_preserved_kconfigs($1)) {
-            dprint "Preserve config $1";
-            print;
-            next;
-        }
+	if (in_preserved_kconfigs($1)) {
+	    dprint "Preserve config $1";
+	    print;
+	    next;
+	}
 	if (defined($configs{$1})) {
 	    if ($localyesconfig) {
-	        $setconfigs{$1} = 'y';
+		$setconfigs{$1} = 'y';
 		print "$1=y\n";
 		next;
 	    } else {
-	        $setconfigs{$1} = $2;
+		$setconfigs{$1} = $2;
 	    }
 	} elsif ($2 eq "m") {
 	    print "# $1 is not set\n";
-- 
2.30.1


