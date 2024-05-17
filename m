Return-Path: <linux-kbuild+bounces-1882-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B18C877C
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 15:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C749B1F210CB
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 13:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A7B54F95;
	Fri, 17 May 2024 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRfzu44M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD804F896;
	Fri, 17 May 2024 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715954005; cv=none; b=PG0lSheDqtkDWkuIl92nG6oxfsKW44I8BcUn01DLsxsayMspKz2yUZIrDdzr6w/T7z3rl35j3KKEMvsZKAxu0DfGey/UR4qhq7AwnDd8xhxd0K9b3ZPu8As8yRWdQCDYir5p7TBPZWoANcvXBvHf94gb8tZ3qG4E1nEu6k7w5/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715954005; c=relaxed/simple;
	bh=Yyh0Uj9+41K/rG4aw95IIWmOeWYmMDJLjQFcuqVick4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hdxxt3DTTREtmaPRXbAvH2ypwASV8wl+3K7X8DigEz65LEN1xYespz0tmOUPzdnCm670SnAZR1/UAT4OqANpYGXF4rqF9mvJNNihoUXyE/KpnrJ/ARxDGM3rl7PplPgWPptkR/+GKJAR9QF3pAgzvf0k182Ui3R6gEMwCNuS/fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRfzu44M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDBFC2BD10;
	Fri, 17 May 2024 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715954004;
	bh=Yyh0Uj9+41K/rG4aw95IIWmOeWYmMDJLjQFcuqVick4=;
	h=From:Date:Subject:To:Cc:From;
	b=JRfzu44Mm1YIB26kKJT3HjLJ4RpTbj2CiXRZ16idsDo1y+uXwRWBCg7a9T7/FrCTq
	 kPbcBL430fYR7ZW40EX1gxfqzadSYgS6yU2+ht9MLJ0x31QbxTjFzcZFGJZYAbbGQ/
	 G1yWHT0UB8K+nrcCGLhDjlPNQdAKSwaFmIn9joTLZySQcFCnmDdTZnkelqsMPqPoHR
	 CGk3KGcI/owG73GAIxu/CEpfBDftwwzO0LDdzL1XLF2s0EXvLutPJ7X5drugiN9wyG
	 rr9/Vlycq9qQsRU5SBkH6M9VI750APfvl6VHu5X07Xwn3WlCdJfICkUvpfqOL9x5YW
	 jAQkVxGsEuWLQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52327368e59so2158445e87.1;
        Fri, 17 May 2024 06:53:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVW8Yzj2IvNbXQ1EY0uK297YOydpci6OvgIdMJaXOmI1L+LaaWDDKtbw6PJxKM+lnFdVZ6qBc8O1yvVfqcufAzvLegs0NXsiXJNwaor
X-Gm-Message-State: AOJu0YypQCfpD8WS3R0jfZJLI3e4nB0ZFY2sxEimYWbppqmcFCdcpRQK
	lI33B+JsJq68cOGBP6hKuZzSdmAkmyY4Mj8hDNzgPCgkvz5/9fOjPvb5sd/G0EvEh37CYEpvQlZ
	+Hv1Ahh+u5+gzldHHmTw++L/P9As=
X-Google-Smtp-Source: AGHT+IGFZuTSR5vI6kI7phN+jd+ubxKcz1/2FbCWLUeKpSiVSc4WPA2KCs4JNLqJXbeKW6d5Lc7TscmzpsYCZ/ENbeQ=
X-Received: by 2002:ac2:5a4a:0:b0:519:1e33:9d85 with SMTP id
 2adb3069b0e04-5220fd7ad22mr12558469e87.36.1715954002931; Fri, 17 May 2024
 06:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 17 May 2024 22:52:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6HRC42sL7TT05k6Y8N4jFcxfz5JY4EYAGLeP2sNGgRg@mail.gmail.com>
Message-ID: <CAK7LNAQ6HRC42sL7TT05k6Y8N4jFcxfz5JY4EYAGLeP2sNGgRg@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v6.10-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,


Please pull Kbuild updates for v6.10-rc1.


You will see conflicts in 4 files.

All of them are properly resolved in linux-next.



After merging this pull request, just in case, please run

  $ git grep '$(srctree)/$(src)'

If you get a hit, please replace $(srctree)/$(src) with $(src).


My commit b1992c3772e6 needs to consistently replace $(srctree)/$(src),
but I cannot touch in-flight patches merged in other subsystems.



