Return-Path: <linux-kbuild+bounces-8572-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E5B343AD
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 16:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 093301882ACD
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 14:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414022FCBEB;
	Mon, 25 Aug 2025 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhtif550"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA30B2FB990;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131964; cv=none; b=MpTYX87xZOnhAiZuE5i9OsAiOR/h3/L/ERJZ857MhVKqVAVCBctNj0MOZRY1Yc02kPrjbhrd52fyvYp0Iyg7uIVzXkjT/S7cac6f9LVsglwttWlevFDzxwmkqLD7Omb4p74k103k7I3za4nGoPqSj0ae97J7eTLIiOBCoog/Dn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131964; c=relaxed/simple;
	bh=wgWu+8XypexFEPIMyZ5cUv+a841NNieT1SYM+X0Qx/k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FwmhD+WTxy3Z3UqRPI1WrR+XP7pOrWx+r1qkmTUe24697MnLeRrk4EzJrQ8+PpgoNf075smFQoy5Se4haUfnqv29ZUJYCI4Vy6JBukGiVn45nMVfv4V7zKRsX3GoGaIfbgRVoZfksqH/B24InsVPcyNA9qQZW+A5Q1p6X8p1IM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhtif550; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AA6C4CEED;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131963;
	bh=wgWu+8XypexFEPIMyZ5cUv+a841NNieT1SYM+X0Qx/k=;
	h=From:To:Cc:Subject:Date:From;
	b=qhtif550k7UP88ylX7mXFhF3o1Ewy/94q+uBREqP5wwVj4p5tKWo4YIYxqabfCm7o
	 RXbpoE5lUS9A4eX6olO0JQHJX7II7zucifIUT4t5oGSDjVm5tEUvNG7nDTaTagf8MC
	 jr7RemyFaL1wlR9Kr70Sg2zVepCA8TRpRF4n178+y1/WeWFAYnDer2xVGz5oBJ0Lzm
	 0uYOJ+IQmCdVYQdGABtrzKO32BebHlOxGDRRKOqu8JezSkNdHqIcMoMGgLe2oVQ2xq
	 QdjlzNO81fwO8SDSNET5/Yoj4vn7Gds6gMmBMfvGySNCf4krhzhfmv4KmE2sfHEjQA
	 zncS7Q1vVyi0w==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 0/5] kcfi: Prepare for GCC support
Date: Mon, 25 Aug 2025 07:25:47 -0700
Message-Id: <20250825141316.work.967-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

With KCFI support in GCC coming[1], we need to make some (relatively
small) changes in the kernel to deal with it:

- move __nocfi out of compilers-clang.h (so GCC can see it too)
- add cfi=debug so future Kees can find breakage easier
- remove problematic __noinitretpoline usage
- rename CONFIG_CFI_CLANG to CONFIG_CFI (otherwise is it quite confusing)

Thanks!

-Kees

[1] https://lore.kernel.org/linux-hardening/20250821064202.work.893-kees@kernel.org/

Kees Cook (5):
  compiler_types.h: Move __nocfi out of compiler-specific header
  x86/traps: Clarify KCFI instruction layout
  x86/cfi: Add option for cfi=debug bootparam
  x86/cfi: Remove __noinitretpoline and __noretpoline
  kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI

 arch/Kconfig                                  | 22 +++++-----
 arch/arm/Kconfig                              |  2 +-
 arch/arm64/Kconfig                            |  4 +-
 arch/riscv/Kconfig                            |  6 +--
 arch/x86/Kconfig                              | 12 +++---
 init/Kconfig                                  |  4 +-
 kernel/module/Kconfig                         |  2 +-
 lib/Kconfig.debug                             |  2 +-
 Makefile                                      |  2 +-
 arch/arm/mm/Makefile                          |  2 +-
 arch/riscv/kernel/Makefile                    |  2 +-
 arch/riscv/purgatory/Makefile                 |  2 +-
 arch/x86/kernel/Makefile                      |  2 +-
 arch/x86/purgatory/Makefile                   |  2 +-
 kernel/Makefile                               |  2 +-
 .../admin-guide/kernel-parameters.txt         | 18 ++++++++
 arch/riscv/include/asm/cfi.h                  |  4 +-
 arch/x86/include/asm/cfi.h                    |  4 +-
 include/asm-generic/vmlinux.lds.h             |  2 +-
 include/linux/cfi.h                           |  6 +--
 include/linux/cfi_types.h                     |  8 ++--
 include/linux/compiler-clang.h                |  5 ---
 include/linux/compiler-gcc.h                  |  4 --
 include/linux/compiler.h                      |  2 +-
 include/linux/compiler_types.h                |  4 +-
 include/linux/init.h                          |  8 ----
 tools/include/linux/cfi_types.h               |  6 +--
 tools/perf/util/include/linux/linkage.h       |  2 +-
 arch/arm/mm/cache-fa.S                        |  2 +-
 arch/arm/mm/cache-v4.S                        |  2 +-
 arch/arm/mm/cache-v4wb.S                      |  4 +-
 arch/arm/mm/cache-v4wt.S                      |  2 +-
 arch/arm/mm/cache-v6.S                        |  2 +-
 arch/arm/mm/cache-v7.S                        |  2 +-
 arch/arm/mm/cache-v7m.S                       |  2 +-
 arch/arm/mm/proc-arm1020.S                    |  2 +-
 arch/arm/mm/proc-arm1020e.S                   |  2 +-
 arch/arm/mm/proc-arm1022.S                    |  2 +-
 arch/arm/mm/proc-arm1026.S                    |  2 +-
 arch/arm/mm/proc-arm920.S                     |  2 +-
 arch/arm/mm/proc-arm922.S                     |  2 +-
 arch/arm/mm/proc-arm925.S                     |  2 +-
 arch/arm/mm/proc-arm926.S                     |  2 +-
 arch/arm/mm/proc-arm940.S                     |  2 +-
 arch/arm/mm/proc-arm946.S                     |  2 +-
 arch/arm/mm/proc-feroceon.S                   |  2 +-
 arch/arm/mm/proc-mohawk.S                     |  2 +-
 arch/arm/mm/proc-xsc3.S                       |  2 +-
 arch/arm/mm/tlb-v4.S                          |  2 +-
 arch/arm/kernel/hw_breakpoint.c               |  2 +-
 arch/arm64/kernel/debug-monitors.c            |  2 +-
 arch/arm64/kernel/traps.c                     |  4 +-
 arch/arm64/kvm/handle_exit.c                  |  2 +-
 arch/arm64/net/bpf_jit_comp.c                 |  2 +-
 arch/riscv/net/bpf_jit_comp64.c               |  4 +-
 arch/x86/kernel/alternative.c                 | 43 +++++++++++++++----
 arch/x86/kernel/cfi.c                         |  2 +-
 arch/x86/kernel/kprobes/core.c                |  2 +-
 drivers/misc/lkdtm/cfi.c                      |  2 +-
 kernel/module/tree_lookup.c                   |  2 +-
 kernel/configs/hardening.config               |  2 +-
 61 files changed, 141 insertions(+), 113 deletions(-)

-- 
2.34.1


