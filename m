Return-Path: <linux-kbuild+bounces-2560-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A477B933531
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 03:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BB711F23254
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 01:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE3B184F;
	Wed, 17 Jul 2024 01:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SdAwUwqg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD0EC5
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jul 2024 01:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721181066; cv=none; b=ILbocA9Ln7DsIu9CRjflN6P3c491v9Ec7PEiO+A0tiNA23HEsYs9fKGr4oS3WXF8Ajb92uWCSqQepaOZtVCsT9UVxC2B0hmgTztx/NRhSXlFrzxslODby8Bhy0/rYk5TIjvLDqD94axxfyoyTUXzdN4D31HOGxOR+KID0ZeN25w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721181066; c=relaxed/simple;
	bh=eObwt/zi3Kr95XXc60X23X6dODaeDbiMIQnVNj03/Yg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ktKzBSU5alVZwste01HiIUweu+KgEtK0H6lPRyNByn+O/qRpSb5hnYbik3n1gcJuskB4QvhnBndycvPq40ysSdde3eewf8vppEXaC22e567rXGE9y62qyRB1U8+7SbxBG7ZcDJnT7nOziWh2cZ5mjtsu8mtzhBn2omUNJ+ygZZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SdAwUwqg; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfa7a8147c3so11687229276.3
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jul 2024 18:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721181063; x=1721785863; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3aCBBWFffWvGxNelxYi8javtM+9l3qfCXyadBBSBs4=;
        b=SdAwUwqgyDPlE7QMkcIQKEYgC6Y6OeAE33tChgc2Iu5X5mSt5apYmQYYOoQjrghtNA
         o0AI8XRrcTPSHCaE+l5zRYbUtMnRtjdVcmX8Ry39m8zBdaANQ95JgUJ5FuvJgLm94yUN
         rWfjhsRkYnHZhqpXhIsvV0ZhO5WK5oHmBj67ainGO05D9Y9zwTFTOyu1TT4EH9IHXcKp
         nG7FzylsZwfOlwGx8nPaaLSr1QkGu6T7VaJvnyPoJFNt7ZuJqo5WvI5JpLPYjG8kOq5U
         YNjYeW+arKQhPRlKtE0Nka13DyY/tdXpBUwj9V4F+cy4dQckrtDSI1CmYlWJ51bgyZHL
         Co5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721181063; x=1721785863;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I3aCBBWFffWvGxNelxYi8javtM+9l3qfCXyadBBSBs4=;
        b=qOMqPCiCNUaUQBu8FNDbljwjmFf+AydL03cGvl15p/PJMJdz0chsL+3xBBgiRDFkAu
         b+OsoNkyRiYlnFGaRAACddCNQYnn087SS3laGwcez10e1wZsFNgaK2ZVlOOEUfZaBdRz
         DRWIXNlovD3AwIClCkf8D8TTp3+DcyCRBC30EjTtgnXqLyhsHOWeiTla36cI9zSaJ023
         Mm0EjqauRNmnqQyjsm0M1eFTnFCV1sjpZvkmsJPJ1rhnOFYW0fazxSA15tQifNwV6IP1
         8OLtPssNngHg8w6Zi1gkvvOWnl+UcurF61oMzParMCsfttLgWJ6QIeuq9qXvqduu6W4i
         jCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2OPX91DSJnLKBZ0vdamvFy21qG/aeDfjirfWU92QiOqsuY7yIMLrh60eXEJ5mwCkBXv2RbI8t5WnBeJDVCpOqP/UL2OrLif2pjbsF
X-Gm-Message-State: AOJu0Yyt/rCzbqkCn3eJKXG/MTk1lBQm1k4ke+mZ1elllSrfZu0CkYTD
	26rvGEQ71Q1k5cNyscEO87OikLnCz9Ma24HuFZUStlLwSQfJXhSsbRl53TkF0KiKoPbL3Q==
X-Google-Smtp-Source: AGHT+IGJ2ob/5Gax9awARwZ+djoFJgzGUxbI73foCKISaOUPZsRwo46wiPy3gnhiNooAz+efVWeKkdXS
X-Received: from elsk.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:dbd])
 (user=elsk job=sendgmr) by 2002:a05:6902:2503:b0:dfb:22ca:1efd with SMTP id
 3f1490d57ef6-e05ed77deddmr1030276.9.1721181063541; Tue, 16 Jul 2024 18:51:03
 -0700 (PDT)
