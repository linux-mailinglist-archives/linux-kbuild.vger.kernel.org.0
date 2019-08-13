Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37BFC8BCCF
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 17:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729873AbfHMPPe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 11:15:34 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45632 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729855AbfHMPPe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 11:15:34 -0400
Received: by mail-pg1-f195.google.com with SMTP id o13so51403745pgp.12
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=CppQ5IfTrKtF8sLkKBQgACp32D76faL1vkHtpdC3L4M=;
        b=a6R7vnNQi5dWDfgU8yUl1087AWgjtUHZQ2oTOBFO+joiOf9XtEiIhtftHRjZThPQSv
         /gFnrtiO5yg6bk2ukBl9exaIcqPEmTFEk0gMs8nl3+uC11ogEcby+HEOql1RpQtHktcF
         a4mi/OtI4wEbHCh4es8+HaHtMjELmA2YChznA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=CppQ5IfTrKtF8sLkKBQgACp32D76faL1vkHtpdC3L4M=;
        b=iNlm8NVuG83XdAAioCBwZfnUzfQ2pY4K+Jslk+QxO49VR47E+HdBdmOz7Jvgq/6p/a
         7bi0ySKTXKzcY6QPCNtmAS12D6uVBUWjf3z+WW+zwyJZkDggma7TYoZaz7rgoc88A6bO
         zvKmaqD8T+87373O5i6jbo1jqWZg6WObag70w+3T/JuLdkujns4YrgkEBKFF5UnnXKGk
         JZNZhnKmAa93MwkWl/n8JNWvXn9lgCRREwms6Wvd29o0iwq5hDDIoECs8L4BvWu0pK+w
         m/D2x4Rsd7UeYnInbKeGJGwk6Fg7fCGvtxPmkgLGT7XKO9BZl5NPeKVN3ik5XweE9CtF
         fnWg==
X-Gm-Message-State: APjAAAXFFSPaaPUSyrfX0asxsLsqWmRQgmdDBplaBQyUt3iB+FL4Peej
        JERIoT8vtuukbOQdvPw/XdK+og==
X-Google-Smtp-Source: APXvYqzTdD59gxrJllUxXkjBAVUbS3mMr5XMvs0oAIJcCOS8YHYuHc2S8SEwslFz8M9zKSUTvnzRBQ==
X-Received: by 2002:a65:60d3:: with SMTP id r19mr35217368pgv.91.1565709333960;
        Tue, 13 Aug 2019 08:15:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p1sm15310991pff.44.2019.08.13.08.15.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 08:15:33 -0700 (PDT)
Date:   Tue, 13 Aug 2019 08:15:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: [PATCH v2] kbuild: Parameterize kallsyms generation and correct
 reporting
Message-ID: <201908130812.45DE9AE8@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When kallsyms generation happens, temporary vmlinux outputs are linked
but the quiet make output didn't report it, giving the impression that
the prior command is taking longer than expected.

Instead, report the linking step explicitly. While at it, this
consolidates the repeated "kallsyms generation step" into a single
function and removes the existing copy/pasting.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2:
- rename $kallsymso_previous to $kallsymso_prev (Masahiro)
- move location of kallsyms_step() (Masahiro)
- report linking step instead of folding it into KSYM (Masahiro)
---
 scripts/link-vmlinux.sh | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index a7124f895b24..0b08bfb88f74 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -60,6 +60,7 @@ modpost_link()
 # ${2} - output file
 vmlinux_link()
 {
+	info LD ${2}
 	local lds="${objtree}/${KBUILD_LDS}"
 	local objects
 
@@ -138,6 +139,18 @@ kallsyms()
 	${CC} ${aflags} -c -o ${2} ${afile}
 }
 
+# Perform one step in kallsyms generation, including temporary linking of
+# vmlinux.
+kallsyms_step()
+{
+	kallsymso_prev=${kallsymso}
+	kallsymso=.tmp_kallsyms${1}.o
+	kallsyms_vmlinux=.tmp_vmlinux${1}
+
+	vmlinux_link "${kallsymso_prev}" ${kallsyms_vmlinux}
+	kallsyms ${kallsyms_vmlinux} ${kallsymso}
+}
+
 # Create map file with all symbols from ${1}
 # See mksymap for additional details
 mksysmap()
@@ -216,6 +229,7 @@ info MODINFO modules.builtin.modinfo
 ${OBJCOPY} -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
 
 kallsymso=""
+kallsymso_prev=""
 kallsyms_vmlinux=""
 if [ -n "${CONFIG_KALLSYMS}" ]; then
 
@@ -242,32 +256,18 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	# a)  Verify that the System.map from vmlinux matches the map from
 	#     ${kallsymso}.
 
-	kallsymso=.tmp_kallsyms2.o
-	kallsyms_vmlinux=.tmp_vmlinux2
-
-	# step 1
-	vmlinux_link "" .tmp_vmlinux1
-	kallsyms .tmp_vmlinux1 .tmp_kallsyms1.o
-
-	# step 2
-	vmlinux_link .tmp_kallsyms1.o .tmp_vmlinux2
-	kallsyms .tmp_vmlinux2 .tmp_kallsyms2.o
+	kallsyms_step 1
+	kallsyms_step 2
 
 	# step 3
-	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" .tmp_kallsyms1.o)
-	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" .tmp_kallsyms2.o)
+	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
+	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
 	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
-		kallsymso=.tmp_kallsyms3.o
-		kallsyms_vmlinux=.tmp_vmlinux3
-
-		vmlinux_link .tmp_kallsyms2.o .tmp_vmlinux3
-
-		kallsyms .tmp_vmlinux3 .tmp_kallsyms3.o
+		kallsyms_step 3
 	fi
 fi
 
-info LD vmlinux
 vmlinux_link "${kallsymso}" vmlinux
 
 if [ -n "${CONFIG_DEBUG_INFO_BTF}" ]; then
-- 
2.17.1


-- 
Kees Cook
