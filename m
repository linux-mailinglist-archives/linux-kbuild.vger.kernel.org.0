Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7078B75E11A
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Jul 2023 12:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjGWKEy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 23 Jul 2023 06:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjGWKEy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Jul 2023 06:04:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB7D10FD;
        Sun, 23 Jul 2023 03:04:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5423C60C6F;
        Sun, 23 Jul 2023 10:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBBEC433CA;
        Sun, 23 Jul 2023 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690106691;
        bh=BXNbfiZP5SgJnQHebcdaUHLbFi7ieRXqurAcsahENjA=;
        h=From:To:Cc:Subject:Date:From;
        b=tTD+6JH/7ul6Ifwh50RkuI1LvXkaai9hDPASKsNgEc6BkY/Hs+Q/DTk0PBSjKNNJe
         SG2iensEe2SfhWlHZXjw8mkdwcFVPbBT5qeLvW2OyRdCV3/jZ++Hm3tVtgdhzJ+Fa7
         bbcygyLt3+OsJgEooZPYyH3QlXZ/qIcUTcb9lO6nsILJxk81b/rOsOgg48E1i8jOR7
         FohZbyWahj4dp8Q5ghXBLHkUvtHCf4BFZmmvu3PgXQ6fCMRFrPmDW1PJOl3FScsBpO
         1eQKMG6n/iThmRLwbmWSavQtTONXscpucNIKVY6xLDxMHjLBo0ekbSVKmdopFq15B7
         7YL/kAHJ2LfyA==
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 1/4] modpost: change return type of addend_*_rel()
Date:   Sun, 23 Jul 2023 19:04:43 +0900
Message-Id: <20230723100446.3062358-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that none of addend_*_rel() returns a meaningful value (the return
value is always 0), change all of them to return the value of r_addend.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 63 +++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 39 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 8227641dd087..a8e85b7cc0da 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1257,21 +1257,18 @@ static void check_section_mismatch(struct module *mod, struct elf_info *elf,
 				 tosec, taddr);
 }
 
-static int addend_386_rel(uint32_t *location, Elf_Rela *r)
+static Elf_Addr addend_386_rel(uint32_t *location, Elf_Rela *r)
 {
 	unsigned int r_typ = ELF_R_TYPE(r->r_info);
 
 	switch (r_typ) {
 	case R_386_32:
-		r->r_addend = TO_NATIVE(*location);
-		break;
+		return TO_NATIVE(*location);
 	case R_386_PC32:
-		r->r_addend = TO_NATIVE(*location) + 4;
-		break;
-	default:
-		r->r_addend = (Elf_Addr)(-1);
+		return TO_NATIVE(*location) + 4;
 	}
-	return 0;
+
+	return (Elf_Addr)(-1);
 }
 
 #ifndef R_ARM_CALL
@@ -1315,7 +1312,7 @@ static int32_t sign_extend32(int32_t value, int index)
 	return (int32_t)(value << shift) >> shift;
 }
 
-static int addend_arm_rel(void *loc, Elf_Sym *sym, Elf_Rela *r)
+static Elf_Addr addend_arm_rel(void *loc, Elf_Sym *sym, Elf_Rela *r)
 {
 	unsigned int r_typ = ELF_R_TYPE(r->r_info);
 	uint32_t inst, upper, lower, sign, j1, j2;
@@ -1325,22 +1322,19 @@ static int addend_arm_rel(void *loc, Elf_Sym *sym, Elf_Rela *r)
 	case R_ARM_ABS32:
 	case R_ARM_REL32:
 		inst = TO_NATIVE(*(uint32_t *)loc);
-		r->r_addend = inst + sym->st_value;
-		break;
+		return inst + sym->st_value;
 	case R_ARM_MOVW_ABS_NC:
 	case R_ARM_MOVT_ABS:
 		inst = TO_NATIVE(*(uint32_t *)loc);
 		offset = sign_extend32(((inst & 0xf0000) >> 4) | (inst & 0xfff),
 				       15);
-		r->r_addend = offset + sym->st_value;
-		break;
+		return offset + sym->st_value;
 	case R_ARM_PC24:
 	case R_ARM_CALL:
 	case R_ARM_JUMP24:
 		inst = TO_NATIVE(*(uint32_t *)loc);
 		offset = sign_extend32((inst & 0x00ffffff) << 2, 25);
-		r->r_addend = offset + sym->st_value + 8;
-		break;
+		return offset + sym->st_value + 8;
 	case R_ARM_THM_MOVW_ABS_NC:
 	case R_ARM_THM_MOVT_ABS:
 		upper = TO_NATIVE(*(uint16_t *)loc);
@@ -1350,8 +1344,7 @@ static int addend_arm_rel(void *loc, Elf_Sym *sym, Elf_Rela *r)
 				       ((lower & 0x7000) >> 4) |
 				       (lower & 0x00ff),
 				       15);
