Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B569D193A5C
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 09:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbgCZIEd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 04:04:33 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:20009 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbgCZIEd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:04:33 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 02Q81WpT002183;
        Thu, 26 Mar 2020 17:01:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 02Q81WpT002183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585209694;
        bh=pP2B3e2HIi5aiL8gQpMs8wNmwELktRFcv9my7u/AjTs=;
        h=From:To:Cc:Subject:Date:From;
        b=bzmVG4HAmlp7LgiUy5yPMNdC2iG1kMMwInKzoNZv1szrMcME6xMVXTR1XOUL1qzoZ
         UXypNBLGmlWiyFbn8AGEg1DP67vhAiBAU9HRXNv1JINVe7WLdcTRF880YP/6P8P1+9
         hxP3DnXfQ+AfCFeKc2l0PJ59q8E/XrbPagI9eW55k8R26xEu2vMzfSYDcnSuCE7Ekz
         cNcbHs5t6C6XtBsfX9LVYo8kSbzcATH2qezUw8lKD/JPtQQxhcQ6uRYK5EQ4Ibf/5f
         kIk+7YVoFx0fk4BpYs1xrJORYS45omf/l2ivmZpMddWLGj3TlGYyfrTvNHbrcuIME9
         jBqXd0OeNAqFQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "David S. Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ingo Molnar <mingo@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_* and cosolidate Kconfig/Makefiles
Date:   Thu, 26 Mar 2020 17:00:48 +0900
Message-Id: <20200326080104.27286-1-masahiroy@kernel.org>
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
(and we even plan to bump it to 2.23).

After cleaning away the old checks,
as-instr calls are moved to Kconfig from Makefiles,
then more Kconfig / Makefile code is cleaned up.

I folded all relevanet patches into this series,
as suggested by Jason A. Donenfeld.

The update for v2 is quite small.
I just swapped the patch order of patch 8 and 11
instead of moving comments around files,
which was addressed by Nick Desaulniers.


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
  x86: replace arch macros from compiler with CONFIG_X86_{32,64}
  drm/i915: remove always-defined CONFIG_AS_MOVNTDQA
  x86: add comments about the binutils version to support code in
    as-instr
  crypto: x86 - clean up poly1305-x86_64-cryptogams.S by 'make clean'

 Documentation/process/changes.rst             |   4 +-
 arch/x86/Kconfig                              |   2 +
 arch/x86/Kconfig.assembler                    |  17 ++
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
 30 files changed, 101 insertions(+), 324 deletions(-)
 create mode 100644 arch/x86/Kconfig.assembler

-- 
2.17.1

