Return-Path: <linux-kbuild+bounces-13702-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j2EYDiL6KWrwgQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13702-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 01:58:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAEB66D755
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 01:58:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JIWf5odL;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13702-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13702-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31A99309FD4B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 23:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C383BB69D;
	Wed, 10 Jun 2026 23:58:23 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D7D3B19C2;
	Wed, 10 Jun 2026 23:58:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781135903; cv=none; b=ZM0w5zXmWQqSSqRNrNRMj0hqdEU7qi0GwnrDfSXrrqE+9QAsPynh1+joCLfWD4V48ebN4F9mblO6qUEQqry5eklAsqgm5klSI3+hY07jvXdC0x04rXjk5WVPLqwwo/cRSZKu/Y3VOfo5zAm+sCkS7vk+OKMyxylETJT/9+e3H9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781135903; c=relaxed/simple;
	bh=v+eTFspCf4NF1QMOsacYRFZjFtM4dRGoRCj8ouydhdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SfMU50xYL1sQRO7fx+jxXpkiKB/MUh/cLe40AmjMW92MC4chnsbJZWK0MVXfW/tzgU6+YW8TDe68XE+KKbR+DgemwO82U6adUWtuUEM7nIWWEqWdfetqkp1QE68xZAY/mNUUfprpQnYflw94C/xakcC2Bl9vKKki8029i/3LLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIWf5odL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0D41F00893;
	Wed, 10 Jun 2026 23:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781135902;
	bh=pETAGnfHDyUgQHh7fdu0vRck6aDi0cyAflTtYKkHdug=;
	h=Date:From:To:Cc:Subject;
	b=JIWf5odLjvnSi+2teJ38otvVetbG9Dk2yYgYbKZ9Yyq0IbAC7YDecHz/7el9P+WTr
	 nnIW0Y8zVRoWGZohnbvinDwpTpwHVfpLDZjKewjjIoxMGSjL/IjRJ25V+RvnGgOiY9
	 fsevDFXIzaEiTN/Y46DbzSlBN4Y7XMeM0OIT7XKpqMfd7n8Lqk4S+5a/3LT5pAOFsw
	 DNDS5UR5zqOyYWKIobWJLftM323uYarxZcD1ydJPzlkPS0cwupYdVNFjuowWi43gPh
	 Pb+22KXpYJqaXAegv6770mmx/Af/HDfx3XYcRHVxbMCYfD8mTmVlIE0+CoHZLAs9Z6
	 3UNkhogON1xPg==
Date: Wed, 10 Jun 2026 16:58:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild / Kconfig updates for 7.2
Message-ID: <20260610235818.GA873456@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13702-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EAEB66D755

Hi Linus,

Please pull these changes to Kbuild / Kconfig for 7.2. I am sending this
a little bit early for personal reasons. If there are any problems,
comments, or concerns, please let me know. I am only aware of two
conflicts, one with your current tree in compiler-clang.h [1] and
another with the upcoming docs tree [2], which should be fairly trivial.

[1]: https://lore.kernel.org/ah7geBSoDn696L9S@sirena.org.uk/
[2]: https://lore.kernel.org/ah7hUGlwC-lBwDvc@sirena.org.uk/

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.2-1

for you to fetch changes up to 1a1e62a5a48494cdf33e3bfb82fb8f408da7c4cc:

  kconfig: tests: fix typo in comment (2026-06-09 16:28:46 -0700)

----------------------------------------------------------------
Kbuild / Kconfig changes for 7.2

Kbuild:

- Remove broken module linking exclusion for BTF

- Add documentation around how offset header files work

- Include unstripped vDSO libraries in pacman packages

- Bump minimum version of LLVM for building the kernel to 17.0.1 and
  clean up unnecessary workarounds

- Use a context manager in run-clang-tools

- Add dist macro value if present to release tag for RPM packages

- Detect and report truncated buf_printf() output in modpost

- Add __llvm_covfun and __llvm_covmap to section whitelist in modpost

