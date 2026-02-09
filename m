Return-Path: <linux-kbuild+bounces-11091-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGcSEmZhimleJwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11091-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 23:36:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 982FF11512F
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 23:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E5683015C98
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Feb 2026 22:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C413314A94;
	Mon,  9 Feb 2026 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlGn1OkL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7943C163;
	Mon,  9 Feb 2026 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770676579; cv=none; b=LN5Ypq/6ggKcwcYxrCdy5zpG7al9Q3tB4l40RRRdPyY0zeZgd1Mv1AY6iipERcu8r9VXX73uc+vH/4YT2HDgvLS1HfLB+8H4LF3p78//n2lsfaSm1MXGdGfjdTVA0BuTXuqq7NI50WOK1hCyOmd6VB5JWBUcKc3dvAELtie5v/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770676579; c=relaxed/simple;
	bh=asJTMFEJGZb2fFckEUil8MmgGN64LZXvTv6AjF4ZbXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAFw+ywwElJB2eNQxQcWV9OHsZkbhMM6VG+ggav5QdN4kxUY6SbjBrKPfr3AAxG26X4sgmbWJ6Jj5I1J6I4cWqmP0tAhs2JMTMgTzlZJudOCsm3ymVai4gt3BAs7F33LMRnp8aAzuSw5C0ZAzNrqyqewxS7bGMpA9NYvc+B7j+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlGn1OkL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2BCC116C6;
	Mon,  9 Feb 2026 22:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770676579;
	bh=asJTMFEJGZb2fFckEUil8MmgGN64LZXvTv6AjF4ZbXo=;
	h=Date:From:To:Cc:Subject:From;
	b=qlGn1OkLMmQVFUurCYocgwIuEQjcpFG1i1WfhSd+AZGzeeZ14+qoyCfGTAwaSmsDe
	 c68sgMqtGLMxTe32fbxNnHSTtDdRzVcgtSqb5F6vD7s6lkepxos4phYainNQiPiHvO
	 ws7QqkValGM3gRjy+SxuhUaFZpmDlBy3gaJa0vaZ1BV3rYtzjHd/UD5Hg7yWkNSu9o
	 SuvHvyT4WmmA/dDy/LSPCVdMrfzcwH1Z1cfA1yWdWjDFHCk0QsWMTaojyNbERI0ofZ
	 D2SGasWQcOnLK+xwzF1Sd5b/qJVF7oIgFmyGgXjfTCAGpiEW23iGvF6pSZAwQfEVxj
	 AbJcbmcyoKvxA==
Date: Mon, 9 Feb 2026 15:36:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [GIT PULL] Kbuild / Kconfig updates for 7.0
Message-ID: <20260209223615.GA3506796@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11091-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 982FF11512F
X-Rspamd-Action: no action

Hi Linus,

Please pull these Kbuild / Kconfig updates for 7.0. I am only aware of
one trivial conflict against the Documentation tree:

  https://lore.kernel.org/aXeZT4VGXCf3a6CF@sirena.org.uk/

Please let me know if there are any issues.

Cheers,
Nathan

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-7.0-1

for you to fetch changes up to d8ad80a85b96649a6ef30976762660245ae61a25:

  kbuild: remove dependency of run-command on config (2026-02-07 16:09:14 -0600)

----------------------------------------------------------------
Kbuild/Kconfig updates for 7.0

Kbuild changes
==============

* Drop '*_probe' pattern from modpost section check allowlist, which hid
  legitimate warnings (Johan Hovold)

* Disable -Wtype-limits altogether, instead of enabling at W=2 (Vincent
  Mailhol)

* Improve UAPI testing to skip testing headers that require a libc when
  CONFIG_CC_CAN_LINK is not set, opening up testing of headers with no
  libc dependencies to more environments (Thomas Weißschuh)

* Update gendwarfksyms documentation with required dependencies (Jihan
  LIN)

* Reject invalid LLVM= values to avoid unintentionally falling back to
  system toolchain (Thomas Weißschuh)

* Add a script to help run the kernel build process in a container for
  consistent environments and testing (Guillaume Tucker)

* Simplify kallsyms by getting rid of the relative base (Ard Biesheuvel)

* Performance and usability improvements to scripts/make_fit.py (Simon
  Glass)

* Minor various clean ups and fixes

Kconfig changes
===============

* Move XPM icons to individual files, clearing up GTK deprecation
  warnings (Rostislav Krasny)

* Support

    depends on FOO if BAR

  as syntactic sugar for

    depends on FOO || !BAR' (Nicolas Pitre, Graham Roff)

