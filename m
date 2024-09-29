Return-Path: <linux-kbuild+bounces-3829-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D307989699
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Sep 2024 19:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C38BF283E42
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Sep 2024 17:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A533B3BBD8;
	Sun, 29 Sep 2024 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVEyyu7k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B17B3BB21;
	Sun, 29 Sep 2024 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727631189; cv=none; b=IGH2TQA0OUUzvnsCp0yo+ZpkbpF3JLo+KTR0+l4SxlFnvt2fgVejD0YMmOph5kVaK22DlJ3O4BX5rTgQlpgbWqjP1aBq0nBa1J1iYwaIRXAUO5nUhYGqtAKP39/R0EVF00Ddxt47TeA1q/5gOiI0ay9nRBEU/39OusyFOcDDZlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727631189; c=relaxed/simple;
	bh=O5v5k+Gc3q1ZoQUuGzDLkB9PDIzH1nVUyxFhHXjdD9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnhQDi5oh8YDraeAy8izC31idGScOpZvckHugwz7Vgn4FO7S4bJdjE5ThD5HeQTseusHUpEkpSqZE6BdMw8gXHZB1EaXADRR9vuKEyL4I1WAaeAelW98fiCELdKVPtQXSKbieQsHN5/LfN8BlY+gpam3GmzpmYvnb63Ed+UnwMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVEyyu7k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE1DC4CEC5;
	Sun, 29 Sep 2024 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727631189;
	bh=O5v5k+Gc3q1ZoQUuGzDLkB9PDIzH1nVUyxFhHXjdD9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TVEyyu7kiyZ/VBq7Kp91r4UQjeBAjE14q0YnXgaEvkZzM071F5EC5almNgBzzCBZt
	 8C0kYqypkdXKgOG/MTYlQihINwSo2guIWeNarDmgCoPJNQTgrU2WN2b69rz6v5GyDk
	 RUvt4FdmnVtddQ0KRb+NZYhI6jiVLP0y2zDVd5Vie+cIXjGeSx+Btn5RcSLtTXOA7e
	 UR6yCWKl1J4PTbvGJAw6lCFCPk4QRbZZQdvd5ZGZMMmC+E2kmA5KSWw0xsa463gSJG
	 2nmri+/2mzLkHEcoDXjyD4kdKjPbCmCP3dsaW3+PWw46RHxLaz0ZvVYdWl6X02q1kc
	 DS7H3V6wMfZHQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] kconfig: remove support for "bool" prompt for choice entries
Date: Mon, 30 Sep 2024 02:32:37 +0900
Message-ID: <20240929173302.203827-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929173302.203827-1-masahiroy@kernel.org>
References: <20240929173302.203827-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit fde192511bdb ("kconfig: remove tristate choice support"),
all choice blocks are now boolean. There is no longer a need to specify
the choice type explicitly.

All "bool" prompts in choice entries have been converted to "prompt".

This commit removes support for the "bool" syntax in choice entries.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst | 4 ++--
 scripts/kconfig/parser.y                  | 6 ------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 43037be96a16..2619fdf56e68 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -412,8 +412,8 @@ choices::
 	<choice block>
 	"endchoice"
 
-This defines a choice group and accepts any of the above attributes as
-options.
+This defines a choice group and accepts "prompt", "default", "depends on", and
+"help" attributes as options.
 
 A choice only allows a single config entry to be selected.
 
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 1ad60f9e164e..4b9eaee20eaf 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -287,12 +287,6 @@ choice_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", cur_filename, cur_lineno);
 };
 
-choice_option: T_BOOL T_WORD_QUOTE if_expr T_EOL
-{
-	menu_add_prompt(P_PROMPT, $2, $3);
-	printd(DEBUG_PARSE, "%s:%d:bool\n", cur_filename, cur_lineno);
-};
-
 choice_option: T_DEFAULT nonconst_symbol if_expr T_EOL
 {
 	menu_add_symbol(P_DEFAULT, $2, $3);
-- 
2.43.0