Date: Wed, 17 Jul 2024 01:50:41 +0000
In-Reply-To: <CAK7LNAR_=AWh1aE4iev1xtcfTAAHNOhwq3gF+h6DFzz9x39qPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAK7LNAR_=AWh1aE4iev1xtcfTAAHNOhwq3gF+h6DFzz9x39qPw@mail.gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240717015042.339931-1-elsk@google.com>
Subject: [PATCH v4] kconfig: recursive checks drop file/lineno
From: HONG Yifan <elsk@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: HONG Yifan <elsk@google.com>, kernel-team@android.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This prevents segfault when getting filename and lineno in recursive
checks.

If the following snippet is found in Kconfig:

[Test code 1]

config FOO
        bool
        depends on BAR
        select BAR

... without BAR defined; then there is a segfault.

  Kconfig:34:error: recursive dependency detected!
  Kconfig:34:	symbol FOO depends on BAR
  make[4]: *** [scripts/kconfig/Makefile:85: allnoconfig] Segmentation fault

This is because of the following. BAR is a fake entry created by
sym_lookup() with prop being NULL. In the recursive check, there is a
NULL check for prop to fall back to stack->sym->prop if stack->prop is
NULL. However, in this case, stack->sym points to the fake BAR entry
created by sym_lookup(), so prop is still NULL. prop was then referenced
without additional NULL checks, causing segfault.

As the previous email thread suggests, the file and lineno for select is
also wrong:

[Test code 2]

config FOO
       bool

config BAR
       bool

config FOO
       bool "FOO"
       depends on BAR
       select BAR

  $ make defconfig
  *** Default configuration is based on 'x86_64_defconfig'
  Kconfig:1:error: recursive dependency detected!
  Kconfig:1: symbol FOO depends on BAR
  Kconfig:4: symbol BAR is selected by FOO
  [...]

Kconfig:4 should be Kconfig:10.

This patch deletes the wrong and segfault-prone filename/lineno
inference completely. With this patch, Test code 1 yields:

error: recursive dependency detected!
	symbol FOO depends on BAR
	symbol BAR is selected by FOO

Link: https://lore.kernel.org/linux-kbuild/20240627231919.2461945-1-elsk@google.com/T/
Link: https://lore.kernel.org/linux-kbuild/20240620211112.500465-1-elsk@google.com/
Link: https://lore.kernel.org/linux-kbuild/20240618185609.4096399-1-elsk@google.com/
Signed-off-by: HONG Yifan <elsk@google.com>

--
v4: Rebased & addressed comments from masahiroy@kernel.org. Simplify
    code by dropping `prop` variable.
v3: Rebase on top of
    https://lore.kernel.org/linux-kbuild/20240626182212.3758235-1-masahiroy@kernel.org/T/#t
    & resolve merge conflicts. Fix
    scripts/kconfig/tests/err_recursive_dep/expected_stderr
v2: Delete all filenames/lineno completely as suggested by
    masahiroy@kernel.org
