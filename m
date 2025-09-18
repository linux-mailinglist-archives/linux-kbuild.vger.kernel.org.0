Return-Path: <linux-kbuild+bounces-8376-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC96B21D70
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FF85500A10
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7D12E88A2;
	Tue, 12 Aug 2025 05:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M7S40MwV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oT3QciTb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361872E5409;
	Tue, 12 Aug 2025 05:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754977491; cv=none; b=JcP3nJEgRriruN8ijfpqBsM8Iw+SdnRCwKMfnCYZoo7EsIC2bKGu6hnNRd7/5JVUjCWo1ktb1k7ZHV+eBlma2KX752nF2hNsaVlycDKca78qIpJh32ITPE0ofpGuSmI//kS9+QiKl6mrRLF8FYu0as7kGAg3xP/tIR+9pVnHZAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754977491; c=relaxed/simple;
	bh=3K4dUUVStWjQ5/WBfnnWwj1hNxnDgSGwmxNLWqKjR7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N3RECGWCU94WTAXg8gXmLDxLADXMQ0/jnsuIvPQo2zAbHVo8rf1pXj2OEseF27tBNOuQx122X0Mpv/vxhtEcHeO7E9ch8zGWwurozUL0TW0GGoxTf8f/IGANR0ZT+hOttMcREG2Kpmtf/G4pA5rK1uL+mAzhWXQfa7yN4EbOUyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M7S40MwV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oT3QciTb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xnh72HUbhzd4qempQkZ++BS8+pzvYgS+1ottOAOyHdU=;
	b=M7S40MwV/29NPfO9Sasy+ADfYcsvNi5Apjwn245Ady0D3VOmbwdncNTgeKb1CtGlZMH2y5
	VLb+3/m+Kr/szGiTLJd4uAnGlG3BOQdpLLeDU2s3RuY0jGaoJQ9CoZ8ywkJenQVTh8q1ZU
	AzYugh31VGsAyOYBGTv9zwM7UTdCqcxGOgnyVS8W0fkGMwNgHzjkZfXtr0UvL1e7UJMMmF
	nJcpgacbXj6Sj/nRL1V06LnhMjF7zs1jSvpx57y2lKdkro1SgilU5GZG0SWcrItG0ikYUg
	AXOR889bzaLnAigaurgMDW06LMjY90s899cXrcGjUdmhdbEMejfGbP4Qf1yxPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xnh72HUbhzd4qempQkZ++BS8+pzvYgS+1ottOAOyHdU=;
	b=oT3QciTbYI+S9gc2w0Nm9Wh0wRDtrD56Uiy+WUIfVLkM867MFCQ7qwFFCJ/zKjjlLlWrmY
	vK59scPXpcCQ33AQ==
Date: Tue, 12 Aug 2025 07:44:27 +0200
Subject: [PATCH v4 14/24] arm64: vdso: Enable the vdsocheck tool
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-vdso-absolute-reloc-v4-14-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=2714;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3K4dUUVStWjQ5/WBfnnWwj1hNxnDgSGwmxNLWqKjR7g=;
 b=yJ2PupWNQCp+kR/s6ueQVFH3FycSSSmFfTc8D7vtTv0iU6LC1cQ44wErnQahnnu4cKtXubosj
 a7zqtL+HXllCbNMWl3p7/xwQr+4L7lGG20l7mLQYJBiX+218aWqN4J7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The vdsocheck tool validates the object files and final .so library.
It can detect if the compiler created relocations which are incompatible
with the vDSO which need to be worked around.

Wire it up for the architecture.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/kernel/vdso/Makefile |  4 ++--
 lib/vdso/Kconfig                |  1 +
 lib/vdso/check/vdsocheck.rs     | 11 +++++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 7dec05dd33b70ea8fc734e0c13af9ec4568d80a8..9fac0e54097dc552dbfe81074da71492c79c9230 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -61,7 +61,7 @@ targets += vdso.lds
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 
 # Link rule for the .so file, .lds has to be first
-$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
+$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) $(vdsocheck) FORCE
 	$(call if_changed,vdsold_and_vdso_check)
 
 # Strip rule for the .so file
@@ -79,4 +79,4 @@ include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
 
 # Actual build commands
 quiet_cmd_vdsold_and_vdso_check = LD      $@
-      cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check)
+      cmd_vdsold_and_vdso_check = $(cmd_ld_vdso); $(cmd_vdso_check)
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 84bff59ccef4acd95159d03e96991161a029fb2d..3037b15476bb60ee47c1e083eae3968ab9604f59 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -53,6 +53,7 @@ config HAVE_VDSOCHECK
 	bool
 	default y if X86
 	default y if ARM
+	default y if ARM64
 	help
 	  Selected for architectures that are supported by the 'vdsocheck' progam.
 	  Only transitional.
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index 23970b9d05dc320eb4966967904deae661171b15..a695aed95ad391a0c55e5388bc6d1f1141fd784e 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -54,6 +54,17 @@ fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'s
                 bindings::R_ARM_PREL31,
             ],
         }),
+        bindings::EM_AARCH64 => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[
+                bindings::R_AARCH64_PREL64,
+                bindings::R_AARCH64_PREL32,
+                bindings::R_AARCH64_PREL16,
+                bindings::R_AARCH64_LD_PREL_LO19,
+                bindings::R_AARCH64_ADR_PREL_LO21,
+                bindings::R_AARCH64_CALL26,
+            ],
+        }),
         _ => None,
     }
 }

-- 
2.50.1


