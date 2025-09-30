Return-Path: <linux-kbuild+bounces-8985-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF3DBAB48D
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Sep 2025 06:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6319B3C0875
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Sep 2025 04:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78271247284;
	Tue, 30 Sep 2025 04:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P84j0X3q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF8158DAC;
	Tue, 30 Sep 2025 04:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759205484; cv=none; b=W35OVVyL4c9LRpAj6P71MV9r3CcXCOaSV0hIhc1myPPu/PoIXA5N/e+rERwf/DaaVYafcUDvqRWS94nkiz2afvX98h1pbNTSI5EVKdrqYIphOsaMmRGfz6jq52bmY+xAuuPBBA3uda7j3mwyU3qO4VkLnmjKLV8d60B/3uI+7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759205484; c=relaxed/simple;
	bh=tEA9RAVe902bczUpATC5xzP8yIKDSnkt/x8+xZUqgrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RhhGIfxmeFOfMYKtjPdK32+xxhrRglzh5eTDq06FyUKWNjKVOtI0UkLnnJVyerdBaYZjUxZ7hbOqtvHtl6CpO/Ecyf4ks70vTzY+Yf7SGs8z6LmEtU9Q7mn86DO4ZsWrBmt8y3dgBDoj1RIQtHHCr49sbHoZK1eZ+aqhX2m7QTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P84j0X3q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59E5C4CEF0;
	Tue, 30 Sep 2025 04:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759205484;
	bh=tEA9RAVe902bczUpATC5xzP8yIKDSnkt/x8+xZUqgrk=;
	h=Date:From:To:Cc:Subject:From;
	b=P84j0X3qDCeotY/jwXbqpDkgtRPD+bGl1EcZOI4xWZ2cl5pTmHyz1pFkOfrbIbwAR
	 MYi/k7Gj0kAgSezlCV5zeEZZeVy1yRHnAY2wQAH9/qroo1rzdCEHcjR1VzUhoqOluE
	 0Ff2pomvofgwOL2SpTolqTAw5qyWhZs3/2LYf4IncWXEwBvJQMUOycQ2U3DLnOflX+
	 yBAoGKxYcDK0KLXd3H5Nvy3Hx1pBL2stUHb1O0W/PZz19GZsqa6F61EzAjv4jX+5V0
	 M2nrxWb7Pz1PzyvEn+iu4+W9GaXkwzrlYFGOLUYGYXvpyaw+ICfBn/zmAtDnOY4oVv
	 9v0TjotiBlqDg==
Date: Mon, 29 Sep 2025 21:11:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Kbuild updates for 6.18
Message-ID: <20250930041119.GA1936516@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these updates to Kbuild for 6.18. This is my first pull
request, so if I have done something incorrect or unsatisfactory to
your standards, please let me know so I (and Nicolas) can avoid
repeating mistakes in the future.

The majority of these changes have been in -next for several cycles
with no reported problems. I am only aware of one conflict with the
arm64 tree around CONFIG_CPU_BIG_ENDIAN, Mark's resolution looks
correct to me.

  https://lore.kernel.org/aNU-sG84vqPj7p7G@sirena.org.uk/

There are several changes from other areas (mostly architectures) that
should have their appropriate acks and such.

