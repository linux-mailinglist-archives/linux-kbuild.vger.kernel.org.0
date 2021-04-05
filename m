Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF41F354660
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Apr 2021 19:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232452AbhDER72 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Apr 2021 13:59:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:15759 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239708AbhDER71 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Apr 2021 13:59:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617645561; h=In-Reply-To: Message-Id: Date: Subject: Cc: To:
 From: Sender; bh=OYnNE7Dy5EU3OXyOzCgjnJg//0G4V/ieE3hirIKZBnQ=; b=TTLRLiRQYo3TzEg+sB6Ha9f1dHgfUWj7z/CE/FUhPms9P8RYrRwppFzyPjomkVQ4t2mLUc1k
 +L9OMMCYyKOQu0/yNic7yldmfGyy47FNbhS2GqmGudaL9Cd3fFrIz/CAX26Txb+p8KjSItku
 oK2SfqjUwWPQAIWWJzU4AtIIz8E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606b4ff88807bcde1d8e79e4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Apr 2021 17:59:19
 GMT
Sender: eberman=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6383C43462; Mon,  5 Apr 2021 17:59:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7FA82C433CA;
        Mon,  5 Apr 2021 17:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7FA82C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Maennich <maennich@google.com>,
        Trilok Soni <tsoni@codeaurora.org>
Subject: [PATCH v2] Kbuild: Update config_data.gz only if KCONFIG_CONFIG materially changed
Date:   Mon,  5 Apr 2021 10:58:41 -0700
Message-Id: <1617645521-8098-1-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: 1617317072-26770-1-git-send-email-eberman@codeaurora.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If you update the timestamp of KCONFIG_CONFIG without actually changing
anything, config_data.gz is re-generated and causes vmlinux to re-link.
When Link Time Optimization is enabled, unnecessary re-linking of
vmlinux is highly desirable since it adds several minutes to build time.

Avoid touching config_data.gz by using a script to compare the existing
config_data.gz, KCONFIG_CONFIG, or script itself to update only if any
is mismatched.  The script follows gen_kheaders.sh approach for
determing in update is needed. The script intentionally avoids
re-compressing KCONFIG_CONFIG.

The .config can be touched, for instance, by a build script which
installs the default defconfig and then applies a defconfig fragment on
top.

For a simple example on my x86 machine, I modified x86 default defconfig to set
CONFIG_IKCONFIG=y and run:
  make -j50 defconfig tiny.config vmlinux
  make -j50 defconfig tiny.config vmlinux
With this patch, vmlinux is not re-built as a result of config_data.gz
change.

Changes in v2:
 - Use md5 checksum to compare .config instead of gzip'ing again

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 kernel/.gitignore         |  1 +
 kernel/Makefile           |  4 +++-
 kernel/gen_config_data.sh | 31 +++++++++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100755 kernel/gen_config_data.sh

diff --git a/kernel/.gitignore b/kernel/.gitignore
index 78701ea..a191136 100644
--- a/kernel/.gitignore
+++ b/kernel/.gitignore
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config_data.gz.md5
 kheaders.md5
 timeconst.h
 hz.bc
diff --git a/kernel/Makefile b/kernel/Makefile
index 320f1f3..0784bf3d 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -139,8 +139,10 @@ obj-$(CONFIG_SCF_TORTURE_TEST) += scftorture.o
 $(obj)/configs.o: $(obj)/config_data.gz
 
 targets += config_data.gz
+quiet_cmd_genicfg = CHK     $(obj)/config_data.gz
+      cmd_genicfg = $(CONFIG_SHELL) $(srctree)/kernel/gen_config_data.sh $@ $<
 $(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
-	$(call if_changed,gzip)
+	$(call cmd,genicfg)
 
 $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
 
diff --git a/kernel/gen_config_data.sh b/kernel/gen_config_data.sh
new file mode 100755
index 00000000..e9ff193
--- /dev/null
+++ b/kernel/gen_config_data.sh
@@ -0,0 +1,31 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+# This script generates a compressed version of .config, if its checksum has changed
+set -e
+
+this_file="$(readlink -f "$0")"
+outfile=$1
+infile=$2
+
+config_md5="$(md5sum $infile | cut -d ' ' -f1)"
+# Any changes to this script will also cause a rebuild of config_data.
+this_file_md5="$(md5sum $sfile | cut -d ' ' -f1)"
+if [ -f $outfile ]; then outfile_md5="$(md5sum $outfile | cut -d ' ' -f1)"; fi
+
+if [ -f $outfile.md5 ] &&
+	[ "$(head -n 1 $outfile.md5)" = "$config_md5" ] &&
+	[ "$(head -n 2 $outfile.md5 | tail -n 1)" = "$this_file_md5" ] &&
+	[ "$(tail -n 1 $outfile.md5)" = "$outfile_md5" ]; then
+		exit
+fi
+
+if [ "${quiet}" != "silent_" ]; then
+	echo "  GEN     $outfile"
+fi
+
+${KGZIP} -c -n -f -9 $infile > $outfile
+
+echo "$config_md5" > $outfile.md5
+echo "$this_file_md5" >> $outfile.md5
+echo "$(md5sum $outfile | cut -d ' ' -f1)" >> $outfile.md5
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

