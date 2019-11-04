Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E781EEE32
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Nov 2019 23:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390214AbfKDWNN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 17:13:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48422 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390510AbfKDWKN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 17:10:13 -0500
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0E6992A09B0
        for <linux-kbuild@vger.kernel.org>; Mon,  4 Nov 2019 22:10:13 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id o13so6337977qtr.3
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Nov 2019 14:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6nIaarjvtOgizveiVSrnR0SvuKBMT/SgTR8AIczCsU=;
        b=rA2lnx5eLeK39Qbgx4dFBrh7XQ3oumIO6Er7xBOKE3OoV2nFW3r52YcRO1llEluKgp
         sivafUSLAZgOKRspfwUDuc+NMT+RA5V6llf8LzCR1ES+xgAHDygCifHXxMPVciLbzlvE
         X1H4VoihA1HhC3i5DL2QCikVZ/q6ws4zZSsoBWGLTUxhR4as0PoOxam/ha6+WigIg1jw
         M9zKW3Gv1pPx2SE9BVYvhNhzySa3gaUdHqc4gC59rNCmujUEiB+7OncEjhss1Bel1+dw
         Ht+28PRwr2ttnLFoA8p1620aGthuBO1hJvKEVDnkLIX9/hbajPrClEeAZSv/DyOy/raz
         HXIQ==
X-Gm-Message-State: APjAAAWYv4GAMwVb9ct+BxnonTjosZUKDU16aLuTnKIkRI3LzM37ZEe8
        uJHthYNTbV/7M4KI4h32+jg2rSphlxCOseHgrS4cQa/LkPVDQQsbjh+EjT95woHaowvKwbV2+6h
        u4cfYyZZ82MOCSlsRhbS1hVnq
X-Received: by 2002:a37:4f10:: with SMTP id d16mr19833155qkb.80.1572905412194;
        Mon, 04 Nov 2019 14:10:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2/yf6495ow5aAiQ4fJlPu54g1fe9DmX7lTS+IITtJiDpMCYvE96mpYrRND4y/rQVGloThlw==
X-Received: by 2002:a37:4f10:: with SMTP id d16mr19833120qkb.80.1572905411873;
        Mon, 04 Nov 2019 14:10:11 -0800 (PST)
Received: from labbott-redhat.redhat.com (pool-96-235-39-235.pitbpa.fios.verizon.net. [96.235.39.235])
        by smtp.gmail.com with ESMTPSA id o3sm9774304qkf.97.2019.11.04.14.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 14:10:11 -0800 (PST)
From:   Laura Abbott <labbott@redhat.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcline@redhat.com,
        dzickus@redhat.com, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCHv2] kconfig: Add option to get the full help text with listnewconfig
Date:   Mon,  4 Nov 2019 17:10:08 -0500
Message-Id: <20191104221008.30078-1-labbott@redhat.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

make listnewconfig will list the individual options that need to be set.
This is useful but there's no easy way to get the help text associated
with the options at the same time. Introduce a new targe
'make helpnewconfig' which lists the full help text of all the
new options as well. This makes it easier to automatically generate
changes that are easy for humans to review. This command also adds
markers between each option for easier parsing.

Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v2: Dropped rfc tag, renamed extendedlistnewconfig -> helpnewconfig.
Added another missing help text.
---
 scripts/kconfig/Makefile |  5 ++++-
 scripts/kconfig/conf.c   | 13 ++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ef2f2336c469..71a956cec64a 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -66,7 +66,9 @@ localyesconfig localmodconfig: $(obj)/conf
 #  syncconfig has become an internal implementation detail and is now
 #  deprecated for external use
 simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
-	alldefconfig randconfig listnewconfig olddefconfig syncconfig
+	alldefconfig randconfig listnewconfig olddefconfig syncconfig \
+	helpnewconfig
+
 PHONY += $(simple-targets)
 
 $(simple-targets): $(obj)/conf
@@ -134,6 +136,7 @@ help:
 	@echo  '  alldefconfig    - New config with all symbols set to default'
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  listnewconfig   - List new options'
+	@echo  '  helpnewconfig   - List new options and help text'
 	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
 	@echo  '                    default value without prompting'
 	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 40e16e871ae2..1f89bf1558ce 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -32,6 +32,7 @@ enum input_mode {
 	defconfig,
 	savedefconfig,
 	listnewconfig,
+	helpnewconfig,
 	olddefconfig,
 };
 static enum input_mode input_mode = oldaskconfig;
@@ -434,6 +435,11 @@ static void check_conf(struct menu *menu)
 						printf("%s%s=%s\n", CONFIG_, sym->name, str);
 					}
 				}
+			} else if (input_mode == helpnewconfig) {
+				printf("-----\n");
+				print_help(menu);
+				printf("-----\n");
+
 			} else {
 				if (!conf_cnt++)
 					printf("*\n* Restart config...\n*\n");
@@ -459,6 +465,7 @@ static struct option long_opts[] = {
 	{"alldefconfig",    no_argument,       NULL, alldefconfig},
 	{"randconfig",      no_argument,       NULL, randconfig},
 	{"listnewconfig",   no_argument,       NULL, listnewconfig},
+	{"helpnewconfig",   no_argument,       NULL, helpnewconfig},
 	{"olddefconfig",    no_argument,       NULL, olddefconfig},
 	{NULL, 0, NULL, 0}
 };
@@ -469,6 +476,7 @@ static void conf_usage(const char *progname)
 	printf("Usage: %s [-s] [option] <kconfig-file>\n", progname);
 	printf("[option] is _one_ of the following:\n");
 	printf("  --listnewconfig         List new options\n");
+	printf("  --helpnewconfig         List new options and help text\n");
 	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
 	printf("  --oldconfig             Update a configuration using a provided .config as base\n");
 	printf("  --syncconfig            Similar to oldconfig but generates configuration in\n"
@@ -543,6 +551,7 @@ int main(int ac, char **av)
 		case allmodconfig:
 		case alldefconfig:
 		case listnewconfig:
+		case helpnewconfig:
 		case olddefconfig:
 			break;
 		case '?':
@@ -576,6 +585,7 @@ int main(int ac, char **av)
 	case oldaskconfig:
 	case oldconfig:
 	case listnewconfig:
+	case helpnewconfig:
 	case olddefconfig:
 		conf_read(NULL);
 		break;
@@ -657,6 +667,7 @@ int main(int ac, char **av)
 		/* fall through */
 	case oldconfig:
 	case listnewconfig:
+	case helpnewconfig:
 	case syncconfig:
 		/* Update until a loop caused no more changes */
 		do {
@@ -675,7 +686,7 @@ int main(int ac, char **av)
 				defconfig_file);
 			return 1;
 		}
-	} else if (input_mode != listnewconfig) {
+	} else if (input_mode != listnewconfig && input_mode != helpnewconfig) {
 		if (!no_conf_write && conf_write(NULL)) {
 			fprintf(stderr, "\n*** Error during writing of the configuration.\n\n");
 			exit(1);
-- 
2.21.0

