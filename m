Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6CC9430B48
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Oct 2021 19:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344423AbhJQRp3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Oct 2021 13:45:29 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:57169 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344366AbhJQRp2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Oct 2021 13:45:28 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 36DE13200927;
        Sun, 17 Oct 2021 13:43:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 17 Oct 2021 13:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        joshtriplett.org; h=date:from:to:cc:subject:message-id
        :mime-version:content-type; s=fm2; bh=VSA0/C+Ci58NlZD+rt2K9iw1T0
        H+yB5CDTqvd/wmN6Y=; b=tk8EU0kTryHQXKjUalVdOsghSS2oJm4WCA1dyPvLH3
        OPRPha7C7gJ6oltnSbsJKBqILfKE2RCe7oIQEU3HdfR3xEO+2i2VMbIHmyMgQsWC
        cJ+MDrqOyYaDir0zKcwWamYQXjWozi+Kg/ZZwg6XY0tiV7D1KT4b8sxVZzAvJzhq
        rr/mFueyMuz1SOiLisoUWEC+pbtkyrxrgrAx3hiAY/Twn0gTgKpL54emkDlUpU6k
        doxFXv7KsJcTAAPbC2yyZtZvehrqt2K8A/4lAcaNpRRkrHgLfq52isxOqm2Wosbn
        zWDoIxqPz7AVqS3PapKYrw4gon+10fDIwl86ABrbINDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=VSA0/C+Ci58NlZD+rt2K9iw1T0H+y
        B5CDTqvd/wmN6Y=; b=hJ72YBJ3ZdJ/9lnm2HiK9bQSnt6EK4Wd9rFuQ3LhgrlLG
        +kPLolrr5UGiG5h3S8NafUxsnDYNqtELk/pWxMmVcDVJdeZ/x0BwNyXolgnsjjWj
        Men3P6UeC7BosXs8N/8JkzVpVf2DSN/wgL804WfJp0Hfy7PBDTKCDin3ffK0fxWN
        EeHaiFXYmLUgGDXAwnGNuCwqY0ecaP2pPGv1npxZ+ifXLlTBBamlOqgwkBTeFtBb
        35whb4jy+zy4nQzIFLR6bjC5RDvJCgTZ9rufhsmQ1iNEpvCt0ypnICFCu6Bn8bMQ
        wAubVlkGKA+7FwwjGjm34LRQ/FdzRAeQ+kB2xZ8IA==
X-ME-Sender: <xms:tWBsYQxt5SFFZZVYpdgtDGhpDP7jWReMUw3NbAtEWW75GkiMMctRFA>
    <xme:tWBsYURSrsVLDqVw9vr9qDQOB-GaaxxVd9X51j4WTV23ZAVPzARnjxBmv66WINOon
    aUylTRX8cgL8kTUBQw>
X-ME-Received: <xmr:tWBsYSV3Mo8KKrxIvoA6iBvEpzYTwk74smYFbRX_TDB--ugC_48kFx_vDwdNWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddukedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkgggtugesthdtredttddtvdenucfhrhhomheplfhoshhhucfv
    rhhiphhlvghtthcuoehjohhshhesjhhoshhhthhrihhplhgvthhtrdhorhhgqeenucggtf
    frrghtthgvrhhnpeelleeggedtjeejfeeuvddufeeggfektdefkeehveeuvedvvdfhgeff
    gfdvgfffkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjohhshhesjhhoshhhthhrihhplhgvthhtrdhorhhg
X-ME-Proxy: <xmx:tWBsYehkh4ARA93YyRGNRPpbFPBtT4w5Yn-uJODwRpSf8MdkMvztYQ>
    <xmx:tWBsYSArctAW3Q0pjaL2hnDAnKCS8y_6fe3le_rJX-klaSu_xQhnYA>
    <xmx:tWBsYfK4wVVEd3y3SK17utyvenXm0Il2TedePFm3YMTrRERh_oF0Mw>
    <xmx:tWBsYT4l_3FlZaD_we6MB653ynOvJ4JJAitCxw4qp6tdwCY4rjvQMA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 Oct 2021 13:43:16 -0400 (EDT)
