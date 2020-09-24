Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC9E2775B7
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Sep 2020 17:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728425AbgIXPqL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Sep 2020 11:46:11 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42788 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgIXPqL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Sep 2020 11:46:11 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 08OFjmFE031136;
        Fri, 25 Sep 2020 00:45:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 08OFjmFE031136
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600962349;
        bh=2/84ainX+exPuFKLItFERxz7wYFsqiAakLmaR16zSEE=;
        h=From:To:Cc:Subject:Date:From;
        b=sUUURivfHeDm3Lj17zEQvc3dpnGqHwk8yYFOMfAnzwDIb4H1KuZevs0sn49a++o6x
         fiPyiRgTgnKCZrzdxkxdx65Zab+uJzzC/Gw//PF7L1DtTSg4Jb60NUPvQt3UEzTyKB
         uwzNOqmS837TGk1fJddSuNuB6YIrkndJe0Z813ch7suIULLfAUv3mYUhH91MaWMyXB
         GXudWqvvOIlauZEZwgZxVqgxlqZj34slviv49d+6w7y/UcZ/TIEB5cRlRYXztuHeSi
         fUBycW6U3WvArCaG+Gk+s1tA4ETsuGIMtoGNiK92cjiTckV46neHqiuOymzXixsBhQ
         TWIFMD1Tb9azA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: split the build log of kallsyms
Date:   Fri, 25 Sep 2020 00:45:46 +0900
Message-Id: <20200924154546.275123-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, the build log shows KSYM + object name.

Precisely speaking, kallsyms generates a .S file and then the compiler
compiles it into a .o file. Split the build log into two.

[Before]

  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
  KSYM    .tmp_vmlinux.kallsyms1.o
  LD      .tmp_vmlinux.kallsyms2
  KSYM    .tmp_vmlinux.kallsyms2.o
  LD      vmlinux

[After]

  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.o
  LD      .tmp_vmlinux.kallsyms2
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.o
  LD      vmlinux

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/link-vmlinux.sh | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index e6e2d9e5ff48..d9bcf36a1583 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -169,10 +169,9 @@ gen_btf()
 	printf '\1' | dd of=${2} conv=notrunc bs=1 seek=16 status=none
 }
 
-# Create ${2} .o file with all symbols from the ${1} object file
+# Create ${2} .S file with all symbols from the ${1} object file
 kallsyms()
 {
-	info KSYM ${2}
 	local kallsymopt;
 
 	if [ -n "${CONFIG_KALLSYMS_ALL}" ]; then
@@ -187,13 +186,8 @@ kallsyms()
 		kallsymopt="${kallsymopt} --base-relative"
 	fi
 
-	local aflags="${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL}               \
-		      ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS}"
-
-	local afile="`basename ${2} .o`.S"
-
-	${NM} -n ${1} | scripts/kallsyms ${kallsymopt} > ${afile}
-	${CC} ${aflags} -c -o ${2} ${afile}
+	info KSYMS ${2}
+	${NM} -n ${1} | scripts/kallsyms ${kallsymopt} > ${2}
 }
 
 # Perform one step in kallsyms generation, including temporary linking of
@@ -203,9 +197,15 @@ kallsyms_step()
 	kallsymso_prev=${kallsymso}
 	kallsyms_vmlinux=.tmp_vmlinux.kallsyms${1}
 	kallsymso=${kallsyms_vmlinux}.o
+	kallsyms_S=${kallsyms_vmlinux}.S
 
 	vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinux_bin_o}
-	kallsyms ${kallsyms_vmlinux} ${kallsymso}
+	kallsyms ${kallsyms_vmlinux} ${kallsyms_S}
+
+	info AS ${kallsyms_S}
+	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
+	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
+	      -c -o ${kallsymso} ${kallsyms_S}
 }
 
 # Create map file with all symbols from ${1}
-- 
2.25.1

