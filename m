Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD2B66B66B
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 08:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfGQGS0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 02:18:26 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:62956 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfGQGSZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:18:25 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x6H6I5Ok009435;
        Wed, 17 Jul 2019 15:18:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6H6I5Ok009435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563344291;
        bh=QrjfI2RnWCz+plNxdKJS2TlPRyyWoZjdUiaEuuPNZUY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RhOMv6RXHKjoConPQ2URQSQTdnZRFSrzvfvIf1DK4Rg0PVzh8dciowkQj8RbrsSoK
         2wBPXSQ+PSQwPz+CRMJzfpfoJqm1E8fiemM+PtpvXj8rKtaD9TkRbbOmDv2JD337LO
         OwYFGY6gHi/UdCwSy2Ns1y14LJ5ms9CHxqFWaayM6oe+eXaTkGNwMBSkbWY64wwxA5
         dXhbdtgCrhLUqSthM6jDjEhpa+6SBfwQvRgDRTNbnC3JnG77VW3DaBdBjIePmTzq1q
         ShBwXCyUmSWNC6H3a+6v2KIvVTIs+nEr56zsusIL24qq3XeOUr1EKf372QIxf8HtOT
         gIgiSpL7geW6Q==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/12] kbuild: export_report: read modules.order instead of .tmp_versions/*.mod
Date:   Wed, 17 Jul 2019 15:17:56 +0900
Message-Id: <20190717061800.10018-9-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190717061800.10018-1-yamada.masahiro@socionext.com>
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Towards the goal of removing MODVERDIR aka .tmp_versions, read out
modules.order to get the list of modules to be processed. This is
simpler than parsing *.mod files in .tmp_versions.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - New patch

Changes in v2: None

 scripts/export_report.pl | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/export_report.pl b/scripts/export_report.pl
index 0f604f62f067..7d3030d03a25 100755
--- a/scripts/export_report.pl
+++ b/scripts/export_report.pl
@@ -52,13 +52,12 @@ sub usage {
 
 sub collectcfiles {
     my @file;
-    while (<.tmp_versions/*.mod>) {
-	open my $fh, '<', $_ or die "cannot open $_: $!\n";
-	push (@file,
-	      grep s/\.ko/.mod.c/,	# change the suffix
-	      grep m/.+\.ko/,		# find the .ko path
-	      <$fh>);			# lines in opened file
+    open my $fh, '< modules.order' or die "cannot open modules.order: $!\n";
+    while (<$fh>) {
+	s/\.ko$/.mod.c/;
+	push (@file, $_)
     }
+    close($fh);
     chomp @file;
     return @file;
 }
-- 
2.17.1