- Support Clang's distributed ThinLTO mode

- Remove architecture specific configurations for AutoFDO and Propeller
  to ease individual architecture maintenance

Kconfig:

- Add kconfig-sym-check target to look for dangling Kconfig symbol
  references and invalid tristate literal values

- Harden against potential NULL pointer dereference

- Fix typo in Kconfig test comment

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Alexandre Courbot (1):
      scripts: modpost: detect and report truncated buf_printf() output

Andrew Jones (1):
      kconfig: add kconfig-sym-check static checker

Ethan Nelson-Moore (1):
      kconfig: tests: fix typo in comment

James Lee (1):
      modpost: Add __llvm_covfun and __llvm_covmap to section_white_list

Masahiro Yamada (1):
      kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a

Nathan Chancellor (17):
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
      kbuild: Remove unnecessary 'T' modifier in cmd_ar_builtin_fixup

Petr Pavlu (1):
      kbuild/btf: Remove broken module relinking exclusion

Philipp Hahn (1):
      run-clang-tools: run multiprocessing.Pool as context manager

Piyush Patle (1):
      kbuild: document generation of offset header files

Rong Xu (3):
      kbuild: distributed build support for Clang ThinLTO
      kconfig: Remove the architecture specific config for AutoFDO
      kconfig: Remove the architecture specific config for Propeller

Thomas Weißschuh (1):
      kbuild: pacman-pkg: package unstripped vDSO libraries

Xingjing Deng (1):
      kconfig: fix potential NULL pointer dereference in conf_askvalue

Yafang Shao (1):
      kbuild: rpm-pkg: append %{?dist} macro to Release tag

 .gitignore                                         |   2 +
 Documentation/dev-tools/autofdo.rst                |  41 +++++++
 Documentation/dev-tools/propeller.rst              |  49 ++++++--
 Documentation/kbuild/makefiles.rst                 |  41 +++++--
 Documentation/process/changes.rst                  |   2 +-
 .../translations/it_IT/process/changes.rst         |   2 +-
 .../translations/pt_BR/process/changes.rst         |   2 +-
 Makefile                                           |  53 +++++----
 arch/Kconfig                                       |  33 ++++--
 arch/arm/Kconfig.platforms                         |   4 -
 arch/arm64/kernel/vmlinux.lds.S                    |   1 +
 arch/riscv/Kconfig                                 |  16 ++-
 arch/x86/Kconfig                                   |   2 -
 arch/x86/Makefile                                  |   5 -
 arch/x86/entry/vdso/vdso32/sigreturn.S             |  10 --
 arch/x86/include/asm/elf.h                         |   5 +-
 arch/x86/kernel/module.c                           |  15 ---
 arch/x86/kernel/vmlinux.lds.S                      |   5 +-
 include/asm-generic/vmlinux.lds.h                  |   6 +
 include/linux/compiler-clang.h                     |  13 +-
 init/Kconfig                                       |   3 -
 scripts/Makefile.lib                               |   8 ++
 scripts/Makefile.modfinal                          |  10 +-
 scripts/Makefile.thinlto                           |  40 +++++++
 scripts/Makefile.vmlinux_a                         |  82 +++++++++++++
 scripts/Makefile.warn                              |  10 --
 scripts/clang-tools/run-clang-tools.py             |  15 +--
 scripts/kconfig/conf.c                             |   6 +-
 scripts/kconfig/kconfig-sym-check.pl               | 132 +++++++++++++++++++++
 .../tests/no_write_if_dep_unmet/__init__.py        |   2 +-
 scripts/min-tool-version.sh                        |   2 +-
 scripts/mod/modpost.c                              |  28 ++++-
 scripts/package/PKGBUILD                           |   3 +
 scripts/package/kernel.spec                        |   2 +-
 security/Kconfig.hardening                         |   9 +-
 35 files changed, 490 insertions(+), 169 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a
 create mode 100755 scripts/kconfig/kconfig-sym-check.pl

