Return-Path: <linux-kbuild+bounces-694-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B520E83F08D
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 23:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA8D3B23F5F
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 22:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741CF1B7FA;
	Sat, 27 Jan 2024 22:14:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01161D692
	for <linux-kbuild@vger.kernel.org>; Sat, 27 Jan 2024 22:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706393682; cv=none; b=bJ+wjC3bOKb5ObcCvRtlF/uhDQWzKWmt+wTVgRoEnKud/Zl2QyqNy96+dqVJbctwLt/HX2juWHMpOaB6vIz6+kjNVmjajyVHvpK1w3AQZAQKAdF2ItndC9mIr4zsgSMKLRWdcKSS0Rl3N2dyF76IJtprsM5GJXoNLvl+8kQ2FbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706393682; c=relaxed/simple;
	bh=Ukc7Ht1rivM64/nrzKpwbg81QtVJhl82u5AmtmJ/QFI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WtGIsU6w2oz2zse3ZL/y5UomN3jBObxO7G8FVLq1YafGPpXqVteGnucGJqSDcafo0dbBjS1r9KXq7u/C6XnWYZJ0AhBLeY3KyEWan6zLzc+f8QnwTM7ZL1eVUxSIfuYor92YJ3t9vf6LQrl9s9q3CR4Lcc4Htg41re8UNCPT7JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sf.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sf.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6dde173384aso1319554a34.1
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Jan 2024 14:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706393679; x=1706998479;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQC0HpKEwg8JljK4ofISFMi5mEmyQxzivzvlaqF6a38=;
        b=dYqVgdD12gLqEfrZD/J37yVFCg1nblHdULcS5qUo8W1pwwqiW3lWZ6znmte/MYUdIM
         2NM3qm3akQZwTyIFlHkrHlzz///LaQ6/PM2Gp7xg8VpX942DelysLJBPFmSVEInGEUU5
         pZ1fg4Q2HDoFq8SkSSZhaOLKLxfEXJb+2CS140Gqj3NfKo7luQjduhyr6qHNNvJTGsm5
         HIVCj93D82R48xs98kGJJxYcH420zopj/nggUAESfVCe+yLSkhYdzSSCGfEVVzii0LC0
         LH9Kh7OApgV+Y5Ou4YFkyBghAoII4gMlLX9QehjB2aGeeI7JAGDq2Ct9KjlIka2bJ8Tj
         +JYA==
X-Gm-Message-State: AOJu0Yy3Ufvq/zihKNVj/kmT3MveRFiT5FPAo7PFRqnr1eMXwAn+4YFJ
	hfRqccW9qJoyZjJXkyYj2NPP0G9QeQat6jq1nju3DuExXyM4bQx3klnqxHsg7W8FWRxmv0Dnx5d
	q0Y05/WAdQxy1T5/PncQNYXtr1vOx5KMdtNk=
X-Google-Smtp-Source: AGHT+IFHtdu6qWssn84KQslUIyRfkVrIW/J/FNhRnfDgblNOpYuvKJglGsDclVwbFbLcxUV5/+LRXp2mtrDg/NGSFBA=
X-Received: by 2002:a9d:7396:0:b0:6dc:6fac:40f9 with SMTP id
 j22-20020a9d7396000000b006dc6fac40f9mr2337061otk.39.1706393679518; Sat, 27
 Jan 2024 14:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dmitry Goncharov <dgoncharov@users.sf.net>
Date: Sat, 27 Jan 2024 17:14:28 -0500
Message-ID: <CAG+Z0CttsBe0_OoPeU3bVh9dg9DN_cUwcX2oC0Mj2uNxurehWA@mail.gmail.com>
Subject: kbuild: Port build system to the future versions of gnu make.
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Martin Dorey <martin.dorey@hitachivantara.com>
Content-Type: multipart/mixed; boundary="0000000000001e01d7060ff4bdff"

--0000000000001e01d7060ff4bdff
Content-Type: text/plain; charset="UTF-8"

Port build system to the future (post make-4.4.1) versions of gnu make.

Starting from https://git.savannah.gnu.org/cgit/make.git/commit/?id=07fcee35f058a876447c8a021f9eb1943f902534
gnu make won't allow conditionals to follow recipe prefix.

