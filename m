Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC421E9DB0
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgFAF6X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:23 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40001 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLu023694;
        Mon, 1 Jun 2020 14:57:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLu023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991064;
        bh=xEwBuIuAsXFW3T3cgYIqwXll9ICSzKqdHziSibBV4r8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mE5SWFl3NGbRi+MdSUSQX6XucTSz76bYsltEVTqJ8xFczu0wbjx98koQX522dkMHb
         5OXdBHUZC7C9aFqtBwscAIjtyTH0iVRoES4Z3cCIc1VMSa3wlh79vI/Ri3vfmFNirU
         Wm9BIw+vHFjh8lXCwInVHPlE4E1Sq/1c2cwR4AYykduXm1tYuwCwY07iG5mvyme3N7
         rJSKT+YtrnjlZOn2yz4V6AemKEz2XX5tDlP8ty8aKv61EzEVH14LmgPsiyJr22JuMv
         5AXFJiqydHiYvxjHXtPmYdVqvMnO1JmVlZ+JgR33ay6ZdU5u/nPOkMnvXJlF3qWW3e
         gLC5rzW7lRy5w==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 17/37] modpost: generate vmlinux.symvers and reuse it for the second modpost
Date:   Mon,  1 Jun 2020 14:57:11 +0900
Message-Id: <20200601055731.3006266-17-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The full build runs modpost twice, first for vmlinux.o and second for
modules.

The first pass dumps all the vmlinux symbols into Module.symvers, but
the second pass parses vmlinux again instead of reusing the dump file,
presumably because it needs to avoid accumulating stale symbols.

Loading symbol info from a dump file is faster than parsing an ELF object.
Besides, modpost deals with various issues to parse vmlinux in the second
pass.

A solution is to make the first pass dumps symbols into a separate file,
vmlinux.symvers. The second pass reads it, and parses module .o files.
The merged symbol information is dumped into Module.symvers in the same
way as before.

This makes further modpost cleanups possible.

Also, it fixes the problem of 'make vmlinux', which previously overwrote
Module.symvers, throwing away module symbols.

I slightly touched scripts/link-vmlinux.sh so that vmlinux is re-linked
when you cross this commit. Otherwise, vmlinux.symvers would not be
generated.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .gitignore               | 1 +
 Documentation/dontdiff   | 1 +
 Makefile                 | 2 +-
 scripts/Makefile.modpost | 7 ++++---
 scripts/link-vmlinux.sh  | 2 --
 5 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/.gitignore b/.gitignore
index 2258e906f01c..87b9dd8a163b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -56,6 +56,7 @@ modules.order
 /linux
 /vmlinux
 /vmlinux.32
+/vmlinux.symvers
 /vmlinux-gdb.py
 /vmlinuz
 /System.map
diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index 72fc2e9e2b63..ef9519c32c55 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -251,6 +251,7 @@ vmlinux-*
 vmlinux.aout
 vmlinux.bin.all
 vmlinux.lds
+vmlinux.symvers
 vmlinuz
 voffset.h
 vsyscall.lds
diff --git a/Makefile b/Makefile
index b40420a0b991..6280c7597a2d 100644
--- a/Makefile
+++ b/Makefile
@@ -1416,7 +1416,7 @@ endif # CONFIG_MODULES
 # make distclean Remove editor backup files, patch leftover files and the like
 
 # Directories & files removed with 'make clean'
-CLEAN_FILES += include/ksym \
+CLEAN_FILES += include/ksym vmlinux.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps
 
 # Directories & files removed with 'make mrproper'
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 6808086075b6..6db692a5d547 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -55,10 +55,10 @@ ifdef MODPOST_VMLINUX
 quiet_cmd_modpost = MODPOST $@
       cmd_modpost = $(MODPOST) $<
 
-Module.symvers: vmlinux.o
+vmlinux.symvers: vmlinux.o
 	$(call cmd,modpost)
 
-__modpost: Module.symvers
+__modpost: vmlinux.symvers
 
 else
 
@@ -66,7 +66,8 @@ MODPOST += -s \
 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
 
 ifeq ($(KBUILD_EXTMOD),)
-MODPOST += $(wildcard vmlinux)
+
+input-symdump := vmlinux.symvers
 output-symdump := Module.symvers
 
 else
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index d09ab4afbda4..d5af6be50b50 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -218,8 +218,6 @@ on_signals()
 }
 trap on_signals HUP INT QUIT TERM
 
-#
-#
 # Use "make V=1" to debug this script
 case "${KBUILD_VERBOSE}" in
 *1*)
-- 
2.25.1

