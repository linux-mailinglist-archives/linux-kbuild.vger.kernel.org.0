Return-Path: <linux-kbuild+bounces-8703-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 939DAB4308D
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 05:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17AB717C849
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 03:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172B7225A35;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbeKPCuH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F55224882;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756957617; cv=none; b=aB97CmlZCOvO/WlvSfwngcRJ0BMmQmGN2g8r61Oi+QuEW3fsRz/SrmCwuk6EAsTXWT68kon11PXgADZXaA6rKd80JhzY+hdiy/trQWvIZrqVXT5feGdmX7yyQ3DZd/F8rvlIQQtQhVvTBsxbg7tW3MZHEv9ap5HrwPMvs2By+JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756957617; c=relaxed/simple;
	bh=huQ/rMnniDWDIFjoLCvgz1AJbkQU2KKmTas/L98LjC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VwLLujC+/5RhWSrruyOe+vLIXxqv4+sG9Qq1awQeLwAKNZiWHZgR3Hukjre0k+dQdIL7eGAdbAe8/dqLAVLRuZmoRuRHP2/SMdUlB61MWoZV7c12lvDuijXaFq044zkrySRJdKnxebZclW2i+WX8ZiaeO2a1OJV6cNE++Ri8ZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbeKPCuH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF6AC4CEF0;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=huQ/rMnniDWDIFjoLCvgz1AJbkQU2KKmTas/L98LjC4=;
	h=From:To:Cc:Subject:Date:From;
	b=YbeKPCuH5Ku1My2/NILiDdlcd2lhEDDgpxPq4p42dihRGT7uqezRNNLqJ/6itihKY
	 ZybcsCamMh2A4/2XW+klE6t0epSCXOyfFe3jrAH/62T0mUZnotmWCS1MlyvlvFURjS
	 wBtqSVaPJXeNoAgSY8kOEzIGTq28Prg04cWEP1i4YB5etAXMKujx4zletrhJLce0Ju
	 Tlqsqk2dy2g4br+paCb9iqydk75fbLBcdjQXY5kVfGFCPKF5R6FkTaothOimSf7pe/
	 o1M21WhmArHLbNBHgSr0GYo9KuyY2qrA//aGDRAEE2i+WimSW2UqqryywqCqDlinNA
	 fkLhdxXvfbK3w==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 0/9] kcfi: Prepare for GCC support
Date: Wed,  3 Sep 2025 20:46:39 -0700
Message-Id: <20250904033217.it.414-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6367; i=kees@kernel.org; h=from:subject:message-id; bh=huQ/rMnniDWDIFjoLCvgz1AJbkQU2KKmTas/L98LjC4=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OfNXqRXMPuu3KW/iNZutC1WFrp2pb562kb3h3dTZd 1RePqr401HKwiDGxSArpsgSZOce5+Lxtj3cfa4izBxWJpAhDFycAjARDW2G/3k7WW1vxMecMLya ZlWv0fs7zCJxQkrMl03arwWmGC/dx8rI0G3jZOYpOOvZq+8X2jhnZe4SNDbe8jnVLXeN8/8rO7O SmAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

v2:
 - integrate "transitional" Kconfig patch[2] (nathan, randy, miguel)
 - add arm32 KCFI trap handler
 - split pr_info changes (nathan)
 - clean up my broken SoB (peter)
 - remove Clang from CONFIG_CFI help (jeff)
 - add r-b (linus)
v1: https://lore.kernel.org/all/20250825141316.work.967-kees@kernel.org/

Hi,

With KCFI support in GCC coming[1], we need to make some (relatively
small) changes in the kernel to deal with it:

- move __nocfi out of compilers-clang.h (so GCC can see it too)
- add cfi=debug so future Kees can find fineibt breakage easier
- remove problematic __noinitretpoline usage
- rename CONFIG_CFI_CLANG to CONFIG_CFI (otherwise it is quite confusing)

If I can get some Acks, I will carry this in the hardening tree, unless
someone else would like to take it (perhaps tip).

Thanks!

-Kees

[1] https://lore.kernel.org/linux-hardening/20250821064202.work.893-kees@kernel.org/
[2] https://lore.kernel.org/all/20250901182334.make.517-kees@kernel.org/

