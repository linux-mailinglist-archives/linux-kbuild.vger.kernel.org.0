Return-Path: <linux-kbuild+bounces-9085-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF3EBCEA45
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 23:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E93EC4E3ADB
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 21:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D0E302758;
	Fri, 10 Oct 2025 21:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvBAVpKx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2FA263F5F;
	Fri, 10 Oct 2025 21:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760132981; cv=none; b=ftIyBYgARlbLGFRsxosEAtprvKZM7zeVmSETHMfXThQim8Ug2rbHuhWAHb3XpEqbSuPtDdcbZZsAhE2lc/+86mfon3JPjLCZ/qQbWjQwiJg0cdOPSJ61w8Cv4yXU7cHoEdLxkww54OJOSiLZ9SIWqpcZSiqF1TW2rke70HkpzRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760132981; c=relaxed/simple;
	bh=WhUTgOUQwZz/mKwCSbgdhMyMfQoSYK7seDZUD2CkcCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QCYqV8sSYbaZZ3w/tw3jgurOW7rzkz1MQ4MlOuHCYwwlhZVe1LEmSWtJ4m8OiW0xFvnsgTpbM8mscFyjOZxsDLNxrl6KrqC5jJWORGz42FVf/aPUD6fa2yV3KwSYo45Vr3ovWyP/UiOCGh+2ZFQ4dt0RXAKkdW3Ga47u7mwswdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvBAVpKx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2153C4CEF1;
	Fri, 10 Oct 2025 21:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760132981;
	bh=WhUTgOUQwZz/mKwCSbgdhMyMfQoSYK7seDZUD2CkcCU=;
	h=From:Date:Subject:To:Cc:From;
	b=hvBAVpKxg+Ah/i30F3SfptTMIKf+JfKWqHASH38i0lZSXkWwtfh7AN5nqsu7WHP/G
	 e8iIF5jyqMrhW3CN8b9RhcoYCG86lU1lfHh2ZTL0RxuRkFsWJ40DnC+IS4/KHWvOpJ
	 GHtVL4bcFITAXHhof363ON4Csu10gcVJxKG5hSvtzc6iyGfYSP/zkhkSr3UBL93HcL
	 aHPxZYNA+DwSKiNkKcumk8qiydxL3A3A8rKmAre0srInul7kf/Rt6xNwNBHi0AcTda
	 2yFIE4bISo6lwnK8gwzQ5mOPV6fjNy0kk/so+yE1nI/4+mKw8wWUVAx76GoZk8U1+f
	 Cl8Chp/ltIAIw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 10 Oct 2025 14:49:27 -0700
Subject: [PATCH] kbuild: Use '--strip-unneeded-symbol' for removing module
 device table symbols
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-kbuild-fix-mod-device-syms-reloc-err-v1-1-6dc88143af25@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGZ/6WgC/x2NywrCQAwAf6XkbGC3Ggr+iniwm2hDHysJLUrpv
 xs8zmFmdnAxFYdrs4PJpq51CcinBsrwWF6CysHQppZyygnHftWJ8akfnCsjh1ME/Ts7mky1oJg
 hnamjTvhSmCBSb5MQ/pvb/Th+W0+vD3YAAAA=
X-Change-ID: 20251010-kbuild-fix-mod-device-syms-reloc-err-535757ed4cd5
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Alexey Gladkov <legion@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 kasan-dev@googlegroups.com, Charles Mirabile <cmirabil@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3205; i=nathan@kernel.org;
 h=from:subject:message-id; bh=WhUTgOUQwZz/mKwCSbgdhMyMfQoSYK7seDZUD2CkcCU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBkv64vuftv+/x4bb8O50Pxtn7ZMb9qS+un6CuUbNyWeb
 BPTUHM71FHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmUjWVkWHNk3fzFJ+tye3+
 X2qU5a1y1Xth79mzTTY3xGYw1Z/4VO/B8D+XI+Sn2Isr5zme2tsuYpv9oqumYdLtY2mNoaU9V51
 2hTMBAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules"), relocatable RISC-V kernels with CONFIG_KASAN=y start failing
when attempting to strip the module device table symbols:

  riscv64-linux-objcopy: not stripping symbol `__mod_device_table__kmod_irq_starfive_jh8100_intc__of__starfive_intc_irqchip_match_table' because it is named in a relocation
  make[4]: *** [scripts/Makefile.vmlinux:97: vmlinux] Error 1

The relocation appears to come from .LASANLOC5 in .data.rel.local:

  $ llvm-objdump --disassemble-symbols=.LASANLOC5 --disassemble-all -r drivers/irqchip/irq-starfive-jh8100-intc.o

  drivers/irqchip/irq-starfive-jh8100-intc.o:   file format elf64-littleriscv

  Disassembly of section .data.rel.local:

  0000000000000180 <.LASANLOC5>:
  ...
       1d0: 0000          unimp
                  00000000000001d0:  R_RISCV_64   __mod_device_table__kmod_irq_starfive_jh8100_intc__of__starfive_intc_irqchip_match_table
  ...

This section appears to come from GCC for including additional
information about global variables that may be protected by KASAN.

There appears to be no way to opt out of the generation of these symbols
through either a flag or attribute. Attempting to remove '.LASANLOC*'
with '--strip-symbol' results in the same error as above because these
symbols may refer to (thus have relocation between) each other.

Avoid this build breakage by switching to '--strip-unneeded-symbol' for
removing __mod_device_table__ symbols, as it will only remove the symbol
when there is no relocation pointing to it. While this may result in a
little more bloat in the symbol table in certain configurations, it is
not as bad as outright build failures.

Fixes: 5ab23c7923a1 ("modpost: Create modalias for builtin modules")
Reported-by: Charles Mirabile <cmirabil@redhat.com>
Closes: https://lore.kernel.org/20251007011637.2512413-1-cmirabil@redhat.com/
Suggested-by: Alexey Gladkov <legion@kernel.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I am Cc'ing KASAN folks in case they have any additional knowledge
around .LASANLOC symbols or how to remove/avoid them.

I plan to send this to Linus tomorrow.
---
 scripts/Makefile.vmlinux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index c02f85c2e241..ced4379550d7 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -87,7 +87,7 @@ remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel*' '!.rel*.dyn'
 # https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c12d9fa2afe7abcbe407a00e15719e1a1350c2a7
 remove-section-$(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS) += '.rel.*'
 
-remove-symbols := -w --strip-symbol='__mod_device_table__*'
+remove-symbols := -w --strip-unneeded-symbol='__mod_device_table__*'
 
 # To avoid warnings: "empty loadable segment detected at ..." from GNU objcopy,
 # it is necessary to remove the PT_LOAD flag from the segment.

---
base-commit: cfc584537150484874e10ec4e59ad2ecbae46bfe
change-id: 20251010-kbuild-fix-mod-device-syms-reloc-err-535757ed4cd5

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