The following are the merge conflicts I am aware of:



[1] drivers/gpu/drm/msm/Makefile

conflict between 0fddd045f88e between b1992c3772e6

addressed by:
https://lore.kernel.org/all/20240507125132.2af57c71@canb.auug.org.au/


[2] drivers/misc/lkdtm/Makefile

conflict between fb28a8862dc4 between 7f7f6f7ad654

addressed by:
https://lore.kernel.org/all/20240513151316.6bd6fc87@canb.auug.org.au/


[3] drivers/net/wireless/intel/iwlwifi/mvm/Makefile

conflict between 2887af4d22f9 and b1992c3772e6

addressed by:
https://lore.kernel.org/all/20240506112810.02ae6c17@canb.auug.org.au/


[4] rust/Makefile

conflict between 11795ae4cc43 and b1992c3772e6

addressed by:
https://lore.kernel.org/all/20240506153333.7b36a0e6@canb.auug.org.au/







Thank you.




The following changes since commit ed30a4a51bb196781c8058073ea720133a65596f:

  Linux 6.9-rc5 (2024-04-21 12:35:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v6.10

for you to fetch changes up to 6ffe4fdf8901dc0a15d7278531503ecd4522ae15:

  kconfig: use sym_get_choice_menu() in sym_check_prop() (2024-05-16
03:18:41 +0900)

----------------------------------------------------------------
Kbuild updates for v6.10

 - Avoid 'constexpr', which is a keyword in C23

 - Allow 'dtbs_check' and 'dt_compatible_check' run independently of
   'dt_binding_check'

 - Fix weak references to avoid GOT entries in position-independent
   code generation

 - Convert the last use of 'optional' property in arch/sh/Kconfig

 - Remove support for the 'optional' property in Kconfig

 - Remove support for Clang's ThinLTO caching, which does not work with
   the .incbin directive

 - Change the semantics of $(src) so it always points to the source
   directory, which fixes Makefile inconsistencies between upstream and
   downstream

 - Fix 'make tar-pkg' for RISC-V to produce a consistent package

 - Provide reasonable default coverage for objtool, sanitizers, and
   profilers

 - Remove redundant OBJECT_FILES_NON_STANDARD, KASAN_SANITIZE, etc.

 - Remove the last use of tristate choice in drivers/rapidio/Kconfig

 - Various cleanups and fixes in Kconfig

----------------------------------------------------------------
Ard Biesheuvel (2):
      kallsyms: Avoid weak references for kallsyms symbols
      vmlinux: Avoid weak reference to notes section

Arnd Bergmann (1):
      scripts/unifdef: avoid constexpr keyword

Emil Renner Berthing (1):
      kbuild: buildtar: install riscv compressed images as vmlinuz

Masahiro Yamada (37):
      parisc: vdso: remove unused C build rule in vdso32/Makefile
      kbuild: buildtar: add comments about inconsistent package generation
      kconfig: add menu_next() function and menu_for_each(_sub)_entry macros
      kconfig: use menu_for_each_entry() to traverse menu tree
      kconfig: remove unneeded if-conditional in conf_choice()
      kbuild: buildtar: remove warning for the default case
      kconfig: remove SYMBOL_CHOICE flag
      sh: Convert the last use of 'optional' property in Kconfig
      kconfig: remove 'optional' property support
      kconfig: remove SYMBOL_NO_WRITE flag
      arch: use $(obj)/ instead of $(src)/ for preprocessed linker scripts
      kbuild: do not add $(srctree) or $(objtree) to header search paths
      kbuild: use $(obj)/ instead of $(src)/ for common pattern rules
      kbuild: use $(src) instead of $(srctree)/$(src) for source directory
      kbuild: remove redundant $(wildcard ) for rm-files
      kbuild: add 'private' to target-specific variables
      kbuild: simplify generic vdso installation code
      kconfig: gconf: update pane correctly after loading a config file
      kconfig: gconf: remove debug code
      kconfig: gconf: use MENU_CHANGED instead of SYMBOL_CHANGED
      kconfig: use linked list in sym_set_changed()
      kconfig: turn conf_choice() into void function
      kconfig: turn missing prompt for choice members into error
      kconfig: turn defaults and additional prompt for choice members into error
      kconfig: add sym_get_choice_menu() helper
      kconfig: use sym_get_choice_menu() in conf_write_defconfig()
      kconfig: use menu_list_for_each_sym() in sym_check_choice_deps()
      kbuild: provide reasonable defaults for tool coverage
      Makefile: remove redundant tool coverage variables
      kbuild: use GCOV_PROFILE and KCSAN_SANITIZE in scripts/Makefile.modfinal
      kconfig: gconf: show checkbox for choice correctly
      kconfig: m/nconf: remove dead code to display children of choice members
      kconfig: m/nconf: remove dead code to display value of bool choice
      kconfig: m/nconf: merge two item_add_str() calls
      kconfig: lxdialog: remove initialization with A_NORMAL
      rapidio: remove choice for enumeration
      kconfig: use sym_get_choice_menu() in sym_check_prop()

Nathan Chancellor (1):
      kbuild: Remove support for Clang's ThinLTO caching

Rob Herring (3):
      dt-bindings: kbuild: Simplify examples target patsubst
      dt-bindings: kbuild: Split targets out to separate rules
      dt-bindings: kbuild: Add separate target/dependency for
processed-schema.json

Wang Yao (1):
      modules: Drop the .export_symbol section from the final modules

 Documentation/Makefile                                        |   8 +--
 Documentation/devicetree/bindings/Makefile                    |  36 ++++++----
 Documentation/kbuild/kconfig-language.rst                     |   3 -
 Documentation/kbuild/makefiles.rst                            |  12 ++--
 Makefile                                                      |  44
+++++++-----
 arch/arc/boot/dts/Makefile                                    |   3 +-
 arch/arm/Kbuild                                               |   2 +-
 arch/arm/boot/Makefile                                        |   3 +-
 arch/arm/boot/bootp/Makefile                                  |   1 -
 arch/arm/boot/compressed/Makefile                             |   7 --
 arch/arm/mach-s3c/Makefile                                    |   2 +-
 arch/arm/plat-orion/Makefile                                  |   2 +-
 arch/arm/tools/Makefile                                       |   2 +-
 arch/arm/vdso/Makefile                                        |   9 ---
 arch/arm64/kernel/pi/Makefile                                 |   6 --
 arch/arm64/kernel/vdso/Makefile                               |  10 +--
 arch/arm64/kernel/vdso32/Makefile                             |   2 +-
 arch/arm64/kvm/Makefile                                       |   4 +-
 arch/arm64/kvm/hyp/Makefile                                   |   2 +-
 arch/arm64/kvm/hyp/nvhe/Makefile                              |  13 ----
 arch/csky/boot/dts/Makefile                                   |   4 +-
 arch/csky/kernel/vdso/Makefile                                |   8 +--
 arch/loongarch/kvm/Makefile                                   |   2 +-
 arch/loongarch/vdso/Makefile                                  |   9 +--
 arch/mips/boot/compressed/Makefile                            |   6 --
 arch/mips/kernel/syscalls/Makefile                            |   2 +-
 arch/mips/vdso/Makefile                                       |  11 +--
 arch/nios2/boot/dts/Makefile                                  |   3 +-
 arch/parisc/boot/compressed/Makefile                          |   4 --
 arch/parisc/kernel/vdso32/Makefile                            |   9 +--
 arch/parisc/kernel/vdso64/Makefile                            |   4 +-
 arch/powerpc/boot/Makefile                                    |   6 +-
 arch/powerpc/boot/dts/Makefile                                |   3 +-
 arch/powerpc/boot/dts/fsl/Makefile                            |   3 +-
 arch/powerpc/kernel/vdso/Makefile                             |  16 ++---
 arch/powerpc/purgatory/Makefile                               |   3 -
 arch/riscv/boot/Makefile                                      |   2 -
 arch/riscv/kernel/compat_vdso/Makefile                        |   8 +--
 arch/riscv/kernel/pi/Makefile                                 |   6 --
 arch/riscv/kernel/vdso/Makefile                               |   8 +--
 arch/riscv/kvm/Makefile                                       |   2 +-
 arch/riscv/purgatory/Makefile                                 |   8 ---
 arch/s390/kernel/syscalls/Makefile                            |   4 +-
 arch/s390/kernel/vdso32/Makefile                              |  12 +---
 arch/s390/kernel/vdso64/Makefile                              |  12 +---
 arch/s390/purgatory/Makefile                                  |   8 ---
 arch/sh/Kconfig                                               |   6 +-
 arch/sh/boot/compressed/Makefile                              |   3 -
 arch/sh/configs/apsh4a3a_defconfig                            |   1 +
 arch/sh/configs/apsh4ad0a_defconfig                           |   1 +
 arch/sh/configs/edosk7705_defconfig                           |   1 +
 arch/sh/configs/hp6xx_defconfig                               |   1 +
 arch/sh/configs/landisk_defconfig                             |   1 +
 arch/sh/configs/magicpanelr2_defconfig                        |   1 +
 arch/sh/configs/rsk7264_defconfig                             |   1 +
 arch/sh/configs/rsk7269_defconfig                             |   1 +
 arch/sh/configs/se7619_defconfig                              |   1 +
 arch/sh/configs/se7705_defconfig                              |   1 +
 arch/sh/configs/se7722_defconfig                              |   1 +
 arch/sh/configs/se7750_defconfig                              |   1 +
 arch/sh/configs/secureedge5410_defconfig                      |   1 +
 arch/sh/configs/sh7710voipgw_defconfig                        |   1 +
 arch/sh/configs/sh7724_generic_defconfig                      |   1 +
 arch/sh/configs/sh7770_generic_defconfig                      |   1 +
 arch/sh/configs/sh7785lcr_32bit_defconfig                     |   1 +
 arch/sh/configs/sh7785lcr_defconfig                           |   1 +
 arch/sh/configs/urquell_defconfig                             |   1 +
 arch/sh/kernel/vsyscall/Makefile                              |   4 +-
 arch/sparc/vdso/Makefile                                      |   4 +-
 arch/um/kernel/Makefile                                       |   2 +-
 arch/x86/boot/Makefile                                        |  17 +----
 arch/x86/boot/compressed/Makefile                             |  11 ---
 arch/x86/entry/vdso/Makefile                                  |  28 +-------
 arch/x86/kernel/Makefile                                      |   2 +-
 arch/x86/kernel/cpu/Makefile                                  |   2 +-
 arch/x86/mm/Makefile                                          |   2 +-
 arch/x86/purgatory/Makefile                                   |   9 ---
 arch/x86/realmode/rm/Makefile                                 |  11 ---
 arch/x86/um/vdso/Makefile                                     |   9 +--
 arch/xtensa/boot/dts/Makefile                                 |   3 +-
 certs/Makefile                                                |   4 +-
 drivers/Makefile                                              |   5 --
 drivers/crypto/intel/qat/qat_420xx/Makefile                   |   2 +-
 drivers/crypto/intel/qat/qat_4xxx/Makefile                    |   2 +-
 drivers/crypto/intel/qat/qat_c3xxx/Makefile                   |   2 +-
 drivers/crypto/intel/qat/qat_c3xxxvf/Makefile                 |   2 +-
 drivers/crypto/intel/qat/qat_c62x/Makefile                    |   2 +-
 drivers/crypto/intel/qat/qat_c62xvf/Makefile                  |   2 +-
 drivers/crypto/intel/qat/qat_dh895xcc/Makefile                |   2 +-
 drivers/crypto/intel/qat/qat_dh895xccvf/Makefile              |   2 +-
 drivers/firmware/efi/libstub/Makefile                         |  11 ---
 drivers/gpu/drm/amd/amdgpu/Makefile                           |   2 +-
 drivers/gpu/drm/arm/display/komeda/Makefile                   |   4 +-
 drivers/gpu/drm/i915/Makefile                                 |   4 +-
 drivers/gpu/drm/imagination/Makefile                          |   2 +-
 drivers/gpu/drm/msm/Makefile                                  |   8 +--
 drivers/gpu/drm/nouveau/Kbuild                                |  10 ++-
 drivers/gpu/drm/xe/Makefile                                   |  10 +--
 drivers/hid/amd-sfh-hid/Makefile                              |   2 +-
 drivers/hid/intel-ish-hid/Makefile                            |   2 +-
 drivers/md/dm-vdo/Makefile                                    |   2 +-
 drivers/misc/lkdtm/Makefile                                   |   4 --
 drivers/net/ethernet/aquantia/atlantic/Makefile               |   2 +-
 drivers/net/ethernet/chelsio/libcxgb/Makefile                 |   2 +-
 drivers/net/ethernet/fungible/funeth/Makefile                 |   2 +-
 drivers/net/ethernet/hisilicon/hns3/Makefile                  |   2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/Makefile     |   4 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/Makefile |   6 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/Makefile |   6 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/Makefile |   6 +-
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/Makefile     |   6 +-
 drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile     |   2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/Makefile               |   2 +-
 drivers/net/wireless/intel/iwlwifi/mei/Makefile               |   2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/Makefile               |   2 +-
 drivers/net/wireless/intel/iwlwifi/tests/Makefile             |   2 +-
 drivers/net/wireless/realtek/rtl818x/rtl8180/Makefile         |   2 +-
 drivers/net/wireless/realtek/rtl818x/rtl8187/Makefile         |   2 +-
 drivers/rapidio/Kconfig                                       |  17 +----
 drivers/scsi/aic7xxx/Makefile                                 |  12 ++--
 drivers/staging/rtl8723bs/Makefile                            |   2 +-
 fs/iomap/Makefile                                             |   2 +-
 fs/unicode/Makefile                                           |  14 ++--
 fs/xfs/Makefile                                               |   4 +-
 include/asm-generic/vmlinux.lds.h                             |  19 +++++
 init/Makefile                                                 |   5 +-
 kernel/kallsyms.c                                             |   6 --
 kernel/kallsyms_internal.h                                    |  30 ++++----
 kernel/ksysfs.c                                               |   4 +-
 lib/Makefile                                                  |   6 +-
 lib/buildid.c                                                 |   4 +-
 lib/raid6/Makefile                                            |   2 +-
 net/wireless/Makefile                                         |   2 +-
 rust/Makefile                                                 |   6 +-
 samples/bpf/Makefile                                          |   2 +-
 samples/hid/Makefile                                          |   2 +-
 scripts/Kbuild.include                                        |   3 +-
 scripts/Makefile.asm-generic                                  |   6 +-
 scripts/Makefile.build                                        |  36 +++++-----
 scripts/Makefile.clean                                        |   2 +-
 scripts/Makefile.host                                         |   4 +-
 scripts/Makefile.lib                                          |  34 +++++----
 scripts/Makefile.modfinal                                     |   4 +-
 scripts/Makefile.modpost                                      |   2 +-
 scripts/Makefile.vdsoinst                                     |   7 +-
 scripts/Makefile.vmlinux                                      |   3 -
 scripts/dtc/Makefile                                          |   6 +-
 scripts/gdb/linux/Makefile                                    |   2 +-
 scripts/genksyms/Makefile                                     |   4 +-
 scripts/kconfig/Makefile                                      |   8 +--
 scripts/kconfig/conf.c                                        |  16 ++---
 scripts/kconfig/confdata.c                                    |  46
++++--------
 scripts/kconfig/expr.h                                        |   6 +-
 scripts/kconfig/gconf.c                                       |  80
++++-----------------
 scripts/kconfig/lexer.l                                       |   1 -
 scripts/kconfig/lkc.h                                         |  13 ++--
 scripts/kconfig/lkc_proto.h                                   |   1 +
 scripts/kconfig/lxdialog/util.c                               |   9 ---
 scripts/kconfig/mconf.c                                       | 104
+++++++++++----------------
 scripts/kconfig/menu.c                                        |  51
++++++-------
 scripts/kconfig/nconf.c                                       | 118
++++++++++++-------------------
 scripts/kconfig/parser.y                                      |  76
++++++++++++++------
 scripts/kconfig/symbol.c                                      |  73
++++++++++++++-----
 scripts/kconfig/tests/choice/Kconfig                          |  26 -------
 scripts/kconfig/tests/choice/__init__.py                      |   2 -
 scripts/kconfig/tests/choice/allmod_expected_config           |   4 --
 scripts/kconfig/tests/choice/allyes_expected_config           |   4 --
 scripts/kconfig/tests/choice/oldask0_expected_stdout          |   2 -
 scripts/kconfig/tests/choice/oldask1_config                   |   1 -
 scripts/kconfig/tests/choice/oldask1_expected_stdout          |   6 --
 scripts/mod/Makefile                                          |   1 -
 scripts/module.lds.S                                          |   1 +
 scripts/package/buildtar                                      |  34 ++++-----
 scripts/unifdef.c                                             |  12 ++--
 security/tomoyo/Makefile                                      |   2 +-
 usr/Makefile                                                  |   2 +-
 usr/include/Makefile                                          |   2 +-
 177 files changed, 610 insertions(+), 945 deletions(-)


--
Best Regards
Masahiro Yamada

