Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32C135AB88
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Apr 2021 08:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhDJG6N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Apr 2021 02:58:13 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:55300 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhDJG6N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Apr 2021 02:58:13 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 13A6vO7p019898;
        Sat, 10 Apr 2021 15:57:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 13A6vO7p019898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618037845;
        bh=dy+M7aj8aLPtekALAFLcpCskI3DPySuYBVYvNLrEAo8=;
        h=From:To:Cc:Subject:Date:From;
        b=2Yy3WPdNQNXOW/aKmJPS4vyi7mCAEwSPnf4dnOh56EdD2NsXtznb0J0CIJWsj/e7N
         aVAPGYkyjUTTtp/Ni/0XNG1UcTA/ekgzeDBLQf62lnP5nLla1SMnQpp7Pjg5slLgVn
         Et12KyeUky8s0lGAWDjwCoDIol+NBv5aeje1az2napVbB3d0rN3X8vdmD/or9xBA98
         mMdxGEzAKvoAsQNOo5tDq7TWiwh1C642AkrLIMd/nDk1Nb4lVe5p/CzFZmmMC7tMuy
         Jdxw9idbMosHSAHRE1WQ1kBeM5pseraMDdHwnc9kvorgwattDcU/EtFxICT0kZKRKR
         UnCMWSqu9P07Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: change sym_change_count into a boolean flag
Date:   Sat, 10 Apr 2021 15:57:22 +0900
Message-Id: <20210410065722.140619-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

sym_change_count has no good reason to be 'int' type.

sym_set_change_count() compares the old and new values after casting
both of them to (bool). I do not see any practical diffrence between
sym_set_change_count(1) and sym_add_change_count(1).

Use the boolean flag, 'conf_changed'.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c  | 31 +++++++++++++------------------
 scripts/kconfig/lkc.h       |  2 --
 scripts/kconfig/lkc_proto.h |  1 +
 scripts/kconfig/mconf.c     |  2 +-
 scripts/kconfig/nconf.c     |  2 +-
 scripts/kconfig/parser.y    |  2 +-
 scripts/kconfig/symbol.c    |  2 +-
 7 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index c796d402665e..a8339871ef79 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -366,7 +366,7 @@ int conf_read_simple(const char *name, int def)
 		in = zconf_fopen(name);
 		if (in)
 			goto load;
-		sym_add_change_count(1);
+		conf_set_changed(true);
 
 		env = getenv("KCONFIG_DEFCONFIG_LIST");
 		if (!env)
@@ -444,7 +444,7 @@ int conf_read_simple(const char *name, int def)
 			if (def == S_DEF_USER) {
 				sym = sym_find(line + 2 + strlen(CONFIG_));
 				if (!sym) {
-					sym_add_change_count(1);
+					conf_set_changed(true);
 					continue;
 				}
 			} else {
@@ -487,7 +487,7 @@ int conf_read_simple(const char *name, int def)
 					 */
 					conf_touch_dep(line + strlen(CONFIG_));
 				else
-					sym_add_change_count(1);
+					conf_set_changed(true);
 				continue;
 			}
 
@@ -535,7 +535,7 @@ int conf_read(const char *name)
 	int conf_unsaved = 0;
 	int i;
 
-	sym_set_change_count(0);
+	conf_set_changed(false);
 
 	if (conf_read_simple(name, S_DEF_USER)) {
 		sym_calc_value(modules_sym);
@@ -593,7 +593,8 @@ int conf_read(const char *name)
 		}
 	}
 
-	sym_add_change_count(conf_warnings || conf_unsaved);
+	if (conf_warnings || conf_unsaved)
+		conf_set_changed(true);
 
 	return 0;
 }
@@ -938,7 +939,7 @@ int conf_write(const char *name)
 		if (is_same(name, tmpname)) {
 			conf_message("No change to %s", name);
 			unlink(tmpname);
-			sym_set_change_count(0);
+			conf_set_changed(false);
 			return 0;
 		}
 
@@ -950,7 +951,7 @@ int conf_write(const char *name)
 
 	conf_message("configuration written to %s", name);
 
-	sym_set_change_count(0);
+	conf_set_changed(false);
 
 	return 0;
 }
@@ -1118,26 +1119,20 @@ int conf_write_autoconf(int overwrite)
 	return 0;
 }
 
-static int sym_change_count;
+static bool conf_changed;
 static void (*conf_changed_callback)(void);
 
-void sym_set_change_count(int count)
+void conf_set_changed(bool val)
 {
-	int _sym_change_count = sym_change_count;
-	sym_change_count = count;
-	if (conf_changed_callback &&
-	    (bool)_sym_change_count != (bool)count)
+	if (conf_changed_callback && conf_changed != val)
 		conf_changed_callback();
-}
 
-void sym_add_change_count(int count)
-{
-	sym_set_change_count(count + sym_change_count);
+	conf_changed = val;
 }
 
 bool conf_get_changed(void)
 {
-	return sym_change_count;
+	return conf_changed;
 }
 
 void conf_set_changed_callback(void (*fn)(void))
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 246eba37ca0e..f98660fa2c48 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -55,8 +55,6 @@ const char *zconf_curname(void);
 
 /* confdata.c */
 const char *conf_get_configname(void);
-void sym_set_change_count(int count);
-void sym_add_change_count(int count);
 void set_all_choice_values(struct symbol *csym);
 
 /* confdata.c and expr.c */
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index 9e81be33c40f..a11626bdc421 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -8,6 +8,7 @@ int conf_read_simple(const char *name, int);
 int conf_write_defconfig(const char *name);
 int conf_write(const char *name);
 int conf_write_autoconf(int overwrite);
+void conf_set_changed(bool val);
 bool conf_get_changed(void);
 void conf_set_changed_callback(void (*fn)(void));
 void conf_set_message_callback(void (*fn)(const char *s));
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 01b6c27224e2..4cfbe62938cd 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -910,7 +910,7 @@ static void conf_load(void)
 				return;
 			if (!conf_read(dialog_input_result)) {
 				set_config_filename(dialog_input_result);
-				sym_set_change_count(1);
+				conf_set_changed(true);
 				return;
 			}
 			show_textbox(NULL, "File does not exist!", 5, 38);
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index e0f965529166..f9a2ec1cefc6 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -1404,7 +1404,7 @@ static void conf_load(void)
 				return;
 			if (!conf_read(dialog_input_result)) {
 				set_config_filename(dialog_input_result);
-				sym_set_change_count(1);
+				conf_set_changed(true);
 				return;
 			}
 			btn_dialog(main_window, "File does not exist!", 0);
diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index e46ce21a2fc4..e90889edf5b3 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -507,7 +507,7 @@ void conf_parse(const char *name)
 	}
 	if (yynerrs)
 		exit(1);
-	sym_set_change_count(1);
+	conf_set_changed(true);
 }
 
 static bool zconf_endtoken(const char *tokenname,
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 36b0fcb18117..5844d636d38f 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -472,7 +472,7 @@ void sym_clear_all_valid(void)
 
 	for_all_symbols(i, sym)
 		sym->flags &= ~SYMBOL_VALID;
-	sym_add_change_count(1);
+	conf_set_changed(true);
 	sym_calc_value(modules_sym);
 }
 
-- 
2.27.0

