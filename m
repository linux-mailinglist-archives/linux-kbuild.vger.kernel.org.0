Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D468A9A8
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 23:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727514AbfHLVtO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 17:49:14 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45155 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfHLVtO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 17:49:14 -0400
Received: by mail-pg1-f195.google.com with SMTP id o13so50130054pgp.12
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Aug 2019 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=SxB55hS+dMxQE9HtSOzkt2R+4Ww8VTS/3uqSYLsuna8=;
        b=lzYAmOqbwT9CeDgDl15mFv5TdBb1wbf3WeSr2Od/BcCxri4TcJpC4oGHXsxNo+nIm9
         4UY8TGtG+c1GNcfBP3jlGRMkahWtZ8KjXFAcMh3FPNN2djLS0KjYin05hlqnu4Y5wal7
         S1qgMuIvQsiN1lVji4aUaHXHcMySssMiixIkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=SxB55hS+dMxQE9HtSOzkt2R+4Ww8VTS/3uqSYLsuna8=;
        b=WND7BHxp17efch73+3ZnJCNsygKzFPxjDA1wl7ZQjEeRMFK4+gbsm9lptFdLTAYVtd
         +wXa1+WZ8IabWpK5HdqSGwZoRFhDlbJoC+LUw4E37YR+HOukquWvsxKQcOut+94hEDUW
         8SuLdoh8kFMPM8wky2r3kvP1eJdS2Tx3rnBKSAnLfObLB8uQZkrFF91yiRoC8GTy4k+f
         GoHgPyEcVBBhh1/0S6pUsc9rLQYGuY1JsQF3ABnYt52njKOd/z2JgF9stBVqE6M5KAgG
         sZ4cRmfYXxCgF/5DDdCJXaY1qFQo1QrgGz8BBbU3Xo6vMWwt5EIYG14GrdVxRbr9Eiga
         bv5A==
X-Gm-Message-State: APjAAAXASvLfahT/4958K3j40OsNHTkSowFMbdnETSgEHHLEC0aYNgpf
        MMYjsx1MO72qjJTdYygJVwz8og==
X-Google-Smtp-Source: APXvYqyLfuIW+ob8nSQJagwEjJ+GYX0/WNpe63lBYSawHUQh2XGtOWLZsLANqss4+EgGiW1AD5Ae9g==
X-Received: by 2002:a17:90a:9903:: with SMTP id b3mr1250682pjp.80.1565646553526;
        Mon, 12 Aug 2019 14:49:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c71sm3236846pfc.106.2019.08.12.14.49.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 14:49:12 -0700 (PDT)
Date:   Mon, 12 Aug 2019 14:49:11 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: Parameterize kallsyms generation and correct
 reporting
Message-ID: <201908121448.4D023D7@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When kallsyms generation happens, temporary vmlinux outputs are linked
but the quiet make output doesn't report it, giving the impression that
the prior command is taking longer than expected.

Instead, report the KSYM step before the temporary linking. While at it,
this consolidates the repeated "kallsyms generation step" into a single
function and removes the existing copy/pasting.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 scripts/link-vmlinux.sh | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 96b6c0233a61..ed52be015523 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -170,7 +170,6 @@ gen_btf()
 # Create ${2} .o file with all symbols from the ${1} object file
 kallsyms()
 {
-	info KSYM ${2}
 	local kallsymopt;
 
 	if [ -n "${CONFIG_KALLSYMS_ALL}" ]; then
@@ -277,7 +276,22 @@ info MODINFO modules.builtin.modinfo
 ${OBJCOPY} -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
 
 kallsymso=""
+kallsymso_previous=""
 kallsyms_vmlinux=""
+
+# Perform one step in kallsyms generation, including temporary linking of
+# vmlinux.
+kallsyms_step()
+{
+	kallsymso_previous=${kallsymso}
+	kallsymso=.tmp_kallsyms${1}.o
+	kallsyms_vmlinux=.tmp_vmlinux${1}
+
+	info KSYM ${kallsymso}
+	vmlinux_link "${kallsymso_previous}" ${kallsyms_vmlinux}
+	kallsyms ${kallsyms_vmlinux} ${kallsymso}
+}
+
 if [ -n "${CONFIG_KALLSYMS}" ]; then
 
 	# kallsyms support
@@ -303,28 +317,15 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
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
+	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_previous})
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
 
-- 
2.17.1


-- 
Kees Cook
