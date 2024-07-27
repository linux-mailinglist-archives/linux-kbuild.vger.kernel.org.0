Return-Path: <linux-kbuild+bounces-2682-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C7093DDB4
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 09:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20A511C2187F
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 07:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E4543AC0;
	Sat, 27 Jul 2024 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dyc/8bgD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EDD433DC;
	Sat, 27 Jul 2024 07:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722066339; cv=none; b=T+v2r/pnPGvNYiJgaSiDUPNOVq+wCEdA0e3dl83FtDBJBn9WauFdxnycJxsgGGZ9Zv1SH+HPUHVVDulNzdJiisdPiY/2BQomx2uG3sdGZNLBOd3XX2qtjS9m8bxkM99a4QUnd1Imrhgta+rlCPo++65fqGrj1Bcg+tF85usimQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722066339; c=relaxed/simple;
	bh=odjYNOw6Q3VhuywTHHYXP+Ya9uttebtWitzebGDplN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luv7hvMmP901bSIfUY/2vrpoBy4EG+sRDQfgPgAy2/7PmDtHxI9UTRNOuDycHs9x6qIqDtEaHS5E5dtIaxzgbcjbQBK0dhpPs1TCk7G6Po0+VZ4WuqA2Gvks9FE0gxK8P+scqwruH/rswCiJQf+bGQNSxily2b+0ndN8mFIXcw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dyc/8bgD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8B7C4AF0F;
	Sat, 27 Jul 2024 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722066338;
	bh=odjYNOw6Q3VhuywTHHYXP+Ya9uttebtWitzebGDplN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dyc/8bgDWepu5bXA4FSBDz2QXfyWAXRZpExXsuKNGzuCt5oZV3yn5qZzvfDEJfQ38
	 fhXibfgP631hQ/tyk3yoG7hRehHlQur4/AB/NKyYUNTHIxEg6s06RQROY2dka8nHaX
	 O5nu6UhY5dH/4pAP6JR7FUAymVOW/qtLe9O9VqPYkoA/yslmRIMhSnvDL4SHVjka05
	 KPJfKjHp/9rJAS/pReewI6qAmW91WZnJzJOPZS2LkGYvgIkXVON+acNb9Mqjas8cg4
	 Ks300bZXAI9iknXrlGazSgZXbFfisUst5dXsmFk8EME8Df7D02I74M4KFWnGCScUeA
	 2+RdXFMf6PoHQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/4] modpost: detect endianness on run-time
Date: Sat, 27 Jul 2024 16:42:02 +0900
Message-ID: <20240727074526.1771247-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240727074526.1771247-1-masahiroy@kernel.org>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endianness is currently detected on compile-time, but we can defer this
until run-time. This change avoids re-executing scripts/mod/mk_elfconfig
even if modpost in the linux-headers package needs to be rebuilt for a
foreign architecture.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/mk_elfconfig.c | 19 -------------------
 scripts/mod/modpost.c      | 36 ++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.h      | 13 ++++---------
 3 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/scripts/mod/mk_elfconfig.c b/scripts/mod/mk_elfconfig.c
index aca96b3aada0..e8cee4e4bc73 100644
--- a/scripts/mod/mk_elfconfig.c
+++ b/scripts/mod/mk_elfconfig.c
@@ -8,7 +8,6 @@ int
 main(int argc, char **argv)
 {
 	unsigned char ei[EI_NIDENT];
-	union { short s; char c[2]; } endian_test;
 
 	if (fread(ei, 1, EI_NIDENT, stdin) != EI_NIDENT) {
 		fprintf(stderr, "Error: input truncated\n");
@@ -28,24 +27,6 @@ main(int argc, char **argv)
 	default:
 		exit(1);
 	}
-	switch (ei[EI_DATA]) {
-	case ELFDATA2LSB:
-		printf("#define KERNEL_ELFDATA ELFDATA2LSB\n");
-		break;
-	case ELFDATA2MSB:
-		printf("#define KERNEL_ELFDATA ELFDATA2MSB\n");
-		break;
-	default:
-		exit(1);
-	}
-
-	endian_test.s = 0x0102;
-	if (memcmp(endian_test.c, "\x01\x02", 2) == 0)
-		printf("#define HOST_ELFDATA ELFDATA2MSB\n");
-	else if (memcmp(endian_test.c, "\x02\x01", 2) == 0)
-		printf("#define HOST_ELFDATA ELFDATA2LSB\n");
-	else
-		exit(1);
 
 	return 0;
 }
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d16d0ace2775..f492fbeed300 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -50,6 +50,9 @@ static bool error_occurred;
 
 static bool extra_warn;
 
+bool target_is_big_endian;
+bool host_is_big_endian;
+
 /*
  * Cut off the warnings when there are too many. This typically occurs when
  * vmlinux is missing. ('make modules' without building vmlinux.)
@@ -438,6 +441,18 @@ static int parse_elf(struct elf_info *info, const char *filename)
 		/* Not an ELF file - silently ignore it */
 		return 0;
 	}
+
+	switch (hdr->e_ident[EI_DATA]) {
+	case ELFDATA2LSB:
+		target_is_big_endian = false;
+		break;
+	case ELFDATA2MSB:
+		target_is_big_endian = true;
+		break;
+	default:
+		fatal("kernel endian is unknown\n");
+	}
+
 	/* Fix endianness in ELF header */
 	hdr->e_type      = TO_NATIVE(hdr->e_type);
 	hdr->e_machine   = TO_NATIVE(hdr->e_machine);
@@ -2117,6 +2132,25 @@ struct dump_list {
 	const char *file;
 };
 
+static void check_host_endian(void)
+{
+	static const union {
+		short s;
+		char c[2];
+	} endian_test = { .c = {0x01, 0x02} };
+
+	switch (endian_test.s) {
+	case 0x0102:
+		host_is_big_endian = true;
+		break;
+	case 0x0201:
+		host_is_big_endian = false;
+		break;
+	default:
+		fatal("Unknown host endian\n");
+	}
+}
+
 int main(int argc, char **argv)
 {
 	struct module *mod;
@@ -2181,6 +2215,8 @@ int main(int argc, char **argv)
 		}
 	}
 
+	check_host_endian();
+
 	list_for_each_entry_safe(dl, dl2, &dump_lists, list) {
 		read_dump(dl->file);
 		list_del(&dl->list);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 58197b34a3c8..54ba9431713f 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -62,15 +62,8 @@
 		    x); \
 })
 
-#if KERNEL_ELFDATA != HOST_ELFDATA
-
-#define TO_NATIVE(x) (bswap(x))
-
-#else /* endianness matches */
-
-#define TO_NATIVE(x) (x)
-
-#endif
+#define TO_NATIVE(x)	\
+	(target_is_big_endian == host_is_big_endian ? x : bswap(x))
 
 #define NOFAIL(ptr)   do_nofail((ptr), #ptr)
 
@@ -187,6 +180,8 @@ void add_moddevtable(struct buffer *buf, struct module *mod);
 void get_src_version(const char *modname, char sum[], unsigned sumlen);
 
 /* from modpost.c */
+extern bool target_is_big_endian;
+extern bool host_is_big_endian;
 char *read_text_file(const char *filename);
 char *get_line(char **stringp);
 void *sym_get_data(const struct elf_info *info, const Elf_Sym *sym);
-- 
2.43.0


