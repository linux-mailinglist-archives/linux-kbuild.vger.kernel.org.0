Return-Path: <linux-kbuild+bounces-1819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1F28C2205
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2024 12:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69A8F281E91
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2024 10:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B294168B01;
	Fri, 10 May 2024 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YT7bLdue"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32253168AFE;
	Fri, 10 May 2024 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336683; cv=none; b=AKe5BIXs/UIBsvbObSVLfJJe13kC41eoXIolwvKlpD7Rpmloxw4SitHpsKUTmePtKiGYNSUAwSq/goX+kqXbMPDyH0A/Dgkcwpjzlz5Ne2IujpImS1teLyAh1ZiG+gfxW9TnTfhvwAN5USWPEnZ3vUJMez2zbfvUesJdCL20IVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336683; c=relaxed/simple;
	bh=Ze8Q2NPH+lSYb7GIrGOA0moGIm4Q2QeviYx2Y8PWdGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p+ZBpBO7YFiVVsrTwSf02CGynl9yNsgi5MKPkYvtVtZJUb12lZTG42wxaZnIgOVAZ8JBo30yL99Z6FpXql9WG5NGDTux7Tcd/LgJrwhUQAf/NfRhEZ55Vo4noIvsHg3W36hTZo6QH1dT9uyA9UBlyzF4z/7FrUuMGkwcXZanT7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YT7bLdue; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC53C32782;
	Fri, 10 May 2024 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715336683;
	bh=Ze8Q2NPH+lSYb7GIrGOA0moGIm4Q2QeviYx2Y8PWdGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YT7bLdueDc0PkEw8gXPF2shBbQsnt/830VRkyRsZcvmfXO+UtbvGXJ3yxvLwB8d6u
	 qekB5YocfItYOmDeux5RFNdAuHeKdbjb2T9cGSOSUhKVA52AGPaeEmgBSajsjNMItd
	 qrYkNqw8ucGaLjWlSFLTjhQdMYRBNA5QROhvtU4DfGfnmpQZ9s+8WKsqMSdhMC5QIz
	 NbgunPzNCayr3WcLXIE88KsTi6hQmh2rVAm+xabYEsEO8ctE4zpzZUqCe3v+AancK7
	 iF2bKuvGtRdywDRYOJGmVaFIHm1OrKAvWdYpwndOSzgJRU9VwXfkIymwlNzgrLaPGA
	 //kgkgOJeScJw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 2/3] kconfig: m/nconf: remove dead code to display value of bool choice
Date: Fri, 10 May 2024 19:23:22 +0900
Message-Id: <20240510102323.2948886-2-masahiroy@kernel.org>
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

Previously, optional bool choices met the following conditions
simultaneously:

 - sym_is_choice(sym)
 - sym_is_changeable(sym)
 - type == S_BOOLEAN

It no longer occurs since 6a1215888e23 ("kconfig: remove 'optional'
property support"). Remove the dead code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/mconf.c | 17 +++++------------
 scripts/kconfig/nconf.c | 26 +++++++++-----------------
 2 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 8de4af43e865..90cd59a96aac 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -525,19 +525,12 @@ static void build_conf(struct menu *menu)
 
 		val = sym_get_tristate_value(sym);
 		if (sym_is_changeable(sym)) {
-			switch (type) {
-			case S_BOOLEAN:
-				item_make("[%c]", val == no ? ' ' : '*');
-				break;
-			case S_TRISTATE:
-				switch (val) {
-				case yes: ch = '*'; break;
-				case mod: ch = 'M'; break;
-				default:  ch = ' '; break;
-				}
-				item_make("<%c>", ch);
-				break;
+			switch (val) {
+			case yes: ch = '*'; break;
+			case mod: ch = 'M'; break;
+			default:  ch = ' '; break;
 			}
+			item_make("<%c>", ch);
 			item_set_tag('t');
 			item_set_data(menu);
 		} else {
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index bf460233a4cc..93047cd28f3f 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -826,26 +826,18 @@ static void build_conf(struct menu *menu)
 
 		val = sym_get_tristate_value(sym);
 		if (sym_is_changeable(sym)) {
-			switch (type) {
-			case S_BOOLEAN:
-				item_make(menu, 't', "[%c]",
-						val == no ? ' ' : '*');
+			switch (val) {
+			case yes:
+				ch = '*';
 				break;
-			case S_TRISTATE:
-				switch (val) {
-				case yes:
-					ch = '*';
-					break;
-				case mod:
-					ch = 'M';
-					break;
-				default:
-					ch = ' ';
-					break;
-				}
-				item_make(menu, 't', "<%c>", ch);
+			case mod:
+				ch = 'M';
+				break;
+			default:
+				ch = ' ';
 				break;
 			}
+			item_make(menu, 't', "<%c>", ch);
 		} else {
 			item_make(menu, def_menu ? 't' : ':', "   ");
 		}
-- 
2.40.1