There is a back merge of 6.17-rc6, which should have sufficient
justification but I know back merges can be contentious so I figured
I would be open with it up front anyways. Looking back on it, I probably
should have only merged up to 6.17-rc4 for commit bd7c2312128e ("pinctrl:
meson: Fix typo in device table macro") but I went with -rc6 to try and
head off a simple conflict from commit 41f9049cff32 ("riscv: Only allow
LTO with CMODEL_MEDANY") in -rc5. In the end, it didn't matter because
of the arm64 conflict so I will be more careful in the future.

Cheers,
Nathan

----------------------------------------------------------------

The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e:

  Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-6.18-1

for you to fetch changes up to 2ea77fca84f07849aa995271271340d262d0c2e9:

  modpost: Initialize builtin_modname to stop SIGSEGVs (2025-09-28 07:54:07 -0400)

----------------------------------------------------------------
Kbuild updates for 6.18

- Extend modules.builtin.modinfo to include module aliases from
  MODULE_DEVICE_TABLE for builtin modules so that userspace tools (such
  as kmod) can verify that a particular module alias will be handled by
  a builtin module.

- Bump the minimum version of LLVM for building the kernel to 15.0.0.

- Upgrade several userspace API checks in headers_check.pl to errors.

- Unify and consolidate CONFIG_WERROR / W=e handling.

- Turn assembler and linker warnings into errors with CONFIG_WERROR /
  W=e.

- Respect CONFIG_WERROR / W=e when building userspace programs
  (userprogs).

- Enable -Werror unconditionally when building host programs
  (hostprogs).

- Support copy_file_range() and data segment alignment in gen_init_cpio
  to improve performance on filesystems that support reflinks such as
  btrfs and XFS.

- Miscellaneous small changes to scripts and configuration files.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>

----------------------------------------------------------------
Alexey Gladkov (5):
      s390: vmlinux.lds.S: Reorder sections
      scsi: Always define blogic_pci_tbl structure
      modpost: Add modname to mod_device_table alias
      modpost: Create modalias for builtin modules
      kbuild: vmlinux.unstripped should always depend on .vmlinux.export.o

Andrii Nakryiko (1):
      .gitignore: ignore compile_commands.json globally

David Disseldorp (8):
      gen_init_cpio: write to fd instead of stdout stream
      gen_init_cpio: support -o <output_file> parameter
      gen_init_cpio: attempt copy_file_range for file data
      gen_init_cpio: avoid duplicate strlen calls
      gen_initramfs.sh: use gen_init_cpio -o parameter
      docs: initramfs: file data alignment via name padding
      gen_init_cpio: add -a <data_align> as reflink optimization
      initramfs_test: add filename padding test case

Hugh Dickins (1):
      modpost: Initialize builtin_modname to stop SIGSEGVs

Masahiro Yamada (4):
      kbuild: always create intermediate vmlinux.unstripped
      kbuild: keep .modinfo section in vmlinux.unstripped
      kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
      Documentation: kbuild: note CONFIG_DEBUG_EFI in reproducible builds

Maxime Thiebaut (1):
      extract-vmlinux: Output used decompression method

Miguel Ojeda (1):
      kbuild: rust: move `-Dwarnings` handling to `Makefile.extrawarn`

Nathan Chancellor (15):
      kbuild: Bump minimum version of LLVM for building the kernel to 15.0.0
      arch/Kconfig: Drop always true condition from RANDOMIZE_KSTACK_OFFSET
      ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
      arm64: Remove tautological LLVM Kconfig conditions
      mips: Unconditionally select ARCH_HAS_CURRENT_STACK_POINTER
      powerpc: Drop unnecessary initializations in __copy_inst_from_kernel_nofault()
      riscv: Remove version check for LTO_CLANG selects
      riscv: Unconditionally use linker relaxation
      riscv: Remove ld.lld version checks from many TOOLCHAIN_HAS configs
      lib/Kconfig.debug: Drop CLANG_VERSION check from DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
      objtool: Drop noinstr hack for KCSAN_WEAK_MEMORY
      KMSAN: Remove tautological checks
      Merge patch series "Bump minimum supported version of LLVM for building the kernel to 15.0.0"
      Merge 6.17-rc6 into kbuild-next
      Merge patch series "Add generated modalias to modules.builtin.modinfo"

Randy Dunlap (1):
      kconfig: qconf/xconfig: show the OptionsMode radio button setting at startup

Thomas Weiﬂschuh (11):
      kbuild: uapi: rerun header tests when headers_check.pl changes
      kbuild: uapi: fail header test on compiler warnings
      kbuild: uapi: upgrade warning on asm/types.h inclusion to error
      kbuild: uapi: upgrade check_sizetypes() warning to error
      kbuild: uapi: upgrade check_declarations() warning to error
      kbuild: align W=e with CONFIG_WERROR
      kbuild: unify W=e and CONFIG_WERROR
      kbuild: respect CONFIG_WERROR for linker and assembler
      kbuild: respect CONFIG_WERROR for userprogs
      kbuild: enable -Werror for hostprogs
      kbuild: userprogs: avoid duplication of flags inherited from kernel

Thorsten Blum (1):
      kconfig: nconf: Format and print 'line' without a temporary copy

Vlastimil Babka (1):
      scripts/misc-check: update export checks for EXPORT_SYMBOL_FOR_MODULES()

 .gitignore                                         |   2 +-
 .../driver-api/early-userspace/buffer-format.rst   |   5 +
 Documentation/kbuild/reproducible-builds.rst       |   3 +
 Documentation/process/changes.rst                  |   2 +-
 Makefile                                           |   8 +-
 arch/Kconfig                                       |   1 -
 arch/arm/Kconfig                                   |  11 +-
 arch/arm64/Kconfig                                 |   5 +-
 arch/mips/Kconfig                                  |   2 +-
 arch/powerpc/include/asm/inst.h                    |   4 -
 arch/riscv/Kconfig                                 |  21 +-
 arch/riscv/Makefile                                |   9 +-
 arch/s390/kernel/vmlinux.lds.S                     |  10 +-
 drivers/scsi/BusLogic.c                            |   4 +-
 include/asm-generic/vmlinux.lds.h                  |   2 +-
 include/linux/module.h                             |  18 +-
 init/initramfs_test.c                              |  67 +++++-
 lib/Kconfig.debug                                  |   2 +-
 lib/Kconfig.kcsan                                  |   6 -
 lib/Kconfig.kmsan                                  |  11 +-
 rust/kernel/device_id.rs                           |   8 +-
 scripts/Makefile.extrawarn                         |  18 +-
 scripts/Makefile.vmlinux                           |  79 ++++---
 scripts/Makefile.vmlinux_o                         |  26 +--
 scripts/extract-vmlinux                            |   8 +-
 scripts/kconfig/nconf.gui.c                        |   8 +-
 scripts/kconfig/qconf.cc                           |  13 ++
 scripts/link-vmlinux.sh                            |   5 +-
 scripts/min-tool-version.sh                        |   6 +-
 scripts/misc-check                                 |   4 +-
 scripts/mksysmap                                   |   6 +
 scripts/mod/file2alias.c                           |  35 +++-
 scripts/mod/modpost.c                              |  15 ++
 scripts/mod/modpost.h                              |   2 +
 tools/objtool/check.c                              |  10 -
 tools/power/cpupower/.gitignore                    |   3 -
 usr/gen_init_cpio.c                                | 233 ++++++++++++++-------
 usr/gen_initramfs.sh                               |   7 +-
 usr/include/Makefile                               |   4 +-
 usr/include/headers_check.pl                       |   9 +-
 40 files changed, 432 insertions(+), 260 deletions(-)

