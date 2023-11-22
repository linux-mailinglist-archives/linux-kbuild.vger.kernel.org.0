Return-Path: <linux-kbuild+bounces-111-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B317F4A63
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 16:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 125181C20955
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 15:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194C54CDE0;
	Wed, 22 Nov 2023 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bi4xC82U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE78B5B20E
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Nov 2023 15:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90940C433C8;
	Wed, 22 Nov 2023 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700667168;
	bh=fWiSFMfDLokE0fHpF4fY2qrcsRxAWpAbxo0BBd3jFug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bi4xC82UvOxmgWDSddxzp+EZzsxihguuFoKXKYYw+Yr/iI8oxUNDaekSuwfNXmZdD
	 gqb/0AjGTrRRTwr2ixtT45nG7LfpEPbnuOdwD/33C4SA/NpoIOIKZdoGpuqc5Duy35
	 u5MfaZqzAh9pqa8HEgw+7OpTwitCRBmYDLkoSAyG6Ziz5kgTMvaj3GuXBpqEJZ1bQx
	 NMdXunVfPA6pFVKCNOAz2Afaehz5Ks2G2l64v01LUop4QrVxIcuR5FJaSRfC7dOYZJ
	 Uc0h86kTCUrsG3vr4Sb6jC+hC9vF/G5opttEvmHJ1xWzncvsbBmLLt+c3SjYey6fHa
	 CQ9r8VWdLZVlw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 11/17] modpost: fix section mismatch message for RELA
Date: Wed, 22 Nov 2023 10:31:40 -0500
Message-ID: <20231122153212.852040-11-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122153212.852040-1-sashal@kernel.org>
References: <20231122153212.852040-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.2
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 1c4a7587d1bbee0fd53b63af60e4244a62775f57 ]

The section mismatch check prints a bogus symbol name on some
architectures.

[test code]

  #include <linux/init.h>

  int __initdata foo;
  int get_foo(void) { return foo; }

If you compile it with GCC for riscv or loongarch, modpost will show an
incorrect symbol name:

  WARNING: modpost: vmlinux: section mismatch in reference: get_foo+0x8 (section: .text) -> done (section: .init.data)

To get the correct symbol address, the st_value must be added.

This issue has never been noticed since commit 93684d3b8062 ("kbuild:
include symbol names in section mismatch warnings") presumably because
st_value becomes zero on most architectures when the referenced symbol
is looked up. It is not true for riscv or loongarch, at least.

With this fix, modpost will show the correct symbol name:

  WARNING: modpost: vmlinux: section mismatch in reference: get_foo+0x8 (section: .text) -> foo (section: .init.data)

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/mod/modpost.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index b3dee80497cb2..ac4ef3e206bbd 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1496,13 +1496,15 @@ static void section_rela(struct module *mod, struct elf_info *elf,
 		return;
 
 	for (rela = start; rela < stop; rela++) {
+		Elf_Sym *tsym;
 		Elf_Addr taddr, r_offset;
 		unsigned int r_type, r_sym;
 
 		r_offset = TO_NATIVE(rela->r_offset);
 		get_rel_type_and_sym(elf, rela->r_info, &r_type, &r_sym);
 
-		taddr = TO_NATIVE(rela->r_addend);
+		tsym = elf->symtab_start + r_sym;
+		taddr = tsym->st_value + TO_NATIVE(rela->r_addend);
 
 		switch (elf->hdr->e_machine) {
 		case EM_RISCV:
@@ -1517,7 +1519,7 @@ static void section_rela(struct module *mod, struct elf_info *elf,
 			break;
 		}
 
-		check_section_mismatch(mod, elf, elf->symtab_start + r_sym,
+		check_section_mismatch(mod, elf, tsym,
 				       fsecndx, fromsec, r_offset, taddr);
 	}
 }
-- 
2.42.0