Kees Cook (9):
  compiler_types.h: Move __nocfi out of compiler-specific header
  x86/traps: Clarify KCFI instruction layout
  x86/cfi: Document the "cfi=" bootparam options
  x86/cfi: Standardize on common "CFI:" prefix for CFI reports
  x86/cfi: Add "debug" option to "cfi=" bootparam
  x86/cfi: Remove __noinitretpoline and __noretpoline
  kconfig: Add transitional symbol attribute for migration support
  kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
  ARM: traps: Implement KCFI trap handler for ARM32

 arch/Kconfig                                  |  36 ++++---
 arch/arm/Kconfig                              |   2 +-
 arch/arm64/Kconfig                            |   4 +-
 arch/riscv/Kconfig                            |   6 +-
 arch/x86/Kconfig                              |  12 +--
 init/Kconfig                                  |   4 +-
 kernel/module/Kconfig                         |   2 +-
 .../kconfig/tests/err_transitional/Kconfig    |  52 +++++++++
 scripts/kconfig/tests/transitional/Kconfig    | 100 +++++++++++++++++
 lib/Kconfig.debug                             |   2 +-
 Makefile                                      |   2 +-
 arch/arm/mm/Makefile                          |   2 +-
 arch/riscv/kernel/Makefile                    |   2 +-
 arch/riscv/purgatory/Makefile                 |   2 +-
 arch/x86/kernel/Makefile                      |   2 +-
 arch/x86/purgatory/Makefile                   |   2 +-
 kernel/Makefile                               |   2 +-
 scripts/kconfig/expr.h                        |   1 +
 scripts/kconfig/lexer.l                       |   1 +
 scripts/kconfig/parser.y                      |  47 ++++++++
 scripts/kconfig/symbol.c                      |  16 ++-
 .../tests/err_transitional/__init__.py        |  14 +++
 .../tests/err_transitional/expected_stderr    |   7 ++
 .../kconfig/tests/transitional/__init__.py    |  18 ++++
 .../tests/transitional/expected_config        |  12 +++
 .../kconfig/tests/transitional/initial_config |  16 +++
 .../admin-guide/kernel-parameters.txt         |  18 ++++
 Documentation/kbuild/kconfig-language.rst     |  32 ++++++
 arch/riscv/include/asm/cfi.h                  |   4 +-
 arch/x86/include/asm/cfi.h                    |   4 +-
 include/asm-generic/vmlinux.lds.h             |   2 +-
 include/linux/cfi.h                           |   6 +-
 include/linux/cfi_types.h                     |   8 +-
 include/linux/compiler-clang.h                |   5 -
 include/linux/compiler-gcc.h                  |   4 -
 include/linux/compiler.h                      |   2 +-
 include/linux/compiler_types.h                |   4 +-
 include/linux/init.h                          |   8 --
 tools/include/linux/cfi_types.h               |   6 +-
 tools/perf/util/include/linux/linkage.h       |   2 +-
 arch/arm/mm/cache-fa.S                        |   2 +-
 arch/arm/mm/cache-v4.S                        |   2 +-
 arch/arm/mm/cache-v4wb.S                      |   4 +-
 arch/arm/mm/cache-v4wt.S                      |   2 +-
 arch/arm/mm/cache-v6.S                        |   2 +-
 arch/arm/mm/cache-v7.S                        |   2 +-
 arch/arm/mm/cache-v7m.S                       |   2 +-
 arch/arm/mm/proc-arm1020.S                    |   2 +-
 arch/arm/mm/proc-arm1020e.S                   |   2 +-
 arch/arm/mm/proc-arm1022.S                    |   2 +-
 arch/arm/mm/proc-arm1026.S                    |   2 +-
 arch/arm/mm/proc-arm920.S                     |   2 +-
 arch/arm/mm/proc-arm922.S                     |   2 +-
 arch/arm/mm/proc-arm925.S                     |   2 +-
 arch/arm/mm/proc-arm926.S                     |   2 +-
 arch/arm/mm/proc-arm940.S                     |   2 +-
 arch/arm/mm/proc-arm946.S                     |   2 +-
 arch/arm/mm/proc-feroceon.S                   |   2 +-
 arch/arm/mm/proc-mohawk.S                     |   2 +-
 arch/arm/mm/proc-xsc3.S                       |   2 +-
 arch/arm/mm/tlb-v4.S                          |   2 +-
 arch/arm/kernel/hw_breakpoint.c               |   2 +-
 arch/arm/kernel/traps.c                       | 102 ++++++++++++++++++
 arch/arm64/kernel/debug-monitors.c            |   2 +-
 arch/arm64/kernel/traps.c                     |   4 +-
 arch/arm64/kvm/handle_exit.c                  |   2 +-
 arch/arm64/net/bpf_jit_comp.c                 |   2 +-
 arch/riscv/net/bpf_jit_comp64.c               |   4 +-
 arch/x86/kernel/alternative.c                 |  44 ++++++--
 arch/x86/kernel/cfi.c                         |   2 +-
 arch/x86/kernel/kprobes/core.c                |   2 +-
 drivers/misc/lkdtm/cfi.c                      |   2 +-
 kernel/module/tree_lookup.c                   |   2 +-
 kernel/configs/hardening.config               |   2 +-
 74 files changed, 569 insertions(+), 118 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_transitional/Kconfig
 create mode 100644 scripts/kconfig/tests/transitional/Kconfig
 create mode 100644 scripts/kconfig/tests/err_transitional/__init__.py
 create mode 100644 scripts/kconfig/tests/err_transitional/expected_stderr
 create mode 100644 scripts/kconfig/tests/transitional/__init__.py
 create mode 100644 scripts/kconfig/tests/transitional/expected_config
 create mode 100644 scripts/kconfig/tests/transitional/initial_config

-- 
2.34.1


