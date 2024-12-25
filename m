Return-Path: <linux-kbuild+bounces-5242-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 861E89FC5EB
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2024 16:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2569B188382A
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2024 15:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05F01BC07A;
	Wed, 25 Dec 2024 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kp4P3hOy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C8F1BC069;
	Wed, 25 Dec 2024 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735140848; cv=none; b=FVwlDVSZrKONvROoML16h7M3r4x+vM3mzb+xOxfS7Qh12T7FEYnwYaZPPaZ/vsy6/tD7K3uSfOP2O8T1lzwkDIPmIy/uS9SSeAxDLbJkaYJhgGFSoYI/siNQmHCjKy3PKeVIgBtI+RIqCzc9sfdHdwlrgsk/dgMYw4dqcIbjuto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735140848; c=relaxed/simple;
	bh=6D1C6rbrgHU2WXBYnJ9sFqrh5OpIdxLiPim9FKxrsqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D2th4JkLQgKk5EDX7ySZjp/wRQdMe+qB4wGQjxiIa+n30+XCcmKhk6TiU6Z2wO2OsmIdZeNgU6dJfq+kaBtPakzpjMKaiaIkRIYOHK0BlbaxAUOHNG7b2TXMNih7fRYr/Yf6Qd0F9xn5267nb2gCtOhG063318oViFaSTVXvgi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kp4P3hOy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91DA4C4CECD;
	Wed, 25 Dec 2024 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735140848;
	bh=6D1C6rbrgHU2WXBYnJ9sFqrh5OpIdxLiPim9FKxrsqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kp4P3hOyy1QXDBZnl1mJGkshMH3iDj3JiupgXH/cAeFVohwdiXgbSx+9EYT+cIsKd
	 Ab6yHzu3CBDnsj23QNXaQQpuRvH8s8natc7YeAT23NU5Ik0UVAxNe83RkxIwybLkzj
	 a4nk5FUWoOlvB/vaS/vaaKm8gX2S9lbgDmckYcdFJ6wKkqoaG6wubDZfjDOCbW/IWN
	 YmWxBw4c9yqoFZ9vQQAURFOl4iVCJAdKGOeU3K9KZfCi1GcpJOS5H6wm2+xUMyWKIl
	 di+v3ElMCxEHzQ4+zimkqdOLr5yH9gy5lYIYDhVgQ1BpdN5fIO5wLofJse+cC7Gsht
	 abIexsaF2KTMA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Paulo Pisati <paolo.pisati@canonical.com>,
	Matthias Klose <doko@debian.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 3/3] modpost: work around unaligned data access error
Date: Thu, 26 Dec 2024 00:33:37 +0900
Message-ID: <20241225153343.134590-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241225153343.134590-1-masahiroy@kernel.org>
References: <20241225153343.134590-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the latest binutils, modpost fails with a bus error on some
architectures such as ARM and sparc64.

