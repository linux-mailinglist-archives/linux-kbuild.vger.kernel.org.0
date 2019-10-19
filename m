Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9977DDD8C5
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Oct 2019 15:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfJSNHj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Oct 2019 09:07:39 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34878 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfJSNHj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Oct 2019 09:07:39 -0400
Received: by mail-pf1-f193.google.com with SMTP id 205so5546723pfw.2;
        Sat, 19 Oct 2019 06:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OXt3/b6OC4Z7HRZ9VLAnHYXWYrRq0AR98MVlOlUAeUg=;
        b=J+Az/r8IT1XKl0+ikMjDtZgB02dwdvZDUwWXsbKrQaWpnha3ej8x8ZU/rJoU8Qm+Z+
         mSyA1+EP549KnXf6I1zGsgCO0KAPSjafZYVv+Wp8r3TIr7vx8NWYwA7dkCfz92apRun4
         iKuSj6IJDgC0aSjNrTBux3Jtr6YEi4M239Hi+y6f4PdlJh/RSysFEt4x15o5UhYd6U/Q
         HRRbO6bqfBQ2avJYJDKl5kEJfbQh1XkZuf1NdBG8CtpAHIPw2/7FUC8c2ckpwKcoyKVv
         9VtLXu9KSsUfb5FSu9ob8DNeeuiJwWu1aDUCbQFjK8iAIzmnBwAm2h5anZzdVBOsikZq
         cczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OXt3/b6OC4Z7HRZ9VLAnHYXWYrRq0AR98MVlOlUAeUg=;
        b=XyzkhcHhhQrvzxyLF2xWxjlgJ6Wb7rreHi65jT/FKQZwe+xPEff3kHqoVOVrnP6L1E
         KFqoDxfVAOADudZpo8TzCz4Yosw4IskrO2sm1Q/yw8P6d6fGClNo+1mj+rJulw4Dwvp0
         KFxLAkLlthJqikrYHJsducwsgnOVIkZvZcQBy/Wjbey5ulQEEBjhygiTTei8j/kLiIdz
         LH53053btoY9r6z4gAVQfbV2Qx18KsH9JVqMSdZ6bowHBxJMhToCve+SbDh30s3Yx7iH
         N+o4O20YME/auq6/aN2towXsPJT8kCeqtbQYlQKqlVf+T9wSSx4smrDtJwR+mqc+trFt
         vifg==
X-Gm-Message-State: APjAAAVTdQ7nXyi7iMvO2/0UpjC1nddXb66MMWZK4IV0EmTFV8NnVq26
        cM9wGmkHQJDwy788uFEPcx8=
X-Google-Smtp-Source: APXvYqz6fJOLOE0C2jNhhzo+7YrOJinDxiDJ9c3SZ/cvhGhX8n2nGHOlRUCQH/AA6b+NCx1aYVYE4Q==
X-Received: by 2002:a17:90a:a00c:: with SMTP id q12mr17283753pjp.102.1571490458652;
        Sat, 19 Oct 2019 06:07:38 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.90.170])
        by smtp.gmail.com with ESMTPSA id v35sm11851012pgn.89.2019.10.19.06.07.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Oct 2019 06:07:37 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     rdunlap@infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, bfields@fieldses.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts: prune-kernel : prune kernels generalized way
Date:   Sat, 19 Oct 2019 18:37:22 +0530
Message-Id: <20191019130722.8067-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch will remove old kernel from the system in a selective way.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/prune-kernel | 86 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 72 insertions(+), 14 deletions(-)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index e8aa940bc0a9..9d839a4e4539 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -5,17 +5,75 @@
 # again, /boot and /lib/modules/ eventually fill up.
 # Dumb script to purge that stuff:

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
+#for f in "$@"
+#do
+#       if rpm -qf "/lib/modules/$f" >/dev/null; then
+#                echo "keeping $f (installed from rpm)"
+#        elif [ $(uname -r) = "$f" ]; then
+#                echo "keeping $f (running kernel) "
+#        else
+#                echo "removing $f"
+#                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
+#                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
+#                rm -rf "/lib/modules/$f"
+#                new-kernel-pkg --remove $f
+#       fi
+#done
+boot_dir=/boot
+modules_dir=/lib/modules
+
+function remove_old_kernel(){
+	cd $boot_dir
+	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_version
+}
+
+function remove_old_modules_dir(){
+	cd $modules_dir
+	rm -rf $modules_version
+}
+
+printf "\n\n Enlist the installed kernels \n\n"
+
+
+find $boot_dir -name "vmlinuz-*" -type f -exec ls -1 {} \;
+
+printf "\n\n\n Please give the kernel version to remove: %s"
+read kernel_version
+
+if [[ $kernel_version == "" ]];then
+	exit 1
+else
+	remove_old_kernel
+fi
+
+printf "\n\n Enlist the installed modules directory \n\n"
+
+find $modules_dir -maxdepth 0 -type d -exec ls -1 {} \;
+
+printf "\n\n Please give the full modules directory name to remove: %s"
+read modules_version
+
+if [[ $modules_version == "" ]];then
+	printf "You have forgotten to give the modules dir to remove"
+else
+	remove_old_modules_dir
+fi
+
+printf "\n\n\n Removed kernel version:$kernel_version and associated modules:$modules_version ...Done \n"
+
+while :
+ do
+    printf "\n\n Do you want to remove another?[YN]: %s"
+    read response
+       if [[ $response == "Y" ]];then
+	 printf "Please give another version to remove: %s"
+	 read kernel_version
+	 remove_old_kernel
+	 printf "Please give the full modules directory name to remove: %s"
+	 read modules_version
+	 remove_old_modules_dir
+	 printf "\n\n\n Removed kernel version:$kernel_version and associated modules:$modules_version ..Done \n\n"
+      elif [[ $response == "N" ]];then
+	 exit 1
+    fi
+ done
--
2.21.0

