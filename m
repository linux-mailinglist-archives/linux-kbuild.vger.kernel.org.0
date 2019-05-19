Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 157122259D
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2019 03:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbfESBHe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 May 2019 21:07:34 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:37101 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbfESBHe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 May 2019 21:07:34 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x4J17Sqn012202;
        Sun, 19 May 2019 10:07:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x4J17Sqn012202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558228050;
        bh=IhI0yBjnGjQLG7F+/hheP5GcqYbG7sk4U/apfwQ5pSc=;
        h=From:Date:Subject:To:Cc:From;
        b=T+fhJaoKnYk9lQ7+biKBYPKrHimNpum9iVq4avz9numT0vVLTkuGNVcxWQl87m1M9
         KL0KNnN3JDOhuJB0cqDPqkf2yYRyfnu410kYWLEdmd9zUJpyse3q4PLhhgPUqKqbEv
         NICvV//icZmUb9HgavwR6W8cOMB/a1lXsVb4xMBL/Q1kpZ6mz4W9WISUN3tfZ7XGSh
         5W+pGZlJiKkBy2vRdD0r+EFokVSpSJ9oH1oR7gs0iOXCurBWkXB5DnKvcqCT463loP
         AbxxjtVFn7Rw0wNA2Mpd8YRjQZHahBvRPr/w9f3MX11uiRdzAktoBb4DDaoI/8fkdm
         5DxBtk7y9uwTA==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id t18so4136130uar.4;
        Sat, 18 May 2019 18:07:29 -0700 (PDT)
X-Gm-Message-State: APjAAAUNCzrud+V553rXQD1CRDK+nWBXPhZUw8sJwHd4bIB5Ugrc65BB
        KSKfoPR+cUGA4JusIroDj5OtEp+heeGMVnvsNeE=
X-Google-Smtp-Source: APXvYqx1TI6iwGKK/SFLpjp+jaBAvGAf0YAP57YvaWIWQWnEz1vGgsx1pNwKgFC5ZiPuJh1RXpiFFsAH5Dmo57Z13/I=
X-Received: by 2002:a9f:24a3:: with SMTP id 32mr8526737uar.109.1558228048186;
 Sat, 18 May 2019 18:07:28 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 19 May 2019 10:06:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNATmYHZoF5WYVY6mWet76Teb5YMyVDUuEGJRJdRiqETROQ@mail.gmail.com>
Message-ID: <CAK7LNATmYHZoF5WYVY6mWet76Teb5YMyVDUuEGJRJdRiqETROQ@mail.gmail.com>
Subject: [GIT PULL] more Kbuild updates for v5.2-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some late Kbuild updates.
(The reasons for lateness are;
[1] rebasing to avoid merge conflicts
[2] pick up patches that were not taken care of
    by arch maintainers
[3] some (e.g. checker of module name uniqueness)
    are good to merge even in the last minutes of MW
)


Thanks.


The following changes since commit 72cf0b07418a9c8349aa9137194b1ccba6e54a9d:

  Merge tag 'sound-fix-5.2-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound (2019-05-17
13:57:54 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.2-2

for you to fetch changes up to fc2694ec1ab7c805505bef2752aca56977a22abd:

  kconfig: use 'else ifneq' for Makefile to improve readability
(2019-05-19 09:34:35 +0900)

----------------------------------------------------------------
Kbuild updates for v5.2 (2nd)

 - remove unneeded use of cc-option, cc-disable-warning, cc-ldoption

 - exclude tracked files from .gitignore

 - re-enable -Wint-in-bool-context warning

 - refactor samples/Makefile

 - stop building immediately if syncconfig fails

 - do not sprinkle error messages when $(CC) does not exist

 - move arch/alpha/defconfig to the configs subdirectory

 - remove crappy header search path manipulation

 - add comment lines to .config to clarify the end of menu blocks

 - check uniqueness of module names (adding new warnings intentionally)

----------------------------------------------------------------
Alexander Popov (1):
      kconfig: Terminate menu blocks with a comment in the generated config

