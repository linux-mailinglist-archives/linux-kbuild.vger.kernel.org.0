Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77B0264F80
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 21:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgIJTox (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 15:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730896AbgIJPcP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 11:32:15 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CF7C061375;
        Thu, 10 Sep 2020 08:32:07 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id c10so5662469otm.13;
        Thu, 10 Sep 2020 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=JiSCidLpAFauFqzkl7i2+9u0fMatvu0gGkE6KN/KG9U=;
        b=BVu5wJvWAgAn7anPmfckOEzsLzv87rlFrOI+NlJOALnxFmUatLy9YcYLoNHR2I8w6E
         bQ4bdVIAs28MSeQkmdCl5c225NIHlKHE4SIFZva2s2CTxxLCDIC1dn/SwHSCpwb92UYt
         8ZthJCksGq3uYaXgPSKvvcZYdJ4YpSj5SjUiaTzgR5b3UiEoFTRZL+e0O+keGHBNzrkD
         kKay6ibxlrMCvcH3ymEyU9LR9McKlvrekkgZlDr9K1lfzA7OF5rHM2wNvK6FUdVYtPog
         lXXKtGtFuq9QZg/zt1JW5gfDC6ohtmEkV84wbrmtP6iTPRcvsK7EX6euy5FI8UCRO6ml
         jw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=JiSCidLpAFauFqzkl7i2+9u0fMatvu0gGkE6KN/KG9U=;
        b=eIfoRYLgcWzqSRGjmwL345OXsyEyj4JEUOHxzzEyeIsbh0slMlt1+/Ke+6DHER8kNa
         mIuciS7aBWgGP2tDlmNTjdFfJE1XvmJo2eNCulCwnnbRhBpVtAqAdSXC3tBUKXdW/nz+
         YOq27g9XslKo8gK4rqaD3oPq4efP1vxTPMy+ip6L39yT9cp/GEaR774RewyDjc8U6cEi
         UDG5p8XZqhZt0J4ReQSAJHx9gJFBrDRWXfxejbeMrpaWoaZsQEcObqbV1pLCW8BCgRLX
         vIsP02FKRAJT2VCQaBDX0BoVBeCtEg4UaxMoMw5cssADnL4uIQfGNzLK6IEhVClYTxvx
         ks6g==
X-Gm-Message-State: AOAM530eXz8cIT/NfRoLFARKLhv79T04vIZ0FgwzJifHxSn3XvgU49q1
        6aPed82lLkJB8U377CDQyE/sXHfaD/s=
X-Google-Smtp-Source: ABdhPJxMyTwNAXwvzU2ykEwYZlouGnvaDbkicUpfWN823STLrYt6/gwSKbdqSCmGlnQOeB3NIxHc/A==
X-Received: by 2002:a05:6830:10ca:: with SMTP id z10mr4305280oto.208.1599751926843;
        Thu, 10 Sep 2020 08:32:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 126sm991772oof.28.2020.09.10.08.32.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 08:32:06 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] kbuild: Try up to eight kallsyms link passes
Date:   Thu, 10 Sep 2020 08:32:04 -0700
Message-Id: <20200910153204.156871-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since v5.8, powerpc:allmodconfig often fails to build with the following
error message.

	Inconsistent kallsyms data
	Try make KALLSYMS_EXTRA_PASS=1 as a workaround

Setting KALLSYMS_EXTRA_PASS=1 does not help. As it turns out, the build
currently needs up to four link passes to succeed.

Similar problems have been observed over time for other architectures.

Make the number of link passes dynamic to solve the problem. Try up to
eight passes before giving up. If KALLSYMS_EXTRA_PASS is set, add one
additional pass after succeeding.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 scripts/link-vmlinux.sh | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index e6e2d9e5ff48..72abdee0e649 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -316,11 +316,10 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	#     From here, we generate a correct .tmp_kallsyms2.o
 	# 3)  That link may have expanded the kernel image enough that
 	#     more linker branch stubs / trampolines had to be added, which
-	#     introduces new names, which further expands kallsyms. Do another
-	#     pass if that is the case. In theory it's possible this results
-	#     in even more stubs, but unlikely.
-	#     KALLSYMS_EXTRA_PASS=1 may also used to debug or work around
-	#     other bugs.
+	#     introduces new names, which further expands kallsyms. Try up
+	#     to eight passes to handle that situation before giving up.
+	#     KALLSYMS_EXTRA_PASS=1 may be used to add an extra step
+	#     for debugging or to work around other bugs.
 	# 4)  The correct ${kallsymso} is linked into the final vmlinux.
 	#
 	# a)  Verify that the System.map from vmlinux matches the map from
@@ -329,13 +328,21 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	kallsyms_step 1
 	kallsyms_step 2
 
-	# step 3
-	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
-	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
-
-	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
-		kallsyms_step 3
-	fi
+	# step n
+	step=3
+	while [ $step -le 8 ]; do
+		size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
+		size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
+
+		if [ $size1 -eq $size2 ]; then
+			if [ -z "${KALLSYMS_EXTRA_PASS}" ]; then
+				break
+			fi
+			KALLSYMS_EXTRA_PASS=""
+		fi
+		kallsyms_step $step
+		step="$(expr $step + 1)"
+	done
 fi
 
 vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
-- 
2.17.1