---
 scripts/kconfig/symbol.c                      | 42 ++++++-------------
 .../tests/err_recursive_dep/expected_stderr   | 36 ++++++++--------
 2 files changed, 30 insertions(+), 48 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 6c6f238c4f7b..71502abd3b12 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1074,10 +1074,9 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 {
 	struct dep_stack *stack;
 	struct symbol *sym, *next_sym;
-	struct menu *menu = NULL;
 	struct menu *choice;
-	struct property *prop;
 	struct dep_stack cv_stack;
+	enum prop_type type;
 
 	choice = sym_get_choice_menu(last_sym);
 	if (choice) {
@@ -1096,53 +1095,36 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 	for (; stack; stack = stack->next) {
 		sym = stack->sym;
 		next_sym = stack->next ? stack->next->sym : last_sym;
-		prop = stack->prop;
-		if (prop == NULL)
-			prop = stack->sym->prop;
-
-		/* for choice values find the menu entry (used below) */
-		if (sym_is_choice(sym) || sym_is_choice_value(sym)) {
-			for (prop = sym->prop; prop; prop = prop->next) {
-				menu = prop->menu;
-				if (prop->menu)
-					break;
-			}
-		}
+		type = stack->prop ? stack->prop->type : P_UNKNOWN;
+
 		if (stack->sym == last_sym)
-			fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
-				prop->filename, prop->lineno);
+			fprintf(stderr, "error: recursive dependency detected!\n");
 
 		if (sym_is_choice(next_sym)) {
 			choice = list_first_entry(&next_sym->menus, struct menu, link);
 
-			fprintf(stderr, "%s:%d:\tsymbol %s is part of choice block at %s:%d\n",
-				menu->filename, menu->lineno,
+			fprintf(stderr, "\tsymbol %s is part of choice block at %s:%d\n",
 				sym->name ? sym->name : "<choice>",
 				choice->filename, choice->lineno);
 		} else if (stack->expr == &sym->dir_dep.expr) {
-			fprintf(stderr, "%s:%d:\tsymbol %s depends on %s\n",
-				prop->filename, prop->lineno,
+			fprintf(stderr, "\tsymbol %s depends on %s\n",
 				sym->name ? sym->name : "<choice>",
 				next_sym->name);
 		} else if (stack->expr == &sym->rev_dep.expr) {
-			fprintf(stderr, "%s:%d:\tsymbol %s is selected by %s\n",
-				prop->filename, prop->lineno,
+			fprintf(stderr, "\tsymbol %s is selected by %s\n",
 				sym->name, next_sym->name);
 		} else if (stack->expr == &sym->implied.expr) {
-			fprintf(stderr, "%s:%d:\tsymbol %s is implied by %s\n",
-				prop->filename, prop->lineno,
+			fprintf(stderr, "\tsymbol %s is implied by %s\n",
 				sym->name, next_sym->name);
 		} else if (stack->expr) {
-			fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
-				prop->filename, prop->lineno,
+			fprintf(stderr, "\tsymbol %s %s value contains %s\n",
 				sym->name ? sym->name : "<choice>",
-				prop_get_type_name(prop->type),
+				prop_get_type_name(type),
 				next_sym->name);
 		} else {
-			fprintf(stderr, "%s:%d:\tsymbol %s %s is visible depending on %s\n",
-				prop->filename, prop->lineno,
+			fprintf(stderr, "\tsymbol %s %s is visible depending on %s\n",
 				sym->name ? sym->name : "<choice>",
-				prop_get_type_name(prop->type),
+				prop_get_type_name(type),
 				next_sym->name);
 		}
 	}
diff --git a/scripts/kconfig/tests/err_recursive_dep/expected_stderr b/scripts/kconfig/tests/err_recursive_dep/expected_stderr
index 05d4ced70320..fc2e860af082 100644
--- a/scripts/kconfig/tests/err_recursive_dep/expected_stderr
+++ b/scripts/kconfig/tests/err_recursive_dep/expected_stderr
@@ -1,38 +1,38 @@
-Kconfig:5:error: recursive dependency detected!
-Kconfig:5:	symbol A depends on A
+error: recursive dependency detected!
+	symbol A depends on A
 For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:11:error: recursive dependency detected!
-Kconfig:11:	symbol B is selected by B
+error: recursive dependency detected!
+	symbol B is selected by B
 For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:17:error: recursive dependency detected!
-Kconfig:17:	symbol C1 depends on C2
-Kconfig:21:	symbol C2 depends on C1
+error: recursive dependency detected!
+	symbol C1 depends on C2
+	symbol C2 depends on C1
 For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:27:error: recursive dependency detected!
-Kconfig:27:	symbol D1 depends on D2
-Kconfig:32:	symbol D2 is selected by D1
+error: recursive dependency detected!
+	symbol D1 depends on D2
+	symbol D2 is selected by D1
 For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:37:error: recursive dependency detected!
-Kconfig:37:	symbol E1 depends on E2
-Kconfig:42:	symbol E2 is implied by E1
+error: recursive dependency detected!
+	symbol E1 depends on E2
+	symbol E2 is implied by E1
 For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:49:error: recursive dependency detected!
-Kconfig:49:	symbol F1 default value contains F2
-Kconfig:51:	symbol F2 depends on F1
+error: recursive dependency detected!
+	symbol F1 default value contains F2
+	symbol F2 depends on F1
 For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
 
-Kconfig:60:error: recursive dependency detected!
-Kconfig:60:	symbol G depends on G
+error: recursive dependency detected!
+	symbol G depends on G
 For a resolution refer to Documentation/kbuild/kconfig-language.rst
 subsection "Kconfig recursive dependency limitations"
-- 
2.45.2.993.g49e7a77208-goog


