Return-Path: <linux-kbuild+bounces-8935-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EB1B9792F
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 23:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1061C2E69E6
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Sep 2025 21:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D56B30C622;
	Tue, 23 Sep 2025 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMHgqyqx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C39303CB2;
	Tue, 23 Sep 2025 21:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758663263; cv=none; b=B4DbEJWQCg2FfBD24rioE8fzoEty6HZWDG8xlrLnoIeggE92N9nHpvNuQKx1Lbss3hbCEF41PWeEIOnN7URHIYYUGOsfiNxNz/cMqT7aXM5AJ54nO4Swxo/BRwa5pSQdGvenfvMVQTlhI7xKEmgyYWFelf3Q+mEb2RdwKlFt9o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758663263; c=relaxed/simple;
	bh=pDaooK30U19hne34JuAhtizKT1ZuonmtreK5zAdeXEQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wjgq9F5wi997JXHCQ2N0MG3NrkE3C9OYxo/1p7LBqOqgmF09aLBrPRzxfrCqWKVFGSw+pDxSUVdV5NknQgmQM0W8l6g5IxSKFdW4eCsEG1qdWxgFRLpn8P8s6jvKRfyzRWjYdeiaetOc5J23XgqM52YRLx2PZMotlQEuPtzOr14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMHgqyqx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB8CC4CEF7;
	Tue, 23 Sep 2025 21:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758663262;
	bh=pDaooK30U19hne34JuAhtizKT1ZuonmtreK5zAdeXEQ=;
	h=From:To:Cc:Subject:Date:From;
	b=AMHgqyqxwI5lfJweeS04+lwkcSXxTkHN9b8/sOWwcRdFyFO0cSqdi/aLqiTdxq+tE
	 xmYZVDb+Rt2a5GwQ0Pu3I/8L7yE30XT8lY1hpF1vqapEdeG49R9SDZZA1SloaSkjwC
	 BwgBHrjx+zSASbCCQ8dmlOJXJBqWDDf6PA4DvS3r7EgDcS6/ysAy7p7ezoQECdYy5j
	 UZDz2bm2xu3MqXp5mUNXgyTU2nAHObnAIqWdROMq1I50xrcd0C05LvUbDrs31hUPi6
	 2tMnMWK16hCa3ooSe+g7YZ8Tazo/ntvypsPprBvyrDLJvLIcfvYHOATBbmS6VDJzh3
	 2mgNboXQtrZ3g==
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 0/3] kconfig: Add transitional symbol attribute for migration support
Date: Tue, 23 Sep 2025 14:34:16 -0700
Message-Id: <20250923213120.make.332-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5037; i=kees@kernel.org; h=from:subject:message-id; bh=pDaooK30U19hne34JuAhtizKT1ZuonmtreK5zAdeXEQ=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmXhSK3r2aK/PXg54dMhznxGZqxv1/z6zX7Vj+ayCLc8 DaI0Temo5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCKeZxgZdtz9pfVwOU9zhO3E 6rj/Ve4VcfG7dPvKtths89a6yRm/jOG/0z+lhJvXZM24l60ubnl3buGPDyyead98Jdfv4uLzar3 NBQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

Add the new "transitional" keyword to kconfig and use it to rename
CONFIG_CFI_CLANG to CONFIG_CFI.

 v3: use Vegard's approach, add selftests
 v2: https://lore.kernel.org/lkml/20250830020109.it.598-kees@kernel.org/
 v1: https://lore.kernel.org/all/20250830014438.work.682-kees@kernel.org/

-Kees

Kees Cook (3):
  kconfig: Fix BrokenPipeError warnings in selftests
  kconfig: Add transitional symbol attribute for migration support
  kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI

 arch/Kconfig                                  |  36 ++++---
 arch/arm/Kconfig                              |   2 +-
 arch/arm64/Kconfig                            |   4 +-
 arch/riscv/Kconfig                            |   6 +-
 arch/x86/Kconfig                              |  12 +--
 init/Kconfig                                  |   4 +-
 kernel/module/Kconfig                         |   2 +-
 .../kconfig/tests/err_transitional/Kconfig    |  52 +++++++++
 scripts/kconfig/tests/transitional/Kconfig    | 100 ++++++++++++++++++
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
 scripts/kconfig/symbol.c                      |   7 +-
 scripts/kconfig/tests/conftest.py             |  17 ++-
 .../tests/err_transitional/__init__.py        |  14 +++
 .../tests/err_transitional/expected_stderr    |   7 ++
 .../kconfig/tests/transitional/__init__.py    |  18 ++++
 .../tests/transitional/expected_config        |  12 +++
 .../kconfig/tests/transitional/initial_config |  16 +++
 Documentation/kbuild/kconfig-language.rst     |  32 ++++++
 arch/riscv/include/asm/cfi.h                  |   4 +-
 arch/x86/include/asm/cfi.h                    |   4 +-
 include/asm-generic/vmlinux.lds.h             |   2 +-
 include/linux/cfi.h                           |   6 +-
 include/linux/cfi_types.h                     |   8 +-
 include/linux/compiler.h                      |   2 +-
 include/linux/compiler_types.h                |   2 +-
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
 arch/arm64/kernel/debug-monitors.c            |   2 +-
 arch/arm64/kernel/traps.c                     |   4 +-
 arch/arm64/kvm/handle_exit.c                  |   2 +-
 arch/arm64/net/bpf_jit_comp.c                 |   2 +-
 arch/riscv/net/bpf_jit_comp64.c               |   4 +-
 arch/x86/kernel/alternative.c                 |   4 +-
 arch/x86/kernel/kprobes/core.c                |   2 +-
 drivers/misc/lkdtm/cfi.c                      |   2 +-
 kernel/module/tree_lookup.c                   |   2 +-
 kernel/configs/hardening.config               |   2 +-
 69 files changed, 422 insertions(+), 92 deletions(-)
 create mode 100644 scripts/kconfig/tests/err_transitional/Kconfig
 create mode 100644 scripts/kconfig/tests/transitional/Kconfig
 create mode 100644 scripts/kconfig/tests/err_transitional/__init__.py
 create mode 100644 scripts/kconfig/tests/err_transitional/expected_stderr
 create mode 100644 scripts/kconfig/tests/transitional/__init__.py
 create mode 100644 scripts/kconfig/tests/transitional/expected_config
 create mode 100644 scripts/kconfig/tests/transitional/initial_config

-- 
2.34.1


