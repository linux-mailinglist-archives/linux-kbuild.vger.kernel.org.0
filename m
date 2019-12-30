Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D390512D035
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Dec 2019 14:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfL3NUp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Dec 2019 08:20:45 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:64258 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbfL3NUo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Dec 2019 08:20:44 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id xBUDK8fI023590;
        Mon, 30 Dec 2019 22:20:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com xBUDK8fI023590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1577712010;
        bh=pnBt8xUVdXEnrnK1yEByI/0eROSFkY8hUgAQAoImYAQ=;
        h=From:To:Cc:Subject:Date:From;
        b=HluJL/CBuyQeAdk7OIIZRrd69Ejlmzhjkac59K+L68i5vhiA1d8Jcgjw3PIKCpkXk
         wHBZB7/bz6DhpNIKJKwdpntoXuFVJ1gOrTnAx4rwP+G3BfZdgqWubFhhUmstqKl45m
         bFswy6EsRIqxEmDC7sd/fQjsKMq7UBdjmA7HnNmEPGHprPGYaQHH/2vr7K/PvrwfxU
         pU5Aoa+c0HLFe1BnFfMmHSsiyMX5E+8TLFkNjpQslBRNcRGJ4dOB9/Mf3f7LkGmq5u
         2FYLKE0/7bfc5+7uyx3KVKRine7RokWDztzduVtLBYF+irc6X1ZtOMI2PTM0WoGNNU
         m3NOOqx+WeePA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     "Jory A . Pratt" <anarchy@gentoo.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] initramfs: fix 'bad variable name' error in gen_initramfs_list.sh
Date:   Mon, 30 Dec 2019 22:20:06 +0900
Message-Id: <20191230132006.7401-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Prior to commit 858805b336be ("kbuild: add $(BASH) to run scripts with
bash-extension"), this shell script was almost always run by bash since
bash is usually installed on the system by default.

Now, this script is run by sh, which might be a symlink to dash. On such
distros, the following code emits an error:

  local dev=`LC_ALL=C ls -l "${location}"`

You can reproduce the build error, for example by setting
CONFIG_INITRAMFS_SOURCE="/dev".

    GEN     usr/initramfs_data.cpio.gz
  ./usr/gen_initramfs_list.sh: 131: local: 1: bad variable name
  make[1]: *** [usr/Makefile:61: usr/initramfs_data.cpio.gz] Error 2

This is because `LC_ALL=C ls -l "${location}"` contains spaces.
Surrounding it with double-quotes fixes the error.

Fixes: 858805b336be ("kbuild: add $(BASH) to run scripts with bash-extension")
Reported-by: Jory A. Pratt <anarchy@gentoo.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/gen_initramfs_list.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/gen_initramfs_list.sh b/usr/gen_initramfs_list.sh
index 0aad760fcd8c..2bbac73e6477 100755
--- a/usr/gen_initramfs_list.sh
+++ b/usr/gen_initramfs_list.sh
@@ -128,7 +128,7 @@ parse() {
 			str="${ftype} ${name} ${location} ${str}"
 			;;
 		"nod")
-			local dev=`LC_ALL=C ls -l "${location}"`
+			local dev="`LC_ALL=C ls -l "${location}"`"
 			local maj=`field 5 ${dev}`
 			local min=`field 6 ${dev}`
 			maj=${maj%,}
-- 
2.17.1