Krzysztof Kozlowski (1):
      MAINTAINERS: kbuild: Add pattern for scripts/*vmlinux*

Masahiro Yamada (19):
      csky: remove deprecated arch/csky/boot/dts/include/dt-bindings
      sh: exclude vmlinux.scr from .gitignore pattern
      kbuild: re-enable int-in-bool-context warning
      samples: guard sub-directories with CONFIG options
      arch: remove dangling asm-generic wrappers
      kbuild: add -Wvla flag unconditionally
      kbuild: add some extra warning flags unconditionally
      kbuild: add all Clang-specific flags unconditionally
      .gitignore: exclude .get_maintainer.ignore and .gitattributes
      kbuild: turn auto.conf.cmd into a mandatory include file
      kbuild: terminate Kconfig when $(CC) or $(LD) is missing
      alpha: move arch/alpha/defconfig to arch/alpha/configs/defconfig
      media: remove unneeded header search paths
      media: prefix header search paths with $(srctree)/
      treewide: prefix header search paths with $(srctree)/
      kbuild: remove 'addtree' and 'flags' magic for header search paths
      kbuild: add LICENSES to KBUILD_ALLDIRS
      kbuild: check uniqueness of module names
      kconfig: use 'else ifneq' for Makefile to improve readability

Nathan Chancellor (1):
      kbuild: Don't try to add '-fcatch-undefined-behavior' flag

Nick Desaulniers (2):
      ia64: require -Wl,--hash-style=sysv
      sh: vsyscall: drop unnecessary cc-ldoption

 .gitignore                                    |  8 +++++---
 MAINTAINERS                                   |  1 +
 Makefile                                      | 21 ++++++++++-----------
 arch/alpha/Makefile                           |  2 ++
 arch/alpha/{ => configs}/defconfig            |  0
 arch/csky/boot/dts/include/dt-bindings        |  1 -
 arch/csky/include/asm/Kbuild                  |  4 ----
 arch/h8300/include/asm/Kbuild                 |  1 -
 arch/ia64/kernel/Makefile.gate                |  2 +-
 arch/mips/pnx833x/Platform                    |  2 +-
 arch/nds32/include/asm/Kbuild                 |  3 ---
 arch/powerpc/Makefile                         |  2 +-
 arch/riscv/include/asm/Kbuild                 |  4 ----
 arch/sh/Makefile                              |  4 ++--
 arch/sh/boot/.gitignore                       |  1 +
 arch/sh/kernel/vsyscall/Makefile              |  3 +--
 arch/x86/kernel/Makefile                      |  2 +-
 arch/x86/mm/Makefile                          |  2 +-
 arch/xtensa/boot/lib/Makefile                 |  2 +-
 arch/xtensa/include/asm/Kbuild                |  1 -
 drivers/hid/intel-ish-hid/Makefile            |  2 +-
 drivers/media/common/b2c2/Makefile            |  4 ++--
 drivers/media/dvb-frontends/cxd2880/Makefile  |  2 --
 drivers/media/i2c/smiapp/Makefile             |  2 +-
 drivers/media/mmc/siano/Makefile              |  3 +--
 drivers/media/pci/b2c2/Makefile               |  2 +-
 drivers/media/pci/bt8xx/Makefile              |  5 ++---
 drivers/media/pci/cx18/Makefile               |  4 ++--
 drivers/media/pci/cx23885/Makefile            |  4 ++--
 drivers/media/pci/cx88/Makefile               |  4 ++--
 drivers/media/pci/ddbridge/Makefile           |  4 ++--
 drivers/media/pci/dm1105/Makefile             |  2 +-
 drivers/media/pci/mantis/Makefile             |  2 +-
 drivers/media/pci/netup_unidvb/Makefile       |  2 +-
 drivers/media/pci/ngene/Makefile              |  4 ++--
 drivers/media/pci/pluto2/Makefile             |  2 +-
 drivers/media/pci/pt1/Makefile                |  4 ++--
 drivers/media/pci/pt3/Makefile                |  4 ++--
 drivers/media/pci/smipcie/Makefile            |  5 ++---
 drivers/media/pci/ttpci/Makefile              |  4 ++--
 drivers/media/platform/sti/c8sectpfe/Makefile |  5 ++---
 drivers/media/radio/Makefile                  |  2 --
 drivers/media/spi/Makefile                    |  4 +---
 drivers/media/usb/as102/Makefile              |  2 +-
 drivers/media/usb/au0828/Makefile             |  4 ++--
 drivers/media/usb/b2c2/Makefile               |  2 +-
 drivers/media/usb/cx231xx/Makefile            |  5 ++---
 drivers/media/usb/em28xx/Makefile             |  4 ++--
 drivers/media/usb/go7007/Makefile             |  2 +-
 drivers/media/usb/pvrusb2/Makefile            |  4 ++--
 drivers/media/usb/siano/Makefile              |  2 +-
 drivers/media/usb/tm6000/Makefile             |  4 ++--
 drivers/media/usb/ttusb-budget/Makefile       |  2 +-
 drivers/media/usb/usbvision/Makefile          |  2 --
 drivers/net/ethernet/chelsio/libcxgb/Makefile |  2 +-
 drivers/target/iscsi/cxgbit/Makefile          |  6 +++---
 drivers/usb/storage/Makefile                  |  2 +-
 fs/ocfs2/dlm/Makefile                         |  3 +--
 fs/ocfs2/dlmfs/Makefile                       |  2 +-
 fs/xfs/Makefile                               |  4 ++--
 net/bpfilter/Makefile                         |  2 +-
 samples/Makefile                              | 24 ++++++++++++++++++++----
 samples/seccomp/Makefile                      |  2 +-
 samples/vfs/Makefile                          |  2 +-
 scripts/Kbuild.include                        |  8 --------
 scripts/Kconfig.include                       |  8 ++++++++
 scripts/Makefile.extrawarn                    | 25 +++++++++++++------------
 scripts/Makefile.host                         | 12 +++++-------
 scripts/Makefile.lib                          | 26 ++++++++------------------
 scripts/dtc/Makefile                          |  6 +++---
 scripts/genksyms/Makefile                     |  4 ++--
 scripts/kconfig/Makefile                      |  8 +++-----
 scripts/kconfig/confdata.c                    | 13 ++++++++++++-
 scripts/modules-check.sh                      | 16 ++++++++++++++++
 74 files changed, 178 insertions(+), 172 deletions(-)
 rename arch/alpha/{ => configs}/defconfig (100%)
 delete mode 120000 arch/csky/boot/dts/include/dt-bindings
 create mode 100755 scripts/modules-check.sh


-- 
Best Regards
Masahiro Yamada
