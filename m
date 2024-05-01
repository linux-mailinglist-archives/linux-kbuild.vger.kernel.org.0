Return-Path: <linux-kbuild+bounces-1722-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA9C8B91C3
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 00:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B63B1C20EF7
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 May 2024 22:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4562150286;
	Wed,  1 May 2024 22:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OByP5kph"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC934F897;
	Wed,  1 May 2024 22:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714604134; cv=none; b=LJv8vaErXVwB7s3g0zFyX7ny7gqs1QHuImoMm5yB0UrtyiDcboHDk5fFB9a0QO/UGNH/9wgN+IZO8Jj7Q+qbsf0NvYMAv/blxgahFR1GDRKMHpuPrAFFM7BzmzEfkEuttmyFYia+SK/bDGhcGrptVvKY4Gv4Hkef6OoybuPAdUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714604134; c=relaxed/simple;
	bh=jj5Po6i6bhNWS4WRCJD7MS6k4QGArNUryRqACxKTrq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MwKvrpTfjQpASDDfTUcP9spcloIJEvx0r9HQrlzivMfeAIFHWDo0XeNNuBcL+yoh6I7AW/F77vAWB8Hg7YFI7zpFGoBLYdXfoSMG6oyK0XgIEJz/6eTeeu+7LfX2UH2uHYK7s1UDPprKZ4Z1mJO8syj2H0cEpMxsummR95qxt34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OByP5kph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D163BC072AA;
	Wed,  1 May 2024 22:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714604133;
	bh=jj5Po6i6bhNWS4WRCJD7MS6k4QGArNUryRqACxKTrq4=;
	h=From:Date:Subject:To:Cc:From;
	b=OByP5kph77hHZK59VyfQjQvcru7O5KiqstijuGhg6FQIC71EB9PD1vyHeNDvWYRci
	 WhYHxL8qgo22t9T4vNN9AL71Tj8I4OkhF1kNwjP3qtoqhIdEAolevhw3nOEcXOgttB
	 Xa+2GzILKMXSqlVRbbXuUcYXcVhPSp/uH7F6PTQohzzmmRb8Bw9L5gdyND+YxppiiZ
	 XZ6CqlntxQjXDao7EaWVkOr8PfFHlHcgOfanDBuk56ycAf+lzzK2OS44uCAhWzfc+Z
	 CKrzG/fYUWMQG9VWphAVXSINXc4czpnz3XVbyNrDHVy0Mq8un/LgYFHHmF1L4Ede64
	 pIqXc0NgiJVtw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 01 May 2024 15:55:25 -0700
Subject: [PATCH] kbuild: Remove support for Clang's ThinLTO caching
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240501-kbuild-llvm-drop-thinlto-cache-v1-1-c117cc50a24b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFzIMmYC/x3NQQ6DIBBA0auYWTsJEivqVYwLC4NMRDBgTRPj3
 Uu6fJv/b8iUmDKM1Q2JLs4cQ0FTV6DdElZCNsUghWzFSzS4vT/sDXp/7WhSPPB0HPwZUS/aEdp
 2UEqJbpC2hxI5Eln+/gfT/Dw/yr0i4XAAAAA=
To: masahiroy@kernel.org, morbo@google.com, justinstitt@google.com
Cc: nicolas@fjasle.eu, keescook@chromium.org, samitolvanen@google.com, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 stable@vger.kernel.org, Yifan Hong <elsk@google.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5033; i=nathan@kernel.org;
 h=from:subject:message-id; bh=jj5Po6i6bhNWS4WRCJD7MS6k4QGArNUryRqACxKTrq4=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGlGJ1IeBmpE54rbSgTM4Fshcjh3cc5jnWSjjwufKwV8O
 +NS/Mylo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzk2gNGhm8ZAacSNwux9C3p
 rjWKPB9ZpdiUskzDed3G6yXff7NMncfIsGOroo07H4tWQ/u6BzNOy74pqj9VGn3lROmaazN9Wx3
 leAE=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

