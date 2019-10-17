Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87EA9DA5A5
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 08:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393811AbfJQGcN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Oct 2019 02:32:13 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34160 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392596AbfJQGcN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 02:32:13 -0400
Received: by mail-pf1-f194.google.com with SMTP id b128so974639pfa.1;
        Wed, 16 Oct 2019 23:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VcEcGim2RmqS3UeX6xT8H4if/l+6Xo48doC8m5li394=;
        b=LcfF3VNKeQ2e8Si8bM4yN8O55lQgU+ga54W4el/55KyixvL+P2gzcneBJUQPpXumFD
         6NsuboV9xWGh/sjOnihlj74zsg59PtMZ97ZSjJ3SJ0BqiakxJZAmDmh/kfbrqiSVaVsq
         oHYmMvtKe4hBr1MPbfWSzQY1xVuOUZHJ56AvwsAHk1NYTK9Kenm+gVtL4syyOYBXw0PT
         TPkDJtmZXwrd/aHX138pkGBcKhBX+3FLcMreGvwKaKyX3HsRL3dYswejGL59wASQArci
         sbtrxd5b0KebvNV/k3ovDAdGTcUCusn4gN+lY68TkPw7DAt0MI9mG8lgxEfpmFzQXo3n
         jgGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VcEcGim2RmqS3UeX6xT8H4if/l+6Xo48doC8m5li394=;
        b=groHARRfk1kfbzV/n/WUvjhfOqwpjfOnwvwjnAaDzwZi0OZ6Iw2rSVEDGgokQQKDLS
         o7AB+NcNwJCnxxFRwEdMP7UXwjaStlpHCl/VIp7zU9XcrIjwJU1399wdLojXeGtG892i
         oaiIjzXqiFihWaoImHK/RrABb5taqocEevuqjeyJ/tvXYfLnct5DuoisvGNIHR3xYy1L
         evjN639mhM7Xo4XFtGF1MK7naRNa5Byt13xVw+Ce3l+6vJLbiZtKQV8kDTn1pAxoDKnc
         xSEivuhXlHx1Xq764P6ioSxeQ4TgPeP/sbKBJaitd5MoQXXs658xstbKOrC5nJezaR7J
         NYfA==
X-Gm-Message-State: APjAAAUpxv+OiER3jpueVED2nvxfIlwg9dYRrBJRFzo/XaRJ6UEwK0qb
        NPfbhBYc7NxogyG9882WL/k=
X-Google-Smtp-Source: APXvYqyZ5awnAcxGxr51+TL3MV9txbzRSJuohsCm2nK6b+bhQNRFWK8tw0VwEjhncWut2elFt+mRbA==
X-Received: by 2002:a62:b504:: with SMTP id y4mr1907572pfe.124.1571293931217;
        Wed, 16 Oct 2019 23:32:11 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.91.35])
        by smtp.gmail.com with ESMTPSA id r18sm1173869pgm.31.2019.10.16.23.32.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 23:32:10 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     rdunlap@infradead.org, bfields@fieldses.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts : prune-kernel : prune kernels generalized way
Date:   Thu, 17 Oct 2019 12:01:26 +0530
Message-Id: <20191017063126.2005-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch will remove old kernel from the system in a selective way.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
For Randy :
✔ ~/git-linux/linux-kbuild [master|AM/REBASE ↑·8|✔]
11:42 $ ./scripts/checkpatch.pl -f
scripts/0001-Fix-all-the-concern-raised-by-Randy.patch
total: 0 errors, 0 warnings, 93 lines checked

scripts/0001-Fix-all-the-concern-raised-by-Randy.patch has no obvious
style problems and is ready for submission.

scripts/prune-kernel | 75 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index e69de29bb2d1..9461ae2bc122 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -0,0 +1,75 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
+# again, /boot and /lib/modules/ eventually fill up.
+# Dumb script to purge that stuff:
+
+#for f in "$@"
+#do
+#        if rpm -qf "/lib/modules/$f" >/dev/null; then
+#                echo "keeping $f (installed from rpm)"
+#        elif [ $(uname -r) = "$f" ]; then
+#                echo "keeping $f (running kernel) "
+#        else
+#                echo "removing $f"
+#                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
+#                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
+#                rm -rf "/lib/modules/$f"
+#                new-kernel-pkg --remove $f
+#        fi
+#done
+boot_dir=/boot
+modules_dir=/lib/modules
+function remove_old_kernel(){
+	cd $boot_dir
+	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_verison
+}
+function remove_old_kernel_modules_dir(){
+	cd $modules_dir
+	rm -rf $modules_version
+}
+printf "\n\n Enlist the installed kernels \n\n"
+
+find $boot_dir -name "vmlinuz-*" -type f  -exec ls -1 {} \;
+
+printf "\n\n\n Please give the kernel version to remove: %s"
+read kernel_version
+if [[ $kernel_version -eq "" ]];then
+	printf "You have forgotten the version to give for removal"
+	exit 1
+else
+        remove_old_kernel
+fi
+
+printf "\n\n Enlist the installed modules directory \n\n"
+
+find $modules_dir  -maxdepth 0 -type d -exec ls -1 {} \;
+
+printf "\n\n Please give the full modules directory name to remove: %s"
+read modules_version
+if [[ $modules_version -eq "" ]];then
+	printf "You have forgotten to give the modules dir to remove"
+else
+        remove_old_kernel_modules_dir
+fi
+
+printf "\n\n Removed kernel version: $kernel_version and associated modules: $modules_version ...Done \n"
+while :
+  do
+     printf "\n\n Do you want to remove another?[YN] : %s"
+     read response
+
+       if [[ $response == "Y" ]];then
+	printf "Please give another version to remove : %s"
+	read kernel_version
+	remove_old_kernel
+	printf "\n\n Please give the full modules directory name to remove: %s"
+	read modules_version
+	remove_old_kernel_modules_dir
+        printf "\n\n Removed kernel version: $kernel_version and associated modules: $modules_version ...Done \n"
+
+      elif [[ $response == "N" ]];then
+	   exit 1
+      fi
+  done
--
2.21.0

