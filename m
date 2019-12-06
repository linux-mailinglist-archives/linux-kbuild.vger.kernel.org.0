Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA0B71150C0
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Dec 2019 14:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfLFNDd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Dec 2019 08:03:33 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:45594 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfLFNDd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Dec 2019 08:03:33 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id xB6D34Go005873;
        Fri, 6 Dec 2019 22:03:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xB6D34Go005873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1575637385;
        bh=4stJbos6zT3j7PistBFOOfUOCop0dkMXYxlz1QqamUc=;
        h=From:To:Cc:Subject:Date:From;
        b=BCHpRiAb+2t4Es1WaG6qGk3K48C3sN+SD+ODGXTZULJC6Gw39AoSRWGH9ykwf6pqs
         WE/pXz/h0ARUV1EfwaXvgVmraNMSUt7fo4hAAzip51w0CJv98iSZR9DIHV8U3hhJgv
         Wc34hkgeDO798FGAFfZXkO7yBa+W6QISIf4HpZigtFkue+xUYCyB88p5ecNoo77Dng
         3n4Q/ZpdDQ3+7DDM6ESiPgh+rzpPcdje3oyi3K4PmLnDyBK7YSudy3XMiqoz2VrBXZ
         AVBOg/uc2M7lyrmn/GPuFSvjqCBK9Ag8txJqTgv1fqejxt3OpltaLgwUEm2FlrwMoy
         7hQIzVZTOdXNA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mkcompile_h: git rid of UTS_TRUNCATE from LINUX_COMPILE_{BY,HOST}
Date:   Fri,  6 Dec 2019 22:03:01 +0900
Message-Id: <20191206130302.11473-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

UTS_VERSION is set to struct uts_namespace, hence a too long string
should be truncated so it fits in 64 characters.

On the other hand, LINUX_COMPILE_BY/HOST are not set to uts_namespace.
They are just used in the banners, which do not have specific length
limitation.

I dug into the git history, but I could not find the reason why
these two strings must fit in 64 characters. Remove them.

Now that UTS_VERSION is the only user of UTS_TRUNCATE, I squashed it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mkcompile_h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index d1d757c6edf4..3097fec1756a 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -55,12 +55,10 @@ CONFIG_FLAGS=""
 if [ -n "$SMP" ] ; then CONFIG_FLAGS="SMP"; fi
 if [ -n "$PREEMPT" ] ; then CONFIG_FLAGS="$CONFIG_FLAGS PREEMPT"; fi
 if [ -n "$PREEMPT_RT" ] ; then CONFIG_FLAGS="$CONFIG_FLAGS PREEMPT_RT"; fi
-UTS_VERSION="$UTS_VERSION $CONFIG_FLAGS $TIMESTAMP"
 
 # Truncate to maximum length
-
 UTS_LEN=64
-UTS_TRUNCATE="cut -b -$UTS_LEN"
+UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
 
 # Generate a temporary compile.h
 
@@ -69,10 +67,10 @@ UTS_TRUNCATE="cut -b -$UTS_LEN"
 
   echo \#define UTS_MACHINE \"$ARCH\"
 
-  echo \#define UTS_VERSION \"`echo $UTS_VERSION | $UTS_TRUNCATE`\"
+  echo \#define UTS_VERSION \"$UTS_VERSION\"
 
-  echo \#define LINUX_COMPILE_BY \"`echo $LINUX_COMPILE_BY | $UTS_TRUNCATE`\"
-  echo \#define LINUX_COMPILE_HOST \"`echo $LINUX_COMPILE_HOST | $UTS_TRUNCATE`\"
+  echo \#define LINUX_COMPILE_BY \"$LINUX_COMPILE_BY\"
+  echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"
 
   echo \#define LINUX_COMPILER \"`$CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//'`\"
 } > .tmpcompile
-- 
2.17.1