There is an issue in clang's ThinLTO caching (enabled for the kernel via
'--thinlto-cache-dir') with .incbin, which the kernel occasionally uses
to include data within the kernel, such as the .config file for
/proc/config.gz. For example, when changing the .config and rebuilding
vmlinux, the copy of .config in vmlinux does not match the copy of
.config in the build folder:

  $ echo 'CONFIG_LTO_NONE=n
  CONFIG_LTO_CLANG_THIN=y
  CONFIG_IKCONFIG=y
  CONFIG_HEADERS_INSTALL=y' >kernel/configs/repro.config

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 clean defconfig repro.config vmlinux
  ...

  $ grep CONFIG_HEADERS_INSTALL .config
  CONFIG_HEADERS_INSTALL=y

  $ scripts/extract-ikconfig vmlinux | grep CONFIG_HEADERS_INSTALL
  CONFIG_HEADERS_INSTALL=y

  $ scripts/config -d HEADERS_INSTALL

  $ make -kj"$(nproc)" ARCH=x86_64 LLVM=1 vmlinux
  ...
    UPD     kernel/config_data
    GZIP    kernel/config_data.gz
    CC      kernel/configs.o
  ...
    LD      vmlinux
  ...

  $ grep CONFIG_HEADERS_INSTALL .config
  # CONFIG_HEADERS_INSTALL is not set

  $ scripts/extract-ikconfig vmlinux | grep CONFIG_HEADERS_INSTALL
  CONFIG_HEADERS_INSTALL=y

Without '--thinlto-cache-dir' or when using full LTO, this issue does
not occur.

Benchmarking incremental builds on a few different machines with and
without the cache shows a 20% increase in incremental build time without
the cache when measured by touching init/main.c and running 'make all'.

ARCH=arm64 defconfig + CONFIG_LTO_CLANG_THIN=y on an arm64 host:

  Benchmark 1: With ThinLTO cache
    Time (mean ± σ):     56.347 s ±  0.163 s    [User: 83.768 s, System: 24.661 s]
    Range (min … max):   56.109 s … 56.594 s    10 runs

  Benchmark 2: Without ThinLTO cache
    Time (mean ± σ):     67.740 s ±  0.479 s    [User: 718.458 s, System: 31.797 s]
    Range (min … max):   67.059 s … 68.556 s    10 runs

  Summary
    With ThinLTO cache ran
      1.20 ± 0.01 times faster than Without ThinLTO cache

ARCH=x86_64 defconfig + CONFIG_LTO_CLANG_THIN=y on an x86_64 host:

  Benchmark 1: With ThinLTO cache
    Time (mean ± σ):     85.772 s ±  0.252 s    [User: 91.505 s, System: 8.408 s]
    Range (min … max):   85.447 s … 86.244 s    10 runs

  Benchmark 2: Without ThinLTO cache
    Time (mean ± σ):     103.833 s ±  0.288 s    [User: 232.058 s, System: 8.569 s]
    Range (min … max):   103.286 s … 104.124 s    10 runs

  Summary
    With ThinLTO cache ran
      1.21 ± 0.00 times faster than Without ThinLTO cache

While it is unfortunate to take this performance improvement off the
table, correctness is more important. If/when this is fixed in LLVM, it
can potentially be brought back in a conditional manner. Alternatively,
a developer can just disable LTO if doing incremental compiles quickly
is important, as a full compile cycle can still take over a minute even
with the cache and it is unlikely that LTO will result in functional
differences for a kernel change.

Cc: stable@vger.kernel.org
Fixes: dc5723b02e52 ("kbuild: add support for Clang LTO")
Reported-by: Yifan Hong <elsk@google.com>
Closes: https://github.com/ClangBuiltLinux/linux/issues/2021
Reported-by: Masami Hiramatsu <mhiramat@kernel.org>
Closes: https://lore.kernel.org/r/20220327115526.cc4b0ff55fc53c97683c3e4d@kernel.org/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
This is an alternative (and arguably more robust) fix to Yifan's patch
at https://lore.kernel.org/20240429220756.979347-2-elsk@google.com/.
---
 Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 40fb2ca6fe4c..6b6a4a757062 100644
--- a/Makefile
+++ b/Makefile
@@ -942,7 +942,6 @@ endif
 ifdef CONFIG_LTO_CLANG
 ifdef CONFIG_LTO_CLANG_THIN
 CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
-KBUILD_LDFLAGS	+= --thinlto-cache-dir=$(extmod_prefix).thinlto-cache
 else
 CC_FLAGS_LTO	:= -flto
 endif
@@ -1477,7 +1476,7 @@ endif # CONFIG_MODULES
 # Directories & files removed with 'make clean'
 CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
-	       compile_commands.json .thinlto-cache rust/test \
+	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c
 
 # Directories & files removed with 'make mrproper'
@@ -1783,7 +1782,7 @@ PHONY += compile_commands.json
 
 clean-dirs := $(KBUILD_EXTMOD)
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps \
-	$(KBUILD_EXTMOD)/compile_commands.json $(KBUILD_EXTMOD)/.thinlto-cache
+	$(KBUILD_EXTMOD)/compile_commands.json
 
 PHONY += prepare
 # now expand this into a simple variable to reduce the cost of shell evaluations

---
base-commit: e67572cd2204894179d89bd7b984072f19313b03
change-id: 20240501-kbuild-llvm-drop-thinlto-cache-f497770692f8

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


