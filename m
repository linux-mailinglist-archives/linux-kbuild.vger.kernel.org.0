Return-Path: <linux-kbuild+bounces-4295-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D359E9AD3E7
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DED31C225A3
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE7C1FDFBD;
	Wed, 23 Oct 2024 18:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nv2htbso"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F971FDFA8;
	Wed, 23 Oct 2024 18:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707522; cv=none; b=Xdf7darvw2KCTMGp+KYd7/1LRiMkfUSmUXh58wKXAp3GR1HIzxdMYGjGV9G7OvlGMOe6EzPAWzGNX5OUeeW/MD8klXOzGA+1zrXeJuPV1edRqi9fsq2JqdqnETGaXqbmEqhNj51U2X0xHMlTGd/UsttoMsfpWjiwf2NQEyzzwN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707522; c=relaxed/simple;
	bh=Qbz+BtbLJT4dt8gyCwggBQrk2rj7FzPUJGKaNNbd0N8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ky7XaDytYXBjKPK0BTpG9T+udu+g06c+67E6WzIlYH5YglnPaF8B/09ElC9Q1Wl/EoPNz0RQC5sRqJqKQs5/Xt9Fh/WldcgWojmmbTojVOstgJVnBNtvoJbGX8VGoDR5IEJT7z4Rugh90HEPmja834G06aQn/HO+myESzgd57ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv2htbso; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE92AC4CECD;
	Wed, 23 Oct 2024 18:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707522;
	bh=Qbz+BtbLJT4dt8gyCwggBQrk2rj7FzPUJGKaNNbd0N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nv2htbsoyF5gbDRd2C1eFYrUoAX8a8BJ8QID2d6aWySnFCXnu4Lj13/N8uiR6zWwM
	 J2LoJY5YB/4YIiSiI1k6ozWTJo1zXvGA2gyLLg0DhMGyQN5s9i7HwjH6hnAXQuOiYQ
	 AeKzQg0acm6O605VYLQgDQM3/nsvLSsyThMVyigBu9khGFgTpEalvslBAiws/4Sipy
	 EsmANJvfxA3fZfuP9xtkG34C6neYdlQuRjLLs/t+9Hy4mSo2RS6tuShBHHjje1BI2i
	 6EA/Soycq+4wzf/4nsrmK8R3ssekVzre92H+t76HGyZhjnJ9pQ9FmpU8cgaAhYKkYr
	 lXuEhqfeGZJDw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/13] kconfig: qconf: refactor ConfigInfoView::clicked()
Date: Thu, 24 Oct 2024 03:18:02 +0900
Message-ID: <20241023181823.138524-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023181823.138524-1-masahiroy@kernel.org>
References: <20241023181823.138524-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most of the code in ConfigInfoView::clicked() is unnecessary.
There is no need to use the regular expression to search for a symbol.
Calling sym_find() is simpler and faster.

The hyperlink always begins with the "s" tag, and there is no other
tag used. Remove it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 43 ++++++----------------------------------
 1 file changed, 6 insertions(+), 37 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index a208ef33128f..f59a9597f09b 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1001,7 +1001,7 @@ void ConfigInfoView::menuInfo(void)
 			if (sym->name) {
 				stream << " (";
 				if (showDebug())
-					stream << "<a href=\"s" << sym->name << "\">";
+					stream << "<a href=\"" << sym->name << "\">";
 				stream << print_filter(sym->name);
 				if (showDebug())
 					stream << "</a>";
@@ -1010,7 +1010,7 @@ void ConfigInfoView::menuInfo(void)
 		} else if (sym->name) {
 			stream << "<big><b>";
 			if (showDebug())
-				stream << "<a href=\"s" << sym->name << "\">";
+				stream << "<a href=\"" << sym->name << "\">";
 			stream << print_filter(sym->name);
 			if (showDebug())
 				stream << "</a>";
@@ -1124,7 +1124,7 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
 	QTextStream *stream = reinterpret_cast<QTextStream *>(data);
 
 	if (sym && sym->name && !(sym->flags & SYMBOL_CONST)) {
-		*stream << "<a href=\"s" << sym->name << "\">";
+		*stream << "<a href=\"" << sym->name << "\">";
 		*stream << print_filter(str);
 		*stream << "</a>";
 	} else {
@@ -1134,39 +1134,11 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
 
 void ConfigInfoView::clicked(const QUrl &url)
 {
-	QByteArray str = url.toEncoded();
-	const std::size_t count = str.size();
-	char *data = new char[count + 2];  // '$' + '\0'
-	struct symbol **result;
-	struct menu *m = NULL;
+	struct menu *m;
 
-	if (count < 1) {
-		delete[] data;
-		return;
-	}
-
-	memcpy(data, str.constData(), count);
-	data[count] = '\0';
-
-	/* Seek for exact match */
-	data[0] = '^';
-	strcat(data, "$");
-	result = sym_re_search(data);
-	if (!result) {
-		delete[] data;
-		return;
-	}
-
-	sym = *result;
-
-	/* Seek for the menu which holds the symbol */
-	for (struct property *prop = sym->prop; prop; prop = prop->next) {
-		    if (prop->type != P_PROMPT && prop->type != P_MENU)
-			    continue;
-		    m = prop->menu;
-		    break;
-	}
+	sym = sym_find(url.toEncoded().constData());
 
+	m = sym_get_prompt_menu(sym);
 	if (!m) {
 		/* Symbol is not visible as a menu */
 		symbolInfo();
@@ -1174,9 +1146,6 @@ void ConfigInfoView::clicked(const QUrl &url)
 	} else {
 		emit menuSelected(m);
 	}
-
-	free(result);
-	delete[] data;
 }
 
 void ConfigInfoView::contextMenuEvent(QContextMenuEvent *event)
-- 
2.43.0