For example there is a tab followed by ifeq on line 324 in the root Makefile.
With the new make this conditional causes the following

$ make cpu.o
/home/dgoncharov/src/linux-kbuild/Makefile:2063: *** missing 'endif'.  Stop.
make: *** [Makefile:240: __sub-make] Error 2

See https://savannah.gnu.org/bugs/?64185 and
https://savannah.gnu.org/bugs/?64259 for details.

This patch replaces tabs followed by conditionals with 8 spaces.
In case the mailer program messes up the tabs and spaces in the diff,
i enclosed the same patch in the attachment.

Signed-off-by: Dmitry Goncharov <dgoncharov@users.sf.net>
Reported-by: Martin Dorey <martin.dorey@hitachivantara.com>

regards, Dmitry


diff --git a/Makefile b/Makefile
index 9869f57c3fb3..12dcc51c586a 100644
--- a/Makefile
+++ b/Makefile
@@ -294,15 +294,15 @@ may-sync-config    := 1
 single-build    :=

 ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
-    ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
+        ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
         need-config :=
-    endif
+        endif
 endif

 ifneq ($(filter $(no-sync-config-targets), $(MAKECMDGOALS)),)
-    ifeq ($(filter-out $(no-sync-config-targets), $(MAKECMDGOALS)),)
+        ifeq ($(filter-out $(no-sync-config-targets), $(MAKECMDGOALS)),)
         may-sync-config :=
-    endif
+        endif
 endif

 need-compiler := $(may-sync-config)
@@ -323,9 +323,9 @@ endif
 # We cannot build single targets and the others at the same time
 ifneq ($(filter $(single-targets), $(MAKECMDGOALS)),)
     single-build := 1
-    ifneq ($(filter-out $(single-targets), $(MAKECMDGOALS)),)
+        ifneq ($(filter-out $(single-targets), $(MAKECMDGOALS)),)
         mixed-build := 1
-    endif
+        endif
 endif

 # For "make -j clean all", "make -j mrproper defconfig all", etc.
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 43e39040d3ac..76ef1a67c361 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -15,10 +15,10 @@
 KBUILD_DEFCONFIG := multi_defconfig

 ifdef cross_compiling
