Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C318ECD9E
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2019 07:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbfKBGbG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Nov 2019 02:31:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46867 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfKBGbG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Nov 2019 02:31:06 -0400
Received: by mail-pl1-f193.google.com with SMTP id l4so34771plt.13;
        Fri, 01 Nov 2019 23:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ke5QwnWASFDho231U5m1krwvnsmedZElujK4NoGmdbc=;
        b=u2hXu0VEUam8DmMxLcIEEps/vNIiKTzmcj3Nmn8zDz2JXzxJg4RtYRWDr2s/lZrTPC
         DBkG3LLd17osCmLMf8vgltXhTwP6yrLLN4ddPXzGc9GWOzTm6zFQuVzGFRW3UKzlXiTR
         glFO32zBwMW/YSLN/jXjseh6+V4ClZgrWCUn63nmUBKHfqTqitIe/m/wBOFOvhWJhCKB
         ZeqHicfNsCQMYJpwCd7hZ11oSGfwWWa450zEzMQ9lbGzctjR4foZbIWAevwe5DCZL3q5
         yDZq8cwzDeDKXuLZnVjxR8b9TfDAdr26wf1pbT8PAv8uJD1kyICTq4tyhVOLFs7qhJWS
         afkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ke5QwnWASFDho231U5m1krwvnsmedZElujK4NoGmdbc=;
        b=FWG2fFfIv+V6P0H9bklaZZDQrZ6Ql/4H568yyW7eIsl1cygSPETo2MoWPhv9T5tHn/
         etJkSKwFziwtfSDdXORosFJ7L+3kREHZC4w1Xdc4PqnbmBU5M0L8nK3wqu01GzkG1TCV
         13ZRUCd7z4DxAiePs6pZs5bru4xiGXv5hKhshlcJce5QFTiSnm7S9/qizbBbEiO6bj/6
         Uh+oCS8E1/kFSZ5s44WLSO2GO20da9DTP8Pb30lUZv1ZjqgdtyjJSTwIn1enpjGEUT9D
         t8jIHmsFNId8Jw3q6ZK8bcH0Osbw6+4cZJUnQCMa3+q5p7lEyRL47J3gvxx5Skg5BbKf
         jQ6Q==
X-Gm-Message-State: APjAAAUcZqpZWYyA5ZT8ul5EaVe5KYYsVtpb1fCxdgaVQAD0++49qWJH
        ZyoNsZftlCznPEOHeJp08uA=
X-Google-Smtp-Source: APXvYqzQtL7ETyBUZiA2KkQ38XKMr3phJ9Egqa+w/lZ7VIRkm7K6XVqhx+gdDqGc5TQbcO9fKPsmUw==
X-Received: by 2002:a17:902:6bc8:: with SMTP id m8mr16565886plt.49.1572676263510;
        Fri, 01 Nov 2019 23:31:03 -0700 (PDT)
Received: from Slackware.localdomain ([103.231.91.34])
        by smtp.gmail.com with ESMTPSA id 66sm8470803pgi.49.2019.11.01.23.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 23:31:02 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     rdunlap@infradead.org
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts:prune-kernel:remove old kernels and modules dir from system
Date:   Sat,  2 Nov 2019 12:00:36 +0530
Message-Id: <20191102063036.28601-1-unixbhaskar@gmail.com>
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
 scripts/prune-kernel | 82 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 17 deletions(-)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index e8aa940bc0a9..01d0778db71f 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -1,21 +1,69 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+#This script will remove old kernels and modules directory related to it.
+#"-r" or "--remove" show how to silently remove old kernel and modules dir.
+# "-h" or "--help" show how to use this script or show without parameter.
+#"-i" or "--interactive" show how to remove interactively.
+
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
+	printf "Usage: $(basename $0) [-ri]\n"
+	printf "\n -r or --remove  kernel_version modules_version\n"
+	printf "\n -i or --interactive do as interactive way\n"
+	return 0
+}
+
+case "$flag" in
+	-i | --interactive)
+		printf "\nEnter kernel version to remove or blank/empty to exit:"
+		read kernel_version
+		if [[ $kernel_version != "" ]]; then
+			remove_old_kernel
+			printf "\nRemoved kernel version:$kernel_version from the system.\n\n"
+			printf "Please give the full modules directory name to remove:"
+			read modules_version
+			if [[ $modules_version != "" ]]; then
+				remove_old_modules_dir
+				printf "\n\nRemoved modules directory:$modules_version from the system.\n\n"
+			else
+				exit 1
+			fi
+		fi
+		;;
+	-h | --help)
+		usage
+		exit 0
+		;;
+	-r | --remove)
+		if [[ $# -ne 3 ]]; then
+			 printf "You need to provide kernel version and modules directory name.\n"
+			 exit 1
+		 else
+			 remove_old_kernel
+			 remove_old_modules_dir
+		fi
+		;;
+	*)
+		usage
+		exit 1
+		;;
+esac

-# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
-# again, /boot and /lib/modules/ eventually fill up.
-# Dumb script to purge that stuff:

-for f in "$@"
-do
-        if rpm -qf "/lib/modules/$f" >/dev/null; then
-                echo "keeping $f (installed from rpm)"
-        elif [ $(uname -r) = "$f" ]; then
-                echo "keeping $f (running kernel) "
-        else
-                echo "removing $f"
-                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
-                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
-                rm -rf "/lib/modules/$f"
-                new-kernel-pkg --remove $f
-        fi
-done
--
2.23.0

