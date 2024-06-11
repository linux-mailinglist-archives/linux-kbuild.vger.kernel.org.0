Return-Path: <linux-kbuild+bounces-2068-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F879042DF
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F1681C23330
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0411B4F5F9;
	Tue, 11 Jun 2024 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJwFIeFU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1102762C9;
	Tue, 11 Jun 2024 17:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128565; cv=none; b=m/tZUe2KHIykmyWV2/eQyiQOXtRKRNsyNiWkbP1lmBI6b0LZ1Ew97wAV4AynsQkHsn1ar6Kt21Mv0mSjEniKXaxywJMzhL4AD96o+sROhnpdXJoD4JlwC61VxIy+CCUXzYAcSzkmMm7Ec30L8y0Zg3Y0tYMx93vg4suQQeKHa4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128565; c=relaxed/simple;
	bh=GdpFQ2McrR/oLioUGmh3pnwOEGIEtoCNFgyLhOS3wZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i7ZsHx7m8Ai6QASVyfW1cV5vvPJ+uMkugucbKrcQrGv2gDadlD5v/TNDADF+8jhFkGyGPHGkCiZsLBl9d6rZJnvkCFp7n4gVY1nv4kKPQzkgnZD5Ymc4kjOI4WxLjjv2YdHbQWCEUqNNn/POoBVcJzZjQ1Jx3wSfvQyIMigQVt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJwFIeFU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB052C2BD10;
	Tue, 11 Jun 2024 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128565;
	bh=GdpFQ2McrR/oLioUGmh3pnwOEGIEtoCNFgyLhOS3wZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gJwFIeFU1wi9wP5Ac6HoVINEy7rT73wDzM0Ig/EV+9dDQxsHi8caPtpkyzuZeBRd1
	 ZOP3oNZnBerwz7L2omev4PkxllCWNrtj93yKFwi5uX7iQwmyvXT69GbEaOdrJPToO4
	 W9cXfRnNDrT9HVFYIqkocek/g7mGPANigbX8rwUhxs2H7pnUygwaz3+vLVQYAxjWrZ
	 ELw2Z59ph8XLm4G7HSZbB6H2IRY/mtr4KLPk5FWMihKoQ/D6gQAXOuw/xIbHbbZwHG
	 3WLAkul6HCr2X51PQJTX34fY01lto3z3zFqDZ5oEK2zYe/kaaRQ6Un534GLXUtv58H
	 +Q3tMKkT1k18A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 04/16] kconfig: remember the current choice while parsing the choice block
Date: Wed, 12 Jun 2024 02:55:13 +0900
Message-ID: <20240611175536.3518179-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611175536.3518179-1-masahiroy@kernel.org>
References: <20240611175536.3518179-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of the boolean flag, it will be more useful to remember the
current choice being parsed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/parser.y | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 8adb2f70121e..20538e1d3788 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -28,9 +28,7 @@ static void zconf_error(const char *err, ...);
 static bool zconf_endtoken(const char *tokenname,
 			   const char *expected_tokenname);
 
-struct menu *current_menu, *current_entry;
-
-static bool inside_choice = false;
+struct menu *current_menu, *current_entry, *current_choice;
 
 %}
 
@@ -147,7 +145,7 @@ config_entry_start: T_CONFIG nonconst_symbol T_EOL
 
 config_stmt: config_entry_start config_option_list
 {
-	if (inside_choice) {
+	if (current_choice) {
 		if (!current_entry->prompt) {
 			fprintf(stderr, "%s:%d: error: choice member must have a prompt\n",
 				current_entry->filename, current_entry->lineno);
@@ -256,12 +254,12 @@ choice_entry: choice choice_option_list
 
 	$$ = menu_add_menu();
 
-	inside_choice = true;
+	current_choice = current_entry;
 };
 
 choice_end: end
 {
-	inside_choice = false;
+	current_choice = NULL;
 
 	if (zconf_endtoken($1, "choice")) {
 		menu_end_menu();
-- 
2.43.0


