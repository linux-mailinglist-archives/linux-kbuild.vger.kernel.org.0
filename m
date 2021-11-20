Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6ABD457FA6
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Nov 2021 17:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhKTQ4q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 20 Nov 2021 11:56:46 -0500
Received: from sonic309-21.consmr.mail.gq1.yahoo.com ([98.137.65.147]:37707
        "EHLO sonic309-21.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230507AbhKTQ4p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Nov 2021 11:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1637427220; bh=XhUUxjuDvptKLJmrBs1uaon9Jq/bsYpRu4clgNCUXf8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=l0FwT52BIKpqDLH4QhvJ8k2VYG3coeeoRRl41WebyZJI0unkYWCAZkw9NCMUwJ9IJVjczTXYbc1sbrjXtsW2avEwMj+EFfLQdslxPYZZDOSqf4iifMBh6KhOCPTgOVQforUNG+SOU1jQLg8hdsvj0XwN6mKWDgZ88VMAj7eRWUz4J7RIeEB9JAtLLyaDJt+c/i9wtkRwaTaeN/9d2Sk4+qJlpZnrWwyF7t0VJJSo+lZPRDjzJ33bwWVveHd2O5yhaRAQMVPrUhDefcGIHgQeAMqUf8dalDsiYRcWDHf5FL2DnCZSWABV7SEdyIxbYp8unBdWTfFMoaoMG+Uhpaqr3g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1637427220; bh=fi63ap3v/Awv027m64D8EfFCe9wJJgP0fR4dzkQ9oT4=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ePaj4YDk8iQuA0+4zVzv0X+6pfvYs1FRjUWu+Ng0priKmtwcD/NAZR/EG6Xp2yKu4mpmdM79V84g5QyUWHww65zZVBiM5pJ3iElR/B6sWgmokbGRCRa5feE4rndIpfvBlUfBma5CcDbccdWO9GIXEtEJUAVM+jLwmgrZOalHFCkuMzYR/lbtX0fkpc5kwC+cH2glxTExDS9Ajy7hElSvZU8Kbkrf+Z9tq8dk3hE/noJ0A8L7/ETivOqB3iZ/NzwVTmeW2odXI6X9ymv+Jj+Q+HdUw09S8R90JFEh2ilOYoqUiBykyEIGxLxf/8SvVrpdsIxv68aphV7fDMPnKx+qxA==
X-YMail-OSG: cE.pTvoVM1maq4YbuoTo.WL9qf78KqPigDr89kRYynb1Oc.3XiVp.KL2bpoHX8u
 8mt.qVDLEv_I3tJflLVcIzM9RBs2kQ9oaY0p_iCEDyPAZJ8vTVwiFfny39XV59kLD734l7GiaZVp
 d2ZljDgk0B6U7hUR1ZzXGMhZxLFO6lzWSOA0nJYTYqcdh0HHw4nxKYB.Uwc0VLiiuMiatvOfpQYd
 2hJhyXzBYEcaPxRDG8Xpw_IR_eTIMYuOBwAt6vluK9UGB_HueWrqZxwXw_relwmyjWcUBU5rFabd
 N33Il3F0SIgj4014TaX_yIdcPmpMHY1daBbFD53__5BO9J7vP0hSDbmpMRp9NmX74V7IvcGdmeME
 lT6WpjPNyGAEpwPHkK9WGDfcBPzgs.xpR2htVoqmI7OItpCc68t7wNEQqt6If5BYQO7Z6DQvpMux
 onFEPtjE73U1yJnkyQrpP1.OoQLFH30P2EjiDds6qnwf9KFjHQbftwwpXQ467gFhZeVDrng06.zE
 c99tZAUtEtc2VYK8JBr1iIXCVvp23FPEsLpKXkXV4LpEgP7lSFcxPqfUODx34t3dw0jOiklGoyRi
 .HRiJIpIJTK7CmH5kfxwxGb_vPaaAxHFTHJYHmVC56ALFtVwME7dCYMktvt4rhI0Kt19vpe5EMkT
 1wjhz0GTuHSR6p2OfkIvgAtBIdxtq.pNC4oePwCnWspsYC.YC_WqOnBat1IclazG_pIXLIGQjB0U
 85cYw7_AV60tRQ2aVTreAd1p_dmp4hBQ3fxT6sK7rKW8XaoKGl1exox87hq4xjiHx3l1WXFXVMGW
 qWE3WTMKgfXoM34jM2bTbiLfBYSLVkk4f7Gkacs6w75jOzv9PrPXUyd96.yw5jm2JkWNtul16026
 7WThCoeigzvQHjomkzsFY4rU_I_a.fkwKoMHAMPVw5lruOE_XLF2QmYtdIH18d1DvRMiyeDCEzND
 HOfOAIliaELkll6VgO6GhohxJ2CfL4QHogL9OzqAAq8ym2gNkLbc0YmBfGP9eNOmx2PAr.kmV1_m
 .vCHcTdWpjr4oZ3o2AdrIMuHvSmKtMAwu.ax1wiQbjq29UehWYj1kia25x5PNzW8B1FP.XiQPFDo
 TzkjrF0Ea1aHgJSbTWX4f242AUfVkaD5fphMDb49AiQVbaW7799DSWGVhG8uHzEBPW8GUV5BYXW3
 JCYCyNGYhDQQUxV.ypS3UvCDpxysCLiZsH0tlvQYhGLngKCC8eWYW8Fy1VPQIwlqAa1s7mL5po65
 CbxzZGfqsmt_J4Kd5wcabEuD0xz8IIPtVLCtXc8XCNWvk7MC1EKRtNTaCcpKosnyxbNPP3G8cnTv
 dQDgJRf.pZLBDg5m3xv5k8NOlhuImK_hmH4K1e1OMRalkoymtH8e86mqH0qrg5MGRLpF9uzPlCL9
 nF1IE3buWF7vviySUNJGSnp_pGkn7QI9PzhIslQtzpldKpOax3f0KTRYPGAZEUjwCrmjettiae_d
 3NGP8xRK2CGaZggGLDDNvUtrSSUkBJ.uiQpbveoWMhcZMBWfFouwXLqeDx9.RVUJzVZi31cIYQUr
 X8zXewWr81YvHS1wrZSbXltThvKJpUiRy99wjP3krQ_q_sQYWA61l2xYex1dPMGbaRBO0aftXosd
 6SuE.rwGtTPYHAKOsMddl5y1bG6XPx6tyOmODACvsxcE_ZO13wF..CXrlhv1JDNmVPDMyagyH4Xm
 m1gkRG_LFWu3G4jjpihGcc1mxELDChHSeNZ8Nmk1acI2kWVzXuxVMIYymJ1MSAY2moa1IBBlTbyd
 D8YFtC9NIrK8eVt.cx2PHud8m3uHGYtlTpQ664Y1K.U3N3coZwKPolcIK2brxNJ7vQvUjc4iuK2k
 h9GpeJIYkQTl9MlGqnNVR.CPWHLxxLo7SV7ASAZ6e.2sG_8AhF1VSvrnxALPbJ_jgOBwAaYwrvND
 .tT.olXKem3x4m5x1SvaEvUdFujlqoYKztvVntWhdhr5Gj_akZZTqrVZ4Hh4fBU21kkiFzxHCOKE
 bz.gxM3cWpfBPHwp0BncU3UXVCtoRNui7PYA.k_LNLScBHgbluN6oNWoCVDq2.vXXa2R8WMIBZ4f
 9iV27YSELi7GD_RXgrYWaA62bgFS4592shRyyBXrfjaAQPHLbGwnS0AmE5l97v5TqlvudB2_KAMl
 KFnyUS5.zUAUBdjgYegJO1.W44N4SRsKQv19Xfq9WNnvgl7oDgCSou2DWjkVXW5Y7Rqf4zF3ZHei
 ceV.hQvKs_IuxKzxezfQlxQJALBfh4QAe7Gh3cbJl4NZuQyhg6nGWXOzPOI0btS6HY.rBgQ--
X-Sonic-MF: <alex_y_xu@yahoo.ca>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.gq1.yahoo.com with HTTP; Sat, 20 Nov 2021 16:53:40 +0000
Received: by kubenode512.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID bca1f4b1a1f1ece8fed7763af8799d9a;
          Sat, 20 Nov 2021 16:53:37 +0000 (UTC)
From:   "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
To:     Michael Forney <forney@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>, Ingo Molnar <mingo@kernel.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: [PATCH 1/2] kbuild: use perl instead of shell to get file size
Date:   Sat, 20 Nov 2021 11:53:48 -0500
Message-Id: <20211120165349.99908-1-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20211120165349.99908-1-alex_y_xu.ref@yahoo.ca>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This makes it easier to get the size of multiple files. Perl is already
a requirement for all builds to do header checks, so this is not an
additional dependency.
---
 arch/arm/boot/deflate_xip_data.sh | 2 +-
 arch/powerpc/boot/wrapper         | 2 +-
 scripts/Makefile.lib              | 9 ++-------
 scripts/file-size.pl              | 8 ++++++++
 scripts/file-size.sh              | 4 ----
 scripts/link-vmlinux.sh           | 4 ++--
 6 files changed, 14 insertions(+), 15 deletions(-)
 create mode 100755 scripts/file-size.pl
 delete mode 100755 scripts/file-size.sh

diff --git a/arch/arm/boot/deflate_xip_data.sh b/arch/arm/boot/deflate_xip_data.sh
index 304495c3c2c5..14cfa2babb93 100755
--- a/arch/arm/boot/deflate_xip_data.sh
+++ b/arch/arm/boot/deflate_xip_data.sh
@@ -43,7 +43,7 @@ data_start=$(($__data_loc - $base_offset))
 data_end=$(($_edata_loc - $base_offset))
 
 # Make sure data occupies the last part of the file.
-file_end=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" "$XIPIMAGE")
+file_end=$(${PERL} "${srctree}/scripts/file-size.pl" "$XIPIMAGE")
 if [ "$file_end" != "$data_end" ]; then
 	printf "end of xipImage doesn't match with _edata_loc (%#x vs %#x)\n" \
 	       $(($file_end + $base_offset)) $_edata_loc 1>&2
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 9184eda780fd..9f9ee8613432 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -380,7 +380,7 @@ vmz="$tmpdir/`basename \"$kernel\"`.$ext"
 
 # Calculate the vmlinux.strip size
 ${CROSS}objcopy $objflags "$kernel" "$vmz.$$"
-strip_size=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" "$vmz.$$")
+strip_size=$(${PERL} "${srctree}/scripts/file-size.pl" "$vmz.$$")
 
 if [ -z "$cacheit" -o ! -f "$vmz$compression" -o "$vmz$compression" -ot "$kernel" ]; then
     # recompress the image if we need to
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index d1f865b8c0cb..ca901814986a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -379,13 +379,8 @@ dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
 # Bzip2 and LZMA do not include size in file... so we have to fake that;
 # append the size as a 32-bit littleendian number as gzip does.
-size_append = printf $(shell						\
-dec_size=0;								\
-for F in $(real-prereqs); do					\
-	fsize=$$($(CONFIG_SHELL) $(srctree)/scripts/file-size.sh $$F);	\
-	dec_size=$$(expr $$dec_size + $$fsize);				\
-done;									\
-printf "%08x\n" $$dec_size |						\
+total_size = $(shell $(PERL) $(srctree)/scripts/file-size.pl $(real-prereqs))
+size_append = printf $(shell printf "%08x\n" $(total_size) |		\
 	sed 's/\(..\)/\1 /g' | {					\
 		read ch0 ch1 ch2 ch3;					\
 		for ch in $$ch3 $$ch2 $$ch1 $$ch0; do			\
diff --git a/scripts/file-size.pl b/scripts/file-size.pl
new file mode 100755
index 000000000000..170bb6d048fa
--- /dev/null
+++ b/scripts/file-size.pl
@@ -0,0 +1,8 @@
+#!/usr/bin/perl -w
+# SPDX-License-Identifier: GPL-2.0
+my $total = 0;
+foreach (@ARGV) {
+    @stat = stat $_ or die "$_: $!";
+    $total += $stat[7];
+}
+print "$total\n";
diff --git a/scripts/file-size.sh b/scripts/file-size.sh
deleted file mode 100755
index 7eb7423416b5..000000000000
--- a/scripts/file-size.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-set -- $(ls -dn "$1")
-printf '%s\n' "$5"
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 5cdd9bc5c385..c3fa38bd18ab 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -384,8 +384,8 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	kallsyms_step 2
 
 	# step 3
-	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
-	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
+	size1=$(${PERL} "${srctree}/scripts/file-size.pl" ${kallsymso_prev})
+	size2=$(${PERL} "${srctree}/scripts/file-size.pl" ${kallsymso})
 
 	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
 		kallsyms_step 3
-- 
2.34.0

