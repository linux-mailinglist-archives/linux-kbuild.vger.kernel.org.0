Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA549D8881
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2019 08:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbfJPGOC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Oct 2019 02:14:02 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36806 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbfJPGOC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 02:14:02 -0400
Received: by mail-pl1-f193.google.com with SMTP id j11so10754764plk.3;
        Tue, 15 Oct 2019 23:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ws1WO5M7d4Tu7v3DIlAQw4A7zpDh0cpMdpB6luxKIBI=;
        b=Osi9UjzIp6AnYiGqmasdbgc5oOxivyhSWNSIf3W7tfZj0ClRj1FhZ7L+lMq+NUC0Y0
         dxDuajpDijjUrD9vo3MR1Ebpd/4ePPEB478kGblDyugBx8Y6nJrRAxOcjIT3fiU5+Uvf
         oxSo8GRRFjRWZLvqAh10cxG4D/5XoOcL47OP5stHgbVYqilMAI66Pep2n6OueTuia51J
         GTXSpWF3B0puJ0/qZNiwmGVqIWSr5DurwtU/PAUeJKr58mOgj0bDbeyOodTgoAPjUBuX
         9P2l+WmL7WJNOZ1OysC/SwB8MUmngtl7krsSItiYBoF1jGtALNm1Rsr3X7vFmZvUokTd
         DQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ws1WO5M7d4Tu7v3DIlAQw4A7zpDh0cpMdpB6luxKIBI=;
        b=JsoAWmSRAvsL48XI52y/Oc1XfgW6zly8HW+U1JUqQD6cbwpRylwBoaEf68TU7DSqG9
         BX4v9RVk0XzNBY54F2G+ZK0lHRXHlQJms27pApsOt3r1zBsS/GSEWpgd+fsvwBCvScKI
         sMiVaKu5i6FHf6CmHRU+WvylZO5zuSmePGMQuS/yuEkb9w8K+/XxZRD1OX7zOH2QWAu/
         RVcNB1JPQZSYlfykwkzGVL69Baxb4Y/UqVP6q6vYu4k9zaE8ghqxeauDAgCHsChUZUvR
         i0vYZz/y7+6Agy5nDIqwtBvktTK+lXi7+x4HsD2I9klpX3WqQ4Tplm+PkHUFZi3Uev7T
         pB6Q==
X-Gm-Message-State: APjAAAXoAQp8ebv3T66UPyvJ29Dvym82tCpFh5p50g7m40BkuqXD8NLr
        XOY3Sq6q8T5a168YXzLjpfs=
X-Google-Smtp-Source: APXvYqxp9q+kARjAqeN6XdrJY5XNQxHWBW2f5CSxYU1m6B406cBbiZnDzxWE8kPZiK3q9O/Lx4N37A==
X-Received: by 2002:a17:902:82cb:: with SMTP id u11mr38599845plz.315.1571206441188;
        Tue, 15 Oct 2019 23:14:01 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.90.170])
        by smtp.gmail.com with ESMTPSA id q3sm32998595pgj.54.2019.10.15.23.13.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 23:14:00 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org, bfields@fieldses.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts : prune-kernel : prune kernels generalized way
Date:   Wed, 16 Oct 2019 11:43:12 +0530
Message-Id: <20191016061312.10626-1-unixbhaskar@gmail.com>
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
Thanks, a bunch to Randy for the hand holding . :)

 scripts/prune-kernel | 71 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 12 deletions(-)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index e8aa940bc0a9..78dd4c854b2b 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -5,17 +5,64 @@
 # again, /boot and /lib/modules/ eventually fill up.
 # Dumb script to purge that stuff:

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
+
+function remove_old_kernel(){
+	cd $boot_dir
+	rm -If vmlinuz-$kenrel_version System.map-$kernel_version config-$kernel_verison
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
+
+remove_old_kernel
+
+printf "\n\n Enlist the installed modules directory \n\n"
+
+find $modules_dir  -maxdepth 0 -type d -exec ls -1 {} \;
+
+printf "\n\n Please give the full modules directory name to remove: %s"
+read modules_version
+
+remove_old_kernel_modules_dir
+
+printf "\n\n Removed kernel version: $kernel_version and associcated modules: $modules_version ...Done \n"
+while :
 do
+printf "\n\n Do you want to remove another?[YN] : %s"
+read response
+
+if [[ $response == "Y" ]];then
+	printf "Please give another version to remove : %s"
+	read kernel_version
+	remove_old_kernel
+	printf "\n\n Please give the full modules directory name to remove: %s"
+	read modules_version
+	remove_old_kernel_modules_dir
+elif [[ $response == "N" ]];then
+	printf "\n\n Alright,no more. \n\n"
+	exit 1
+fi
 done
--
2.21.0

