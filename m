Return-Path: <linux-kbuild+bounces-5332-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E4CA004FD
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 08:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00454162F11
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 07:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE79C1CDA01;
	Fri,  3 Jan 2025 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iueCJK3B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B39B1CD1F6;
	Fri,  3 Jan 2025 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889462; cv=none; b=X2X9pFGO88HmN9OEVlTheRGpt3CxLuiDHud4aiPOn2eyHI9FxeSsCi5l2v7lxTBogA/C+3HQM29Qogfr0DB+G8do7cH/uKBDPVryK5RE5EdB1Gd/itTQETl02tNFwoi1jc+kHwe2n64sS+w23Fs5m+fkFO8JPrc2bCz12rj2Pho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889462; c=relaxed/simple;
	bh=kg7X+7DNKFWqUvd+B+HYfuLNgqbOgSFSu7r41VUpKWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhXsFKqz+7NYl7PeaJZXiu51dksrHglCgUR/mabGjdtZnM+aCS6CJEv4ABs5TUDDXuRr5WP8RuirK0vKH4OiPGJjJUwNCJthL2N5HuPmZ4ozfKwzKtX6d8AiTjqVc8bGHHbwdTw4FNdxbp5Q8dy9x/wWDZNldCe8fm+KmdCkdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iueCJK3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486EFC4CED7;
	Fri,  3 Jan 2025 07:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735889462;
	bh=kg7X+7DNKFWqUvd+B+HYfuLNgqbOgSFSu7r41VUpKWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iueCJK3B2fF/Fokbefa+7TtsbuoXpPTCBLjofILLkE/u8CZsUrCUzSWp+B2cGjJEI
	 QlNekjFK313xyNdCjnseub0/xYyRXXadajMoPIRb6tQw1zY5pz12LEpE02pM6hPJ1s
	 1en6UvNgS+0AhLMW7K59xW127J8DxyGCOmFM7+mOXBgjW21yBGYaQn4UCwJ/OrqX9M
	 vielj/QnJU/mWBGSi3Wr9410dRI5RulzerAwWoaNtkfsO0AWvZtS07fppvjlDadvrG
	 1JSwDKmns14cUiymS0jkXLcLS2LON8aTiVlJS2HI9HGyydxUa3iagMbTLdr/M9vB2+
	 CPCqBvBoAljMw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 6/6] genksyms: use uint32_t instead of unsigned long for calculating CRC
Date: Fri,  3 Jan 2025 16:30:43 +0900
Message-ID: <20250103073046.2609911-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103073046.2609911-1-masahiroy@kernel.org>
References: <20250103073046.2609911-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, 'unsigned long' is used for intermediate variables when
calculating CRCs.

The size of 'long' differs depending on the architecture: it is 32 bits
on 32-bit architectures and 64 bits on 64-bit architectures.

The CRC values generated by genksyms represent the compatibility of
exported symbols. Therefore, reproducibility is important. In other
words, we need to ensure that the output is the same when the kernel
source is identical, regardless of whether genksyms is running on a
32-bit or 64-bit build machine.

Fortunately, the output from genksyms is not affected by the build
machine's architecture because only the lower 32 bits of the
'unsigned long' variables are used.

To make it even clearer that the CRC calculation is independent of
the build machine's architecture, this commit explicitly uses the
fixed-width type, uint32_t.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/genksyms.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index e2cd3dcb469f..8b0d7ac73dbb 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -12,6 +12,7 @@
 
 #include <stdio.h>
 #include <string.h>
+#include <stdint.h>
 #include <stdlib.h>
 #include <unistd.h>
 #include <assert.h>
@@ -60,7 +61,7 @@ static void print_type_name(enum symbol_type type, const char *name);
 
 /*----------------------------------------------------------------------*/
 
-static const unsigned int crctab32[] = {
+static const uint32_t crctab32[] = {
 	0x00000000U, 0x77073096U, 0xee0e612cU, 0x990951baU, 0x076dc419U,
 	0x706af48fU, 0xe963a535U, 0x9e6495a3U, 0x0edb8832U, 0x79dcb8a4U,
 	0xe0d5e91eU, 0x97d2d988U, 0x09b64c2bU, 0x7eb17cbdU, 0xe7b82d07U,
@@ -115,19 +116,19 @@ static const unsigned int crctab32[] = {
 	0x2d02ef8dU
 };
 
-static unsigned long partial_crc32_one(unsigned char c, unsigned long crc)
+static uint32_t partial_crc32_one(uint8_t c, uint32_t crc)
 {
 	return crctab32[(crc ^ c) & 0xff] ^ (crc >> 8);
 }
 
-static unsigned long partial_crc32(const char *s, unsigned long crc)
+static uint32_t partial_crc32(const char *s, uint32_t crc)
 {
 	while (*s)
 		crc = partial_crc32_one(*s++, crc);
 	return crc;
 }
 
-static unsigned long crc32(const char *s)
+static uint32_t crc32(const char *s)
 {
 	return partial_crc32(s, 0xffffffff) ^ 0xffffffff;
 }
@@ -517,7 +518,7 @@ static void print_list(FILE * f, struct string_list *list)
 	}
 }
 
-static unsigned long expand_and_crc_sym(struct symbol *sym, unsigned long crc)
+static uint32_t expand_and_crc_sym(struct symbol *sym, uint32_t crc)
 {
 	struct string_list *list = sym->defn;
 	struct string_list **e, **b;
@@ -624,7 +625,7 @@ static unsigned long expand_and_crc_sym(struct symbol *sym, unsigned long crc)
 void export_symbol(const char *name)
 {
 	struct symbol *sym;
-	unsigned long crc;
+	uint32_t crc;
 	int has_changed = 0;
 
 	sym = find_symbol(name, SYM_NORMAL, 0);
@@ -672,7 +673,7 @@ void export_symbol(const char *name)
 	if (flag_dump_defs)
 		fputs(">\n", debugfile);
 
-	printf("#SYMVER %s 0x%08lx\n", name, crc);
+	printf("#SYMVER %s 0x%08lx\n", name, (unsigned long)crc);
 }
 
 /*----------------------------------------------------------------------*/
-- 
2.43.0


