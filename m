Return-Path: <linux-kbuild+bounces-7739-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 346D0AECFA8
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 830B03ACB82
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4F823BCEB;
	Sun, 29 Jun 2025 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcvFFW57"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E593F23B63D;
	Sun, 29 Jun 2025 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222765; cv=none; b=RPZqj1G4oYIhG+XX60LBHItkrkyeZvSqmKM3InjfbQWPCtFzRMI0gUedlpizS9IiEklPoQajajJygUowd49GeFQ4nFBEH+z8zqDZu8sfGhXhju9/xw/979qMRqGGSDoIxrjJxSDVm6DC5p8jVoTkWrDEi4+JiU14gEaQP2dAVNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222765; c=relaxed/simple;
	bh=6qmI+Su7XzuajmCFhroeUQcivTIBTD9Q5REVTanqpXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vjkf2nZE7IL1JFTcViHW5VUH6RI2qXbuSGqT4kMDkK2fVvyTV4EI1amrNERDzasX/EsFsoKNfU8dGjRtxnVIIrwwidbHN37yfSpvpgBtEgL8io1Buac+yB+kzoYJcMNY8WqJYVSLpyWkQ7gJW/cVa7RQaLR1zDRNwBB2ZWOi/Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcvFFW57; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60947C4CEFC;
	Sun, 29 Jun 2025 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751222764;
	bh=6qmI+Su7XzuajmCFhroeUQcivTIBTD9Q5REVTanqpXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tcvFFW57QuRqg7Gi33lGRu/JtXXym49iSKLF4VMjriFGYeQSWB0i2pF88AJkSBNWj
	 EJ9lA3UTYpMIDpZfWXbp7LE34aPFj1skYQnwAmAJOyJ23nocGrxzoTPz1G76D5JHxQ
	 rjCOY1VCD0SGQtFaXI+kUhmeAj6OJe5xv4ubPbu368QFH1A3nGhOXKYpbupPLrdKgG
	 mbxaFrIJsp4O7f+a/VBRY3Qg6XeQohILJRnna7Ci7x9uaqw/00uFCrIbdABASHtXA5
	 ZP+36vqNCgTxS0m6ytW7LSsUZASESa8RQ9YLu3TzrnB8/yQABISVAsHQjYeOQm5EKP
	 lFeEZeRL8mbZg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] kconfig: gconf: rename gconf.glade to gconf.ui
Date: Mon, 30 Jun 2025 03:43:30 +0900
Message-ID: <20250629184554.407497-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629184554.407497-1-masahiroy@kernel.org>
References: <20250629184554.407497-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The next commit will convert this file to GtkBuilder format. Rename
it in advance to reflect the intended format.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/gconf.c                   | 6 +++---
 scripts/kconfig/{gconf.glade => gconf.ui} | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename scripts/kconfig/{gconf.glade => gconf.ui} (100%)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index bc25924a1adf..6cf58fe5bcfe 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1325,11 +1325,11 @@ int main(int ac, char *av[])
 	/* Determine GUI path */
 	env = getenv(SRCTREE);
 	if (env)
-		glade_file = g_strconcat(env, "/scripts/kconfig/gconf.glade", NULL);
+		glade_file = g_strconcat(env, "/scripts/kconfig/gconf.ui", NULL);
 	else if (av[0][0] == '/')
-		glade_file = g_strconcat(av[0], ".glade", NULL);
+		glade_file = g_strconcat(av[0], ".ui", NULL);
 	else
-		glade_file = g_strconcat(g_get_current_dir(), "/", av[0], ".glade", NULL);
+		glade_file = g_strconcat(g_get_current_dir(), "/", av[0], ".ui", NULL);
 
 	/* Conf stuffs */
 	if (ac > 1 && av[1][0] == '-') {
diff --git a/scripts/kconfig/gconf.glade b/scripts/kconfig/gconf.ui
similarity index 100%
rename from scripts/kconfig/gconf.glade
rename to scripts/kconfig/gconf.ui
-- 
2.43.0