Since binutils commit 1f1b5e506bf0 ("bfd/ELF: restrict file alignment
for object files"), the byte offset to each section (sh_offset) in
relocatable ELF is no longer guaranteed to be aligned.

modpost parses MODULE_DEVICE_TABLE() data structures, which are usually
located in the .rodata section. If it is not properly aligned, unaligned
access errors may occur.

To address the issue, this commit imports the get_unaligned() helper
from include/linux/unaligned.h.

The get_unaligned_native() helper caters to the endianness in addition
to handling the unaligned access.

I slightly refactored do_pcmcia_entry() and do_input() to avoid writing
back to an unaligned address. (We would need the put_unaligned() helper
to do that.)

The addend_*_rel() functions need similar adjustments because the .text
sections are not aligned either.

It seems that the .symtab, .rel.* and .rela.* sections are still aligned.
Keep normal pointer access for these sections to avoid unnecessary
performance costs.

Reported-by: Paulo Pisati <paolo.pisati@canonical.com>
Reported-by: Matthias Klose <doko@debian.org>
Closes: https://sourceware.org/bugzilla/show_bug.cgi?id=32435
Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Closes: https://sourceware.org/bugzilla/show_bug.cgi?id=32493
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 26 +++++++++++++-------------
 scripts/mod/modpost.c    | 24 ++++++++++++------------
 scripts/mod/modpost.h    | 14 ++++++++++++++
 3 files changed, 39 insertions(+), 25 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 2c7b76d4e8ec..19ec72a69e90 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -132,7 +132,8 @@ struct devtable {
  * based at address m.
  */
 #define DEF_FIELD(m, devid, f) \
-	typeof(((struct devid *)0)->f) f = TO_NATIVE(*(typeof(f) *)((m) + OFF_##devid##_##f))
+	typeof(((struct devid *)0)->f) f = \
+		get_unaligned_native((typeof(f) *)((m) + OFF_##devid##_##f))
 
 /* Define a variable f that holds the address of field f of struct devid
  * based at address m.  Due to the way typeof works, for a field of type
@@ -600,7 +601,7 @@ static void do_pnp_card_entry(struct module *mod, void *symval)
 static void do_pcmcia_entry(struct module *mod, void *symval)
 {
 	char alias[256] = {};
-	unsigned int i;
+
 	DEF_FIELD(symval, pcmcia_device_id, match_flags);
 	DEF_FIELD(symval, pcmcia_device_id, manf_id);
 	DEF_FIELD(symval, pcmcia_device_id, card_id);
@@ -609,10 +610,6 @@ static void do_pcmcia_entry(struct module *mod, void *symval)
 	DEF_FIELD(symval, pcmcia_device_id, device_no);
 	DEF_FIELD_ADDR(symval, pcmcia_device_id, prod_id_hash);
 
-	for (i=0; i<4; i++) {
-		(*prod_id_hash)[i] = TO_NATIVE((*prod_id_hash)[i]);
-	}
-
 	ADD(alias, "m", match_flags & PCMCIA_DEV_ID_MATCH_MANF_ID,
 	    manf_id);
 	ADD(alias, "c", match_flags & PCMCIA_DEV_ID_MATCH_CARD_ID,
@@ -623,10 +620,14 @@ static void do_pcmcia_entry(struct module *mod, void *symval)
 	    function);
 	ADD(alias, "pfn", match_flags & PCMCIA_DEV_ID_MATCH_DEVICE_NO,
 	    device_no);
-	ADD(alias, "pa", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID1, (*prod_id_hash)[0]);
-	ADD(alias, "pb", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID2, (*prod_id_hash)[1]);
-	ADD(alias, "pc", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID3, (*prod_id_hash)[2]);
-	ADD(alias, "pd", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID4, (*prod_id_hash)[3]);
+	ADD(alias, "pa", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID1,
+	    get_unaligned_native(*prod_id_hash + 0));
+	ADD(alias, "pb", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID2,
+	    get_unaligned_native(*prod_id_hash + 1));
+	ADD(alias, "pc", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID3,
+	    get_unaligned_native(*prod_id_hash + 2));
+	ADD(alias, "pd", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID4,
+	    get_unaligned_native(*prod_id_hash + 3));
 
 	module_alias_printf(mod, true, "pcmcia:%s", alias);
 }
@@ -654,10 +655,9 @@ static void do_input(char *alias,
 {
 	unsigned int i;
 
-	for (i = min / BITS_PER_LONG; i < max / BITS_PER_LONG + 1; i++)
-		arr[i] = TO_NATIVE(arr[i]);
 	for (i = min; i <= max; i++)
-		if (arr[i / BITS_PER_LONG] & (1ULL << (i%BITS_PER_LONG)))
+		if (get_unaligned_native(arr + i / BITS_PER_LONG) &
+		    (1ULL << (i % BITS_PER_LONG)))
 			sprintf(alias + strlen(alias), "%X,*", i);
 }
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 94ee49207a45..7ea59dc4926b 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1138,9 +1138,9 @@ static Elf_Addr addend_386_rel(uint32_t *location, unsigned int r_type)
 {
 	switch (r_type) {
 	case R_386_32:
-		return TO_NATIVE(*location);
+		return get_unaligned_native(location);
 	case R_386_PC32:
-		return TO_NATIVE(*location) + 4;
+		return get_unaligned_native(location) + 4;
 	}
 
 	return (Elf_Addr)(-1);
@@ -1161,24 +1161,24 @@ static Elf_Addr addend_arm_rel(void *loc, Elf_Sym *sym, unsigned int r_type)
 	switch (r_type) {
 	case R_ARM_ABS32:
 	case R_ARM_REL32:
-		inst = TO_NATIVE(*(uint32_t *)loc);
+		inst = get_unaligned_native((uint32_t *)loc);
 		return inst + sym->st_value;
 	case R_ARM_MOVW_ABS_NC:
 	case R_ARM_MOVT_ABS:
-		inst = TO_NATIVE(*(uint32_t *)loc);
+		inst = get_unaligned_native((uint32_t *)loc);
 		offset = sign_extend32(((inst & 0xf0000) >> 4) | (inst & 0xfff),
 				       15);
 		return offset + sym->st_value;
 	case R_ARM_PC24:
 	case R_ARM_CALL:
 	case R_ARM_JUMP24:
-		inst = TO_NATIVE(*(uint32_t *)loc);
+		inst = get_unaligned_native((uint32_t *)loc);
 		offset = sign_extend32((inst & 0x00ffffff) << 2, 25);
 		return offset + sym->st_value + 8;
 	case R_ARM_THM_MOVW_ABS_NC:
 	case R_ARM_THM_MOVT_ABS:
-		upper = TO_NATIVE(*(uint16_t *)loc);
-		lower = TO_NATIVE(*((uint16_t *)loc + 1));
+		upper = get_unaligned_native((uint16_t *)loc);
+		lower = get_unaligned_native((uint16_t *)loc + 1);
 		offset = sign_extend32(((upper & 0x000f) << 12) |
 				       ((upper & 0x0400) << 1) |
 				       ((lower & 0x7000) >> 4) |
@@ -1195,8 +1195,8 @@ static Elf_Addr addend_arm_rel(void *loc, Elf_Sym *sym, unsigned int r_type)
 		 * imm11 = lower[10:0]
 		 * imm32 = SignExtend(S:J2:J1:imm6:imm11:'0')
 		 */
-		upper = TO_NATIVE(*(uint16_t *)loc);
-		lower = TO_NATIVE(*((uint16_t *)loc + 1));
+		upper = get_unaligned_native((uint16_t *)loc);
+		lower = get_unaligned_native((uint16_t *)loc + 1);
 
 		sign = (upper >> 10) & 1;
 		j1 = (lower >> 13) & 1;
@@ -1219,8 +1219,8 @@ static Elf_Addr addend_arm_rel(void *loc, Elf_Sym *sym, unsigned int r_type)
 		 * I2    = NOT(J2 XOR S)
 		 * imm32 = SignExtend(S:I1:I2:imm10:imm11:'0')
 		 */
-		upper = TO_NATIVE(*(uint16_t *)loc);
-		lower = TO_NATIVE(*((uint16_t *)loc + 1));
+		upper = get_unaligned_native((uint16_t *)loc);
+		lower = get_unaligned_native((uint16_t *)loc + 1);
 
 		sign = (upper >> 10) & 1;
 		j1 = (lower >> 13) & 1;
@@ -1241,7 +1241,7 @@ static Elf_Addr addend_mips_rel(uint32_t *location, unsigned int r_type)
 {
 	uint32_t inst;
 
-	inst = TO_NATIVE(*location);
+	inst = get_unaligned_native(location);
 	switch (r_type) {
 	case R_MIPS_LO16:
 		return inst & 0xffff;
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 8b72c227ebf4..ffd0a52a606e 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -65,6 +65,20 @@
 #define TO_NATIVE(x)	\
 	(target_is_big_endian == host_is_big_endian ? x : bswap(x))
 
+#define __get_unaligned_t(type, ptr) ({					\
+	const struct { type x; } __attribute__((__packed__)) *__pptr =	\
+						(typeof(__pptr))(ptr);	\
+	__pptr->x;							\
+})
+
+#define get_unaligned(ptr)	__get_unaligned_t(typeof(*(ptr)), (ptr))
+
+#define get_unaligned_native(ptr) \
+({ \
+	typeof(*(ptr)) _val = get_unaligned(ptr); \
+	TO_NATIVE(_val); \
+})
+
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
 #define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
-- 
2.43.0


