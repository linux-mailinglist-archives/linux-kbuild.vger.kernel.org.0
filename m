Return-Path: <linux-kbuild+bounces-1028-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 670A385EC9A
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 00:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C49B91F2342E
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 23:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232DA8663D;
	Wed, 21 Feb 2024 23:16:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0508C3EA8E
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 23:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708557415; cv=none; b=nXwFLpppQ3AhHbqrgAwPnhos63/lqhZQXPxpiFQ/NeJlBVA8RGT6qRC7nWZYbmvLySFxO9LMllGzSmrAyk+rf8sPSqLD7zF5m2ZlTkMVi8yeF2UXNUBcjskoHJQIcL8b7WJt+fPL+yBHYKy2NS4FpXtCDB/y8m7OZAlnJa81U7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708557415; c=relaxed/simple;
	bh=ENBz9WHTzaYFbwqUAG5oLTvsRAprTXEgiBfkXPqlg7E=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=rdM8MJMDRVACv54qEnUUHf6fPALEZ7Ii3TiEAcFClw4aqQRTL/hkjBE8RTWnkUOX4/cbdHkLyVrN+eO2BVlG7vp3RKMxYtVaTtGqKlu17En+EFIOXsFf6P41R/YsvqzTTbtBPBgH9QXCfvtFmAAen5uM6PyBH4h6BWfFGiJLrWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=drgnwing.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=drgnwing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 41LNGTsd041146
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 21 Feb 2024 18:16:35 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 41LNGTR0041143;
	Wed, 21 Feb 2024 15:16:29 -0800 (PST)
	(envelope-from ehem)
Message-Id: <b3207b3dc5df34b43e1aa40a91e255ab9ae069a4.1708478592.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1708478591.git.ehem+linux@m5p.com>
References: <cover.1708478591.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+raspberrypi@drgnwing.com>
Date: Tue, 20 Feb 2024 09:13:37 -0800
Subject: [PATCH RFC 1/3] build: add trailing slash to $(srctree)
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

This better handles the case of $(srctree) being the current directory
and $(src) being an absolute path.  Instead of being ".", $(srctree)
ends up empty, and $(src) can be directly appended.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
I suspect the Makefile sections besides the top-level are attempting to
solve the *exact* *same* issue.  Problem is that workaround requires
changes in every Makefile, whereas this looks closer to the root cause.

I'm less than 100% sure I've avoided all spacing changes.  I forget
where, but I seem to recall running into a space which was instead a tab.
---
 Makefile                                    | 8 ++++----
 tools/bootconfig/Makefile                   | 4 ++--
 tools/bpf/Makefile                          | 4 ++--
 tools/bpf/bpftool/Makefile                  | 6 +++---
 tools/build/Makefile                        | 4 ++--
 tools/counter/Makefile                      | 4 ++--
 tools/gpio/Makefile                         | 4 ++--
 tools/hv/Makefile                           | 4 ++--
 tools/iio/Makefile                          | 4 ++--
 tools/include/nolibc/Makefile               | 2 +-
 tools/lib/api/Makefile                      | 6 +++---
 tools/lib/bpf/Makefile                      | 6 +++---
 tools/lib/perf/Makefile                     | 6 +++---
 tools/lib/subcmd/Makefile                   | 6 +++---
 tools/lib/symbol/Makefile                   | 6 +++---
 tools/lib/thermal/Makefile                  | 6 +++---
 tools/objtool/Makefile                      | 4 ++--
 tools/pci/Makefile                          | 4 ++--
 tools/perf/Makefile.perf                    | 4 ++--
 tools/power/acpi/Makefile.config            | 4 ++--
 tools/power/x86/intel-speed-select/Makefile | 8 ++++----
 tools/spi/Makefile                          | 4 ++--
 tools/testing/selftests/nolibc/Makefile     | 2 +-
 tools/thermal/lib/Makefile                  | 6 +++---
 tools/thermal/thermal-engine/Makefile       | 6 +++---
 tools/thermal/thermometer/Makefile          | 6 +++---
 tools/usb/Makefile                          | 4 ++--
 27 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/Makefile b/Makefile
index 41fa8a2565f5..a957ffe04647 100644
--- a/Makefile
+++ b/Makefile
@@ -246,20 +246,20 @@ else # need-sub-make
 
 ifeq ($(abs_srctree),$(abs_objtree))
         # building in the source tree
-        srctree := .
+        srctree := ./
 	building_out_of_srctree :=
 else
         ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
                 # building in a subdirectory of the source tree
-                srctree := ..
+                srctree := ../
         else
