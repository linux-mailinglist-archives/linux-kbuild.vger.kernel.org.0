Return-Path: <linux-kbuild+bounces-2276-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC8091B29D
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 01:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719F9285125
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 23:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218331A2C2D;
	Thu, 27 Jun 2024 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JOoAfhvh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE841A2C27
	for <linux-kbuild@vger.kernel.org>; Thu, 27 Jun 2024 23:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719530364; cv=none; b=uxMi37VcCwj4xBK6TwcfHV6BBuqhYUG04brtSRCR48qvVljzmAtdDqx8zxrl8IwtHiLqXXLBFEG8K1RhR0VwaIhEmbdzebonq3x63NZd2rayPt/brIaCQqowsJFLmIzQWwdVcMbgRa6ejIT7a95Alb/fpHFYgW88GVL4JVtHsoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719530364; c=relaxed/simple;
	bh=DrCqKiL/pCMihlN46mvRvR8EclvzSD4pZGIIsWvU/0I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rgF4TEcjKOdJo9MmERuLAiqz7gHpDRoAQf9aVKUooyVonLdVU/W0hhm+6NzHCKsNqeQ/gx7BGTCS8LnG/OU312dOPZf4r/cnly2D3+WmhE53c9O3yqhOiXCzxcYv39kelhaRQDbB9gCExuwTjRCjLpXYZLIjd85ZkRXfqtt2nMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JOoAfhvh; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0322e5d0daso125909276.0
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Jun 2024 16:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719530361; x=1720135161; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lbeqboMNXPvpri+31lcbyxGvW1jhsLnKPupd3d+M1PU=;
        b=JOoAfhvhAzH3XsUMbZKccTzpgflGskGhayhrPKY/h5dbGyIj8i8B28XuCJ0HEpeLJe
         aROHzmluAUF5sJajpdZlPBXTTeqotKQ5+7jsMTgndTw2Bcoj4ALn8bUmCH8IKs+8kVWB
         GWvJXsspuPe/NIQQFdWKBZBYsk6m0Zvdc2VSxeGPRYb3boRSfgWO5Wjpf9rnQXK7yOUk
         pWebxjewMvRQ4YEeykJRXySpFjQcPCKUfvZEMwhXz+/G9rHVeBfcLBs6o9E2s50o1OSf
         o0i6IiH6pi56CsOiB7VAxaJYXblhPKsbAcpuLGgFqmSp0UQF8cz7iS+9Ajz35IbU+pqq
         sc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719530361; x=1720135161;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lbeqboMNXPvpri+31lcbyxGvW1jhsLnKPupd3d+M1PU=;
        b=l3iy1mPAAyT2U8dAIXDzCpZYg8APc0BgrWwNmiFuNJzQGGCwRwDSpDqzljl0PIPmSc
         G8RCBU8bWx32IuszeboUYZMD+3MFZvTUDrjb4wWw1krvriGq7t5SVIXtpGqJrOMuFoky
         JVxlECjl27HmjnqCXExl8j6aGosI8vTIdVr0zTAgYDLWVvo9rzjiol6qLZ91fy5Fq5Ie
         b+NO8dyqYXfdcosPc/CHRjC3NgcmvCxxgqcTpHe8jtADOV3PzNb1fnny5rtjgYsiWduS
         KYt8jdaWXAxJ+qtlX7ozwBg5Xv5EpAFNKTbVYzIA2xtKaDs1OOROvCj5M7H9ZX9hDfLM
         loJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOIFHC36ubCxFdfz2YLjBUAwVhwHswtvm3wV26SW8Noj0xLYJKI3t+ly9lwbeW0j5VY3wa336cuRrcEBFMfhHe9rparCC2rQ4GFmsH
X-Gm-Message-State: AOJu0YxFchnp7xDQ10TXWWI27lyN5lLjHpKsl7tUwr6vJC5gdrXFMY1P
	ezq2SLQ3VYcRFo4XYyMd/E6TwebSkyfLGDE/ouBBc57tP0/RSpIZkXl9jL1m01vDN9G9xw==
X-Google-Smtp-Source: AGHT+IFsOjo+uPSs9HOn7YkmxKzwpRo9G4W7RfOuhhYZWC95tEB560alN/cX4ONJq1ishV2MNcawnZEv
X-Received: from elsk.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:dbd])
 (user=elsk job=sendgmr) by 2002:a25:51c1:0:b0:e03:5148:9f02 with SMTP id
 3f1490d57ef6-e035bff4fe7mr22276.3.1719530361457; Thu, 27 Jun 2024 16:19:21
 -0700 (PDT)
Date: Thu, 27 Jun 2024 23:19:18 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240627231919.2461945-1-elsk@google.com>
Subject: [PATCH v3] kconfig: recursive checks drop file/lineno
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

... without BAR defined; then if one runs `make tinyconfig`, there is a
segfault.

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

Link: https://lore.kernel.org/linux-kbuild/20240620211112.500465-1-elsk@google.com/
Signed-off-by: HONG Yifan <elsk@google.com>

--
v3: Rebase on top of
    https://lore.kernel.org/linux-kbuild/20240626182212.3758235-1-masahiroy@kernel.org/T/#t
    & resolve merge conflicts. Fix
    scripts/kconfig/tests/err_recursive_dep/expected_stderr
v2: Delete all filenames/lineno completely as suggested by
    masahiroy@kernel.org
---
 scripts/kconfig/symbol.c                      | 40 +++++++------------
 .../tests/err_recursive_dep/expected_stderr   | 36 ++++++++---------
 2 files changed, 33 insertions(+), 43 deletions(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index c05d188a1857..e22c8769f44f 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1068,10 +1068,10 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 {
 	struct dep_stack *stack;
 	struct symbol *sym, *next_sym;
-	struct menu *menu = NULL;
 	struct menu *choice;
 	struct property *prop;
 	struct dep_stack cv_stack;
+	enum prop_type type;
 
 	choice = sym_get_choice_menu(last_sym);
 	if (choice) {
@@ -1094,49 +1094,39 @@ static void sym_check_print_recursive(struct symbol *last_sym)
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
2.45.2.803.g4e1b14247a-goog


