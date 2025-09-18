Return-Path: <linux-kbuild+bounces-8374-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38FB21D75
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:50:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 369CA3A7DF9
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CA52E36F1;
	Tue, 12 Aug 2025 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eDOLCLFD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x8u4rxPi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7122E62C7;
	Tue, 12 Aug 2025 05:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977490; cv=none; b=hA7DyVURQyah3DGvtsZufEAfrjzvedGKEpg+BY8IxB7BVCec/2V0gbl9vkXS+sGrpC8tsJ/LiORGkaArEZcMyN+qgXFO+5mYvAn+CY3TDI9c0sB3dtRgsOzswtkRmSIZotiQu05dGf1tRfFQ5CLgUVbd6ENp7unam2uxDaoYYn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977490; c=relaxed/simple;
	bh=qygA/StJzW73SS+Ekq7PC7CyPNI3mc4mEN9yJxXb3XY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXFdMSjVE8QC2g9AW96RFXrDXOsF3WIlOwabXA/PEf005FhU7aFO5mn99nl3PjWJ/MV31jmE+/1f8h37+MlQZwMvAhQNbkWy+Rh+bF5iFob5CMOGdYPAhEp8CkiHrKInWZ38P82D3iHeh4iqWfJ4su6QRrZGP26Z8gNLQy/yc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eDOLCLFD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x8u4rxPi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSsLaj0Vhu9/PGMTmPXGdssJTXVn3W9ZA9BGqH+Jqx4=;
	b=eDOLCLFDPRbYYV6S9jLoySaVAu3Me/4SS95J0pa44QzQju1lVdvjVQb0NHn26GgiKzsdo0
	la6VnrTn3Ck0BTNHV6iPzgVSMcM+D0zEUl6vIHzxvac1IhKbgdrENmV4kvNogwCDIi9bUc
	6NLSPM+lX/mzQgqWdYfgFCIaVbyuAVg9fXpU/8xhY6vP+6L/k7HV27ig2A37biQWg7w8ix
	r22eKq9Rr8f+6bN2DMXyuLJK6jRyLg2KwjU7bpH/2t/nkFxU+VPhqpYVJXC6AZK4UecCPQ
	yLI5tse76hfyElSeWwb5NV3HG2g/+z2gvs4FmkDYEzX/DdmDG0K9iSN0HH4iNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSsLaj0Vhu9/PGMTmPXGdssJTXVn3W9ZA9BGqH+Jqx4=;
	b=x8u4rxPiqX9dOvWWfSpG/Ujml/DOO844CEKhLv/WuFCx5Vk6KLOOdTUqW25zFxXj1eXLob
	cNpDxW8Y1VxhSEDw==
Date: Tue, 12 Aug 2025 07:44:26 +0200
Subject: [PATCH v4 13/24] ARM: vdso: Enable the vdsocheck tool
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-13-61a8b615e5ec@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=2638;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=qygA/StJzW73SS+Ekq7PC7CyPNI3mc4mEN9yJxXb3XY=;
 b=T+Y3ba3sPD8SH63yLbLTW2WkOy2PgtViR8rWIZYQ/4UjtoPlEd+0f2LNjX0dkYHy33nz3NhFa
 fZMmsLbItu4Bl44kkc4ojPXchIFcJeEzvChFGVZh7EzamhWR3UCQS7W
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vdsocheck tool validates the object files and final .so library.
It can detect if the compiler created relocations which are incompatible
with the vDSO which need to be worked around.

Wire it up for the architecture.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/vdso/Makefile      | 4 ++--
 lib/vdso/Kconfig            | 1 +
 lib/vdso/check/vdsocheck.rs | 8 ++++++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index cf8cd39ab80468bf1409172a8b857d050b224004..fd34d0ff018a8afa5bfebb62f69bba964c6e73a3 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -37,7 +37,7 @@ endif
 $(obj)/vdso.o : $(obj)/vdso.so
 
 # Link rule for the .so file
-$(obj)/vdso.so.raw: $(obj)/vdso.lds $(obj-vdso) FORCE
+$(obj)/vdso.so.raw: $(obj)/vdso.lds $(obj-vdso) $(vdsocheck) FORCE
 	$(call if_changed,vdsold_and_vdso_check)
 
 $(obj)/vdso.so.dbg: $(obj)/vdso.so.raw $(obj)/vdsomunge FORCE
@@ -50,7 +50,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 
 # Actual build commands
 quiet_cmd_vdsold_and_vdso_check = LD      $@
-      cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check)
+      cmd_vdsold_and_vdso_check = $(cmd_ld_vdso); $(cmd_vdso_check)
 
 quiet_cmd_vdsomunge = MUNGE   $@
       cmd_vdsomunge = $(objtree)/$(obj)/vdsomunge $< $@
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index e9215084462dfb33a5cd55a57171d2ec4295a270..84bff59ccef4acd95159d03e96991161a029fb2d 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -52,6 +52,7 @@ config GENERIC_VDSO_DATA_STORE
 config HAVE_VDSOCHECK
 	bool
 	default y if X86
+	default y if ARM
 	help
 	  Selected for architectures that are supported by the 'vdsocheck' progam.
 	  Only transitional.
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index c4feb75f93ec0a6a153a758ee7a51cc6f2f58bf1..23970b9d05dc320eb4966967904deae661171b15 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -46,6 +46,14 @@ fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'s
             ignored_object_file_sections: None,
             in_object_file: &[bindings::R_X86_64_PC32, bindings::R_X86_64_PLT32],
         }),
+        bindings::EM_ARM => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[
+                bindings::R_ARM_NONE,
+                bindings::R_ARM_REL32,
+                bindings::R_ARM_PREL31,
+            ],
+        }),
         _ => None,
     }
 }

-- 
2.50.1