* Refactor merge_config.sh to use awk over shell/sed/grep, dramatically
  speeding up processing large number of config fragments (Anders
  Roxell, Mikko Rapeli)

----------------------------------------------------------------
Anders Roxell (1):
      scripts: kconfig: merge_config.sh: refactor from shell/sed/grep to awk

Ard Biesheuvel (2):
      mips: Add support for PC32 relocations in vmlinux
      kallsyms: Get rid of kallsyms relative base

Diego Viola (1):
      streamline_config.pl: remove superfluous exclamation mark

Guillaume Tucker (2):
      scripts: add tool to run containerized builds
      Documentation: dev-tools: add container.rst page

Jihan LIN (2):
      Documentation/kbuild: Document gendwarfksyms build dependencies
      Documentation/kbuild: gendwarfksyms: Style cleanup

Johan Hovold (1):
      modpost: drop '*_probe' from section check whitelist

Matthew Maurer (1):
      rust: kconfig: Don't require RUST_IS_AVAILABLE for rustc-option

Michal Suchanek (1):
      kbuild: dummy-tools: Add python3

Mikko Rapeli (2):
      scripts: kconfig: merge_config.sh: use awk in checks too
      scripts: kconfig: merge_config.sh: warn on duplicate input files

Nathan Chancellor (1):
      Merge UAPI header testing improvements into kbuild-next

Nicolas Pitre (1):
      kconfig: Support conditional deps using "depends on X if Y"

Nicolas Schier (1):
      kbuild: Add top-level target for building gen_init_cpio

René Rebe (1):
      modpost: Amend ppc64 save/restfpr symnames for -Os build

Rostislav Krasny (1):
      kconfig: move XPM icons to separate files

Simon Glass (6):
      scripts/make_fit: Speed up operation
      scripts/make_fit: Support an initial ramdisk
      scripts/make_fit: Move dtb processing into a function
      kbuild: Support a FIT_EXTRA_ARGS environment variable
      scripts/make_fit: Support a few more parallel compressors
      scripts/make_fit: Compress dtbs in parallel

Thomas Weißschuh (11):
      kbuild: uapi: Drop check_config()
      kbuild: uapi: validate that headers do not use libc
      hexagon: Drop invalid UAPI header asm/signal.h
      kbuild: uapi: don't compile test bpf_perf_event.h on xtensa
      kbuild: uapi: split out command conditions into variables
      kbuild: Drop superfluous compiler option checks
      hyper-v: Mark inner union in hv_kvp_exchg_msg_value as packed
      virt: vbox: uapi: Mark inner unions in packed structs as packed
      kbuild: uapi: drop dependency on CC_CAN_LINK
      kbuild: Reject unexpected values for LLVM=
      kbuild: remove dependency of run-command on config

Tiezhu Yang (1):
      MAINTAINERS: Add scripts/install.sh into Kbuild entry

Vincent Mailhol (3):
      kbuild: remove gcc's -Wtype-limits
      kbuild: cleanup local -Wno-type-limits exceptions
      overflow: Remove is_non_negative() and is_negative()

