Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BDB304D03
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 00:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731434AbhAZXBA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:01:00 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:18627 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730380AbhAZTRG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 14:17:06 -0500
Received: from localhost.localdomain (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 10QJFlBF030360;
        Wed, 27 Jan 2021 04:15:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 10QJFlBF030360
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611688547;
        bh=sQhsCQI2eSZz/5i9fu05fR07HjBcNUyDmzcgAe3KfDI=;
        h=From:To:Cc:Subject:Date:From;
        b=aUAlmyfQRQxdRNlNCeRb0FVMb1DaNVxc/m1EHFDOBX1KdYCEHycs4RsvZgVZ7WBYK
         oSfRlfesf0hkWwZawu0yN3GIVkfF3+E2NQtrIQJTWAf0Z0TCvhvo7FaAXeKLPY1EBu
         n2vx+Lj6Q+fxuRfV2rEYLqy+pvNyi4jWAIGUBKnkS+E3peJBlq3Cw09osHyXaCJDmx
         geDB16BdSH2wM0uraNNZwzifbiWuqm18eN6MYHCdVGOrz3uzILpKdekyLtlVUU+DWT
         x1i1R171tOn7E/oKjbDFCPNvn2eC1X+caU2CFbBMitTill3m1ZqLycFj0YWB2O+RMq
         nDFLYYii6YrNg==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Joe Perches <joe@perches.com>, Christoph Jaeger <cj@linux.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andy Whitcroft <apw@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "checkpatch: add check for keyword 'boolean' in Kconfig definitions"
Date:   Wed, 27 Jan 2021 04:15:40 +0900
Message-Id: <20210126191541.210168-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 327953e9af6c59ad111b28359e59e3ec0cbd71b6.

You cannot use 'boolean' since commit b92d804a5179 ("kconfig: drop
'boolean' keyword").

This check is no longer needed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/checkpatch.pl | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 92e888ed939f..1afe3af1cc09 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3390,13 +3390,6 @@ sub process {
 			}
 		}
 
-# discourage the use of boolean for type definition attributes of Kconfig options
-		if ($realfile =~ /Kconfig/ &&
-		    $line =~ /^\+\s*\bboolean\b/) {
-			WARN("CONFIG_TYPE_BOOLEAN",
-			     "Use of boolean is deprecated, please use bool instead.\n" . $herecurr);
-		}
-
 		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
 		    ($line =~ /\+(EXTRA_[A-Z]+FLAGS).*/)) {
 			my $flag = $1;
-- 
2.27.0

