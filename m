Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDCE3E7EB3
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2019 04:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbfJ2DBD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Oct 2019 23:01:03 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44557 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbfJ2DBC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Oct 2019 23:01:02 -0400
Received: by mail-pg1-f196.google.com with SMTP id e10so8435594pgd.11;
        Mon, 28 Oct 2019 20:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZLMvhv7tKSSJDMxnidSZGekxZVeFH3sCSLj6UYa6wM=;
        b=KR3dPGQoi5grst4QKJAlm+TtB1j6tTnvrumVy1IEh8/PYO2KF8qMPohUz44dqLDJ45
         QZE5beoyvxLAWJ7o6BhvIr/Mbc5uEWVOrjo7Binm8V8I/92WUNoQhRV7v9s8lsAzCVlv
         tgaasRCin+SgUSa1l5+ROANAo9PH6UtTL3xXR71brK4LDaFE6vQ0o7tnSSx6gkxjfarm
         VoJfs9jQ725XKVRlbBEgq7LvR0U95rAN9bP1BzTI2em3pLE8Ys1OV91xMhwVs/6EdkyU
         hau6VddqW8nceFpc+J0HN6tUxzmWr63anKQ4FTSIeUQADHU1g1+EN3ILBZDWxQGXXSLF
         tNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZLMvhv7tKSSJDMxnidSZGekxZVeFH3sCSLj6UYa6wM=;
        b=nWOarintAxMGMNpSEwOzR08WDDBvchKLTEbadksbc8D+k83mD7DIwXJE5e7zCQU5b0
         5hw+lzoIHX9df175VZAIN6cGPorU7Lxc8fyhZ6N7iDre0zMkhOT5K8h+QTNo+QkwfB5F
         WQYPmoPeYJHJfIuiKpz3GwTR79HXe9dsoTA4iJGuIAh+ynGt3vlzvYUEgChEOcrNlBJA
         Izd3hGPo3IDbbUySKYQTWjlhvlUN5g82ONssBis3LJAl18xUHBzgJdgd5/LIoXLAwK0f
         sW1dqs5Gsg+MwCH3LwfkDc9TV++kxyTVj49rU4AboI7L2KJ0mX0cUouQH7ykTnlY7I5F
         oozg==
X-Gm-Message-State: APjAAAVDJBbBUa36c4lmFkzrGuvB1Cn6p3nxgQ2NkZdsJjvRIDIzVfbG
        WTD51Qzn/AS89eSINmxGP8o=
X-Google-Smtp-Source: APXvYqyiLo57314Q6lNpMx+Xhvoay8T9dgZTy35jdfhTOHpCI8vHD/SlqMr/NAyLBicfMLX2GA0xyA==
X-Received: by 2002:a63:801:: with SMTP id 1mr13350746pgi.58.1572318061971;
        Mon, 28 Oct 2019 20:01:01 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id u68sm12436603pfu.39.2019.10.28.20.00.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 20:01:01 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     rdunlap@infradead.org, bfields@fieldses.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts:prune-kernel:prune kernel and modules dir from the system
Date:   Tue, 29 Oct 2019 08:30:30 +0530
Message-Id: <20191029030030.31659-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch will remove old kernel and modules directory from 
the system interactive way and also at once ,provied the parameter
given to the invoking script.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/prune-kernel | 58 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index 58a7650ce592..a6c990450ddc 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -1,2 +1,60 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+#This script will delete old kernels and modules directory related to it,both
+#automated and interactive way, if you choose -i or --interactive as parameter.
+#For normal operation you have to invoke this script like below
+#prune-kernel -r kernel_ver modules_dir_name
+flag=$1
+kernel_ver=$2
+modules_dir_name=$3
+boot_dir=/boot
+modules_dir=/lib/modules
+
+remove_old_kernel() {
+	cd $boot_dir
+	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_version
+	return 0
+}
+
+remove_old_modules_dir() {
+	cd $modules_dir
+	rm -rf $modules_version
+	return 0
+}
+
+usage() {
+	printf "Usage: $(basename $0) [-ri] \n"
+	printf "\n -r | --remove kernel_ver modules_dir_name \n"
+	printf "\n -i | --interactive use as interactive way \n"
+}
+
+while getopts :hir opt;do
+	case "$flag" in
+		-i | --interactive)
+			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
+			read kernel_version
+			if [[ $kernel_version != "" ]]; then
+				remove_old_kernel
+				printf "Please give the full modules directory name to remove:%s"
+				read modules_version
+				remove_old_modules_dir
+				printf "\n\n\n Removed kernel version:$kernel_version and associated modules directory:$modules_version ..Done.\n"
+			else
+				exit 1
+			fi
+			;;
+		-h | --help)
+			usage
+			exit 1
+			;;
+		-r | --remove)
+			shift $(( OPTIND -1 ))
+			cd $boot_dir
+			rm -f $kernel_ver
+			cd $modules_dir
+			rm -rf $modules_dir_name
+			printf "Removed kernel version:$kernel_ver and modules directory:$modules_dir_name from the system. \n\n"
+			exit 0
+			;;
+	esac
+done
--
2.23.0

