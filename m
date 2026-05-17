Return-Path: <linux-kbuild+bounces-13211-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMlaNL5JCmqtzAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13211-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:05:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB585643B6
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 01:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17CD4300FC42
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5480C3603D5;
	Sun, 17 May 2026 23:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZwZunnn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7DA342173;
	Sun, 17 May 2026 23:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779059130; cv=none; b=ZV4EuK/AuoO+pLYQoToiF8YsrkQAOB+b9tvuFesK3NC+Y5ygaV8KsZqu5ixoSkrzVFEG3bcp1GA/TE0AmKi5U3694L/9Wxpt4FTblcbwyQBw8tN680oB+bdjtcrJSIOhCLvSSieF7nHMEy5drbvrQl3BwxBEfCeog8cd5AdcEXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779059130; c=relaxed/simple;
	bh=sKGyBmnsQGG9j/rVeObTG2RlcjQt9ogqSMl6CyE8SUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q7+69Hnjr1VByzBIthw1FOng8yC3kn7MMzUv3OLFS3OmSVuKgr25w1CDAuZ/23SKMJpS7+a5EyKF/c2xD0UyEQngnwNkPasnvruIoRAkZ686+6uNP3gTJhSlw5MGUJ1B3kk3o6E8DouJBcwbr4aUr7TEjM/3kcxb1c1cKTVzb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZwZunnn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63B0C2BCB0;
	Sun, 17 May 2026 23:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059129;
	bh=sKGyBmnsQGG9j/rVeObTG2RlcjQt9ogqSMl6CyE8SUg=;
	h=From:Subject:Date:To:Cc:From;
	b=KZwZunnneLfGOgNmmMgkbwkMmz/eop0EoFPf6Bj7HAIhfo4y4EPlrhXXKKsJy2cTu
	 dj5E9yHpjiiMV9g7Lak7U0DEW4BOZobhXz430Fc8nutZ78AORq20zAt9SizLEHUppr
	 CDk0PqKPo0tWnLsFYjF45wyPt7UTT843kcHUchXlNFlksCJEkkmNom5ngRVMTFWjX/
	 u+ChBcsToLQ8C5V1QBH0kxtAkkJZGxPcmYRktnIlSlCckRzwujz8fuvh1GArCx1Tck
	 gOZCfFxKzAhGvDFWtcGwhfef4h4u6dwbRtw/TZNbOZ5pXM3Fopvdsfdu7eVl8R4UcS
	 pUtoOE7qN6TxQ==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 00/16] Bump minimum version of LLVM for building the
 kernel to 17.0.1
Date: Sun, 17 May 2026 13:05:03 -1000
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOSw6CMBRFt2I69hkov+rIfRgGFJ7wlH7SlkZD2
 LuAcQEOT3LvPXdmHh2hZ5fDzBxG8mT0Cvx4YO3Q6B6BupUZT3iZ5JyDnJQFRZrUpMBP1hoXsIN
 xjAoiuq0PwUBagczLTDSFkEmesXXPOrzTa3fd6i/7ST6wDZtgSwzkg3Hv/UxMt9zPK/7wxhQSE
 Gl3lhwFYlVcn+g0jifjelYvy/IBVVHJSPUAAAA=
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
 Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6925; i=nathan@kernel.org;
 h=from:subject:message-id; bh=sKGyBmnsQGG9j/rVeObTG2RlcjQt9ogqSMl6CyE8SUg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnhuUlFizjHsnZfOubBbtifmavaft/KMLr/WqgvPtL
 syVkfHvKGVhEONikBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABPZJc3wz2SGZ+Wx2uZ7ug/c
 0qI55uxh1P/T4m87RXvG0Ql6awpKXzAyrD3mJcquZ1VVVHpY6tvlR04vsrP/L469VWB/0WHymWo
 RNgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 2CB585643B6
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
	TAGGED_FROM(0.00)[bounces-13211-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Action: no action

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
Changes in v2:
- Pick up provided tags (thanks everyone!)
- Patch 1: Adjust changes.rst in Documentation/translations
- Patch 11: Adjust commit message based on Sashiko review
- Patch 15-16: New changes
- Link to v1: https://patch.msgid.link/20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org

---
Nathan Chancellor (16):
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
      x86/build: Drop unnecessary '-ffreestanding' addition to KBUILD_CFLAGS
      x86/module: Revert "Deal with GOT based stack cookie load on Clang < 17"
      x86/entry/vdso32: Remove conditional omission of '.cfi_offset eflags'
      kbuild: Remove check for broken scoping with clang < 17 in CC_HAS_ASM_GOTO_OUTPUT
      compiler-clang.h: Remove __cleanup -Wunused-variable workaround
      compiler-clang.h: Drop explicit version number from "all" diagnostic macro

 Documentation/process/changes.rst                    |  2 +-
 Documentation/translations/it_IT/process/changes.rst |  2 +-
 Documentation/translations/pt_BR/process/changes.rst |  2 +-
 arch/Kconfig                                         |  5 +----
 arch/arm/Kconfig.platforms                           |  4 ----
 arch/riscv/Kconfig                                   | 16 +++++++---------
 arch/x86/Makefile                                    |  5 -----
 arch/x86/entry/vdso/vdso32/sigreturn.S               | 10 ----------
 arch/x86/include/asm/elf.h                           |  5 ++---
 arch/x86/kernel/module.c                             | 15 ---------------
 include/linux/compiler-clang.h                       | 13 ++-----------
 init/Kconfig                                         |  3 ---
 scripts/Makefile.warn                                | 10 ----------
 scripts/min-tool-version.sh                          |  2 +-
 security/Kconfig.hardening                           |  8 --------
 15 files changed, 16 insertions(+), 86 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260422-bump-minimum-supported-llvm-version-to-17-b4638a58b043

Best regards,
--  
Cheers,
Nathan