-                srctree := $(abs_srctree)
+                srctree := $(abs_srctree)/
         endif
 	building_out_of_srctree := 1
 endif
 
 ifneq ($(KBUILD_ABS_SRCTREE),)
-srctree := $(abs_srctree)
+srctree := $(abs_srctree)/
 endif
 
 objtree		:= .
diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index 566c3e0ee561..605c0798a83d 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -5,8 +5,8 @@ include ../scripts/Makefile.include
 bindir ?= /usr/bin
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 LIBSRC = $(srctree)/lib/bootconfig.c $(srctree)/include/linux/bootconfig.h
diff --git a/tools/bpf/Makefile b/tools/bpf/Makefile
index 243b79f2b451..b12ff0126cf6 100644
--- a/tools/bpf/Makefile
+++ b/tools/bpf/Makefile
@@ -23,8 +23,8 @@ ifndef building_out_of_srctree
 update_srctree := 1
 endif
 ifeq ($(update_srctree),1)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 ifeq ($(V),1)
diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
index e9154ace80ff..34b55ae53d0a 100644
--- a/tools/bpf/bpftool/Makefile
+++ b/tools/bpf/bpftool/Makefile
@@ -2,9 +2,9 @@
 include ../../scripts/Makefile.include
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 ifeq ($(V),1)
diff --git a/tools/build/Makefile b/tools/build/Makefile
index 17cdf01e29a0..cdebad6f1bfb 100644
--- a/tools/build/Makefile
+++ b/tools/build/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 include $(srctree)/tools//scripts/Makefile.include
diff --git a/tools/counter/Makefile b/tools/counter/Makefile
index d82d35a520f6..3d23639fa8fc 100644
--- a/tools/counter/Makefile
+++ b/tools/counter/Makefile
@@ -4,8 +4,8 @@ include ../scripts/Makefile.include
 bindir ?= /usr/bin
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 # Do not use make's built-in rules
diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
index d29c9c49e251..0828ee9e8a16 100644
--- a/tools/gpio/Makefile
+++ b/tools/gpio/Makefile
@@ -8,8 +8,8 @@ bindir ?= /usr/bin
 # is set to ".". building_out_of_srctree is undefined for in srctree
 # builds
 ifndef building_out_of_srctree
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 # Do not use make's built-in rules
diff --git a/tools/hv/Makefile b/tools/hv/Makefile
index fe770e679ae8..6b9f42743c57 100644
--- a/tools/hv/Makefile
+++ b/tools/hv/Makefile
@@ -7,8 +7,8 @@ libexecdir ?= /usr/libexec
 sharedstatedir ?= /var/lib
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 # Do not use make's built-in rules
diff --git a/tools/iio/Makefile b/tools/iio/Makefile
index fa720f062229..f4f64a152457 100644
--- a/tools/iio/Makefile
+++ b/tools/iio/Makefile
@@ -4,8 +4,8 @@ include ../scripts/Makefile.include
 bindir ?= /usr/bin
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 # Do not use make's built-in rules
diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index e69c26abe1ea..372a17bf7d36 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -4,7 +4,7 @@ include ../../scripts/Makefile.include
 
 # we're in ".../tools/include/nolibc"
 ifeq ($(srctree),)
-srctree := $(patsubst %/tools/include/,%,$(dir $(CURDIR)))
+srctree := $(patsubst %tools/include/,%,$(dir $(CURDIR)))
 endif
 
 # when run as make -C tools/ nolibc_<foo> the arch is not set
diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index 044860ac1ed1..74e774984d83 100644
--- a/tools/lib/api/Makefile
+++ b/tools/lib/api/Makefile
@@ -3,9 +3,9 @@ include ../../scripts/Makefile.include
 include ../../scripts/utilities.mak		# QUIET_CLEAN
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index 4be7144e4803..66970cf138fc 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -18,9 +18,9 @@ MAKEFLAGS += --no-print-directory
 # is a ".". building_out_of_srctree is undefined for in srctree
 # builds
 ifndef building_out_of_srctree
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/lib/perf/Makefile b/tools/lib/perf/Makefile
index 3a9b2140aa04..3e998b2af153 100644
--- a/tools/lib/perf/Makefile
+++ b/tools/lib/perf/Makefile
@@ -8,9 +8,9 @@ LIBPERF_EXTRAVERSION = 1
 MAKEFLAGS += --no-print-directory
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
index b87213263a5e..fdd0bf03fd6d 100644
--- a/tools/lib/subcmd/Makefile
+++ b/tools/lib/subcmd/Makefile
@@ -3,9 +3,9 @@ include ../../scripts/Makefile.include
 include ../../scripts/utilities.mak		# QUIET_CLEAN
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/lib/symbol/Makefile b/tools/lib/symbol/Makefile
index 13d43c6f92b4..1f2390d1c0e0 100644
--- a/tools/lib/symbol/Makefile
+++ b/tools/lib/symbol/Makefile
@@ -3,9 +3,9 @@ include ../../scripts/Makefile.include
 include ../../scripts/utilities.mak		# QUIET_CLEAN
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/lib/thermal/Makefile b/tools/lib/thermal/Makefile
index 2d0d255fd0e1..8c78b2540156 100644
--- a/tools/lib/thermal/Makefile
+++ b/tools/lib/thermal/Makefile
@@ -8,9 +8,9 @@ LIBTHERMAL_EXTRAVERSION = 1
 MAKEFLAGS += --no-print-directory
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 # $(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 83b100c1e7f6..714bf362b59c 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -3,8 +3,8 @@ include ../scripts/Makefile.include
 include ../scripts/Makefile.arch
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
diff --git a/tools/pci/Makefile b/tools/pci/Makefile
index 57744778b518..913c9d29bfb2 100644
--- a/tools/pci/Makefile
+++ b/tools/pci/Makefile
@@ -4,8 +4,8 @@ include ../scripts/Makefile.include
 bindir ?= /usr/bin
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 # Do not use make's built-in rules
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f8774a9b1377..4ff08babcecc 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -144,8 +144,8 @@ LC_NUMERIC=C
 export LC_COLLATE LC_NUMERIC
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/power/acpi/Makefile.config b/tools/power/acpi/Makefile.config
index cd7106876a5f..7df61e8ad7be 100644
--- a/tools/power/acpi/Makefile.config
+++ b/tools/power/acpi/Makefile.config
@@ -6,8 +6,8 @@
 #
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(shell pwd)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
index 7221f2f55e8b..fcb13e08effe 100644
--- a/tools/power/x86/intel-speed-select/Makefile
+++ b/tools/power/x86/intel-speed-select/Makefile
@@ -4,10 +4,10 @@ include ../../../scripts/Makefile.include
 bindir ?= /usr/bin
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 # Do not use make's built-in rules
diff --git a/tools/spi/Makefile b/tools/spi/Makefile
index 7fccd245a535..c511864f270b 100644
--- a/tools/spi/Makefile
+++ b/tools/spi/Makefile
@@ -4,8 +4,8 @@ include ../scripts/Makefile.include
 bindir ?= /usr/bin
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
 endif
 
 # Do not use make's built-in rules
diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 40dd95228051..acfd59dcba56 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -13,7 +13,7 @@ endif
 
 # we're in ".../tools/testing/selftests/nolibc"
 ifeq ($(srctree),)
-srctree := $(patsubst %/tools/testing/selftests/,%,$(dir $(CURDIR)))
+srctree := $(patsubst %tools/testing/selftests/,%,$(dir $(CURDIR)))
 endif
 
 ifeq ($(ARCH),)
diff --git a/tools/thermal/lib/Makefile b/tools/thermal/lib/Makefile
index 82db451935c5..f5323c5a9ca0 100644
--- a/tools/thermal/lib/Makefile
+++ b/tools/thermal/lib/Makefile
@@ -8,9 +8,9 @@ LIBTHERMAL_TOOLS_EXTRAVERSION = 1
 MAKEFLAGS += --no-print-directory
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 # $(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/thermal/thermal-engine/Makefile b/tools/thermal/thermal-engine/Makefile
index 6bd05ff89485..5bc3bc70a418 100644
--- a/tools/thermal/thermal-engine/Makefile
+++ b/tools/thermal/thermal-engine/Makefile
@@ -2,9 +2,9 @@
 # Makefile for thermal tools
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 # $(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/thermal/thermometer/Makefile b/tools/thermal/thermometer/Makefile
index d8f8bc82fe3b..624359d3503c 100644
--- a/tools/thermal/thermometer/Makefile
+++ b/tools/thermal/thermometer/Makefile
@@ -2,9 +2,9 @@
 # Makefile for cgroup tools
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=%))
+srctree := $(dir $(srctree:%/=%))
 # $(info Determined 'srctree' to be $(srctree))
 endif
 
diff --git a/tools/usb/Makefile b/tools/usb/Makefile
index c6235667dd46..6f80415d04be 100644
--- a/tools/usb/Makefile
+++ b/tools/usb/Makefile
@@ -5,8 +5,8 @@ include ../scripts/Makefile.include
 bindir ?= /usr/bin
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(dir $(CURDIR))
+srctree := $(dir $(srctree:%/=$))
 endif
 
 # Do not use make's built-in rules
-- 
2.39.2