-		r->r_addend = offset + sym->st_value;
-		break;
+		return offset + sym->st_value;
 	case R_ARM_THM_JUMP19:
 		/*
 		 * Encoding T3:
@@ -1372,8 +1365,7 @@ static int addend_arm_rel(void *loc, Elf_Sym *sym, Elf_Rela *r)
 				       ((upper & 0x03f) << 12) |
 				       ((lower & 0x07ff) << 1),
 				       20);
-		r->r_addend = offset + sym->st_value + 4;
-		break;
+		return offset + sym->st_value + 4;
 	case R_ARM_THM_CALL:
 	case R_ARM_THM_JUMP24:
 		/*
@@ -1399,15 +1391,13 @@ static int addend_arm_rel(void *loc, Elf_Sym *sym, Elf_Rela *r)
 				       ((upper & 0x03ff) << 12) |
 				       ((lower & 0x07ff) << 1),
 				       24);
-		r->r_addend = offset + sym->st_value + 4;
-		break;
-	default:
-		r->r_addend = (Elf_Addr)(-1);
+		return offset + sym->st_value + 4;
 	}
-	return 0;
+
+	return (Elf_Addr)(-1);
 }
 
-static int addend_mips_rel(uint32_t *location, Elf_Rela *r)
+static Elf_Addr addend_mips_rel(uint32_t *location, Elf_Rela *r)
 {
 	unsigned int r_typ = ELF_R_TYPE(r->r_info);
 	uint32_t inst;
@@ -1415,18 +1405,13 @@ static int addend_mips_rel(uint32_t *location, Elf_Rela *r)
 	inst = TO_NATIVE(*location);
 	switch (r_typ) {
 	case R_MIPS_LO16:
-		r->r_addend = inst & 0xffff;
-		break;
+		return inst & 0xffff;
 	case R_MIPS_26:
-		r->r_addend = (inst & 0x03ffffff) << 2;
-		break;
+		return (inst & 0x03ffffff) << 2;
 	case R_MIPS_32:
-		r->r_addend = inst;
-		break;
-	default:
-		r->r_addend = (Elf_Addr)(-1);
+		return inst;
 	}
-	return 0;
+	return (Elf_Addr)(-1);
 }
 
 #ifndef EM_RISCV
@@ -1513,6 +1498,7 @@ static void section_rel(struct module *mod, struct elf_info *elf,
 
 	for (rel = start; rel < stop; rel++) {
 		Elf_Sym *tsym;
+		Elf_Addr taddr = 0;
 		void *loc;
 
 		r.r_offset = TO_NATIVE(rel->r_offset);
@@ -1531,27 +1517,26 @@ static void section_rel(struct module *mod, struct elf_info *elf,
 		r.r_info = TO_NATIVE(rel->r_info);
 		r_sym = ELF_R_SYM(r.r_info);
 #endif
-		r.r_addend = 0;
 
 		loc = sym_get_data_by_offset(elf, fsecndx, r.r_offset);
 		tsym = elf->symtab_start + r_sym;
 
 		switch (elf->hdr->e_machine) {
 		case EM_386:
-			addend_386_rel(loc, &r);
+			taddr = addend_386_rel(loc, &r);
 			break;
 		case EM_ARM:
-			addend_arm_rel(loc, tsym, &r);
+			taddr = addend_arm_rel(loc, tsym, &r);
 			break;
 		case EM_MIPS:
-			addend_mips_rel(loc, &r);
+			taddr = addend_mips_rel(loc, &r);
 			break;
 		default:
 			fatal("Please add code to calculate addend for this architecture\n");
 		}
 
 		check_section_mismatch(mod, elf, tsym,
-				       fsecndx, fromsec, r.r_offset, r.r_addend);
+				       fsecndx, fromsec, r.r_offset, taddr);
 	}
 }
 
-- 
2.39.2

