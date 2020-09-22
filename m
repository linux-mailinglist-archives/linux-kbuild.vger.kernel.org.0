Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233A32747B8
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Sep 2020 19:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgIVRtt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Sep 2020 13:49:49 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:41481 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgIVRtt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Sep 2020 13:49:49 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 08MHn0Nm019599;
        Wed, 23 Sep 2020 02:49:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 08MHn0Nm019599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600796940;
        bh=7r+QVIfUJ3sIljVKmpOn/byhmJJPSCK7+h4sbICb0vM=;
        h=From:To:Cc:Subject:Date:From;
        b=YvuOzGATOytrS/3cxAJUelQ5Iz0Ou2Ff502Ghp8v/LeqMpxsf4Zbxlyt71OUi3fn7
         8IBaTO+kQsgCHD/J0a8SiRyCDnwYZKE5A6C5M/l8JwnWAHirUJtrTHDL7WIISU+C0C
         XYdZ8Cn9oHExl2VAP+a7vioGtqBFb25XF2pmB+Qo9IYvnNO93p7JcYl0PYNnBEL9b0
         lpADxx8FyJqxqvXb9mnXzJOx0zhZo55vy3/Roqy4sHv22K+N7Y31xB/71wW0nC+GsJ
         VjsNwG4gyNI3AG1F3I5GQkbYhkobV1yvT/fkF1ZVc/NiVDARLzzQwYNT8dkVNK/TH/
         UFxpNmM1ID/Rw==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/kallsyms: skip ppc compiler stub *.long_branch.* / *.plt_branch.*
Date:   Wed, 23 Sep 2020 02:48:56 +0900
Message-Id: <20200922174856.2001167-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

PowerPC allmodconfig often fails to build as follows:

    LD      .tmp_vmlinux.kallsyms1
    KSYM    .tmp_vmlinux.kallsyms1.o
    LD      .tmp_vmlinux.kallsyms2
    KSYM    .tmp_vmlinux.kallsyms2.o
    LD      .tmp_vmlinux.kallsyms3
    KSYM    .tmp_vmlinux.kallsyms3.o
    LD      vmlinux
    SORTTAB vmlinux
    SYSMAP  System.map
  Inconsistent kallsyms data
  Try make KALLSYMS_EXTRA_PASS=1 as a workaround
  make[2]: *** [../Makefile:1162: vmlinux] Error 1

Setting KALLSYMS_EXTRA_PASS=1 does not help.

This is caused by the compiler inserting stubs such as *.long_branch.*
and *.plt_branch.*

  $ powerpc-linux-nm -n .tmp_vmlinux.kallsyms2
   [ snip ]
  c00000000210c000 T __init_begin
  c00000000210c000 T _sinittext
  c00000000210c010 t 00000075.plt_branch.da9:19
  c00000000210c020 t 00000075.plt_branch.1677:5
  c00000000210c030 t 00000075.long_branch.memmove
  c00000000210c034 t 00000075.plt_branch.9e0:5
  c00000000210c044 t 00000075.plt_branch.free_initrd_mem
    ...

Actually, the problem mentioned in scripts/link-vmlinux.sh comments;
"In theory it's possible this results in even more stubs, but unlikely"
is happening here, and ends up with another kallsyms step required.

scripts/kallsyms.c already ignores various compiler stubs. Let's do
similar to make kallsysms for PowerPC always succeed in 2 steps.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 0096cd965332..306b9b38150f 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -120,17 +120,25 @@ static bool is_ignored_symbol(const char *name, char type)
 		NULL
 	};
 
+	static const char * const ignored_matches[] = {
+		".long_branch.",	/* ppc stub */
+		".plt_branch.",		/* ppc stub */
+		NULL
+	};
+
 	const char * const *p;
 
-	/* Exclude symbols which vary between passes. */
+	/* ignore symbol names that exactly match to a particular string. */
 	for (p = ignored_symbols; *p; p++)
 		if (!strcmp(name, *p))
 			return true;
 
+	/* ignore symbol names that start with a particular string. */
 	for (p = ignored_prefixes; *p; p++)
 		if (!strncmp(name, *p, strlen(*p)))
 			return true;
 
+	/* ignore symbol names that end with a particular string. */
 	for (p = ignored_suffixes; *p; p++) {
 		int l = strlen(name) - strlen(*p);
 
@@ -138,6 +146,12 @@ static bool is_ignored_symbol(const char *name, char type)
 			return true;
 	}
 
+	/* ignore symbol names that contain a particular string. */
+	for (p = ignored_matches; *p; p++) {
+		if (strstr(name, *p))
+			return true;
+	}
+
 	if (type == 'U' || type == 'u')
 		return true;
 	/* exclude debugging symbols */
-- 
2.25.1

