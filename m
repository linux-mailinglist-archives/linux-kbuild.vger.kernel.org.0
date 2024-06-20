Return-Path: <linux-kbuild+bounces-2231-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22E91141C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 23:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A40CA1C20D1C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 21:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6200B7581F;
	Thu, 20 Jun 2024 21:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZGr2uNtv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96153A1CD
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Jun 2024 21:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718917908; cv=none; b=cjd7woCp3XB7vr/QErdufXXubn+X8UXB0AchAHZ2JMbdjXPEoh1RefO59sKjfvQraf/6crZZz19OsIKtU2uGgU9OuLCfXl5bJOzzdYNQQTlMigGlCZazH4thFL6GqG4r2i5IaHSUqGTPe2r/0SshwBQfRmxfOeiL5du7GOegp2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718917908; c=relaxed/simple;
	bh=GA91huQdLUbSlkWk8Tpei6PdXlKNw2ETyVPB0qR2BUU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ij7Gut3DNbwEoF3mQVhMg1SQaEKmDCqDI1dQaEqWtnIhmg4Bi7Y8yVMsJg541BL4Ql4oV0KjMtXFjZxu4XTlpffE73HPo4zcLKXpIweSuycX5k9bdaacMz1xJ5bQ9hixT1kD2UeHixQb+mt7XhvbwtassSkv19wNllu2haPOHzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZGr2uNtv; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfdfe3d9fc8so2247755276.3
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Jun 2024 14:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718917906; x=1719522706; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IQuwu/NTPlbRKO6mQ54PUmCU1PjMj/T5kuRqII4usxg=;
        b=ZGr2uNtvmYfe9AOJI84J1ia/Sh+kP6Hh6luEJWg+vBpmguPCvJL4kWDpRxBkocYcuP
         lTlsRJCmusmePhyLpTv7LDdbhDw2p2m+mKQ++bLNXVXvm1kc4nBTqpB1K7w32AbnGucz
         O5mFUj08IuBbakJVXYCN+abHDvqhiEbDlnt5qqec2RpAyc6oi+c/Sx9kXMfo0a9DUOkJ
         XK/kj4W7GKNf0ijOaSsQ13zDfvUnGUREfWl+06RJSQXVxpRnrFnA/JJz1LNtKRDcI7ud
         NhAgAhk3bYswooGR1XdSudvkY0Efr7kRMVj2veThg2NyQgU6cv6PXlZ1dupsB2vXNBVa
         VmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718917906; x=1719522706;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQuwu/NTPlbRKO6mQ54PUmCU1PjMj/T5kuRqII4usxg=;
        b=XiQYyLst5kCw3rXiivyNzmOKUsuhQ4zO58rY6InKkzphMIxgWoCZNZs621gwFwBiUr
         cDY/jHMAYI4JVbR/1kpBXSRlQcwzDZ65khTqvYaaJNuJQ5cXSx81B5qV7HPpTv8GNzkX
         SCzaiiYLFkepPpBrnVF2w+YmA5Spyw5lpWbHfSyGzh9K/f4UrXBCVxGv7+d7Pa1KoMqB
         djjn+H90ehuHFB5yMJggUL9waeimntVHQa+I4gbgqN6MMV2uEdlGljVZWmHolExl4kxX
         NfWO/mTrN/xhEH4xNMQCqZxjtt7XM4/UlBj146hLJwcm7a47bP+1ovNIkm28Qx6d62pP
         TKGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlJ4BXr15rRGPMbx5Qrg1U32dB4ycKAQ1evHfOCsbj8wltSOdVYau1O7XkzTd0n909VTZu8rtRt1kO7a4zWEzizBomtyzTpRGgGhJc
X-Gm-Message-State: AOJu0YwsmgKfCIEv7nJe1PfJuD+em3mrN0eJESLJ9GHbX4LrGf9bHCpu
	R+e3mJvABNsJzxZ68z3+IPaqlga0NJOvzPRotZQ7hAj9gi+LfAJ67tJ2PED7V8iirfjVpQ==
X-Google-Smtp-Source: AGHT+IHc/3f9XoezpLQgMIYpssJemzPAUQJu+86hEHhv1C0NFnpvXJwK87sdofroR3vo7JN/LbpZqICj
X-Received: from elsk.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:dbd])
 (user=elsk job=sendgmr) by 2002:a05:6902:1006:b0:dfe:1633:89e9 with SMTP id
 3f1490d57ef6-e02be16c56dmr1760259276.1.1718917905788; Thu, 20 Jun 2024
 14:11:45 -0700 (PDT)
Date: Thu, 20 Jun 2024 21:11:12 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240620211112.500465-1-elsk@google.com>
Subject: [PATCH v2] kconfig: recursive checks drop file/lineno
From: HONG Yifan <elsk@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: HONG Yifan <elsk@google.com>, kernel-team@android.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This prevents segfault when getting filename
and lineno in recursive checks.

If the following snippet is found in Kconfig:

[Test code 1]

config FOO
       tristate
       depends on BAR
       select BAR
       help
         foo

