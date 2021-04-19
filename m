Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F744364D23
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 23:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbhDSViy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 17:38:54 -0400
Received: from terminus.zytor.com ([198.137.202.136]:60677 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229714AbhDSVix (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 17:38:53 -0400
X-Greylist: delayed 2559 seconds by postgrey-1.27 at vger.kernel.org; Mon, 19 Apr 2021 17:38:53 EDT
Received: from tazenda.hos.anvin.org ([IPv6:2601:646:8602:8be0:7285:c2ff:fefb:fd4])
        (authenticated bits=0)
        by mail.zytor.com (8.16.1/8.15.2) with ESMTPSA id 13JKslbW2399793
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 19 Apr 2021 13:54:58 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 13JKslbW2399793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2021032801; t=1618865698;
        bh=s4Q4KeT+aEE/OwsAE9aacFN8BXDaHZAzNphILgcRt3k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=B7wFVncMlEl0LsPcexbIIrru/6YdcNhrI1+H/ipS4EgVGRDPG4xJoVlovV6+ROBxn
         PqarEgDrRLLusc6s1YPTZU5VGh/4ljnHsZp+61ZAjZhInE/ZTIsZ6DQ6vPoFh+D/Y2
         Tvoe4MgUjtaiqXqS0kX+kCK1cCuswq/FmFBP0/EBvCTH4VnuJUrw5QK/jYJBBzeeAY
         e6IZ/eT75GXBXDcGp26YB04XbsBpKJycWH7xAPHABw67YkJeBWHE5BssI2LywuTMQB
         WZtU8DdE4SZ9ga4pJajaisaH2R7pqaQUOM88NcmtpqEiyrWdpp9SUS4YT6hS1R+Z7j
         HkPm/omtydE/g==
From:   "H. Peter Anvin" <hpa@zytor.com>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 3/3] x86/boot: Add option to add modules.img to {fd,hd,iso}image
Date:   Mon, 19 Apr 2021 13:54:38 -0700
Message-Id: <20210419205438.1531413-4-hpa@zytor.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210419205438.1531413-1-hpa@zytor.com>
References: <20210419205438.1531413-1-hpa@zytor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "H. Peter Anvin" (Intel) <hpa@zytor.com>

Make it easy to generate a disk image which includes the all-modules
initramfs image.

Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---
 arch/x86/Makefile      |  3 ++-
 arch/x86/boot/Makefile | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

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
index dfbc26a8e924..601ade7adc70 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -119,9 +119,20 @@ $(obj)/compressed/vmlinux: FORCE
 FDARGS =
 # Set this if you want one or more initrds included in the image
 FDINITRD =
+# Set this to 1 if you want usr/modules.img included in the image
+FDMODS =
 
 imgdeps = $(obj)/bzImage $(obj)/mtools.conf $(src)/genimage.sh
 
+ifneq ($(FDMODS),)
+imgdeps  += $(objtree)/usr/modules.img
+FDINITRD += $(objtree)/usr/modules.img
+
+$(objtree)/usr/modules.img:
+	$(Q)$(MAKE) -f $(srctree)/Makefile usr/modules.img
+KBUILD_MODULES := 1
+endif
+
 $(obj)/mtools.conf: $(src)/mtools.conf.in
 	sed -e 's|@OBJ@|$(obj)|g' < $< > $@
 
-- 
2.30.2

