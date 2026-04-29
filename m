Return-Path: <linux-kbuild+bounces-12910-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1A6sOj508WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12910-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:00:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1B48E782
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0FEA305374D
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E35133F59E;
	Wed, 29 Apr 2026 03:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lm6oqDaZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F15330D43;
	Wed, 29 Apr 2026 03:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431610; cv=none; b=XztK+I4ZrFhv0dtdEgdiFtHorJevpzCibvYAEMPtAsocLJdRfhzFD3PR64zFOO8bZg169o637kAFG7pSmBnBkO38Mb63TeBvOn07esHoJwKis2g8+IBPDAg6igLJAfgbewXFk2OlwWuZ0xcwqHH7+eYLmYwsU7N724lv69oV8GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431610; c=relaxed/simple;
	bh=BPWip7f/+n2wb9mPvkHgJCd0lFqOC+ZsA1RInw6FYx8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u3VpxcYkqIkm2oU9JkySBZYzpDzTStl0BTpQraKqvslYM4f2AVxZiwwl43YC8zS5SCO2WayWrbBImZYG/9ylLvcsdwFJm54oQFcr0hQAqr7jC1zgx+IlDfo98EgnxlcR/aHmOxOfjDf1KX9fxD0P6tCN/Y1Yaa2anifZlNxsoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lm6oqDaZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3B9C2BCB7;
	Wed, 29 Apr 2026 03:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431609;
	bh=BPWip7f/+n2wb9mPvkHgJCd0lFqOC+ZsA1RInw6FYx8=;
	h=From:Subject:Date:To:Cc:From;
	b=Lm6oqDaZCWZPGshfZZK+k3YJKNsDnG8AlHI64y2CWDqFmLMmaqsMBR+/vE3bA/wP/
	 qBOoFQ/mqwzel7Gid5GmxZodV4mf1xpeBH0sY7SsY9LGRMSt74iysuHwe2M56ExfD8
	 goiP9iOwlp8C2br8Add6rW5f9H9OjquXWl9bYh+Fcv2GTS5kMfEwGHeClKFelU19sn
	 SIMG/hdVguN/Ocxka1uk3ZIdHBi5e04hd81Ss92pRLqtTlQ8s93zp/uOUkCGXm4kF9
	 f+rpPRHBzzJdlmq8Kt6ysbjX7bxF15iXX8oENUhNFMxcT58CLIzAyP8SBPtcmN42wO
	 4oXtJ02loyEIw==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 00/14] Bump minimum version of LLVM for building the kernel
 to 17.0.1
Date: Tue, 28 Apr 2026 22:59:06 -0400
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNyw6CMBCF4Vchs3aSUioSX8W4oDDgGHpJbzEhv
 LtFl9/inH+HSIEpwr3ZIVDhyM5WtJcGptdoV0Keq0EK2QslJepsPBq2bLLBmL13IdGM21YMFgr
 nHpPD9oZa9d0wXgctVAf1zwda+PNrPZ5/x6zfNKUzAMfxBS9G0zWNAAAA
X-Change-ID: 20260422-bump-minimum-supported-llvm-version-to-17-b4638a58b043
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-hardening@vger.kernel.org, linux-security-module@vger.kernel.org, 
 Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
 linux-arm-kernel@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6086; i=nathan@kernel.org;
 h=from:subject:message-id; bh=BPWip7f/+n2wb9mPvkHgJCd0lFqOC+ZsA1RInw6FYx8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfSwy7+t4r7Kv16klo6al7FnGl0OyWQ1SCjbIF4/MYH
 9eSzsiOUhYGMS4GWTFFlurHqscNDeecZbxxahLMHFYmkCEMXJwCMJGV0xn+B1/JuipsITflWW/l
 m6DA5oOhB7lmcdcvX5Hz8Y+Uefb79wz/7J86+2gJ/PR/d2GTU3jbj9SMJM3fnd0H9j5T980/ZXu
 PBwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 88A1B48E782
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12910-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The current minimum version of LLVM for building the kernel is 15.0.0.
However, there are two deficiencies compared to GCC that were fixed in
LLVM 17 that are starting to become more noticeable.

The first was a bug in LLVM's scope checker [1], where all labels in a
function were validated as potential targets of an asm goto statement,
even if they were not listed in the asm goto statement as targets. This
becomes particularly problematic when the cleanup attribute is used, as

  asm goto(... : label_a);
  ...
label_a:
  ...
  int var __free(foo);
  asm goto(... : label_b);
  ...
label_b:
  ...