... without BAR defined; then if one runs
`make tinyconfig`, there is a segfault.

  Kconfig:34:error: recursive dependency detected!
  Kconfig:34:	symbol FOO depends on BAR
  make[4]: *** [scripts/kconfig/Makefile:85: allnoconfig] Segmentation fault

This is because of the following. BAR is
a fake entry created by sym_lookup() with prop
being NULL. In the recursive check, there is a
NULL check for prop to fall back to
stack->sym->prop if stack->prop is NULL. However,
in this case, stack->sym points to the fake BAR
entry created by sym_lookup(), so prop is still
NULL. prop was then referenced without additional
NULL checks, causing segfault.

As the previous email thread suggests, the file
and lineno for select is also wrong:

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

This patch deletes the wrong and segfault-prone
filename/lineno inference completely. With this
patch, Test code 1 yields:

error: recursive dependency detected!
	symbol FOO depends on BAR
	symbol BAR is selected by FOO

Link: https://lore.kernel.org/linux-kbuild/20240618185609.4096399-1-elsk@google.com/
Signed-off-by: HONG Yifan <elsk@google.com>

--
v2: Delete all filenames/lineno completely as
suggested by masahiroy@kernel.org
---
 scripts/kconfig/symbol.c | 43 +++++++++++++++-------------------------
 1 file changed, 16 insertions(+), 27 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 8df0a75f40b9..3974e46a8533 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1042,9 +1042,9 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 {
 	struct dep_stack *stack;
 	struct symbol *sym, *next_sym;
-	struct menu *menu = NULL;
 	struct property *prop;
 	struct dep_stack cv_stack;
+	enum prop_type type;
 
 	if (sym_is_choice_value(last_sym)) {
 		dep_stack_insert(&cv_stack, last_sym);
@@ -1066,54 +1066,43 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		if (prop == NULL)
 			prop = stack->sym->prop;
 
-		/* for choice values find the menu entry (used below) */
-		if (sym_is_choice(sym) || sym_is_choice_value(sym)) {
-			for (prop = sym->prop; prop; prop = prop->next) {
-				menu = prop->menu;
-				if (prop->menu)
-					break;
-			}
-		}
+		if (prop == NULL)
+			type = P_UNKNOWN;
+		else
+			type = prop->type;
+
 		if (stack->sym == last_sym)
-			fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
-				prop->filename, prop->lineno);
+			fprintf(stderr, "error: recursive dependency detected!\n");
 
 		if (sym_is_choice(sym)) {
-			fprintf(stderr, "%s:%d:\tchoice %s contains symbol %s\n",
-				menu->filename, menu->lineno,
+			fprintf(stderr, "\tchoice %s contains symbol %s\n",
 				sym->name ? sym->name : "<choice>",
 				next_sym->name ? next_sym->name : "<choice>");
 		} else if (sym_is_choice_value(sym)) {
-			fprintf(stderr, "%s:%d:\tsymbol %s is part of choice %s\n",
-				menu->filename, menu->lineno,
+			fprintf(stderr, "\tsymbol %s is part of choice %s\n",
 				sym->name ? sym->name : "<choice>",
 				next_sym->name ? next_sym->name : "<choice>");
 		} else if (stack->expr == &sym->dir_dep.expr) {
-			fprintf(stderr, "%s:%d:\tsymbol %s depends on %s\n",
-				prop->filename, prop->lineno,
+			fprintf(stderr, "\tsymbol %s depends on %s\n",
 				sym->name ? sym->name : "<choice>",
 				next_sym->name ? next_sym->name : "<choice>");
 		} else if (stack->expr == &sym->rev_dep.expr) {
-			fprintf(stderr, "%s:%d:\tsymbol %s is selected by %s\n",
-				prop->filename, prop->lineno,
+			fprintf(stderr, "\tsymbol %s is selected by %s\n",
 				sym->name ? sym->name : "<choice>",
 				next_sym->name ? next_sym->name : "<choice>");
 		} else if (stack->expr == &sym->implied.expr) {
-			fprintf(stderr, "%s:%d:\tsymbol %s is implied by %s\n",
-				prop->filename, prop->lineno,
+			fprintf(stderr, "\tsymbol %s is implied by %s\n",
 				sym->name ? sym->name : "<choice>",
 				next_sym->name ? next_sym->name : "<choice>");
 		} else if (stack->expr) {
-			fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
-				prop->filename, prop->lineno,
+			fprintf(stderr, "\tsymbol %s %s value contains %s\n",
 				sym->name ? sym->name : "<choice>",
-				prop_get_type_name(prop->type),
+				prop_get_type_name(type),
 				next_sym->name ? next_sym->name : "<choice>");
 		} else {
-			fprintf(stderr, "%s:%d:\tsymbol %s %s is visible depending on %s\n",
-				prop->filename, prop->lineno,
+			fprintf(stderr, "\tsymbol %s %s is visible depending on %s\n",
 				sym->name ? sym->name : "<choice>",
-				prop_get_type_name(prop->type),
+				prop_get_type_name(type),
 				next_sym->name ? next_sym->name : "<choice>");
 		}
 	}
-- 
2.45.2.741.gdbec12cfda-goog


