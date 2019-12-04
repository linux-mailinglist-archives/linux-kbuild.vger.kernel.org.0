Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5A41135AF
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2019 20:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbfLDT1Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Dec 2019 14:27:16 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:35844 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727910AbfLDT1Q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 14:27:16 -0500
Received: from [IPv6:2601:2c1:380:2390:953d:2f64:f809:46b1] (unknown [IPv6:2601:2c1:380:2390:953d:2f64:f809:46b1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: anarchy)
        by smtp.gentoo.org (Postfix) with ESMTPSA id E60CB34D7DA;
        Wed,  4 Dec 2019 19:27:14 +0000 (UTC)
To:     yamada.masahiro@socionext.com
Cc:     linux-kbuild@vger.kernel.org
From:   "Jory A. Pratt" <anarchy@gentoo.org>
Subject: [PATCH]gen_initramfs_list.sh failure with CONFIG_SHELL
Autocrypt: addr=anarchy@gentoo.org; keydata=
 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
 ywhqU77N5mk6PLfTTfg=
Message-ID: <73e4e767-efd3-849a-1d7e-0e2a05fe5149@gentoo.org>
Date:   Wed, 4 Dec 2019 13:27:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------D03701D7E36836FD45BA1BA1"
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------D03701D7E36836FD45BA1BA1
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

As stated in patch the script is a non posix bash script and should use
bash instead of config_shell


--------------D03701D7E36836FD45BA1BA1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-gen_initramfs_list.sh-is-a-bash-script-that-isn-t-po.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-gen_initramfs_list.sh-is-a-bash-script-that-isn-t-po.pa";
 filename*1="tch"

From 6a7ef73882393e23e966e7b53e7b03397ad18e63 Mon Sep 17 00:00:00 2001
From: Jory Pratt <anarchy@gentoo.org>
Date: Wed, 4 Dec 2019 09:30:17 -0600
Subject: [PATCH] gen_initramfs_list.sh is a bash script that isn't posix
 compliant.

This ensures we call bash instead of sh which could be dash or any other
shell that is not compatible with the script.

Signed-off-by: Jory Pratt <anarchy@gentoo.org>
---
 usr/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/Makefile b/usr/Makefile
index e6f7cb2f81db..27987f18eb20 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -27,7 +27,7 @@ $(obj)/initramfs_data.o: $(obj)/$(datafile_y) FORCE
 # Generate the initramfs cpio archive
 
 hostprogs-y := gen_init_cpio
-initramfs   := $(CONFIG_SHELL) $(srctree)/$(src)/gen_initramfs_list.sh
+initramfs   := $(BASH) $(srctree)/$(src)/gen_initramfs_list.sh
 ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
 			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)
 ramfs-args  := \
-- 
2.24.0


--------------D03701D7E36836FD45BA1BA1--