Date:   Sun, 17 Oct 2021 19:43:13 +0200
From:   Josh Triplett <josh@joshtriplett.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: Add `make mod2noconfig` to disable module options
Message-ID: <37c3a9d3d6fceba0f55d05e7558370e3f60b8bf0.1634492509.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When converting a modular kernel to a monolithic kernel, once the kernel
works without loading any modules, this helps to quickly disable all the
modules before turning off module support entirely.

Refactor conf_rewrite_mod_or_yes to a more general
conf_rewrite_tristates that accepts an old and new state.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---
 scripts/kconfig/Makefile |  3 ++-
 scripts/kconfig/conf.c   | 17 ++++++++++-------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 5a215880b268..b8ef0fb4bbef 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -69,7 +69,7 @@ localyesconfig localmodconfig: $(obj)/conf
 #  deprecated for external use
 simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
 	alldefconfig randconfig listnewconfig olddefconfig syncconfig \
-	helpnewconfig yes2modconfig mod2yesconfig
+	helpnewconfig yes2modconfig mod2yesconfig mod2noconfig
 
 PHONY += $(simple-targets)
 
@@ -134,6 +134,7 @@ help:
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  yes2modconfig	  - Change answers from yes to mod if possible'
 	@echo  '  mod2yesconfig	  - Change answers from mod to yes if possible'
+	@echo  '  mod2noconfig	  - Change answers from mod to no if possible'
 	@echo  '  listnewconfig   - List new options'
 	@echo  '  helpnewconfig   - List new options and help text'
 	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 5d84b44a2a2a..5535dddab770 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -35,6 +35,7 @@ enum input_mode {
 	olddefconfig,
 	yes2modconfig,
 	mod2yesconfig,
+	mod2noconfig,
 };
 static enum input_mode input_mode = oldaskconfig;
 static int input_mode_opt;
@@ -163,8 +164,6 @@ enum conf_def_mode {
 	def_default,
 	def_yes,
 	def_mod,
-	def_y2m,
-	def_m2y,
 	def_no,
 	def_random
 };
@@ -302,12 +301,10 @@ static bool conf_set_all_new_symbols(enum conf_def_mode mode)
 	return has_changed;
 }
 
-static void conf_rewrite_mod_or_yes(enum conf_def_mode mode)
+static void conf_rewrite_tristates(tristate old_val, tristate new_val)
 {
 	struct symbol *sym;
 	int i;
-	tristate old_val = (mode == def_y2m) ? yes : mod;
-	tristate new_val = (mode == def_y2m) ? mod : yes;
 
 	for_all_symbols(i, sym) {
 		if (sym_get_type(sym) == S_TRISTATE &&
@@ -696,6 +693,7 @@ static const struct option long_opts[] = {
 	{"olddefconfig",  no_argument,       &input_mode_opt, olddefconfig},
 	{"yes2modconfig", no_argument,       &input_mode_opt, yes2modconfig},
 	{"mod2yesconfig", no_argument,       &input_mode_opt, mod2yesconfig},
+	{"mod2noconfig",  no_argument,       &input_mode_opt, mod2noconfig},
 	{NULL, 0, NULL, 0}
 };
 
@@ -724,6 +722,7 @@ static void conf_usage(const char *progname)
 	printf("  --randconfig            New config with random answer to all options\n");
 	printf("  --yes2modconfig         Change answers from yes to mod if possible\n");
 	printf("  --mod2yesconfig         Change answers from mod to yes if possible\n");
+	printf("  --mod2noconfig          Change answers from mod to no if possible\n");
 	printf("  (If none of the above is given, --oldaskconfig is the default)\n");
 }
 
@@ -799,6 +798,7 @@ int main(int ac, char **av)
 	case olddefconfig:
 	case yes2modconfig:
 	case mod2yesconfig:
+	case mod2noconfig:
 		conf_read(NULL);
 		break;
 	case allnoconfig:
@@ -873,10 +873,13 @@ int main(int ac, char **av)
 	case savedefconfig:
 		break;
 	case yes2modconfig:
-		conf_rewrite_mod_or_yes(def_y2m);
+		conf_rewrite_tristates(yes, mod);
 		break;
 	case mod2yesconfig:
-		conf_rewrite_mod_or_yes(def_m2y);
+		conf_rewrite_tristates(mod, yes);
+		break;
+	case mod2noconfig:
+		conf_rewrite_tristates(mod, no);
 		break;
 	case oldaskconfig:
 		rootEntry = &rootmenu;
-- 
2.33.0