-    ifeq ($(CROSS_COMPILE),)
+        ifeq ($(CROSS_COMPILE),)
         CROSS_COMPILE := $(call cc-cross-prefix, \
             m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
-    endif
+        endif
 endif

 #
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 920db57b6b4c..7486b3b30594 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -50,12 +50,12 @@ export CROSS32CC

 # Set default cross compiler for kernel build
 ifdef cross_compiling
-    ifeq ($(CROSS_COMPILE),)
+        ifeq ($(CROSS_COMPILE),)
         CC_SUFFIXES = linux linux-gnu unknown-linux-gnu suse-linux
         CROSS_COMPILE := $(call cc-cross-prefix, \
             $(foreach a,$(CC_ARCHES), \
             $(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
-    endif
+        endif
 endif

 ifdef CONFIG_DYNAMIC_FTRACE
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 1a068de12a56..2264db14a25d 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -112,13 +112,13 @@ ifeq ($(CONFIG_X86_32),y)
         # temporary until string.h is fixed
         KBUILD_CFLAGS += -ffreestanding

-    ifeq ($(CONFIG_STACKPROTECTOR),y)
-        ifeq ($(CONFIG_SMP),y)
+        ifeq ($(CONFIG_STACKPROTECTOR),y)
+                ifeq ($(CONFIG_SMP),y)
             KBUILD_CFLAGS += -mstack-protector-guard-reg=fs
-mstack-protector-guard-symbol=__stack_chk_guard
-        else
+                else
             KBUILD_CFLAGS += -mstack-protector-guard=global
-        endif
-    endif
+                endif
+        endif
 else
         BITS := 64
         UTS_MACHINE := x86_64

--0000000000001e01d7060ff4bdff
Content-Type: text/x-patch; charset="US-ASCII"; name="tabs_and_cond.diff"
Content-Disposition: attachment; filename="tabs_and_cond.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lrwmnumq0>
X-Attachment-Id: f_lrwmnumq0

ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggOTg2OWY1N2MzZmIzLi4xMmRj
YzUxYzU4NmEgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0yOTQsMTUg
KzI5NCwxNSBAQCBtYXktc3luYy1jb25maWcJOj0gMQogc2luZ2xlLWJ1aWxkCTo9CiAKIGlmbmVx
ICgkKGZpbHRlciAkKG5vLWRvdC1jb25maWctdGFyZ2V0cyksICQoTUFLRUNNREdPQUxTKSksKQot
CWlmZXEgKCQoZmlsdGVyLW91dCAkKG5vLWRvdC1jb25maWctdGFyZ2V0cyksICQoTUFLRUNNREdP
QUxTKSksKQorICAgICAgICBpZmVxICgkKGZpbHRlci1vdXQgJChuby1kb3QtY29uZmlnLXRhcmdl
dHMpLCAkKE1BS0VDTURHT0FMUykpLCkKIAkJbmVlZC1jb25maWcgOj0KLQllbmRpZgorICAgICAg
ICBlbmRpZgogZW5kaWYKIAogaWZuZXEgKCQoZmlsdGVyICQobm8tc3luYy1jb25maWctdGFyZ2V0
cyksICQoTUFLRUNNREdPQUxTKSksKQotCWlmZXEgKCQoZmlsdGVyLW91dCAkKG5vLXN5bmMtY29u
ZmlnLXRhcmdldHMpLCAkKE1BS0VDTURHT0FMUykpLCkKKyAgICAgICAgaWZlcSAoJChmaWx0ZXIt
b3V0ICQobm8tc3luYy1jb25maWctdGFyZ2V0cyksICQoTUFLRUNNREdPQUxTKSksKQogCQltYXkt
c3luYy1jb25maWcgOj0KLQllbmRpZgorICAgICAgICBlbmRpZgogZW5kaWYKIAogbmVlZC1jb21w
aWxlciA6PSAkKG1heS1zeW5jLWNvbmZpZykKQEAgLTMyMyw5ICszMjMsOSBAQCBlbmRpZgogIyBX
ZSBjYW5ub3QgYnVpbGQgc2luZ2xlIHRhcmdldHMgYW5kIHRoZSBvdGhlcnMgYXQgdGhlIHNhbWUg
dGltZQogaWZuZXEgKCQoZmlsdGVyICQoc2luZ2xlLXRhcmdldHMpLCAkKE1BS0VDTURHT0FMUykp
LCkKIAlzaW5nbGUtYnVpbGQgOj0gMQotCWlmbmVxICgkKGZpbHRlci1vdXQgJChzaW5nbGUtdGFy
Z2V0cyksICQoTUFLRUNNREdPQUxTKSksKQorICAgICAgICBpZm5lcSAoJChmaWx0ZXItb3V0ICQo
c2luZ2xlLXRhcmdldHMpLCAkKE1BS0VDTURHT0FMUykpLCkKIAkJbWl4ZWQtYnVpbGQgOj0gMQot
CWVuZGlmCisgICAgICAgIGVuZGlmCiBlbmRpZgogCiAjIEZvciAibWFrZSAtaiBjbGVhbiBhbGwi
LCAibWFrZSAtaiBtcnByb3BlciBkZWZjb25maWcgYWxsIiwgZXRjLgpkaWZmIC0tZ2l0IGEvYXJj
aC9tNjhrL01ha2VmaWxlIGIvYXJjaC9tNjhrL01ha2VmaWxlCmluZGV4IDQzZTM5MDQwZDNhYy4u
NzZlZjFhNjdjMzYxIDEwMDY0NAotLS0gYS9hcmNoL202OGsvTWFrZWZpbGUKKysrIGIvYXJjaC9t
NjhrL01ha2VmaWxlCkBAIC0xNSwxMCArMTUsMTAgQEAKIEtCVUlMRF9ERUZDT05GSUcgOj0gbXVs
dGlfZGVmY29uZmlnCiAKIGlmZGVmIGNyb3NzX2NvbXBpbGluZwotCWlmZXEgKCQoQ1JPU1NfQ09N
UElMRSksKQorICAgICAgICBpZmVxICgkKENST1NTX0NPTVBJTEUpLCkKIAkJQ1JPU1NfQ09NUElM
RSA6PSAkKGNhbGwgY2MtY3Jvc3MtcHJlZml4LCBcCiAJCQltNjhrLWxpbnV4LWdudS0gbTY4ay1s
aW51eC0gbTY4ay11bmtub3duLWxpbnV4LWdudS0pCi0JZW5kaWYKKyAgICAgICAgZW5kaWYKIGVu
ZGlmCiAKICMKZGlmZiAtLWdpdCBhL2FyY2gvcGFyaXNjL01ha2VmaWxlIGIvYXJjaC9wYXJpc2Mv
TWFrZWZpbGUKaW5kZXggOTIwZGI1N2I2YjRjLi43NDg2YjNiMzA1OTQgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcGFyaXNjL01ha2VmaWxlCisrKyBiL2FyY2gvcGFyaXNjL01ha2VmaWxlCkBAIC01MCwxMiAr
NTAsMTIgQEAgZXhwb3J0IENST1NTMzJDQwogCiAjIFNldCBkZWZhdWx0IGNyb3NzIGNvbXBpbGVy
IGZvciBrZXJuZWwgYnVpbGQKIGlmZGVmIGNyb3NzX2NvbXBpbGluZwotCWlmZXEgKCQoQ1JPU1Nf
Q09NUElMRSksKQorICAgICAgICBpZmVxICgkKENST1NTX0NPTVBJTEUpLCkKIAkJQ0NfU1VGRklY
RVMgPSBsaW51eCBsaW51eC1nbnUgdW5rbm93bi1saW51eC1nbnUgc3VzZS1saW51eAogCQlDUk9T
U19DT01QSUxFIDo9ICQoY2FsbCBjYy1jcm9zcy1wcmVmaXgsIFwKIAkJCSQoZm9yZWFjaCBhLCQo
Q0NfQVJDSEVTKSwgXAogCQkJJChmb3JlYWNoIHMsJChDQ19TVUZGSVhFUyksJChhKS0kKHMpLSkp
KQotCWVuZGlmCisgICAgICAgIGVuZGlmCiBlbmRpZgogCiBpZmRlZiBDT05GSUdfRFlOQU1JQ19G
VFJBQ0UKZGlmZiAtLWdpdCBhL2FyY2gveDg2L01ha2VmaWxlIGIvYXJjaC94ODYvTWFrZWZpbGUK
aW5kZXggMWEwNjhkZTEyYTU2Li4yMjY0ZGIxNGEyNWQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L01h
a2VmaWxlCisrKyBiL2FyY2gveDg2L01ha2VmaWxlCkBAIC0xMTIsMTMgKzExMiwxMyBAQCBpZmVx
ICgkKENPTkZJR19YODZfMzIpLHkpCiAgICAgICAgICMgdGVtcG9yYXJ5IHVudGlsIHN0cmluZy5o
IGlzIGZpeGVkCiAgICAgICAgIEtCVUlMRF9DRkxBR1MgKz0gLWZmcmVlc3RhbmRpbmcKIAotCWlm
ZXEgKCQoQ09ORklHX1NUQUNLUFJPVEVDVE9SKSx5KQotCQlpZmVxICgkKENPTkZJR19TTVApLHkp
CisgICAgICAgIGlmZXEgKCQoQ09ORklHX1NUQUNLUFJPVEVDVE9SKSx5KQorICAgICAgICAgICAg
ICAgIGlmZXEgKCQoQ09ORklHX1NNUCkseSkKIAkJCUtCVUlMRF9DRkxBR1MgKz0gLW1zdGFjay1w
cm90ZWN0b3ItZ3VhcmQtcmVnPWZzIC1tc3RhY2stcHJvdGVjdG9yLWd1YXJkLXN5bWJvbD1fX3N0
YWNrX2Noa19ndWFyZAotCQllbHNlCisgICAgICAgICAgICAgICAgZWxzZQogCQkJS0JVSUxEX0NG
TEFHUyArPSAtbXN0YWNrLXByb3RlY3Rvci1ndWFyZD1nbG9iYWwKLQkJZW5kaWYKLQllbmRpZgor
ICAgICAgICAgICAgICAgIGVuZGlmCisgICAgICAgIGVuZGlmCiBlbHNlCiAgICAgICAgIEJJVFMg
Oj0gNjQKICAgICAgICAgVVRTX01BQ0hJTkUgOj0geDg2XzY0Cg==
--0000000000001e01d7060ff4bdff--