will trigger an error since the scope checker will complain that the
cleanup variable would be skipped when jumping from the first asm goto
to label_b (which obviously cannot happen). This issue was the catalyst
for commit e2ffa15b9baa ("kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on
clang < 17"). Unfortunately, this issue is reproducible with regular asm
goto in addition to asm goto with outputs, so that change was not
entirely sufficient to avoid the issue altogether. As asm goto has
effectively been required since commit a0a12c3ed057 ("asm goto:
eradicate CC_HAS_ASM_GOTO") and the usage of the cleanup attribute
continues to grow across the tree, raising the minimum to a version that
avoids this issue altogether is a better long term solution than
attempting to workaround it at every spot where it happens.

The second issue is an incompatibility with GCC 8.1+ around variables
marked with const being valid constant expressions for _Static_assert
and other macros [2]. With GCC 8.1 being the minimum supported version
since commit 118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30"),
this incompatibility becomes more of a maintenance burden since only
clang-15 and clang-16 are affected by it.

Looking at the clang version of various major distributions through
Docker images, no one should be left behind as a result of this bump, as
the old ones cannot clear the current minimum of 15.0.0.

  archlinux:latest              clang version 22.1.3
  debian:oldoldstable-slim      Debian clang version 11.0.1-2
  debian:oldstable-slim         Debian clang version 14.0.6
  debian:stable-slim            Debian clang version 19.1.7 (3+b1)
  debian:testing-slim           Debian clang version 21.1.8 (3+b1)
  debian:unstable-slim          Debian clang version 21.1.8 (7+b1)
  fedora:42                     clang version 20.1.8 (Fedora 20.1.8-4.fc42)
  fedora:latest                 clang version 21.1.8 (Fedora 21.1.8-4.fc43)
  fedora:44                     clang version 22.1.1 (Fedora 22.1.1-2.fc44)
  fedora:rawhide                clang version 22.1.3 (Fedora 22.1.3-1.fc45)
  opensuse/leap:latest          clang version 17.0.6
  opensuse/tumbleweed:latest    clang version 21.1.8
  ubuntu:jammy                  Ubuntu clang version 14.0.0-1ubuntu1.1
  ubuntu:noble                  Ubuntu clang version 18.1.3 (1ubuntu1)
  ubuntu:questing               Ubuntu clang version 20.1.8 (0ubuntu4)
  ubuntu:resolute               Ubuntu clang version 21.1.8 (6ubuntu1)

17.0.1 is chosen as the minimum instead of 17.0.0 to ensure that the
particular version of LLVM 17 has the two aforementioned bugs fixed, as
the second was fixed during the 17.0.0 release candidate phase and it
was not until LLVM 18 that LLVM adopted the scheme of x.0.0 being a
prerelease version and x.1.0 is a release version [3] to help with
scenarios such as this.

The first patch in the series does the actual bump. The remaining
patches are cleanups of workarounds for various issues that are no
longer needed with the bump.

I plan to take this via the Kbuild tree for 7.2, please provide Acks as
necessary.

[1]: https://github.com/llvm/llvm-project/commit/f023f5cdb2e6c19026f04a15b5a935c041835d14
[2]: https://github.com/llvm/llvm-project/commit/0b2d5b967d98375793897295d651f58f6fbd3034
[3]: https://github.com/llvm/llvm-project/commit/4532617ae420056bf32f6403dde07fb99d276a49

---
Nathan Chancellor (14):
      kbuild: Bump minimum version of LLVM for building the kernel to 17.0.1
      security/Kconfig.hardening: Remove tautological condition from CC_HAS_ZERO_CALL_USED_REGS
      security/Kconfig.hardening: Remove tautological condition from FORTIFY_SOURCE
      security/Kconfig.hardening: Remove tautological condition from CC_HAS_RANDSTRUCT
      arch/Kconfig: Remove tautological conditions from HAS_LTO_CLANG
      arch/Kconfig: Remove tautological condition from AUTOFDO_CLANG
      ARM: Drop tautological ld.lld conditions from ARCH_MULTI_V4{,T}
      riscv: Remove tautological condition from selection of ARCH_SUPPORTS_CFI
      riscv: Drop tautological condition from TOOLCHAIN_NEEDS_OLD_ISA_SPEC
      scripts/Makefile.warn: Drop -Wformat handling for clang < 16
      x86/build: Drop unused '-ffreestanding' addition to KBUILD_CFLAGS
      x86/module: Revert "Deal with GOT based stack cookie load on Clang < 17"
      x86/entry/vdso32: Remove conditional omission of '.cfi_offset eflags'
      kbuild: Remove check for broken scoping with clang < 17 in CC_HAS_ASM_GOTO_OUTPUT

 Documentation/process/changes.rst      |  2 +-
 arch/Kconfig                           |  5 +----
 arch/arm/Kconfig.platforms             |  4 ----
 arch/riscv/Kconfig                     | 16 +++++++---------
 arch/x86/Makefile                      |  5 -----
 arch/x86/entry/vdso/vdso32/sigreturn.S | 10 ----------
 arch/x86/include/asm/elf.h             |  5 ++---
 arch/x86/kernel/module.c               | 15 ---------------
 init/Kconfig                           |  3 ---
 scripts/Makefile.warn                  | 10 ----------
 scripts/min-tool-version.sh            |  2 +-
 security/Kconfig.hardening             |  8 --------
 12 files changed, 12 insertions(+), 73 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260422-bump-minimum-supported-llvm-version-to-17-b4638a58b043

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


