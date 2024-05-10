Return-Path: <linux-kbuild+bounces-1818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A858C2203
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2024 12:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F21CFB21736
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2024 10:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A44168AE7;
	Fri, 10 May 2024 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0RiO78B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10A130E39;
	Fri, 10 May 2024 10:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336682; cv=none; b=IZdYFE7upTzyLVZYeHV8w2q6nLHFSPbbX6gaWTqy0E/Qc20A7CXQB8TXICRIIQ8LRzttYRm1VSC0hcowZ7w5etkgl4baLYcj+NFglg6QXIvvv7Ca1g0G/NkGVgP3HC9P+P/b0bq+L4G3Hl8g2RGaEC4oMl/OTEP2K6NhC3QX65k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336682; c=relaxed/simple;
	bh=Q5ZDUnExSnU8qi8YRiMhs4Ryi8d1arD/GQlT0xAQ3jA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dgb9NS8k1d/Dfi2MFkFbM9ZrueCuBSuVyNQEdUAL6DOwlrn37MVMFcLmYqypHC+BacUqIN4dtTxSppm/hnJrfoKM3B73a0RSFcYjrnhBby+yplisDJaE6ntrIgUADJDt0ZkDQiXscURPupmcHIGbeGevH7mwfu3B4/lm+T/uR4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0RiO78B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0562AC113CC;
	Fri, 10 May 2024 10:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715336681;
	bh=Q5ZDUnExSnU8qi8YRiMhs4Ryi8d1arD/GQlT0xAQ3jA=;
	h=From:To:Cc:Subject:Date:From;
	b=t0RiO78BOWpYP+ckiAh37hqwnRWGabYb6hfLyyCoMH45bETJ8uGJYflHwcIVqdy1t
	 RQuV8fOi8XOwZwRimEBeqE3tg7p9i8NH9A33oAZfSsBZalD185AA67augK82Q8meYj
	 gvjbkL/1RSqlDpWBnABsuchan285IXZs9gzxTP78vXYBF3pA/oavhfrTggUbHPFjY9
	 LnMJLCSvVRrQfPYN9scWvRhheIYoHIVSRWI1NWBfjkFT238cZjSrPAlx6nPEsNmBpe
	 X+05cr/CdIezmNfkCIkNXqi/Rv+9Qubcg5o5j0nzdOhz9clqi7Ri3Aum9CJGYKlFzN
	 UpBYStORbdO0g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 1/3] kconfig: m/nconf: remove dead code to display children of choice members
Date: Fri, 10 May 2024 19:23:21 +0900
Message-Id: <20240510102323.2948886-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This code previously displayed child symbols of the selected choice
member.

Since commit 7e3465f63a0a ("kconfig: do not reparent the menu inside
a choice block"), choice members never have child symbols, therefore
this is dead code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Remove more dead code

 scripts/kconfig/mconf.c | 81 +++++++++++++++++----------------------
 scripts/kconfig/nconf.c | 85 +++++++++++++++++------------------------
 2 files changed, 71 insertions(+), 95 deletions(-)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index c0969097447d..8de4af43e865 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -551,11 +551,6 @@ static void build_conf(struct menu *menu)
 			if (def_menu) {
 				item_add_str(" (%s)", menu_get_prompt(def_menu));
 				item_add_str("  --->");
-				if (def_menu->list) {
-					indent += 2;
-					build_conf(def_menu);
-					indent -= 2;
-				}
 			}
 			return;
 		}
@@ -568,49 +563,43 @@ static void build_conf(struct menu *menu)
 		}
 		child_count++;
 		val = sym_get_tristate_value(sym);
