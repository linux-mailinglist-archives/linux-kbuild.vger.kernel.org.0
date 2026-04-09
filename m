Return-Path: <linux-kbuild+bounces-12725-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPsgELF112nTOAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12725-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 11:47:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D85AF3C8A7D
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 11:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A0F53007899
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Apr 2026 09:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414CB2EA480;
	Thu,  9 Apr 2026 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TpWYAv9/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E3137CD4C
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Apr 2026 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728047; cv=none; b=eVjF1PGZSxBc0oMmN/LOQTkiyiW7pI+TKduCmy1o1AvXDcB1/NdSZZ3ZryGZc/Lvvg+a7x5J44gz9Go4CktMa+QHOQhGp90j0eWsEh+f7FfbzFhYj0tLLxNH6pY68DVq+dUYhA+taVJvaqzuUOAftuESh15WX/aOsKpXFxit8CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728047; c=relaxed/simple;
	bh=8YxIQ6wac2x7sSoyTl4vGC3X2EwFblCMe0Uywc0+D/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CEsQGp62lWitHcn8CC83M50xnEVkD1XNMngYWs0cwrkIruCGrS/DtWPxYBmZq092zI0iPnsf3UNXVOD4B9cpag/Yax2x6LJuzORmGiT+xUTE2jxT+foEfItlOg+l8AiW6i/uM0eUWJcKl16sjlyyNo8Fy0p4ww2UxcSIL4WkblM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TpWYAv9/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775728044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VcoefioJuAnikTVPhfmsUPKdcg28dRUHdK02otyykPA=;
	b=TpWYAv9/wJtmBwde5dwDfukeIKEWZQtRqfd/4JGk4W9JQU3isy8yYsd9M91ghs5V4LvGWB
	pqng6RQvoRt24LyNKdw3a8fqncQLBQZAj46JV/2q2aH9Ybvwa5itB7z1qAOEg9mxqInOO/
	1b0AaqYV55LgoiFZLgAGR2+mNYiKr2E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-1c0icj-CMF-HqBpFQo7GxQ-1; Thu,
 09 Apr 2026 05:47:21 -0400
X-MC-Unique: 1c0icj-CMF-HqBpFQo7GxQ-1
X-Mimecast-MFC-AGG-ID: 1c0icj-CMF-HqBpFQo7GxQ_1775728040
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E209A18002E7;
	Thu,  9 Apr 2026 09:47:19 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.155])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8D08D30001BE;
	Thu,  9 Apr 2026 09:47:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v5 0/8] Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
Date: Thu,  9 Apr 2026 11:47:00 +0200
Message-ID: <20260409094708.1687376-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12725-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thuth@redhat.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stackoverflow.com:url,raspberrypi.com:url]
X-Rspamd-Queue-Id: D85AF3C8A7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembly and C source code.
However, all the supported versions of the GCC and Clang compilers
also define the macro __ASSEMBLER__ automatically already when compiling
assembly code, so some kernel headers are using __ASSEMBLER__ instead.
With regards to userspace code, this seems also to be constant source
of confusion, see for example these links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, it would make sense to standardize
on the macro that gets defined by the compiler, so this patch series
changes all occurances of __ASSEMBLY__ into __ASSEMBLER__ and
finally removes the -D__ASSEMBLY__ from the Makefiles.

I split the patches per architecture to ease the review, and I also
split the uapi headers from the normal ones in case we decide that
uapi needs to be treated differently from the normal headers here.

Most patches for the individual architectures have already been merged
through the corresponding architecture trees (big thanks to the main-
tainers!), so this series here now just consists of the remaining
patches.

v5:
- More patches have been merged through architecture trees, dropped
  them now from this series here.
- Fixed some more occurances of __ASSEMBLY__ in new code.

v4:
- Most patches from the original series got already merged via the
  tree of the individual architectures, so the amount of patches here
  has been greatly reduced
