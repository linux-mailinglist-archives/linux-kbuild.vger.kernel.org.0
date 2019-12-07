Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF58115AA8
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Dec 2019 02:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfLGBnj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Dec 2019 20:43:39 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:58934 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbfLGBnj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Dec 2019 20:43:39 -0500
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id xB71gwrD035800;
        Sat, 7 Dec 2019 10:42:58 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp);
 Sat, 07 Dec 2019 10:42:58 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp)
Received: from ccsecurity.localdomain (softbank126040062084.bbtec.net [126.40.62.84])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id xB71gmxs035757
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Sat, 7 Dec 2019 10:42:57 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: [PATCH v2] kconfig: Add yes2modconfig and mod2yesconfig targets.
Date:   Sat,  7 Dec 2019 10:42:38 +0900
Message-Id: <20191207014238.5507-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <5a473c6c-cc1f-6648-31ec-3b40e415a836@infradead.org>
References: <5a473c6c-cc1f-6648-31ec-3b40e415a836@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since kernel configs provided by syzbot are close to "make allyesconfig",
it takes long time to rebuild. This is especially waste of time when we
need to rebuild for many times (e.g. doing manual printk() inspection,
bisect operations).

We can save time if we can exclude modules which are irrelevant to each
problem. But "make localmodconfig" cannot exclude modules which are built
into vmlinux because /sbin/lsmod output is used as the source of modules.

Therefore, this patch adds "make yes2modconfig" which converts from =y
to =m if possible. After confirming that the interested problem is still
reproducible, we can try "make localmodconfig" (and/or manually tune
based on "Modules linked in:" line) in order to exclude modules which are
irrelevant to the interested problem. While we are at it, this patch also
adds "make mod2yesconfig" which converts from =m to =y in case someone
wants to convert from =m to =y after "make localmodconfig".

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Dmitry Vyukov <dvyukov@google.com>
---
Changelog since v1:
- Updated the available 'help' targets in Makefile.

 scripts/kconfig/Makefile   |  4 +++-
 scripts/kconfig/conf.c     | 17 +++++++++++++++++
 scripts/kconfig/confdata.c | 26 ++++++++++++++++++++++++++
 scripts/kconfig/lkc.h      |  3 +++
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 2f1a59fa5169..4da36f83277f 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -67,7 +67,7 @@ localyesconfig localmodconfig: $(obj)/conf
 #  deprecated for external use
 simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
 	alldefconfig randconfig listnewconfig olddefconfig syncconfig \
-	helpnewconfig
+	helpnewconfig yes2modconfig mod2yesconfig
 
 PHONY += $(simple-targets)
 
@@ -135,6 +135,8 @@ help:
 	@echo  '  allmodconfig	  - New config selecting modules when possible'
 	@echo  '  alldefconfig    - New config with all symbols set to default'
 	@echo  '  randconfig	  - New config with random answer to all options'
+	@echo  '  yes2modconfig	  - Change answers from yes to mod if possible'
+	@echo  '  mod2yesconfig	  - Change answers from mod to yes'
 	@echo  '  listnewconfig   - List new options'
 	@echo  '  helpnewconfig   - List new options and help text'
 	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 1f89bf1558ce..ae9ddf88c64d 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -34,6 +34,8 @@ enum input_mode {
 	listnewconfig,
 	helpnewconfig,
 	olddefconfig,
+	yes2modconfig,
+	mod2yesconfig,
 };
 static enum input_mode input_mode = oldaskconfig;
 
@@ -467,6 +469,8 @@ static struct option long_opts[] = {
 	{"listnewconfig",   no_argument,       NULL, listnewconfig},
 	{"helpnewconfig",   no_argument,       NULL, helpnewconfig},
 	{"olddefconfig",    no_argument,       NULL, olddefconfig},
+	{"yes2modconfig",   no_argument,       NULL, yes2modconfig},
+	{"mod2yesconfig",   no_argument,       NULL, mod2yesconfig},
 	{NULL, 0, NULL, 0}
 };
 
@@ -489,6 +493,8 @@ static void conf_usage(const char *progname)
 	printf("  --allmodconfig          New config where all options are answered with mod\n");
 	printf("  --alldefconfig          New config with all symbols set to default\n");
 	printf("  --randconfig            New config with random answer to all options\n");
+	printf("  --yes2modconfig         Change answers from yes to mod if possible\n");
+	printf("  --mod2yesconfig         Change answers from mod to yes\n");
 }
 
 int main(int ac, char **av)
@@ -553,6 +559,8 @@ int main(int ac, char **av)
 		case listnewconfig:
 		case helpnewconfig:
 		case olddefconfig:
+		case yes2modconfig:
+		case mod2yesconfig:
 			break;
 		case '?':
 			conf_usage(progname);
@@ -587,6 +595,8 @@ int main(int ac, char **av)
 	case listnewconfig:
 	case helpnewconfig:
 	case olddefconfig:
+	case yes2modconfig:
+	case mod2yesconfig:
 		conf_read(NULL);
 		break;
 	case allnoconfig:
@@ -638,6 +648,11 @@ int main(int ac, char **av)
 		}
 	}
 
+	if (input_mode == yes2modconfig)
+		conf_rewrite_mod_or_yes(def_y2m);
+	else if (input_mode == mod2yesconfig)
+		conf_rewrite_mod_or_yes(def_m2y);
+
 	switch (input_mode) {
 	case allnoconfig:
 		conf_set_all_new_symbols(def_no);
@@ -669,6 +684,8 @@ int main(int ac, char **av)
 	case listnewconfig:
 	case helpnewconfig:
 	case syncconfig:
+	case yes2modconfig:
+	case mod2yesconfig:
 		/* Update until a loop caused no more changes */
 		do {
 			conf_cnt = 0;
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 3569d2dec37c..6832a04a1aa4 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1362,3 +1362,29 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
 
 	return has_changed;
 }
+
+bool conf_rewrite_mod_or_yes(enum conf_def_mode mode)
+{
+	struct symbol *sym;
+	int i;
+	bool has_changed = false;
+
+	if (mode == def_y2m) {
+		for_all_symbols(i, sym) {
+			if (sym_get_type(sym) == S_TRISTATE &&
+			    sym->def[S_DEF_USER].tri == yes) {
+				sym->def[S_DEF_USER].tri = mod;
+				has_changed = true;
+			}
+		}
+	} else if (mode == def_m2y) {
+		for_all_symbols(i, sym) {
+			if (sym_get_type(sym) == S_TRISTATE &&
+			    sym->def[S_DEF_USER].tri == mod) {
+				sym->def[S_DEF_USER].tri = yes;
+				has_changed = true;
+			}
+		}
+	}
+	return has_changed;
+}
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 4fb16f316626..e8f3238dcc70 100644
--- a/scripts/kconfig/lkc.h
+++ b/scripts/kconfig/lkc.h
@@ -34,6 +34,8 @@ enum conf_def_mode {
 	def_default,
 	def_yes,
 	def_mod,
+	def_y2m,
+	def_m2y,
 	def_no,
 	def_random
 };
@@ -52,6 +54,7 @@ const char *conf_get_configname(void);
 void sym_set_change_count(int count);
 void sym_add_change_count(int count);
 bool conf_set_all_new_symbols(enum conf_def_mode mode);
+bool conf_rewrite_mod_or_yes(enum conf_def_mode mode);
 void set_all_choice_values(struct symbol *csym);
 
 /* confdata.c and expr.c */
-- 
2.18.1

