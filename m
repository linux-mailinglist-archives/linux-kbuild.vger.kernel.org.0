Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB7114DFD6
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2020 18:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbgA3RWY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jan 2020 12:22:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:53416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727247AbgA3RWX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 12:22:23 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CACF820674;
        Thu, 30 Jan 2020 17:22:22 +0000 (UTC)
Date:   Thu, 30 Jan 2020 12:22:21 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [GIT PULL] kconfig: localmodconfig: Minor clean ups to
 streamline_config.pl
Message-ID: <20200130122221.30029e32@gandalf.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Linus,

Just a couple of clean ups to streamline_config.pl


Please pull the latest localmodconfig-v5.6 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git
localmodconfig-v5.6

Tag SHA1: ae4a98169606cf4b84bce31c4ec0003da8dd60e6
Head SHA1: 37bf46aae4acb76e7cc0fb4d1131ece682f456d4


Masahiro Yamada (2):
      kconfig: localmodconfig: Remove unused $config
      kconfig: localmodconfig: Fix indentation for closing brace

----
 scripts/kconfig/streamline_config.pl | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
---------------------------
diff --git a/scripts/kconfig/streamline_config.pl
b/scripts/kconfig/streamline_config.pl index 08d76d7b3b81..e2f8504f5a2d
100755 --- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -56,8 +56,6 @@ sub dprint {
     print STDERR @_;
 }
 
-my $config = ".config";
-
 my $uname = `uname -r`;
 chomp $uname;
 
@@ -374,7 +372,7 @@ if (defined($lsmod_file)) {
 	    $lsmod = "$dir/lsmod";
 	    last;
 	}
-}
+    }
     if (!defined($lsmod)) {
 	# try just the path
 	$lsmod = "lsmod";