- Rebased patches on top of linux-next, fixed conflicts and new
  occurances

Thomas Huth (8):
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  hexagon: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  kselftest/riscv: Replace __ASSEMBLY__ with __ASSEMBLER__
  uapi: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  include: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
  treewide: Stop defining __ASSEMBLY__ for assembler files

 Documentation/dev-tools/checkuapi.rst          |  2 +-
 Makefile                                       |  2 +-
 arch/arm/include/asm/arch_gicv3.h              |  4 ++--
 arch/arm/include/asm/assembler.h               |  2 +-
 arch/arm/include/asm/barrier.h                 |  4 ++--
 arch/arm/include/asm/cache.h                   |  2 +-
 arch/arm/include/asm/cp15.h                    |  4 ++--
 arch/arm/include/asm/cputype.h                 |  4 ++--
 arch/arm/include/asm/current.h                 |  4 ++--
 arch/arm/include/asm/delay.h                   |  4 ++--
 arch/arm/include/asm/domain.h                  |  8 ++++----
 arch/arm/include/asm/fpstate.h                 |  2 +-
 arch/arm/include/asm/ftrace.h                  |  6 +++---
 arch/arm/include/asm/hardware/cache-b15-rac.h  |  2 +-
 arch/arm/include/asm/hardware/cache-l2x0.h     |  4 ++--
 arch/arm/include/asm/hardware/dec21285.h       |  2 +-
 arch/arm/include/asm/hardware/ioc.h            |  2 +-
 arch/arm/include/asm/hardware/iomd.h           |  4 ++--
 arch/arm/include/asm/hardware/memc.h           |  2 +-
 arch/arm/include/asm/hwcap.h                   |  2 +-
 arch/arm/include/asm/irq.h                     |  2 +-
 arch/arm/include/asm/jump_label.h              |  4 ++--
 arch/arm/include/asm/kexec.h                   |  4 ++--
 arch/arm/include/asm/kgdb.h                    |  4 ++--
 arch/arm/include/asm/mach/arch.h               |  2 +-
 arch/arm/include/asm/mcpm.h                    |  4 ++--
 arch/arm/include/asm/memory.h                  |  4 ++--
 arch/arm/include/asm/mpu.h                     |  4 ++--
 arch/arm/include/asm/opcodes.h                 | 12 ++++++------
 arch/arm/include/asm/page.h                    |  4 ++--
 arch/arm/include/asm/pgtable-2level.h          |  4 ++--
 arch/arm/include/asm/pgtable-3level.h          |  4 ++--
 arch/arm/include/asm/pgtable-nommu.h           |  4 ++--
 arch/arm/include/asm/pgtable.h                 | 10 +++++-----
 arch/arm/include/asm/probes.h                  |  4 ++--
 arch/arm/include/asm/proc-fns.h                |  4 ++--
 arch/arm/include/asm/ptrace.h                  |  4 ++--
 arch/arm/include/asm/system_info.h             |  4 ++--
 arch/arm/include/asm/system_misc.h             |  4 ++--
 arch/arm/include/asm/thread_info.h             |  2 +-
 arch/arm/include/asm/thread_notify.h           |  2 +-
 arch/arm/include/asm/tlbflush.h                | 10 +++++-----
 arch/arm/include/asm/tls.h                     |  4 ++--
 arch/arm/include/asm/unified.h                 |  6 +++---
 arch/arm/include/asm/unwind.h                  |  4 ++--
 arch/arm/include/asm/v7m.h                     |  4 ++--
 arch/arm/include/asm/vdso.h                    |  4 ++--
 arch/arm/include/asm/vdso/cp15.h               |  4 ++--
 arch/arm/include/asm/vdso/gettimeofday.h       |  4 ++--
 arch/arm/include/asm/vdso/processor.h          |  4 ++--
 arch/arm/include/asm/vdso/vsyscall.h           |  4 ++--
 arch/arm/include/asm/vfp.h                     |  2 +-
 arch/arm/include/asm/virt.h                    |  4 ++--
 arch/arm/include/uapi/asm/ptrace.h             |  4 ++--
 arch/arm/mach-at91/pm.h                        |  2 +-
 arch/arm/mach-exynos/smc.h                     |  4 ++--
 .../mach-footbridge/include/mach/hardware.h    |  2 +-
 arch/arm/mach-imx/hardware.h                   |  2 +-
 arch/arm/mach-imx/mxc.h                        |  2 +-
 arch/arm/mach-omap2/control.h                  |  8 ++++----
 arch/arm/mach-omap2/soc.h                      |  4 ++--
 arch/arm/mach-omap2/sram.h                     |  4 ++--
 arch/arm/mach-pxa/irqs.h                       |  2 +-
 arch/arm/mach-pxa/pxa-regs.h                   |  2 +-
 arch/arm/mach-s3c/map-base.h                   |  2 +-
 arch/arm/mach-sa1100/include/mach/bitfield.h   |  2 +-
 arch/arm/mach-sa1100/include/mach/hardware.h   |  2 +-
 arch/arm/mach-tegra/reset.h                    |  2 +-
 arch/arm/mach-tegra/sleep.h                    |  2 +-
 arch/arm/tools/gen-mach-types                  |  2 +-
 arch/arm64/kernel/vdso32/Makefile              |  1 -
 arch/hexagon/include/asm/hexagon_vm.h          |  4 ++--
 arch/hexagon/include/asm/mem-layout.h          |  6 +++---
 arch/hexagon/include/asm/page.h                |  4 ++--
 arch/hexagon/include/asm/processor.h           |  4 ++--
 arch/hexagon/include/asm/thread_info.h         | 12 ++++++------
 arch/hexagon/include/uapi/asm/registers.h      |  4 ++--
 arch/loongarch/vdso/Makefile                   |  2 +-
 arch/mips/boot/compressed/Makefile             |  2 +-
 arch/mips/vdso/Makefile                        |  2 +-
 arch/powerpc/boot/Makefile                     |  2 +-
 arch/powerpc/platforms/cell/spufs/Makefile     |  2 +-
 arch/s390/Makefile                             |  2 +-
 arch/x86/boot/Makefile                         |  2 +-
 arch/x86/boot/compressed/Makefile              |  2 +-
 arch/x86/realmode/rm/Makefile                  |  2 +-
 arch/xtensa/kernel/Makefile                    |  2 +-
 drivers/firmware/efi/libstub/Makefile          |  2 +-
 drivers/memory/emif.h                          |  4 ++--
 drivers/net/wan/Makefile                       |  2 +-
 include/asm-generic/barrier.h                  |  4 ++--
 include/asm-generic/bug.h                      |  4 ++--
 include/asm-generic/current.h                  |  2 +-
 include/asm-generic/error-injection.h          |  2 +-
 include/asm-generic/fixmap.h                   |  4 ++--
 include/asm-generic/getorder.h                 |  4 ++--
 include/asm-generic/int-ll64.h                 |  6 +++---
 include/asm-generic/kprobes.h                  |  4 ++--
 include/asm-generic/memory_model.h             |  4 ++--
 include/asm-generic/mmu.h                      |  2 +-
 include/asm-generic/pgtable-nop4d.h            |  4 ++--
 include/asm-generic/pgtable-nopmd.h            |  4 ++--
 include/asm-generic/pgtable-nopud.h            |  4 ++--
 include/asm-generic/rwonce.h                   |  4 ++--
 include/asm-generic/signal.h                   |  4 ++--
 include/asm-generic/vdso/vsyscall.h            |  4 ++--
 include/linux/amba/serial.h                    |  4 ++--
 include/linux/annotate.h                       | 18 +++++++++---------
 include/linux/arm-smccc.h                      | 10 +++++-----
 include/linux/bitmap.h                         |  4 ++--
 include/linux/bits.h                           |  6 +++---
 include/linux/cfi_types.h                      |  6 +++---
 include/linux/compiler.h                       |  4 ++--
 include/linux/compiler_types.h                 |  8 ++++----
 include/linux/edd.h                            |  4 ++--
 include/linux/err.h                            |  2 +-
 include/linux/export.h                         |  2 +-
 include/linux/init.h                           |  6 +++---
 include/linux/ioport.h                         |  4 ++--
 include/linux/irqchip/arm-gic-v3.h             |  2 +-
 include/linux/irqchip/arm-gic.h                |  4 ++--
 include/linux/jump_label.h                     | 10 +++++-----
 include/linux/kexec.h                          |  2 +-
 include/linux/linkage.h                        |  6 +++---
 include/linux/mem_encrypt.h                    |  4 ++--
 include/linux/mmzone.h                         |  4 ++--
 include/linux/objtool.h                        |  8 ++++----
 include/linux/objtool_types.h                  |  4 ++--
 include/linux/of_fdt.h                         |  4 ++--
 include/linux/pe.h                             |  4 ++--
 include/linux/percpu-defs.h                    |  4 ++--
 include/linux/pfn.h                            |  2 +-
 include/linux/pgtable.h                        |  4 ++--
 include/linux/platform_data/emif_plat.h        |  4 ++--
 include/linux/serial_s3c.h                     |  4 ++--
 include/linux/static_call_types.h              |  4 ++--
 include/linux/ti-emif-sram.h                   |  2 +-
 include/linux/types.h                          |  4 ++--
 include/soc/imx/cpu.h                          |  2 +-
 include/soc/tegra/flowctrl.h                   |  4 ++--
 include/soc/tegra/fuse.h                       |  4 ++--
 include/uapi/asm-generic/int-l64.h             |  4 ++--
 include/uapi/asm-generic/int-ll64.h            |  4 ++--
 include/uapi/asm-generic/signal-defs.h         |  2 +-
 include/uapi/asm-generic/signal.h              |  4 ++--
 include/uapi/linux/a.out.h                     |  4 ++--
 include/uapi/linux/const.h                     |  4 ++--
 include/uapi/linux/edd.h                       |  4 ++--
 include/uapi/linux/hdlc/ioctl.h                |  4 ++--
 include/uapi/linux/sched.h                     |  2 +-
 include/uapi/linux/types.h                     |  4 ++--
 include/vdso/datapage.h                        |  6 +++---
 include/vdso/helpers.h                         |  4 ++--
 include/vdso/processor.h                       |  4 ++--
 include/vdso/vsyscall.h                        |  4 ++--
 include/xen/arm/interface.h                    |  2 +-
 include/xen/interface/xen-mca.h                |  4 ++--
 include/xen/interface/xen.h                    |  8 ++++----
 scripts/Makefile.build                         |  2 +-
 scripts/gfp-translate                          |  2 +-
 tools/include/asm-generic/barrier.h            |  4 ++--
 tools/include/asm/alternative.h                |  2 +-
 tools/include/linux/bits.h                     |  6 +++---
 tools/include/linux/cfi_types.h                |  6 +++---
 tools/include/linux/compiler.h                 |  4 ++--
 tools/include/linux/objtool_types.h            |  4 ++--
 tools/include/linux/static_call_types.h        |  4 ++--
 tools/include/uapi/linux/const.h               |  4 ++--
 .../trace/beauty/include/uapi/linux/sched.h    |  2 +-
 .../testing/selftests/kvm/lib/riscv/handlers.S |  4 ----
 .../testing/selftests/riscv/cfi/cfi_rv_test.h  |  2 +-
 .../testing/selftests/vDSO/vgetrandom-chacha.S |  2 --
 172 files changed, 329 insertions(+), 336 deletions(-)

-- 
2.53.0