-		if (sym_is_choice_value(sym) && val == yes) {
-			item_make("   ");
-			item_set_tag(':');
+		switch (type) {
+		case S_BOOLEAN:
+			if (sym_is_changeable(sym))
+				item_make("[%c]", val == no ? ' ' : '*');
+			else
+				item_make("-%c-", val == no ? ' ' : '*');
+			item_set_tag('t');
 			item_set_data(menu);
-		} else {
-			switch (type) {
-			case S_BOOLEAN:
-				if (sym_is_changeable(sym))
-					item_make("[%c]", val == no ? ' ' : '*');
-				else
-					item_make("-%c-", val == no ? ' ' : '*');
-				item_set_tag('t');
-				item_set_data(menu);
-				break;
-			case S_TRISTATE:
-				switch (val) {
-				case yes: ch = '*'; break;
-				case mod: ch = 'M'; break;
-				default:  ch = ' '; break;
-				}
-				if (sym_is_changeable(sym)) {
-					if (sym->rev_dep.tri == mod)
-						item_make("{%c}", ch);
-					else
-						item_make("<%c>", ch);
-				} else
-					item_make("-%c-", ch);
-				item_set_tag('t');
-				item_set_data(menu);
-				break;
-			default:
-				tmp = 2 + strlen(sym_get_string_value(sym)); /* () = 2 */
-				item_make("(%s)", sym_get_string_value(sym));
-				tmp = indent - tmp + 4;
-				if (tmp < 0)
-					tmp = 0;
-				item_add_str("%*c%s%s", tmp, ' ', menu_get_prompt(menu),
-					     (sym_has_value(sym) || !sym_is_changeable(sym)) ?
-					     "" : " (NEW)");
-				item_set_tag('s');
-				item_set_data(menu);
-				goto conf_childs;
+			break;
+		case S_TRISTATE:
+			switch (val) {
+			case yes: ch = '*'; break;
+			case mod: ch = 'M'; break;
+			default:  ch = ' '; break;
 			}
+			if (sym_is_changeable(sym)) {
+				if (sym->rev_dep.tri == mod)
+					item_make("{%c}", ch);
+				else
+					item_make("<%c>", ch);
+			} else
+				item_make("-%c-", ch);
+			item_set_tag('t');
+			item_set_data(menu);
+			break;
+		default:
+			tmp = 2 + strlen(sym_get_string_value(sym)); /* () = 2 */
+			item_make("(%s)", sym_get_string_value(sym));
+			tmp = indent - tmp + 4;
+			if (tmp < 0)
+				tmp = 0;
+			item_add_str("%*c%s%s", tmp, ' ', menu_get_prompt(menu),
+				     (sym_has_value(sym) || !sym_is_changeable(sym)) ?
+				     "" : " (NEW)");
+			item_set_tag('s');
+			item_set_data(menu);
+			goto conf_childs;
 		}
 		item_add_str("%*c%s%s", indent + 1, ' ', menu_get_prompt(menu),
 			  (sym_has_value(sym) || !sym_is_changeable(sym)) ?
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 9d22b0f3197b..bf460233a4cc 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -857,11 +857,6 @@ static void build_conf(struct menu *menu)
 				item_add_str(" (%s)",
 					menu_get_prompt(def_menu));
 				item_add_str("  --->");
-				if (def_menu->list) {
-					indent += 2;
-					build_conf(def_menu);
-					indent -= 2;
-				}
 			}
 			return;
 		}
@@ -874,54 +869,46 @@ static void build_conf(struct menu *menu)
 		}
 		child_count++;
 		val = sym_get_tristate_value(sym);
-		if (sym_is_choice_value(sym) && val == yes) {
-			item_make(menu, ':', "   ");
-		} else {
-			switch (type) {
-			case S_BOOLEAN:
-				if (sym_is_changeable(sym))
-					item_make(menu, 't', "[%c]",
-						val == no ? ' ' : '*');
-				else
-					item_make(menu, 't', "-%c-",
-						val == no ? ' ' : '*');
+		switch (type) {
+		case S_BOOLEAN:
+			if (sym_is_changeable(sym))
+				item_make(menu, 't', "[%c]",
+					  val == no ? ' ' : '*');
+			else
+				item_make(menu, 't', "-%c-",
+					  val == no ? ' ' : '*');
+			break;
+		case S_TRISTATE:
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
-				if (sym_is_changeable(sym)) {
-					if (sym->rev_dep.tri == mod)
-						item_make(menu,
-							't', "{%c}", ch);
-					else
-						item_make(menu,
-							't', "<%c>", ch);
-				} else
-					item_make(menu, 't', "-%c-", ch);
+			case mod:
+				ch = 'M';
 				break;
 			default:
-				tmp = 2 + strlen(sym_get_string_value(sym));
-				item_make(menu, 's', "    (%s)",
-						sym_get_string_value(sym));
-				tmp = indent - tmp + 4;
-				if (tmp < 0)
-					tmp = 0;
-				item_add_str("%*c%s%s", tmp, ' ',
-						menu_get_prompt(menu),
-						(sym_has_value(sym) ||
-						 !sym_is_changeable(sym)) ? "" :
-						" (NEW)");
-				goto conf_childs;
+				ch = ' ';
+				break;
 			}
+			if (sym_is_changeable(sym)) {
+				if (sym->rev_dep.tri == mod)
+					item_make(menu, 't', "{%c}", ch);
+				else
+					item_make(menu, 't', "<%c>", ch);
+			} else
+				item_make(menu, 't', "-%c-", ch);
+			break;
+		default:
+			tmp = 2 + strlen(sym_get_string_value(sym));
+			item_make(menu, 's', "    (%s)",
+				  sym_get_string_value(sym));
+			tmp = indent - tmp + 4;
+			if (tmp < 0)
+				tmp = 0;
+			item_add_str("%*c%s%s", tmp, ' ', menu_get_prompt(menu),
+				     (sym_has_value(sym) ||
+				      !sym_is_changeable(sym)) ? "" : " (NEW)");
+			goto conf_childs;
 		}
 		item_add_str("%*c%s%s", indent + 1, ' ',
 				menu_get_prompt(menu),
-- 
2.40.1


