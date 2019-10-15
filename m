Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91106D7954
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2019 17:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732599AbfJOPAf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Oct 2019 11:00:35 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41840 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJOPAf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Oct 2019 11:00:35 -0400
Received: by mail-pl1-f196.google.com with SMTP id t10so9720578plr.8;
        Tue, 15 Oct 2019 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9pUvISacgS82Nv4KreB7bgdol8gRAtwVX2h5JA/PHLE=;
        b=cOUb53G2RZu0t/xKIjyj9L0KuvOXmmUuBWKwV/GGiOXqCXho6kM6sU67UzT4l4sCYR
         H3AaOuKg2l1W9x8btPlJEBHyU4yRvutqfXL+UDpyDnKyHlaeBTTdw4pduu3cB8feLxVJ
         L8haSws4mO81jk8ICMTwv4ZHX/GRvuX3YBC0GaIPRn3+aVV4ssgsERwGpbM4voHpEN/I
         bBlFRg2IOOvIknYi1i5nCa+CNkzKU7GXBEG0zIE1i/zFPJiSecdcPpjULRXhrELxBIe+
         JzrVJSw3vKdKZgqJJ2tbXgiUmRJ2QBvbMgueBSMdPP4zKMgMt7EPnaP7o2CRKCz8OrG3
         6sJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9pUvISacgS82Nv4KreB7bgdol8gRAtwVX2h5JA/PHLE=;
        b=nMPYVHMnYGXjZRvoCjBuFZE/oxYaNogYC7+TCWkgc0DZ2dBEx/nryRxq1Powev+7bN
         dVkfY5TvBAI03Ru5j3T0kbE2WnHbQi9tTuYk+EGFNIW9DlLAf9A3v/tgRKpZnBOgdqOd
         +rP3cMBHgSglxvPMyFafrRhXlfbtLpCnShTxZoS3AgDtNZntX308/T8gwCaoXnQOXwJM
         dNjPAjuJjccDgEqCH2Yt9OwymplsyQsUoOPLvpIBV3+et6f7Zjnol/H1Us14cUHAmkJG
         Je8z61zmUhi94EPMBGonNm7/Sw9Odi95GCA69WGy23qkwoVdQnUZsaNRKIazUCELtZsC
         AFGw==
X-Gm-Message-State: APjAAAXz/tf/ezQ7HA1516F+Omu3RWrlbrXX0yPlFF4NJKk+rlfC39Ef
        BhJT9ARnMIhiGloL+MX73g8edusymXc63g==
X-Google-Smtp-Source: APXvYqzWeulK/NazRnOBg2uP6hPcv2JAZshPWwAQzwuVyhIpIDEWeOAHWpB1hwOZnT3MirBYrtAPlg==
X-Received: by 2002:a17:902:8487:: with SMTP id c7mr35847062plo.20.1571151633147;
        Tue, 15 Oct 2019 08:00:33 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.90.174])
        by smtp.gmail.com with ESMTPSA id m123sm24685739pfb.133.2019.10.15.08.00.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 08:00:32 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] :scripts: prune-kernel : prunning kernel generalize way
Date:   Tue, 15 Oct 2019 20:25:49 +0530
Message-Id: <20191015145548.24165-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch will remove old kernels from system selective way.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/prune-kernel | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/prune-kernel b/scripts/prune-kernel
index 74143f229f84..28fae6c91218 100755
--- a/scripts/prune-kernel
+++ b/scripts/prune-kernel
@@ -33,7 +33,7 @@ printf "\t\n Enlist the installed kernels \n\n\n"
 cd $boot_dir && pwd

 #Bash experts not recomend to run ls inside script,but you can by running that too
-# ls -1 vmlinuz-*
+# ls -1 vmlinuz-*

 #This is the recommended way , little complex but that's what people want to see!

@@ -42,10 +42,10 @@ find $boot_dir -name "vmlinuz-*" -type f -print0 -exec ls -1 {} \;
 printf "\n\n\n Well, we need to purge some kernel to gain some space.\n\n\n"


-printf "Please give the kernel version to remove: %s"
+printf "Please give the kernel version to remove: %s"
 read kernel_version

-remove_old_kernel
+remove_old_kernel

 printf "\n\n Remove associated modules too ... \n\n"

@@ -54,7 +54,7 @@ cd $modules_dir && pwd
 printf "\n\n\n Enlist the installed modules \n\n\n"

 #This is (-1) minus one not l(el)
-# ls -1
+# ls -1

 find $modules_dir -name "$kernel_version-*" -type f -print0 -exec ls -1 {} \;

@@ -66,14 +66,14 @@ rm -rf $modules_version
 printf "\n\n Done \n\n"

 printf "\n\n Want to remove another?[Yn] : %s"
-read response
+read response


 if [[ $response == "Y" ]]; then
- printf "Please give another version to remove : %s"
+ printf "Please give another version to remove : %s"
  read kernel_version

-remove_old_kernel
+remove_old_kernel

 elif [[ $response == "n" ]]; then

@@ -81,4 +81,4 @@ elif [[ $response == "n" ]]; then

 fi

-exit 0
+exit 0
--
2.21.0

