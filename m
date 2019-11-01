Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40B0CEBED8
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Nov 2019 09:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbfKAIGQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Nov 2019 04:06:16 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33919 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbfKAIGQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Nov 2019 04:06:16 -0400
Received: by mail-pf1-f195.google.com with SMTP id x195so3042572pfd.1;
        Fri, 01 Nov 2019 01:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jhu34IXJDs+hULNrQ3H3A+yhrlFb8rs8xpIaYVWNx0o=;
        b=j7pyo/6BJOkohcd+bGnK5/T+KsrfHjr3Y3oaVzCgpq8SU7gnF+F51IBRzeZW/4dwr5
         23jmqtyosAX0aUUH5nXPrrDNaP9cRz/7O7nAmf36KaqYEF/HaGzemyFMk4Fv29oCalBi
         n0OAQS8uwfjs12rk8CZUUELUKUEY3f8vj6mmMHumbitbPdvfnhLRpikijQux3stEXD2d
         sbZiTcMiTOIwj0bzC/jNuZX+kGStyuL/MNuEnXOOu+ulagC3b7N/cAx2vlVA+jUf/Bdo
         fhaF0VtpK7/h/vH5mEeUhAATaNiKac/9vysT8bqXj9D/iM0sJ+QndlMF5dSYdwwQxc4D
         NEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jhu34IXJDs+hULNrQ3H3A+yhrlFb8rs8xpIaYVWNx0o=;
        b=syHwWUc5QuZCqrcCeCBdxWSpd6qvB1vHJdlj4Y4OIxbXAuQGRIJKvVWBSJDiU66+fM
         mBnbTA7F95fQ1cS8COGBbiAeWIVQ5aAHlLXaHET/nZp2h6SdKLWOqpT8McIDKz/nuYg6
         cZXyittljEUtiNe3FAXKzxF3tDKBDndu9MM8pBcpmrrZ5vuM0Vbyej92qgQ6EEdn5+L8
         xBDVKznN2UFcBaF5exoalUNeWhO4XBzyWQ2iDOXQgANM8cj8sMRA5geyo8ir/13+/hfJ
         DlQwCF7rNUgW0vxyBwHxxoPfv31mbH1AUSQh5yNUJvIdaWGxtt/dpPrsPqocl2xXrWL8
         ZdVA==
X-Gm-Message-State: APjAAAW9OOedMNUXOleVNcmHIQtb9ECa30lVDHKP/cXvzizLGkBPfW43
        fAQiOGmq78EZtiP/NudQW/4=
X-Google-Smtp-Source: APXvYqxDO3k8caAHkgU75ZJwN/RonVvFIpKPbhqkBLM+qCtwp9qT/PXKHRzQ9M4HkobUT5/wK3X3Fg==
X-Received: by 2002:a63:3d2:: with SMTP id 201mr11835306pgd.372.1572595575543;
        Fri, 01 Nov 2019 01:06:15 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.91.35])
        by smtp.gmail.com with ESMTPSA id y1sm5917088pfq.138.2019.11.01.01.06.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Nov 2019 01:06:14 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     rdunlap@infradead.org
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts:prune-kernel:Removed old kernels and modules dir from system
Date:   Fri,  1 Nov 2019 13:35:10 +0530
Message-Id: <20191101080510.26247-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch allow you to remove old kernels and associated modules
directory from the system.You can do it at once with the -r flag
and interactively with the -i flag.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/prune-kernel | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index a25aa2160d47..373a845792e6 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -1,3 +1,66 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+#This script will remove old kernels and modules directory related to it.
+# "-h" or "--help" show how to use this script or show without parameter.
+#"-r" or "--remove" show how to silently remove old kernel and modules dir.
+#"-i" or "--interactive" show how to remove interactively.

+flag=$1
+kernel_version=$2
+modules_version=$3
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
+	printf "\n -r or --remove  kernel_version modules_version \n"
+	printf "\n -i or --interactive do as interactive way \n"
+	return 0
+}
+
+	case "$flag" in
+		-i | --interactive)
+			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
+			read kernel_version
+			if [[ $kernel_version != "" ]]; then
+				remove_old_kernel
+				printf "Please give the full modules directory name to remove:%s"
+				read modules_version
+				if [[ $modules_version != "" ]]; then
+					remove_old_modules_dir
+					printf "\n\nRemoved kernel version:$kernel_version and associated modules directory:$modules_version ...Done \n"
+				else
+					exit 1
+				fi
+			fi
+			;;
+		-h | --help)
+			usage
+			exit 1
+			;;
+		-r | --remove)
+			if [[ $# -ne 3 ]]; then
+				printf "You need to provide kernel version and modules directory name \n"
+				exit 1
+			else
+				remove_old_kernel
+				remove_old_modules_dir
+			fi
+			;;
+		*)
+			usage
+			exit 1
+			;;
+	esac
--
2.23.0

