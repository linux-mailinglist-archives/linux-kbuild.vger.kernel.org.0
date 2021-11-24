Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D117E45C8AC
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Nov 2021 16:30:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237670AbhKXPd4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Nov 2021 10:33:56 -0500
Received: from sonic314-19.consmr.mail.gq1.yahoo.com ([98.137.69.82]:44926
        "EHLO sonic314-19.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234707AbhKXPdz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Nov 2021 10:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1637767844; bh=XhUUxjuDvptKLJmrBs1uaon9Jq/bsYpRu4clgNCUXf8=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=eiATKAgsEGyDielN9rfTfID9WYxK0eNYYjrcjjvL0VpxRN9zd6u0GFxh1z31/z9M5pX6MclpZFUE9+IW4d2dp+mveKD2Hvkf6A1PIMi9db8YLkcEOInRB6W94qxMhvnw1ObckUHUgC+shNg4/suMu4HKFCj1duMZL+TqQJcN69RxgrLncu61EAdWpV9ylp9lrIWjn7KYZcgXSbDZ/JyfOWdJC4QURy3Mmo2wUW8ZSYDFfvvGy6YgntEqqJM71QToJm6iJopQje42Tj0imejWTlS+Fy2r5hXIRy2Z71BzDeNsr3mYIYCiXaKf1NiID/O/70yGlSGmZNMT7OuC9zsDoQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1637767844; bh=Y0tsWZ3NpEp7iADcCQGT0zSo6gszppwbH0BG/sb2BR/=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=daJZxq/dlzaVtJq96iSwB+YaCt8y0VCZPTFylsbvMa9DZdgC3Ko6AkXt3BxAwgU+ernbYCpB6hXKsbLo+6gZc8C6p5tDLtr1DmIiy+3UtcKvnVM2z33MZ4MyvcnPmVFujCQXvpgqpOxL1waHKmKtCrf+hOC5NM/zj6J/+iKV725ErMIEICPVJH8+BCmhPGh9E10D2Ymt2X7eCY/UtYnByLsDDDmuyVDaDxENXgm/sGs4KdBVXn6EEytqXX/DF/MRvdhOcySZWHvV+gpHhHCozIkN0fq/s5Gzwo9Cr9FCWCbArKyB5qHRJBhj5TdAdr921qFpBgDsBxwMNepAMd0P7g==
X-YMail-OSG: SUZIVvcVM1kb2NG45uhb5_akOT7iweFTm7OMdRe0o_IP_x_pDq0xgOwmkXYT80W
 ZGZH14xCQ3nl9mGrS_Tv2NM9.pMgE6s1V.ktW8LJmpifmh3oqQK3fbZ8LlrpfLEvbTS98WW.Jx55
 Oi7atP9kGf1X0vG3i4ga0A1vnZihwOGHXGyCm0if2EIvffDZ9VUgN3byoVJTAmPXOExUD_.nmLQr
 7nZxBJ6YcwX0Szn9Nj7_ubhEn8vKKoKN7qkB6XUlgRG22hMiihivwEtJL.Qoyd5NgcxQjOYxY.eB
 A1t1Sr5xwmOjGVqB9DJ7OsjTYmoULYhgW.1VwohvcUzycayTrjhoA9SNcBiZ1GqERVlrGxNfYFcN
 EZdKG7ZLieo9Mxp5gaJutpXFDou661QXu2Ph.zJu6UmlQfW2PdoY33lEjL5Pr1YJWtLgjWYV53gl
 NCZwnLaTKrukw.tPao1qOO1URbpJJ1oE7IVWXI1EZ6ATj6kElJCdAxcs0nvrjbP41mWNxJOHWWhA
 aczkSOR7kb29j35us2Hqm3kECj.hEgyEPOdoyhSjkXwA6RcB.maAJ1quEC8_pzQ0cTaqHjs.7wuP
 CsY7bOTGahPQqljthaPXpkELq9aXdjfnV1f1MWUFBPDiRs8dylO7L6LiuwAhARe2L6f6BHvSUfpQ
 xpKBXF986cgxccrOMGhVSVsJru37u2RrJXD.pHyqlZTehC1vdj9DUBEZgJILyV2_ss.sf7cU61h.
 UpqueIKaXg4Fhnezj0K44Fx9LXAgPIFBlBgY.j3BFfTswCDAyFysIMvPF3_aomEnumHaw2bfwwf7
 s4V7LIo3ZsA9tivql3VqHUeUj6y5GbSihYO_1mftLTbii.wdfq_nV1.PgnHXOf32AQ10u8b9LKvg
 QmhV4dWjIV2pipkZfixdQ_.JpcEgh82oORJq2Yi_J2CFn_o_SrWqfX772CCZPKGgNCKVjHt1aDs2
 1IDhvKhq.vg8KKRTLpthSGWhTgfxlSahgPARLbTDmjiTZko4TEH6zSXCN2HFC5FW_004szaaD8GB
 W4c1BXYB_34hgiWkKI4427G49SuSlLrGKfvtmkz.h7UiPxS6sSfCbZc8l9XEJGi0RU5sgCOjJnhu
 YJfxNilX7cE9xJ_ZrztsxCksADp5G32zcqTkZMz92KeyYgKgGq9TpIIuYq7_g9wKVmODnqMGjFkH
 ADkam4OdG.T8ytCrbToi.c1qL6cvSPw3GuGOOEQ1.O0CMPpr6RVl5ljYuKczZmrpIFePiK.CAZWh
 445jyyEYBNvsYFLlt.zLhxVGSXYttt_UERvHKGWKSUc6zTg0TErQsjQvTcoo7CkTTYQz0u5nZW6_
 nxvS2NKK9BRHS6MNTC6XrPEcFzYTLPIzEHaFZdUk8_eB_x.SljDpOLSig4nu7pLotyYBrLksfF09
 CQjLnwkxLycfsAuCwwf_ycqF9aZQyJ6UzoUBNccnVVUdOIhJHqycB.2UR.sQ7Ej1XwkW1d0AY9tI
 QBwsGYJF9DhKWr.vXfSo6vpPKX7jQHU7rJBMUBjF7eQR_F8zvHOehRRdsdh7oxdq9T6ZVoNqlBks
 Veoww_BVu7vHQlTt433sVnv0mJWTZ0N8.dl89_9kJnc3SXQbQAxjX3l7F7nzLC7z_rY7FjfEilhG
 lC7vQbs5V4daGUkmGOIgUFiCjB3omkHoX2_gygUDFhsDYWBwxcVNYWnWuLO4EByMUgoV6h34Bsmz
 zhjxAAKmwUTvPqESVSSb1zIBj8VMQxbL1bdmBGOEmx_P9b9OFSI3NZ.6xp9Lwnejfy1KI_scQ.eJ
 _Rz0udSknxzi1Z8Ua1DcaaO0JseuOy5H3navvAQXutiKGdjxkIABeTZHVuEFsg4gXVFEtBCOIdtp
 lNu9TQd8Dm2ygLCdf6fGk2TIJhT4boYMawO6Md5_8SU5YrLF.gee.EbSjPbfCfSTqT1w0r4t4wl2
 WPgNBoNqgv_9EyniVDfrsYSlLNSzn26wGTapilEphT.Qm0CSlTWI5pHpBV7I0HEZFnp6OqCLGsBU
 fo_tXosVq1_OCCybeHPjUzlA2ZnIpAwbrycLqy66i8A9UebsEPk5YjqesvSOCatDJ.4VDEiqo9r9
 c.fAQ7DvnHnIJ35GPV2fvf9KmdiK.Ltis.A1DhHGeCufBJDUyDAx_VFq2yalQQDotDsTCOSgpUSk
 bXPL57dUyeX1Gt5cSeyIrX1JtgNkTJtKpv9Ap7TA_rYNkkeHdR0cJCaQQOsCbfY4JY4iUtYIRP5P
 mg7JeZZdgmmpen_ICJZcg4Me2hzyBd2XKEoDvNMOTdhuzAzZYCK3cJR9lBcLeQKiC83iX
X-Sonic-MF: <alex_y_xu@yahoo.ca>
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.gq1.yahoo.com with HTTP; Wed, 24 Nov 2021 15:30:44 +0000
Received: by kubenode516.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID b36b65c048e84da1f7ce293b01997ba8;
          Wed, 24 Nov 2021 15:30:42 +0000 (UTC)
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
Subject: [PATCH v2 1/2] kbuild: use perl instead of shell to get file size
Date:   Wed, 24 Nov 2021 10:31:04 -0500
Message-Id: <20211124153105.155739-1-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20211124153105.155739-1-alex_y_xu.ref@yahoo.ca>
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

