Return-Path: <linux-kbuild+bounces-6485-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D75A7D9FE
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 11:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CB1116AB3A
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 09:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E7922FF2E;
	Mon,  7 Apr 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wrj4Vs/n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B08A22B8BD;
	Mon,  7 Apr 2025 09:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018887; cv=none; b=LRRtEj0vCy/MfFf5f9Dyjp8/EiwQAwwxVIbRo95h9QhcBBpvmhvQzXM7C1WHxyBr11YFeyubc571wN3fOisCeb90zglUhxxSZ5Kq3L0igdfnB0L3FOYWwmhlMQbKathdkFQ4QrOosy/zNR9eFeBnIf67R/75picNpJuNvUFCCS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018887; c=relaxed/simple;
	bh=cqFVpiMLss0+HxdO2CYbfXC6D/iBdTbrM+nK40NDFG4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JVzXY//W6gF7EYM07IsiplfjPEElXEi4MzsAHGfL03zt049WCKJQUwLuMRepxFxU8t44Sp+93cXu3AdWzaE7dygAIq557I9i9yTlWlgLoic1snbOCbYl8OxYMCEFf3Sm4v6iMDFCGca+6RhaNLrDMTzHZR1SL1t33khuW6oKgTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wrj4Vs/n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E958C4CEE9;
	Mon,  7 Apr 2025 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744018887;
	bh=cqFVpiMLss0+HxdO2CYbfXC6D/iBdTbrM+nK40NDFG4=;
	h=From:To:Cc:Subject:Date:From;
	b=Wrj4Vs/n9PxnaHaHHtmEMpxeE23Qy8lrGk4d3zss3LW8jHzTSZsCiMr6hJc+p+j2Q
	 GLNRtgJ0DhH9Ww1/PA/9J6uJBBcnzFcj6K5cV5Cp38K5imMNe/kpNGqRgBOObcXY6B
	 jCrY2CWl7pQpC0ZbkKeeGND8TRvCKFEHqAWWYYOsOeT41hYnu9plJ0xQrLnMSSRh2e
	 92ncte/rG/1MsHNVe/aYtRao0MZpmsripKQ+Azt+o8HyTKGCBOcFvevIeSoM5X/DK9
	 cQ62sFa4cxfq36tnxUuHI5WxLJFetXTDNXMILyQhF2YOG1+ZISRCKc3Dk1Fqg077xa
	 gK1fLhXrhHfdg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Date: Mon,  7 Apr 2025 11:41:12 +0200
Message-Id: <20250407094116.1339199-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

x86 already requires gcc-8.1 since linux-6.15-rc1, which led me to
actually go through all  version checks and make this is the minimum
for all architectures.

Most of the actual resulting changes are actually for raising the
binutils version, which eliminates version checks on x86 and arm64.

Arnd Bergmann (4):
  kbuild: require gcc-8 and binutils-2.30
  raid6: skip avx512 checks
  x86: remove checks for binutils-2.30 and earlier
  arm64: drop binutils version checks

Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Uros Bizjak <ubizjak@gmail.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-raid@vger.kernel.org
Cc: x86@kernel.org

 Documentation/admin-guide/README.rst          |  2 +-
 Documentation/kbuild/makefiles.rst            |  4 +-
 Documentation/process/changes.rst             |  4 +-
 .../translations/it_IT/process/changes.rst    |  4 +-
 .../translations/zh_CN/admin-guide/README.rst |  2 +-
 arch/arm64/Kconfig                            | 37 +--------------
 arch/arm64/Makefile                           | 21 +--------
 arch/arm64/include/asm/rwonce.h               |  4 --
 arch/arm64/kvm/Kconfig                        |  1 -
 arch/arm64/lib/xor-neon.c                     |  2 +-
 arch/um/Makefile                              |  4 +-
 arch/x86/Kconfig.assembler                    | 29 ------------
 arch/x86/crypto/Kconfig                       |  2 +-
 arch/x86/crypto/Makefile                      | 12 +++--
 arch/x86/crypto/aes-ctr-avx-x86_64.S          |  2 -
 arch/x86/crypto/aes-xts-avx-x86_64.S          |  2 -
 arch/x86/crypto/aesni-intel_glue.c            | 21 +--------
 arch/x86/crypto/aria-aesni-avx-asm_64.S       | 10 -----
 arch/x86/crypto/aria-aesni-avx2-asm_64.S      | 10 +----
 arch/x86/crypto/aria_aesni_avx2_glue.c        |  4 +-
 arch/x86/crypto/aria_aesni_avx_glue.c         |  4 +-
 arch/x86/crypto/blake2s-core.S                |  4 --
 arch/x86/crypto/blake2s-glue.c                |  6 +--
 arch/x86/crypto/chacha_glue.c                 |  6 +--
 arch/x86/crypto/poly1305-x86_64-cryptogams.pl |  8 ----
 arch/x86/crypto/poly1305_glue.c               |  4 +-
 arch/x86/crypto/sha1_ssse3_glue.c             | 10 -----
 arch/x86/crypto/sha256_ssse3_glue.c           | 10 -----
 include/linux/unroll.h                        |  4 +-
 kernel/gcov/gcc_4_7.c                         |  4 --
 lib/raid6/algos.c                             |  6 ---
 lib/raid6/avx512.c                            |  4 --
 lib/raid6/recov_avx512.c                      |  6 ---
 lib/raid6/test/Makefile                       |  3 --
 lib/test_fortify/Makefile                     |  5 +--
 scripts/Makefile.compiler                     |  2 +-
 scripts/gcc-plugins/gcc-common.h              | 45 -------------------
 scripts/min-tool-version.sh                   |  6 +--
 38 files changed, 36 insertions(+), 278 deletions(-)

-- 
2.39.5


