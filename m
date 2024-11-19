Return-Path: <linux-kbuild+bounces-4744-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E981F9D3133
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A892E283F85
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312A11DAC9B;
	Tue, 19 Nov 2024 23:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGZqCVfo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082371D4176;
	Tue, 19 Nov 2024 23:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060649; cv=none; b=DUkDDE3Diq2OptOl/PO2hcXfPF1kgH9sscxW68QEpy+H2fceXki+bBYSiCr6RCey5718m5+/D1sxvLReZ7DAxhYe1dJ3uZ7UY6VQssnCWTpyNN/yBXmSm3V3G8WYu/KGZlzo1KyurOJaWozeXiV3o6pelpQPbWAU8iQEgq8DYro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060649; c=relaxed/simple;
	bh=vKE5pwuQ35hn8BTD0L6kSiF6LH1K9KrbOolsQUxhzBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/hrAys8T+fnlqC+SYF5yGh91Z3tzXi/cP1k7gLItMhp5Twqrkl2A2EOwEUIf6t7ArBLGn0mo52qOZ8ERY6UDC0/XM0dNh0MGojnO8Qz3Uh0RL3672GVzJiIdA2uettUKxZMSUj7pc2nLUI98BmmxRblqO5OsMCAHjvnS1yHIDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGZqCVfo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C391DC4CED1;
	Tue, 19 Nov 2024 23:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060648;
	bh=vKE5pwuQ35hn8BTD0L6kSiF6LH1K9KrbOolsQUxhzBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MGZqCVfof1rdoRT8azbuNePvhFUzxAOOp+yPjiMmBHMMaj21p+NIY4QFXMH+CbeXE
	 P/+te6Xbq5QQxluIcotaQ81owpZGbizbyZv5lomfgXCsuAWObfDUJYvi8ySSbf07OR
	 fSXg5LASwKxB/M/XZy91Om5nL53RIvqprqzzG+BMCQYOvp/ZIR9YOuRn5CFfL8P2eC
	 Tuz2tlLI4kIlo3GSdvJcn9+tG3JFtUyhLT0EnSSxbiiruCZlW3Rh/nsi4RCZQioqQq
	 PII46Pav9chsKKgL2PHWp61y2BJbStsbDHhHRSm8c98XQ9ctuxzhzsbGS1ldJis8JU
	 nai9ms7QhB6tA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/15] modpost: move strstarts() to modpost.h
Date: Wed, 20 Nov 2024 08:56:50 +0900
Message-ID: <20241119235705.1576946-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119235705.1576946-1-masahiroy@kernel.org>
References: <20241119235705.1576946-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This macro is useful in file2alias.c as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 2 +-
 scripts/mod/modpost.c    | 2 --
 scripts/mod/modpost.h    | 2 ++
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index b2d5e6451959..01a4b0eaca6d 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1513,7 +1513,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 		return;
 
 	/* All our symbols are of form __mod_<name>__<identifier>_device_table. */
-	if (strncmp(symname, "__mod_", strlen("__mod_")))
+	if (!strstarts(symname, "__mod_"))
 		return;
 	name = symname + strlen("__mod_");
 	namelen = strlen(name);
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 1948d69ce2b9..3bbd5efcf3f3 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -341,8 +341,6 @@ static const char *sec_name(const struct elf_info *info, unsigned int secindex)
 	return sech_name(info, &info->sechdrs[secindex]);
 }
 
-#define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
-
 static struct symbol *sym_add_exported(const char *name, struct module *mod,
 				       bool gpl_only, const char *namespace)
 {
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 52efe0026b34..49848fcbe2a1 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -67,6 +67,8 @@
 
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 
+#define strstarts(str, prefix) (strncmp(str, prefix, strlen(prefix)) == 0)
+
 struct buffer {
 	char *p;
 	int pos;
-- 
2.43.0