Yao Zi (1):
      MIPS: tools: relocs: Ship a definition of R_MIPS_PC32

 Documentation/dev-tools/container.rst              | 227 ++++++++++++++
 Documentation/dev-tools/index.rst                  |   1 +
 Documentation/kbuild/gendwarfksyms.rst             | 123 ++++----
 Documentation/kbuild/kconfig-language.rst          |  22 +-
 MAINTAINERS                                        |   8 +
 Makefile                                           |  13 +-
 arch/hexagon/include/{uapi => }/asm/signal.h       |   0
 arch/mips/boot/tools/relocs.c                      |   2 +
 arch/mips/boot/tools/relocs.h                      |   7 +
 arch/mips/include/asm/elf.h                        |   2 +
 drivers/gpu/drm/Makefile                           |   1 -
 fs/btrfs/Makefile                                  |   1 -
 include/linux/overflow.h                           |  10 +-
 include/uapi/linux/hyperv.h                        |   2 +-
 include/uapi/linux/vbox_vmmdev_types.h             |   4 +-
 init/Kconfig                                       |   2 +-
 kernel/kallsyms.c                                  |   6 +-
 kernel/kallsyms_internal.h                         |   1 -
 kernel/vmcore_info.c                               |   1 -
 scripts/Kconfig.include                            |   2 -
 scripts/Makefile.lib                               |   2 +-
 scripts/Makefile.package                           |   1 -
 scripts/Makefile.warn                              |  27 +-
 scripts/container                                  | 199 +++++++++++++
 scripts/dummy-tools/python3                        |   4 +
 scripts/kallsyms.c                                 |  64 ++--
 scripts/kconfig/Makefile                           |   4 +-
 scripts/kconfig/gconf.c                            |  35 ++-
 scripts/kconfig/icons/back.xpm                     |  29 ++
 scripts/kconfig/icons/choice_no.xpm                |  18 ++
 scripts/kconfig/icons/choice_yes.xpm               |  18 ++
 scripts/kconfig/icons/load.xpm                     |  31 ++
 scripts/kconfig/icons/menu.xpm                     |  18 ++
 scripts/kconfig/icons/menuback.xpm                 |  18 ++
 scripts/kconfig/icons/save.xpm                     |  31 ++
 scripts/kconfig/icons/single_view.xpm              |  28 ++
 scripts/kconfig/icons/split_view.xpm               |  28 ++
 scripts/kconfig/icons/symbol_mod.xpm               |  18 ++
 scripts/kconfig/icons/symbol_no.xpm                |  18 ++
 scripts/kconfig/icons/symbol_yes.xpm               |  18 ++
 scripts/kconfig/icons/tree_view.xpm                |  28 ++
 scripts/kconfig/images.c                           | 328 ---------------------
 scripts/kconfig/images.h                           |  33 ---
 scripts/kconfig/lkc.h                              |   2 +-
 scripts/kconfig/menu.c                             |  12 +-
 scripts/kconfig/merge_config.sh                    | 276 +++++++++++++----
 scripts/kconfig/parser.y                           |   6 +-
 scripts/kconfig/qconf.cc                           |  29 +-
 scripts/kconfig/streamline_config.pl               |   2 +-
 scripts/kconfig/tests/conditional_dep/Kconfig      |  32 ++
 scripts/kconfig/tests/conditional_dep/__init__.py  |  14 +
 .../kconfig/tests/conditional_dep/expected_config1 |  11 +
 .../kconfig/tests/conditional_dep/expected_config2 |   9 +
 .../kconfig/tests/conditional_dep/expected_config3 |  11 +
 scripts/kconfig/tests/conditional_dep/test_config1 |   6 +
 scripts/kconfig/tests/conditional_dep/test_config2 |   7 +
 scripts/kconfig/tests/conditional_dep/test_config3 |   6 +
 scripts/link-vmlinux.sh                            |   4 +
 scripts/make_fit.py                                | 179 ++++++++---
 scripts/mod/modpost.c                              |   6 +-
 tools/perf/tests/vmlinux-kallsyms.c                |   1 -
 usr/include/Makefile                               |  87 +++++-
 usr/include/headers_check.pl                       |   8 -
 63 files changed, 1515 insertions(+), 626 deletions(-)
 create mode 100644 Documentation/dev-tools/container.rst
 rename arch/hexagon/include/{uapi => }/asm/signal.h (100%)
 create mode 100755 scripts/container
 create mode 100755 scripts/dummy-tools/python3
 create mode 100644 scripts/kconfig/icons/back.xpm
 create mode 100644 scripts/kconfig/icons/choice_no.xpm
 create mode 100644 scripts/kconfig/icons/choice_yes.xpm
 create mode 100644 scripts/kconfig/icons/load.xpm
 create mode 100644 scripts/kconfig/icons/menu.xpm
 create mode 100644 scripts/kconfig/icons/menuback.xpm
 create mode 100644 scripts/kconfig/icons/save.xpm
 create mode 100644 scripts/kconfig/icons/single_view.xpm
 create mode 100644 scripts/kconfig/icons/split_view.xpm
 create mode 100644 scripts/kconfig/icons/symbol_mod.xpm
 create mode 100644 scripts/kconfig/icons/symbol_no.xpm
 create mode 100644 scripts/kconfig/icons/symbol_yes.xpm
 create mode 100644 scripts/kconfig/icons/tree_view.xpm
 delete mode 100644 scripts/kconfig/images.c
 delete mode 100644 scripts/kconfig/images.h
 create mode 100644 scripts/kconfig/tests/conditional_dep/Kconfig
 create mode 100644 scripts/kconfig/tests/conditional_dep/__init__.py
 create mode 100644 scripts/kconfig/tests/conditional_dep/expected_config1
 create mode 100644 scripts/kconfig/tests/conditional_dep/expected_config2
 create mode 100644 scripts/kconfig/tests/conditional_dep/expected_config3
 create mode 100644 scripts/kconfig/tests/conditional_dep/test_config1
 create mode 100644 scripts/kconfig/tests/conditional_dep/test_config2
 create mode 100644 scripts/kconfig/tests/conditional_dep/test_config3

