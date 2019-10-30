Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78AC7E9990
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2019 10:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfJ3JzC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Oct 2019 05:55:02 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46694 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbfJ3JzC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Oct 2019 05:55:02 -0400
Received: by mail-pl1-f196.google.com with SMTP id q21so744543plr.13;
        Wed, 30 Oct 2019 02:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D9JSwdS8QAzu/eNw2+AhJGkMgbykurUTxvTSEmWQGAU=;
        b=tPcnbZYYHzgZpSLRoz/3XMDNAPlLjuPUBjmcOj9AuKqw6ylyMqqH3nRUt6coTyAKVP
         gLqK8VFlyLnvVUoSOaXidq3yuUjpZmSlUX+Be9U4Ygxu6HH7X4Fw1bSOmTYpmaTZ2hEc
         hBW1A9bLff6blfC7RisnaQFY/m8K3uDZiN6MIE2FS6f6EsEsW7TewX15iApaVOIfM2bc
         4kNfQ/sp3+J+91itDhPVauYLYvJ1rXt9hRuhXdP0+Eihs+ahMKlLptZkQBjxb+3AjHOF
         6kX2gtvetSjFzu/gnad9XYSojPV1AwAeSPCOInR27N3Wd6nyXZ7VLz/rIN8Az1SEP6BN
         gbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D9JSwdS8QAzu/eNw2+AhJGkMgbykurUTxvTSEmWQGAU=;
        b=VtXKN79u+aT00ifGSx2sCS1KliSQrNWkhEKEVfA0QL+WE+r9YBNNwr55wkUmggCXex
         pq0nej5FwWIjEadT0Bnm17ut8G6A5J9gHW/NMYAuXzwq0JPoiKxOhGolbX3eEVrF+HyK
         IKxUaAnenWrMAWs8Kzi5fiMI5nlezxELUtsz/siYUuc1MpGrgp8CesHkYm8oGsaPfXpu
         M1GnfqHx0k5qT+c/mipuaWQdyFYcTAxracp0tridWnpB3b5dO9v4bhFqw93JICaYlNpm
         OmALw/KC0t1lA7HImqTpN8bPeDe0duytqv3GZIBtiGa29Gyyst0Rc/tIdWBa/5uW4uUR
         P2xg==
X-Gm-Message-State: APjAAAWFyUaDR+OszR8Jki67u1pmAmulMzRMDrKdiDAJsGNxa3DEIhDB
        U8oGCDNt5bsOH52hTi8Lccg=
X-Google-Smtp-Source: APXvYqwWKWowEHWiemmoYatvn9PB53edW84Kr4I19niy1IUpE5pMBaSLxaZYGfm/w7wu16MEc0vGng==
X-Received: by 2002:a17:902:b191:: with SMTP id s17mr3681865plr.122.1572429301473;
        Wed, 30 Oct 2019 02:55:01 -0700 (PDT)
Received: from localhost.localdomain ([103.231.90.171])
        by smtp.gmail.com with ESMTPSA id 4sm2710982pja.29.2019.10.30.02.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:55:00 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     rdunlap@infradead.org, bfields@fieldses.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts: prune-kernel:remove old kernels and modules dir from system
Date:   Wed, 30 Oct 2019 15:24:45 +0530
Message-Id: <20191030095445.912435-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch will remove old kernels and modules directorey related
to that kernel from the system by interactively and silently.Here
are few interactions with the scripts

1)

✔ ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
14:52 $ ./scripts/prune-kernel -h
Usage: prune-kernel [ri]

 -r | --remove kernel_ver modules_dir_name

  -i | --interactive use as interactive way
  ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
  
  14:52 $ ./scripts/prune-kernel --help
  Usage: prune-kernel [ri]

   -r | --remove kernel_ver modules_dir_name

    -i | --interactive use as interactive way
   
 2)

 ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
 14:52 $ ./scripts/prune-kernel -r 5.3.3
 You need to provide kernel version and modules dir name
 
 ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
 14:53 $ ./scripts/prune-kernel -r
 You need to provide kernel version and modules dir name
 
 ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
 14:54 $ ./scripts/prune-kernel -r 5.3.3 5.3.3-foo

3)

$ ./scripts/prune-kernel --remove
You need to provide kernel version and modules dir name

✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
14:55 $ ./scripts/prune-kernel --remove 5.3.3
You need to provide kernel version and modules dir name

✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
14:55 $ ./scripts/prune-kernel --remove 5.3.3 5.3.3-foo


4)14:55 $ ./scripts/prune-kernel -i

Enter kernel version to remove or blank/empty to exit:


5)14:57 $ ./scripts/prune-kernel --interactive

Enter kernel version to remove or blank/empty to exit:
✔ ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]


6)14:59 $ ./scripts/prune-kernel --interactive

Enter kernel version to remove or blank/empty to exit:5.3.3
Please give the full modules directory name to remove:5.3.3-foo



Removed kernel version:5.3.3 and associated modules:5.3.3-foo ...Done.


7)15:00 $ ./scripts/prune-kernel -i

Enter kernel version to remove or blank/empty to exit:5.3.3
Please give the full modules directory name to remove:5.3.3-foo



Removed kernel version:5.3.3 and associated modules:5.3.3-foo ...Done.


Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/prune-kernel | 63 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index a25aa2160d47..a91010d0e2af 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -1,3 +1,66 @@
 #!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
+#This script will delete old kernels and modules directory related to it
+#-h with the script will show you the help
+#-r with the script take two parameter: kernel_ver and modules_dir_name
+#-i with the script allow you do the removing interactive way

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
+	printf "Usage: $(basename $0) [ri] \n"
+	printf "\n -r | --remove kernel_ver modules_dir_name \n"
+	printf "\n -i | --interactive use as interactive way \n"
+}
+
+for arg in "$@"
+do
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
+					printf "\n\n\n Removed kernel version:$kernel_version and associated modules:$modules_version ...Done. \n"
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
+				printf "You need to provide kernel version and modules dir name\n"
+				exit 1
+			else
+				cd $boot_dir
+				rm -f $kernel_ver
+				cd $modules_dir
+				rm -rf $modules_dir_name
+			fi
+			;;
+	esac
+done
--
2.23.0

