Return-Path: <linux-kbuild+bounces-1820-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B464A8C220A
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2024 12:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4E491C20C39
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2024 10:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F2616D309;
	Fri, 10 May 2024 10:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKEfKsON"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4FD16C863;
	Fri, 10 May 2024 10:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336684; cv=none; b=JrWez9pjnDSb5mX6r6XGpFuGieJ8GHVNW+S2zaYGDqM8hDyAYaDePXggg4ts7Q4QmmuXwEMSsnIo+j3ZpCZXBvotCxGmOF8QzAeq8dmG8k9l0ggIZu9IsfU4Ig4NNqKIULb+qq5sW/myba2SGF1w1amVHcHio1bRSh9XNRj9S+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336684; c=relaxed/simple;
	bh=7Cou4XrABzcgomDRnVTRkEhZ2jNwhltEsvMLKE86NHE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ffttCf/EVnUHhEUcOCUHleeOXzf3nQFUCq5SkF5dKY/DfOyGDzKZwny5CfP68v+bobu+4pC5C6a7QJxYKECUGloTOhxAENZT9s9w243M0LT6heo1zXiEHB6tgYA3Fls9lOOH16sA6azRgl4/j4xk3qwFNhZ9jqSFltRG6TfrwgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKEfKsON; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974D7C4AF0A;
	Fri, 10 May 2024 10:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715336684;
	bh=7Cou4XrABzcgomDRnVTRkEhZ2jNwhltEsvMLKE86NHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LKEfKsONXvhUv0mbcnoZLGZGDLpLEF9LW9lxxSVmA+ZHUrdRXfe4bikOdjdUgVW5C
	 CsrhCe01qI4UezBi2xF0CPSrKzx4zYHgeCUUl2Gu4JPORGo2bPCYuluSMXrLHmHluN
	 SrVKMGYvxlLaTpuSF9l93cuHXChu8h5pq9D5G0jGQ7qiKZWEu61gE4NmDej5LmapuW
	 Xqk+53odc9oAqyNeh53dkwwRS9AuhLAUrnFBkl8FTEoCNlR9JsxGl7QoP9VCb+Llpi
	 Sd1UkijAiPldDl8ltWTZmN1xckidmVaXKyyqZ39Z6TDI8nekaOFChCHBTLRH65Y+IK
	 as8jF+j0chSqA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 3/3] kconfig: m/nconf: merge two item_add_str() calls
Date: Fri, 10 May 2024 19:23:23 +0900
Message-Id: <20240510102323.2948886-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240510102323.2948886-1-masahiroy@kernel.org>
References: <20240510102323.2948886-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just trivial cleanups.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/mconf.c | 6 ++----
 scripts/kconfig/nconf.c | 7 ++-----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 90cd59a96aac..d6a61ca1a984 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -541,10 +541,8 @@ static void build_conf(struct menu *menu)
 
 		item_add_str("%*c%s", indent + 1, ' ', menu_get_prompt(menu));
 		if (val == yes) {
-			if (def_menu) {
-				item_add_str(" (%s)", menu_get_prompt(def_menu));
-				item_add_str("  --->");
-			}
+			if (def_menu)
+				item_add_str(" (%s)  --->", menu_get_prompt(def_menu));
 			return;
 		}
 	} else {
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 93047cd28f3f..e1cb09418cbe 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -845,11 +845,8 @@ static void build_conf(struct menu *menu)
 		item_add_str("%*c%s", indent + 1,
 				' ', menu_get_prompt(menu));
 		if (val == yes) {
-			if (def_menu) {
-				item_add_str(" (%s)",
-					menu_get_prompt(def_menu));
-				item_add_str("  --->");
-			}
+			if (def_menu)
+				item_add_str(" (%s)  --->", menu_get_prompt(def_menu));
 			return;
 		}
 	} else {
-- 
2.40.1


