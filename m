Return-Path: <linux-kbuild+bounces-428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4374981ECDF
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Dec 2023 08:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4334B21836
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Dec 2023 07:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FA4539C;
	Wed, 27 Dec 2023 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="F39uGL/b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F25392
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Dec 2023 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1703660626; bh=K2k2GxIuqjMC/NnfCosbCSIqYontEnvv3dQx5KknIGk=;
	h=From:To:Cc:Subject:Date:From;
	b=F39uGL/bn4zLEsFhaY74nOkfbu0rj45jjJOPO0+/s6Mmw7GUSBmZJtNlwq0tHtmx4
	 B4JfchpNPqR3PGn8XEt3h+lTyAA4/6xzaDlk8/5h1XZZexfZmAocxyRyxxTB/0FQgE
	 r1y6nnjLyQbYip892ykBZBlzLGFGgntBKXWmlfaw=
Received: from ld50.lan (unknown [IPv6:240e:388:8d23:e100:4572:35ff:7275:50ea])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8F20160117;
	Wed, 27 Dec 2023 15:03:39 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: linux-kbuild@vger.kernel.org
Cc: WANG Xuerui <git@xen0n.name>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Youling Tang <tangyouling@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev
Subject: [PATCH] modpost: Ignore relaxation and alignment marker relocs on LoongArch
Date: Wed, 27 Dec 2023 15:03:14 +0800
Message-ID: <20231227070317.1936234-1-kernel@xen0n.name>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

With recent trunk versions of binutils and gcc, alignment directives are
represented with R_LARCH_ALIGN relocs on LoongArch, which is necessary
for the linker to maintain alignment requirements during its relaxation
passes. And even though the kernel is built with relaxation disabled, so
far a small number of R_LARCH_RELAX marker relocs are still emitted as
part of la.* pseudo instructions in assembly. These two kinds of relocs
do not refer to symbols, which can trip up modpost's section mismatch
checks, because the r_offset of said relocs can be zero or any other
meaningless value, eventually leading to a `from == NULL` condition in
default_mismatch_handler and SIGSEGV.

As the two kinds of relocs are not concerned with symbols, just ignore
them for section mismatch check purposes.

Fixes: 3d36f4298ba9 ("LoongArch: Switch to relative exception tables")
Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Youling Tang <tangyouling@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev
---
 scripts/mod/modpost.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index cb6406f485a9..a4df47372b95 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1346,6 +1346,14 @@ static Elf_Addr addend_mips_rel(uint32_t *location, unsigned int r_type)
 #define R_LARCH_SUB32		55
 #endif
 
+#ifndef R_LARCH_RELAX
+#define R_LARCH_RELAX		100
+#endif
+
+#ifndef R_LARCH_ALIGN
+#define R_LARCH_ALIGN		102
+#endif
+
 static void get_rel_type_and_sym(struct elf_info *elf, uint64_t r_info,
 				 unsigned int *r_type, unsigned int *r_sym)
 {
@@ -1400,9 +1408,16 @@ static void section_rela(struct module *mod, struct elf_info *elf,
 				continue;
 			break;
 		case EM_LOONGARCH:
-			if (!strcmp("__ex_table", fromsec) &&
-			    r_type == R_LARCH_SUB32)
+			switch (r_type) {
+			case R_LARCH_SUB32:
+				if (!strcmp("__ex_table", fromsec))
+					continue;
+				break;
+			case R_LARCH_RELAX:
+			case R_LARCH_ALIGN:
+				/* these relocs do not refer to symbols */
 				continue;
+			}
 			break;
 		}
 
-- 
2.43.0


