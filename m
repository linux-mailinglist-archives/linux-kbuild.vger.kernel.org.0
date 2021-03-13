Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8ADE33A09C
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 20:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234412AbhCMTtK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 14:49:10 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:39835 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234348AbhCMTtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 14:49:07 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 12DJmef1018162;
        Sun, 14 Mar 2021 04:48:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 12DJmef1018162
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615664921;
        bh=6rpOJIleym9UyVowz9fCDJJOr8izvJrJPHRRPjmFwz8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gl0pp994+JR1XK0feOLWPwOrPVh+7Yts6/MAEJpnWyaxVwv5umef5tfdjnUNztxBC
         je8N98CzXucpc8fzF4V1iqRlZNCP1tu6GCbrjSFkBclmEtARZfwD+ZKc6jf+59twPv
         cyddmmiQnzhF5gvavVhZaC8dtOufNfH9BnZ7rnYjuzsVq58CxGf3CZnP3riAUXT2tI
         brcad3A6pEi337sPrUrtIvs4U+wh0NcCCwvBSOZB/GQgE2IqHwm/jQtGsJ/KDEfSG3
         ndr6DO691Y7LGo3tGVEpExqOO5xrRxb1IKSuk7tcbslDD2uWhmPuGTNnYLGtJvBylG
         F+shvFYyT+klw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] kconfig: refactor option parse
Date:   Sun, 14 Mar 2021 04:48:25 +0900
Message-Id: <20210313194836.372585-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
References: <20210313194836.372585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The current option parse code is clumsy.

The 's' option is separately handled in a if-conditional due to the
following code:

    input_mode = (enum input_mode)opt;

If 's' is moved the switch statement, the invalid value 's' would be
assigned to the input_mode.

Another potential problem is that we are mixing 'enum input_mode' and
ASCII characters. They could overwrap if we add more input modes.

To separate them out, set the flag field of long options to a pointer
of input_mode_opt. For mode select options, getopt_long() returns 0,
which never causes overwrap with ASCII characters that represent short
options.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 91 ++++++++++++++++++++----------------------
 1 file changed, 43 insertions(+), 48 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 063c9e7a34c1..dc1a67fd35a9 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -37,7 +37,7 @@ enum input_mode {
 	mod2yesconfig,
 };
 static enum input_mode input_mode = oldaskconfig;
-
+static int input_mode_opt;
 static int indent = 1;
 static int tty_stdio;
 static int sync_kconfig;
@@ -474,21 +474,21 @@ static void check_conf(struct menu *menu)
 }
 
 static struct option long_opts[] = {
-	{"oldaskconfig",    no_argument,       NULL, oldaskconfig},
-	{"oldconfig",       no_argument,       NULL, oldconfig},
-	{"syncconfig",      no_argument,       NULL, syncconfig},
-	{"defconfig",       required_argument, NULL, defconfig},
-	{"savedefconfig",   required_argument, NULL, savedefconfig},
-	{"allnoconfig",     no_argument,       NULL, allnoconfig},
-	{"allyesconfig",    no_argument,       NULL, allyesconfig},
-	{"allmodconfig",    no_argument,       NULL, allmodconfig},
-	{"alldefconfig",    no_argument,       NULL, alldefconfig},
-	{"randconfig",      no_argument,       NULL, randconfig},
-	{"listnewconfig",   no_argument,       NULL, listnewconfig},
-	{"helpnewconfig",   no_argument,       NULL, helpnewconfig},
-	{"olddefconfig",    no_argument,       NULL, olddefconfig},
-	{"yes2modconfig",   no_argument,       NULL, yes2modconfig},
-	{"mod2yesconfig",   no_argument,       NULL, mod2yesconfig},
+	{"oldaskconfig",  no_argument,       &input_mode_opt, oldaskconfig},
+	{"oldconfig",     no_argument,       &input_mode_opt, oldconfig},
+	{"syncconfig",    no_argument,       &input_mode_opt, syncconfig},
+	{"defconfig",     required_argument, &input_mode_opt, defconfig},
+	{"savedefconfig", required_argument, &input_mode_opt, savedefconfig},
+	{"allnoconfig",   no_argument,       &input_mode_opt, allnoconfig},
+	{"allyesconfig",  no_argument,       &input_mode_opt, allyesconfig},
+	{"allmodconfig",  no_argument,       &input_mode_opt, allmodconfig},
+	{"alldefconfig",  no_argument,       &input_mode_opt, alldefconfig},
+	{"randconfig",    no_argument,       &input_mode_opt, randconfig},
+	{"listnewconfig", no_argument,       &input_mode_opt, listnewconfig},
+	{"helpnewconfig", no_argument,       &input_mode_opt, helpnewconfig},
+	{"olddefconfig",  no_argument,       &input_mode_opt, olddefconfig},
+	{"yes2modconfig", no_argument,       &input_mode_opt, yes2modconfig},
+	{"mod2yesconfig", no_argument,       &input_mode_opt, mod2yesconfig},
 	{NULL, 0, NULL, 0}
 };
 
@@ -526,43 +526,38 @@ int main(int ac, char **av)
 	tty_stdio = isatty(0) && isatty(1);
 
 	while ((opt = getopt_long(ac, av, "hs", long_opts, NULL)) != -1) {
-		if (opt == 's') {
-			conf_set_message_callback(NULL);
-			continue;
-		}
-		input_mode = (enum input_mode)opt;
 		switch (opt) {
-		case syncconfig:
-			/*
-			 * syncconfig is invoked during the build stage.
-			 * Suppress distracting "configuration written to ..."
-			 */
-			conf_set_message_callback(NULL);
-			sync_kconfig = 1;
-			break;
-		case defconfig:
-		case savedefconfig:
-			defconfig_file = optarg;
-			break;
-		case randconfig:
-			set_randconfig_seed();
-			break;
-		case oldaskconfig:
-		case oldconfig:
-		case allnoconfig:
-		case allyesconfig:
-		case allmodconfig:
-		case alldefconfig:
-		case listnewconfig:
-		case helpnewconfig:
-		case olddefconfig:
-		case yes2modconfig:
-		case mod2yesconfig:
-			break;
 		case 'h':
 			conf_usage(progname);
 			exit(1);
 			break;
+		case 's':
+			conf_set_message_callback(NULL);
+			break;
+		case 0:
+			input_mode = input_mode_opt;
+			switch (input_mode) {
+			case syncconfig:
+				/*
+				 * syncconfig is invoked during the build stage.
+				 * Suppress distracting
+				 *   "configuration written to ..."
+				 */
+				conf_set_message_callback(NULL);
+				sync_kconfig = 1;
+				break;
+			case defconfig:
+			case savedefconfig:
+				defconfig_file = optarg;
+				break;
+			case randconfig:
+				set_randconfig_seed();
+				break;
+			default:
+				break;
+			}
+		default:
+			break;
 		}
 	}
 	if (ac == optind) {
-- 
2.27.0

