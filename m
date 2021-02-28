Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C12D32710A
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Feb 2021 07:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhB1GLq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Feb 2021 01:11:46 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:55342 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhB1GLp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Feb 2021 01:11:45 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 11S6Aagu009638;
        Sun, 28 Feb 2021 15:10:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 11S6Aagu009638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614492638;
        bh=wFJmglFoEgW+JEoX5Ob1iT5jv3nE+Vz/BGorJFXpFlQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kMvjtPYaDJ63B6Q0ElakJfGu9jywC7hvm+/lcNi9H+GtXV2g1OObL/rmuJHB19UxC
         atCn9fMTdr9jNirZXBU09uKjd8AVc1WuojPA1UvhToQBZdG7wHrZZI/XdJ+Yn1I5gN
         juDofy0mLCPBdelV67wUT9baEdcooNTyrJLixsrhn1KMUiupaECy8ZE4l+n+JSij7j
         x9t/SbWmrEjKSrA17JV9IA0pSG3zNZFfAF03G0Qvur2oGtXCl2ypRw1MrDqqfujiUA
         RxXiAD0gOxirqhfYRNRWOOkkSYvp4ykdohVi7Az5g2kR0nPQyHgdg1c6vxcWBaZnIT
         VjCfClEEgi8PQ==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 4/4] kbuild: include Makefile.compiler only when compiler is required
Date:   Sun, 28 Feb 2021 15:10:28 +0900
Message-Id: <20210228061028.239459-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210228061028.239459-1-masahiroy@kernel.org>
References: <20210228061028.239459-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit f2f02ebd8f38 ("kbuild: improve cc-option to clean up all
temporary files"), running 'make kernelversion' in a read-only source
tree emits a bunch of warnings:

  mkdir: cannot create directory '.tmp_12345': Permission denied

Non-build targets such as kernelversion, clean, help, etc. do not
need to evaluate $(call cc-option,) and friends. Do not include
Makefile.compiler so $(call cc-option,) becomes no-op.

This not only fix the warnings, but also runs non-build targets much
faster.

Basically, all installation targets should also be non-build targets.
Unfortunately, vdso_install requires the compiler because it builds
vdso before installtion. This is a problem that must be fixed by a
separate patch.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

I am not adding Reported-by for now because a reporter sent me
an email privately.

If he allows me to add Reported-by, I will add it to record
the credit.

(Perhaps, another person might have reported a similar issue
somewhere, but my memory is obsure. I cannot recall it.)


 Makefile | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Makefile b/Makefile
index eec7a94f5c33..20724711dc71 100644
--- a/Makefile
+++ b/Makefile
@@ -263,6 +263,10 @@ no-dot-config-targets := $(clean-targets) \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 outputmakefile
+# Installation targets should not require compiler. Unfortunately, vdso_install
+# is an exception where build artifacts may be updated. This must be fixed.
+no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
+			headers_install modules_install kernelrelease image_name
 no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease \
 			  image_name
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
@@ -270,6 +274,7 @@ single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
 config-build	:=
 mixed-build	:=
 need-config	:= 1
+need-compiler	:= 1
 may-sync-config	:= 1
 single-build	:=
 
@@ -279,6 +284,12 @@ ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
 	endif
 endif
 
+ifneq ($(filter $(no-compiler-targets), $(MAKECMDGOALS)),)
+	ifeq ($(filter-out $(no-compiler-targets), $(MAKECMDGOALS)),)
+		need-compiler :=
+	endif
+endif
+
 ifneq ($(filter $(no-sync-config-targets), $(MAKECMDGOALS)),)
 	ifeq ($(filter-out $(no-sync-config-targets), $(MAKECMDGOALS)),)
 		may-sync-config :=
@@ -584,7 +595,9 @@ endif
 
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
+ifdef need-compiler
 include $(srctree)/scripts/Makefile.compiler
+endif
 
 ifdef config-build
 # ===========================================================================
-- 
2.27.0

