Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65B941227CF
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 10:42:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfLQJm2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Dec 2019 04:42:28 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:64966 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfLQJm1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 04:42:27 -0500
Received: from fsav304.sakura.ne.jp (fsav304.sakura.ne.jp [153.120.85.135])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id xBH9gBO0094351;
        Tue, 17 Dec 2019 18:42:11 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav304.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp);
 Tue, 17 Dec 2019 18:42:11 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp)
Received: from [192.168.1.9] (softbank126040062084.bbtec.net [126.40.62.84])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id xBH9g5is094307
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
        Tue, 17 Dec 2019 18:42:10 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: [PATCH v3] kconfig: Add yes2modconfig and mod2yesconfig targets.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
References: <5a473c6c-cc1f-6648-31ec-3b40e415a836@infradead.org>
 <20191207014238.5507-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <CAK7LNATj5RBHov_w05q1XSiOPN7fYQCKhVMDzHNwHSB1Eq2rmQ@mail.gmail.com>
 <cedbe416-844e-2bb8-5d05-4cd34eae8619@i-love.sakura.ne.jp>
 <CAK7LNATpAbRVbCuHQjq2e493aP0p1F9=Nd8+goQm-JnHzMEesw@mail.gmail.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <ced8ab1c-9c35-c7b0-6b9e-bcee7ffdf469@i-love.sakura.ne.jp>
Date:   Tue, 17 Dec 2019 18:42:06 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNATpAbRVbCuHQjq2e493aP0p1F9=Nd8+goQm-JnHzMEesw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Changelog since v2:
- Add 'if possible' to help message.
- Make conf_rewrite_mod_or_yes() void.
- Don't call check_conf() loop, for conf_write() takes care.
- Use sym_add_change_count(1) to tell something has changed.

Changelog since v1:
- Updated the available 'help' targets in Makefile.

 scripts/kconfig/Makefile   |  4 +++-
 scripts/kconfig/conf.c     | 16 ++++++++++++++++
 scripts/kconfig/confdata.c | 16 ++++++++++++++++
 scripts/kconfig/lkc.h      |  3 +++
 4 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 2f1a59fa5169..811fb930b93b 100644
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
+	@echo  '  mod2yesconfig	  - Change answers from mod to yes if possible'
 	@echo  '  listnewconfig   - List new options'
 	@echo  '  helpnewconfig   - List new options and help text'
 	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 1f89bf1558ce..f6e548b8f795 100644
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
+	printf("  --mod2yesconfig         Change answers from mod to yes if possible\n");
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
@@ -660,6 +670,12 @@ int main(int ac, char **av)
 		break;
 	case savedefconfig:
 		break;
+	case yes2modconfig:
+		conf_rewrite_mod_or_yes(def_y2m);
+		break;
+	case mod2yesconfig:
+		conf_rewrite_mod_or_yes(def_m2y);
+		break;
 	case oldaskconfig:
 		rootEntry = &rootmenu;
 		conf(&rootmenu);
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 3569d2dec37c..99f2418baa6c 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1362,3 +1362,19 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
 
 	return has_changed;
 }
+
+void conf_rewrite_mod_or_yes(enum conf_def_mode mode)
+{
+	struct symbol *sym;
+	int i;
+	tristate old_val = (mode == def_y2m) ? yes : mod;
+	tristate new_val = (mode == def_y2m) ? mod : yes;
+
+	for_all_symbols(i, sym) {
+		if (sym_get_type(sym) == S_TRISTATE &&
+		    sym->def[S_DEF_USER].tri == old_val) {
+			sym->def[S_DEF_USER].tri = new_val;
+			sym_add_change_count(1);
+		}
+	}
+}
diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
index 4fb16f316626..2bcc7bde6a33 100644
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
+void conf_rewrite_mod_or_yes(enum conf_def_mode mode);
 void set_all_choice_values(struct symbol *csym);
 
 /* confdata.c and expr.c */
-- 
2.16.5

