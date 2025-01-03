Return-Path: <linux-kbuild+bounces-5327-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E0EA004F3
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 08:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2AE41883D7B
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 07:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6441C8FD7;
	Fri,  3 Jan 2025 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1FTYZ2x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7001C82E2;
	Fri,  3 Jan 2025 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889455; cv=none; b=XU8KJLUAJjllhGK8i506ZZaGAIHkTqAsKjXPs2tCmkxOOtSpsbvRFJZNbm3IExHSspFLjtpTFFmFlmYqgSwOv30Vx6NGAx4wzhZ8PpODMo6lsR1fN8bWEvmtDj788m9NQ2DDE7BAu4UAoXSs5lsIs+c52GfUvOHMjHxR/+9vTQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889455; c=relaxed/simple;
	bh=8d9RnOeLxBAYfLB453OSPY3ovNxvISADOh5P9Ux7SfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pw06yEw3p6SuOyxLPeRXlNy2bu+614BMUQKCltbkl3XRd86w3KTpwhoWMZW+6S1Or/3ff4tjVKNScj3sMWsl6fuwJCqrcoPnjbdYSF+l4eDs51pO7yKj0Wf223qXcerohw4qk6JAU5Ugu08KNRXZP2rmNSfqN4dJeDU6a8dtJlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1FTYZ2x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7762C4CECE;
	Fri,  3 Jan 2025 07:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735889455;
	bh=8d9RnOeLxBAYfLB453OSPY3ovNxvISADOh5P9Ux7SfE=;
	h=From:To:Cc:Subject:Date:From;
	b=G1FTYZ2xqVXzD/lOUPB4bzpuvMR2PBLPmCoBQGI28j4YUIf7rB4dVFYZ0NyySWXF/
	 eli4vpBdGb7p/U5duCuiNdhnjJHHriX7lBIp/+m4VlU2k1mriouKnhHHjv9JTkiN58
	 U7noPwXsR2uLqqeSYBIkVhuhSwhwN6gdKqE9p54z6AnX5luT6WAzoGSl4LbqZSrB+f
	 Q+fTuKk+/bzV6DOeVWtmcTFOoWvO3bwc0ThaWc2SN4gD8SiBfgSxMFtWJqsLWjaD14
	 ahfIBT94ZQVw+wRoOlNX7/FapPuqS8BVZuugdbaKs8y3WajL7kn3c+6P3bBRbu+rZP
	 Ja3qkU7UzixOQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andreas Gruenbacher <agruen@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 1/6] genksyms: fix memory leak when the same symbol is added from source
Date: Fri,  3 Jan 2025 16:30:38 +0900
Message-ID: <20250103073046.2609911-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a symbol that is already registered is added again, __add_symbol()
returns without freeing the symbol definition, making it unreachable.

The following test cases demonstrate different memory leak points.

[Test Case 1]

Forward declaration with exactly the same definition

  $ cat foo.c
  #include <linux/export.h>
  void foo(void);
  void foo(void) {}
  EXPORT_SYMBOL(foo);

[Test Case 2]

Forward declaration with a different definition (e.g. attribute)

  $ cat foo.c
  #include <linux/export.h>
  void foo(void);
  __attribute__((__section__(".ref.text"))) void foo(void) {}
  EXPORT_SYMBOL(foo);

[Test Case 3]

Preserving an overridden symbol (compile with KBUILD_PRESERVE=1)

  $ cat foo.c
  #include <linux/export.h>
  void foo(void);
  void foo(void) { }
  EXPORT_SYMBOL(foo);

  $ cat foo.symref
  override foo void foo ( int )

The memory leaks in Test Case 1 and 2 have existed since the introduction
of genksyms into the kernel tree. [1]

The memory leak in Test Case 3 was introduced by commit 5dae9a550a74
("genksyms: allow to ignore symbol checksum changes").

When multiple init_declarators are reduced to an init_declarator_list,
the decl_spec must be duplicated. Otherwise, the following Test Case 4
would result in a double-free bug.

[Test Case 4]

  $ cat foo.c
  #include <linux/export.h>

  extern int foo, bar;

  int foo, bar;
  EXPORT_SYMBOL(foo);

In this case, 'foo' and 'bar' share the same decl_spec, 'int'. It must
be unshared before being passed to add_symbol().

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=46bd1da672d66ccd8a639d3c1f8a166048cca608

Fixes: 5dae9a550a74 ("genksyms: allow to ignore symbol checksum changes")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/genksyms.c |  3 +++
 scripts/genksyms/parse.y    | 14 ++++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 07f9b8cfb233..8ca46f807b57 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -239,6 +239,7 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 						"unchanged\n");
 				}
 				sym->is_declared = 1;
+				free_list(defn, NULL);
 				return sym;
 			} else if (!sym->is_declared) {
 				if (sym->is_override && flag_preserve) {
@@ -247,6 +248,7 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 					print_type_name(type, name);
 					fprintf(stderr, " modversion change\n");
 					sym->is_declared = 1;
+					free_list(defn, NULL);
 					return sym;
 				} else {
 					status = is_unknown_symbol(sym) ?
@@ -254,6 +256,7 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 				}
 			} else {
 				error_with_pos("redefinition of %s", name);
+				free_list(defn, NULL);
 				return sym;
 			}
 			break;
diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 8e9b5e69e8f0..840371d01bf4 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -152,14 +152,19 @@ simple_declaration:
 	;
 
 init_declarator_list_opt:
-	/* empty */				{ $$ = NULL; }
-	| init_declarator_list
+	/* empty */			{ $$ = NULL; }
+	| init_declarator_list		{ free_list(decl_spec, NULL); $$ = $1; }
 	;
 
 init_declarator_list:
 	init_declarator
 		{ struct string_list *decl = *$1;
 		  *$1 = NULL;
+
+		  /* avoid sharing among multiple init_declarators */
+		  if (decl_spec)
+		    decl_spec = copy_list_range(decl_spec, NULL);
+
 		  add_symbol(current_name,
 			     is_typedef ? SYM_TYPEDEF : SYM_NORMAL, decl, is_extern);
 		  current_name = NULL;
@@ -170,6 +175,11 @@ init_declarator_list:
 		  *$3 = NULL;
 		  free_list(*$2, NULL);
 		  *$2 = decl_spec;
+
+		  /* avoid sharing among multiple init_declarators */
+		  if (decl_spec)
+		    decl_spec = copy_list_range(decl_spec, NULL);
+
 		  add_symbol(current_name,
 			     is_typedef ? SYM_TYPEDEF : SYM_NORMAL, decl, is_extern);
 		  current_name = NULL;
-- 
2.43.0


