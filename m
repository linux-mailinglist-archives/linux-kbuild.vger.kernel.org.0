Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB6E364E62
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Apr 2021 01:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhDSXEM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 19:04:12 -0400
Received: from terminus.zytor.com ([198.137.202.136]:44739 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230313AbhDSXED (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 19:04:03 -0400
Received: from tazenda.hos.anvin.org ([IPv6:2601:646:8602:8be0:7285:c2ff:fefb:fd4])
        (authenticated bits=0)
        by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 13JN30Cr2438940
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 19 Apr 2021 16:03:10 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 13JN30Cr2438940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2021032801; t=1618873391;
        bh=uQxKDq5WJW9LX8Lc89n/uYaD3Bpj07+hyQ+Dey+xIZI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Rl5uypQgQjmFC1EY+LA/3pJdUfysNSrpUAjqeiFnksj/vwtBB9XmyquEw+Z4lPtjc
         geXpzOyRlmjR24KfRubdigoXpFnsZetVAofSxvn+tr9hLpTJi/GKkTpyK0ER3Mutu2
         rKz2Eu1pfRNl0YXIMGjAbfv4V8bbfyB0C8KMg7y5xeuBrI1yv8v/pksx9/65ss3+O1
         /MAD+4NXzI+QBUySZ5dr51EnzBgp7iQP7S7A/8VCTjggU4SkChENwroBr3DL89Vz7w
         k1rUV6oMeWjOp8Q1Sl4j5JsiS6MeDFTEHarfBBTmtnKxxFtTtP8McUgUlLImUxD94q
         euebZCM58DH/w==
From:   "H. Peter Anvin" <hpa@zytor.com>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
        "H. Peter Anvin (Intel)" <hpa@zytor.com>
Subject: [PATCH v2 3/3] x86/boot: Add option to add modules.img to {fd,hd,iso}image
Date:   Mon, 19 Apr 2021 16:02:52 -0700
Message-Id: <20210419230252.1583169-4-hpa@zytor.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419230252.1583169-1-hpa@zytor.com>
References: <20210419230252.1583169-1-hpa@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "H. Peter Anvin (Intel)" <hpa@zytor.com>

Make it easy to generate a disk image which includes the all-modules
initramfs image.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/Makefile      |  3 ++-
 arch/x86/boot/Makefile | 20 ++++++++++++++++----
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 943f26a32834..74f4e66568d7 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -309,7 +309,8 @@ define archhelp
   echo  '  isoimage		- Create a boot CD-ROM image (arch/x86/boot/image.iso)'
   echo  '			  bzdisk/fdimage*/hdimage/isoimage also accept:'
   echo  '			  FDARGS="..."  arguments for the booted kernel'
-  echo  '                  	  FDINITRD=file initrd for the booted kernel'
+  echo  '			  FDINITRD=file initrd for the booted kernel'
+  echo  '			  FDMODS=1 to include all modules as an initrd'
   echo  ''
   echo  '  kvm_guest.config	- Enable Kconfig items for running this kernel as a KVM guest'
   echo  '  xen.config		- Enable Kconfig items for running this kernel as a Xen guest'
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index dfbc26a8e924..a4f8c66a63d0 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -116,11 +116,23 @@ $(obj)/compressed/vmlinux: FORCE
 
 # Set this if you want to pass append arguments to the
 # bzdisk/fdimage/hdimage/isoimage kernel
-FDARGS =
+FDARGS   :=
 # Set this if you want one or more initrds included in the image
-FDINITRD =
+FDINITRD :=
+# Set this to 1 if you want usr/modules.img included in the image
+FDMODS   :=
 
-imgdeps = $(obj)/bzImage $(obj)/mtools.conf $(src)/genimage.sh
+imgdeps   := $(obj)/bzImage $(obj)/mtools.conf $(src)/genimage.sh
+fdinitrds := $(FDINITRD)
+
+ifneq ($(FDMODS),)
+imgdeps   += $(objtree)/usr/modules.img
+fdinitrds += $(objtree)/usr/modules.img
+
+$(objtree)/usr/modules.img:
+	$(Q)$(MAKE) -f $(srctree)/Makefile usr/modules.img
+KBUILD_MODULES := 1
+endif
 
 $(obj)/mtools.conf: $(src)/mtools.conf.in
 	sed -e 's|@OBJ@|$(obj)|g' < $< > $@
@@ -131,7 +143,7 @@ targets += mtools.conf
 # external dependencies.
 quiet_cmd_genimage = GENIMAGE $3
 cmd_genimage = $(BASH) $(srctree)/$(src)/genimage.sh $2 $3 $(obj)/bzImage \
-		$(obj)/mtools.conf '$(FDARGS)' $(FDINITRD)
+		$(obj)/mtools.conf '$(FDARGS)' $(fdinitrds)
 
 PHONY += bzdisk fdimage fdimage144 fdimage288 hdimage isoimage install
 
-- 
2.30.2

