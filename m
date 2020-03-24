Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D899C190837
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 09:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgCXIvc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 04:51:32 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:17862 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727458AbgCXIvb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 04:51:31 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 02O8mgsX011219;
        Tue, 24 Mar 2020 17:48:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 02O8mgsX011219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585039724;
        bh=jHh3bC0B7EFxldpRV9Bvb2uWBZf2Z0xQXY60ZYUAXx0=;
        h=From:To:Cc:Subject:Date:From;
        b=1o9+mpHFkS4x2Y0HZGvJs1ONHqBTcDMWc7Nery2mXY+kapd34XF+IE5uh5GmdgK2b
         YD4YFFD/szqOC+vo7Uf1l4ZaCTT1UvZ9Xmi4tPoabnc/r1fMr+gi+U5u+bzow+akIF
         mQqikeUO69C9p0JysCAuHcqff1GyfsJhRRKdbqYlIcICFhDd5iQ2oQqZY+bf/K2jST
         1YAO6qxPQXcT9dJjVah9rfbJAOUCVd9hR1b0qdUjjbSiD0JUIOth4HT8cjXI4faEub
         4EGjTEYzllKv6+ShI9tQbGpGYqTd4UmNSYUeuCCoBcfTEqVnPy9gndnm0c/S/O6Gi/
         iDFBgnDjfPmVQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux@googlegroups.com,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and cosolidate Kconfig/Makefiles
Date:   Tue, 24 Mar 2020 17:48:05 +0900
Message-Id: <20200324084821.29944-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This series of cleanups was prompted by Linus:
https://lkml.org/lkml/2020/3/12/726

First, this series drop always-on CONFIG_AS_* options.
Some of those options were introduced in old days.
For example, the check for CONFIG_AS_CFI dates back to 2006.

We raise the minimal tool versions from time to time.
Currently, we require binutils 2.21
(and we plan to bump it to 2.23 for v5.7-rc1).

After cleaning away the old checks,
as-instr calls are moved to Kconfig from Makefiles.
(patch 11)

This allows more Kconfig / Makefile cleanups.
Patch 12 is complex, but I double-checked it does the equivalent.

Patch 14 bumps the binutils version to 2.23,
and patch 15 removes more CONFIG_AS_* options.

I folded all relevanet patches into this series,
as suggested by Jason A. Donenfeld.

If x86 maintainers take care of this series, that's good.

If it is OK to queue this up to Kbuild tree,
I will send a pull request to Linus.

Thank you.



Borislav Petkov (1):
  Documentation/changes: Raise minimum supported binutils version to
    2.23

Jason A. Donenfeld (4):
  x86: probe assembler capabilities via kconfig instead of makefile
  crypto: x86 - rework configuration based on Kconfig
  crypto: curve25519 - do not pollute dispatcher based on assembler
  x86: update AS_* macros to binutils >=2.23, supporting ADX and AVX2

Masahiro Yamada (11):
  lib/raid6/test: fix build on distros whose /bin/sh is not bash
  x86: remove unneeded defined(__ASSEMBLY__) check from asm/dwarf2.h
  x86: remove always-defined CONFIG_AS_CFI
  x86: remove unneeded (CONFIG_AS_)CFI_SIGNAL_FRAME
  x86: remove always-defined CONFIG_AS_CFI_SECTIONS
  x86: remove always-defined CONFIG_AS_SSSE3
  x86: remove always-defined CONFIG_AS_AVX
  x86: add comments about the binutils version to support code in
    as-instr
  x86: replace arch macros from compiler with CONFIG_X86_{32,64}
  drm/i915: remove always-defined CONFIG_AS_MOVNTDQA
  crypto: x86 - clean up poly1305-x86_64-cryptogams.S by 'make clean'

 Documentation/process/changes.rst             |   4 +-
 arch/x86/Kconfig                              |   2 +
 arch/x86/Kconfig.assembler                    |  14 ++
 arch/x86/Makefile                             |  22 ---
 arch/x86/crypto/Makefile                      | 162 +++++++-----------
 arch/x86/crypto/aesni-intel_avx-x86_64.S      |   6 -
 arch/x86/crypto/aesni-intel_glue.c            |  21 +--
 arch/x86/crypto/blake2s-core.S                |   2 -
 arch/x86/crypto/chacha_glue.c                 |   6 +-
 arch/x86/crypto/poly1305-x86_64-cryptogams.pl |  16 --
 arch/x86/crypto/poly1305_glue.c               |  11 +-
 arch/x86/crypto/sha1_ssse3_asm.S              |   4 -
 arch/x86/crypto/sha1_ssse3_glue.c             |  13 --
 arch/x86/crypto/sha256-avx-asm.S              |   3 -
 arch/x86/crypto/sha256-avx2-asm.S             |   3 -
 arch/x86/crypto/sha256_ssse3_glue.c           |  12 --
 arch/x86/crypto/sha512-avx-asm.S              |   2 -
 arch/x86/crypto/sha512-avx2-asm.S             |   3 -
 arch/x86/crypto/sha512_ssse3_glue.c           |  10 --
 arch/x86/include/asm/dwarf2.h                 |  44 -----
 arch/x86/include/asm/xor_avx.h                |   9 -
 drivers/gpu/drm/i915/Makefile                 |   3 -
 drivers/gpu/drm/i915/i915_memcpy.c            |   5 -
 include/crypto/curve25519.h                   |   6 +-
 kernel/signal.c                               |   2 +-
 lib/raid6/algos.c                             |  12 +-
 lib/raid6/avx2.c                              |   4 -
 lib/raid6/recov_avx2.c                        |   6 -
 lib/raid6/recov_ssse3.c                       |   6 -
 lib/raid6/test/Makefile                       |   9 +-
 30 files changed, 98 insertions(+), 324 deletions(-)
 create mode 100644 arch/x86/Kconfig.assembler

-- 
2.17.1

