Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE55555002
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jun 2022 17:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359693AbiFVPxK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jun 2022 11:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359645AbiFVPwu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jun 2022 11:52:50 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE79713FA2;
        Wed, 22 Jun 2022 08:52:46 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LSnsy1QBQzkWNh;
        Wed, 22 Jun 2022 23:51:02 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:43 +0800
Received: from ubuntu1804.huawei.com (10.67.175.36) by
 dggpemm500013.china.huawei.com (7.185.36.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 22 Jun 2022 23:52:43 +0800
From:   Chen Zhongjin <chenzhongjin@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-arch@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kbuild@vger.kernel.org>, <live-patching@vger.kernel.org>
CC:     <jpoimboe@kernel.org>, <peterz@infradead.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <ndesaulniers@google.com>, <mark.rutland@arm.com>,
        <pasha.tatashin@soleen.com>, <broonie@kernel.org>,
        <chenzhongjin@huawei.com>, <rmk+kernel@armlinux.org.uk>,
        <madvenka@linux.microsoft.com>, <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 09/33] objtool: check: Support data in text section
Date:   Wed, 22 Jun 2022 23:48:56 +0800
Message-ID: <20220622154920.95075-10-chenzhongjin@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220622154920.95075-1-chenzhongjin@huawei.com>
References: <20220622154920.95075-1-chenzhongjin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.36]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Arm64 assembly code can mix code and data in text sections through the use
of SYM_DATA_*() macros. Skip the content of these symbols when decoding
instructions of text sections.

Signed-off-by: Julien Thierry <jthierry@redhat.com>
Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
---
 tools/objtool/check.c               | 13 +++++++++++--
 tools/objtool/elf.c                 | 14 ++++++++++++++
 tools/objtool/include/objtool/elf.h |  1 +
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index c0feb6db7c6d..77911ca9cfff 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -359,7 +359,7 @@ static int decode_instructions(struct objtool_file *file)
 {
 	struct section *sec;
 	struct symbol *func;
-	unsigned long offset;
+	unsigned long offset, next_offset;
 	struct instruction *insn;
 	int ret;
 
@@ -377,7 +377,14 @@ static int decode_instructions(struct objtool_file *file)
 		    !strcmp(sec->name, ".entry.text"))
 			sec->noinstr = true;
 
-		for (offset = 0; offset < sec->sh.sh_size; offset += insn->len) {
+		for (offset = 0; offset < sec->sh.sh_size; offset = next_offset) {
+			struct symbol *obj_sym = find_object_containing(sec, offset);
+			if (obj_sym) {
+				/* This is data in the middle of text section, skip it */
+				next_offset = obj_sym->offset + obj_sym->len;
+				continue;
+			}
+
 			insn = malloc(sizeof(*insn));
 			if (!insn) {
 				WARN("malloc failed");
@@ -410,6 +417,8 @@ static int decode_instructions(struct objtool_file *file)
 			hash_add(file->insn_hash, &insn->hash, sec_offset_hash(sec, insn->offset));
 			list_add_tail(&insn->list, &file->insn_list);
 			nr_insns++;
+
+			next_offset = offset + insn->len;
 		}
 
 		list_for_each_entry(func, &sec->symbol_list, list) {
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index c25e957c1e52..d7304e39f6b6 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -236,6 +236,20 @@ struct symbol *find_func_containing(struct section *sec, unsigned long offset)
 	return NULL;
 }
 
+struct symbol *find_object_containing(const struct section *sec, unsigned long offset)
+{
+	struct rb_node *node;
+
+	rb_for_each(node, &offset, &sec->symbol_tree, symbol_by_offset) {
+		struct symbol *s = rb_entry(node, struct symbol, node);
+
+		if (s->type == STT_OBJECT)
+			return s;
+	}
+
+	return NULL;
+}
+
 struct symbol *find_symbol_by_name(const struct elf *elf, const char *name)
 {
 	struct symbol *sym;
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index adebfbc2b518..8b0896935af1 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -167,6 +167,7 @@ struct reloc *find_reloc_by_dest(const struct elf *elf, struct section *sec, uns
 struct reloc *find_reloc_by_dest_range(const struct elf *elf, struct section *sec,
 				     unsigned long offset, unsigned int len);
 struct symbol *find_func_containing(struct section *sec, unsigned long offset);
+struct symbol *find_object_containing(const struct section *sec, unsigned long offset);
 
 #define for_each_sec(file, sec)						\
 	list_for_each_entry(sec, &file->elf->sections, list)
-- 
2.17.1

