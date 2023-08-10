Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 034F9777A5D
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Aug 2023 16:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjHJOUY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Aug 2023 10:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjHJOUW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Aug 2023 10:20:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B87B2698;
        Thu, 10 Aug 2023 07:20:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB6F065D22;
        Thu, 10 Aug 2023 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E700C433C7;
        Thu, 10 Aug 2023 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691677220;
        bh=M6pCzl56hQfYBur6YmsekmzG2MMWL9hk5rFjJ0OsUU0=;
        h=From:To:Cc:Subject:Date:From;
        b=sEToNoLWqGtj4+RI0IeL2/r+G3nimZRvSUqztupu9NJ+WYoZP0DMJQzTc7AhlsCRR
         jK+SIxlfrcfMXKvWeumyeQOK5nFc2dY4tBk6a84vRp7cTftkekwCVyX2rgv9+6AmrC
         Dh91SfRjBjwYI9+cQxGNywuPyE4jUPyAUbzRq1qlPCpdc5pfBe17qe4QSw1GWxutDV
         LEqx6GOFuLUoidCbQEbTBmg9pIzjp2gcCgmaYfyZA/oR7dMrTfDlL6wCOIJiRAEh5z
         7bD2ltW5YMGSzYVVjE66ksMmUMrACNMp5UJJUI+KM+0mH1fxsUmNyF/NEvXI4YbDxf
         rS2tPNYilE83g==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@quicinc.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Jens Axboe <axboe@kernel.dk>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 00/17] -Wmissing-prototype warning fixes
Date:   Thu, 10 Aug 2023 16:19:18 +0200
Message-Id: <20230810141947.1236730-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Most of the patches I sent so far for the -Wmissing-prototype warnings
have made it into linux-next now. There are a few that I'm resending
now as nobody has picked them up, and then a number of fixes that I
found while test-building across all architectures rather than just the
ones I usually test.

The first 15 patches in this series should be uncontroversial, so
I expect that either a subsystem maintainer or Andrew Morton can
apply these directly.

For the last two patches, these might still need some debate about how
to handle them. I added a Kconfig option to turn off most of the missing
prototype warnings in the architectures that nobody has fixed yet,
see patch 16 for those. The last patch does cause some known warnings
and likely unknown ones for architectures other than x86 and arm,
so applying it now will bring new problems, but not applying it also
means that new warnings creep in, so I think this is mainly a question
of what the best timing is for having this in linux-next.

Arnd Bergmann (17):
  [RESEND] jffs2: mark __jffs2_dbg_superblock_counts() static
  [RESEND] irq_work: consolidate arch_irq_work_raise prototypes
  [RESEND] ida: make 'ida_dump' static
  pci: sysfs: move declarations to linux/pci.h
  swim3: mark swim3_init() static
  macintosh/ams: mark ams_init() static
  scsi: qlogicpti: mark qlogicpti_info() static
  microblaze: mark flush_dcache_folio() inline
  parport: gsc: mark init function static
  zorro: include zorro.h in names.c
  scsi: gvp11: remove unused gvp11_setup() function
  time: make sysfs_get_uname() function visible in header
  stackleak: add declarations for global functions
  kprobes: unify kprobes_exceptions_nofify() prototypes
  arch: fix asm-offsets.c building with -Wmissing-prototypes
  [RFC] arch: turn -Wmissing-prototypes off conditionally
  [RFC] Makefile.extrawarn: turn on missing-prototypes again

 arch/alpha/Kbuild                        |  2 ++
 arch/alpha/include/asm/pci.h             |  3 ---
 arch/alpha/kernel/asm-offsets.c          |  2 +-
 arch/alpha/lib/Makefile                  |  1 +
 arch/arc/Kbuild                          |  2 ++
 arch/arc/include/asm/kprobes.h           |  3 ---
 arch/arm/include/asm/irq_work.h          |  2 --
 arch/arm/include/asm/kprobes.h           |  2 --
 arch/arm64/include/asm/irq_work.h        |  2 --
 arch/arm64/include/asm/kprobes.h         |  2 --
 arch/csky/Kbuild                         |  2 ++
 arch/csky/include/asm/irq_work.h         |  2 +-
 arch/hexagon/Kbuild                      |  2 ++
 arch/ia64/Kbuild                         |  2 ++
 arch/ia64/include/asm/kprobes.h          |  2 --
 arch/ia64/kernel/asm-offsets.c           |  2 +-
 arch/ia64/lib/Makefile                   |  1 +
 arch/loongarch/Kbuild                    |  2 ++
 arch/loongarch/kernel/asm-offsets.c      | 12 ++++++++++++
 arch/m68k/Kbuild                         |  2 ++
 arch/m68k/lib/Makefile                   |  1 +
 arch/microblaze/Kbuild                   |  2 ++
 arch/microblaze/include/asm/cacheflush.h |  2 +-
 arch/mips/Kbuild                         |  2 ++
 arch/mips/boot/compressed/Makefile       |  3 ++-
 arch/mips/include/asm/kprobes.h          |  2 --
 arch/nios2/Kbuild                        |  2 ++
 arch/nios2/lib/Makefile                  |  1 +
 arch/openrisc/Kbuild                     |  2 ++
 arch/parisc/Kbuild                       |  2 ++
 arch/parisc/lib/Makefile                 |  1 +
 arch/powerpc/include/asm/irq_work.h      |  1 -
 arch/powerpc/include/asm/kprobes.h       |  2 --
 arch/riscv/include/asm/irq_work.h        |  2 +-
 arch/s390/include/asm/irq_work.h         |  2 --
 arch/s390/include/asm/kprobes.h          |  2 --
 arch/sh/Kbuild                           |  2 ++
 arch/sh/boot/compressed/Makefile         |  1 +
 arch/sh/include/asm/kprobes.h            |  2 --
 arch/sparc/Kbuild                        |  2 ++
 arch/sparc/include/asm/kprobes.h         |  2 --
 arch/sparc/kernel/asm-offsets.c          | 13 ++-----------
 arch/sparc/lib/Makefile                  |  1 +
 arch/sparc/prom/Makefile                 |  1 +
 arch/x86/include/asm/irq_work.h          |  1 -
 arch/x86/include/asm/kprobes.h           |  2 --
 arch/xtensa/Kbuild                       |  2 ++
 arch/xtensa/boot/lib/Makefile            |  2 ++
 drivers/block/swim3.c                    |  2 +-
 drivers/macintosh/ams/ams-core.c         |  2 +-
 drivers/parport/parport_gsc.c            |  2 +-
 drivers/scsi/gvp11.c                     |  5 -----
 drivers/scsi/qlogicpti.c                 |  2 +-
 drivers/zorro/names.c                    |  1 +
 fs/jffs2/debug.c                         |  2 +-
 include/linux/irq_work.h                 |  3 +++
 include/linux/kprobes.h                  |  4 ++++
 include/linux/pci.h                      |  5 +++++
 include/linux/stackleak.h                |  6 ++++++
 init/Kconfig                             | 10 ++++++++++
 kernel/time/tick-internal.h              |  3 ++-
 lib/test_ida.c                           |  2 +-
 scripts/Makefile.extrawarn               |  5 +++--
 63 files changed, 101 insertions(+), 63 deletions(-)

-- 
2.39.2
Cc: Matt Turner <mattst88@gmail.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: Brian Cain <bcain@quicinc.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: x86@kernel.org
Cc: Borislav Petkov <bp@alien8.de>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-hexagon@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-openrisc@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-block@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
