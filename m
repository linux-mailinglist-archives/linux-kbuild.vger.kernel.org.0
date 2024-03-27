Return-Path: <linux-kbuild+bounces-1367-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4CE88E7D3
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 16:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EF5D1F34D4E
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 15:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7BD147C9D;
	Wed, 27 Mar 2024 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AoQElbFM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7801411FB
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Mar 2024 14:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711549568; cv=none; b=Es28CHsmwTjh3lwsSptCqil+JqGlPeCGoGaFhtl25FDr1qU+XzYtPYsWSBZrjH8oSeEPT3Z+GnA7zaYvkxcEdm5eprX270eIkBznzLHhKWJxlIwPNGPRY3ARlySljLpSl90x2+nkS4kkjIbJJiu98csj2SqZU2ktoEIkaGdvO0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711549568; c=relaxed/simple;
	bh=I3ynC9G4wSUtbW2+yKCxFYAbSboPR0fI+YZpXfjxNxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MAUDVNKk1HSrctjaYQhgDNa5MkKf2dinnJZKZ06a+Hh7cRos89T3HdLFWdo4wY4SL+w4N8iPP+n4DedYMASYNeqMBONfTE+/pKn8ZTe01/Q8RsrzlFuAjcdxdwfxyzLXf3u50ssh6TkT+SX6z+k58UpPfLdOP+aJRVT/XZzZu3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AoQElbFM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4149532da36so3987805e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Mar 2024 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711549564; x=1712154364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jYhOZIN90mWP+0u0VcoqC5jXTTn/s6/ShobANYpGqc=;
        b=AoQElbFMvEzrVCfMc31w5Dd2f1Zjkls0R5NNo92cuVpH50JS3n8sA0Oob/lmUXesgy
         4BQOQGjVPw2UKbV+5ziTJ2gMJhF5+zWWR8zQfh4LFGDHwVsnU5JaY6TBLuBQtkIcCMOJ
         3LZG42EwgWN+xC7ASH1tRIlp5XyL+mhihcb7Nl6piltQp2iWE20RPvcm2OiK5C0Seh1E
         42UmAmzFFF9LMrwjqI0SRZUm6SW56NRXSyALDs5LeYuGbFyZ3coVfVDVLI8NIAHplhZU
         eRRHQlDuF9ZeOUrDJP5u5nMVZ2Qa1FI3AcHdYtH4rPS/3+C61vu9sTaH4HwRGzHzhGOo
         YVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711549564; x=1712154364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jYhOZIN90mWP+0u0VcoqC5jXTTn/s6/ShobANYpGqc=;
        b=USaHGokN4HfuGKpO/iSbrhfIG9H7h9RODhXZp3duNoWFF5zeESt7TirEt2LMWBfO4g
         RFjbFc9VhL6AXtrQNPYOHGNL3c5UM1teQo07sqCVjsgPJu/p8udRsp3Ycu/XsylC+QdH
         Bvb8SiQFBQexvOVFXjPTPzLSwZsxd22YAun4MGhYKNwj7b0FIqzRBFQsZwcgTtxeUEqY
         VHbm/0dW87C+81bA3e68UMNq2q7amxNwaTEFE4tdu4i0ISvC4EfVKkZtSsXDayA54a2W
         tq8EkfO1cLW5R6Tp3gVst11QL8cDnytctIfiBzDsigAnOD+Q+yFYi4HC0bshqZWgdLzN
         VlPA==
X-Forwarded-Encrypted: i=1; AJvYcCXnWxc2MoxW764t+SVpa1E52NQ17cdIP3PzAsvBvh630Oii9ziaaabCWKLBceKiYGvvI2EJM9rFVdBOD79SimSvW37PbTiS0FsEhMx/
X-Gm-Message-State: AOJu0YwOa/WmtiuWG4W6umkhiEN0AyyrFhOTCOZytrKxvQ/In9lZU2dB
	MBfs+P+x5bRgaHS7vf6sv12nb1gUg3O/4GvRxAbtZEJdiQLifJ+XOLCsdGgfCX3ojPF7YC2E2Y9
	OhSQ=
X-Google-Smtp-Source: AGHT+IGKmsgW3uTuoJsLFlaDQnJ1ODxpQrVscRAYhYdp2vGdtlnf0B9vShzwxNatiLi84KKh1B5zAg==
X-Received: by 2002:a05:600c:3507:b0:413:f296:980e with SMTP id h7-20020a05600c350700b00413f296980emr114286wmq.31.1711549563494;
        Wed, 27 Mar 2024 07:26:03 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a246:821e:6f3b:6b50:4762:8343])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b00414688af147sm2300840wms.20.2024.03.27.07.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 07:26:03 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [RFC 1/2] kconfig: Add helpallconfig
Date: Wed, 27 Mar 2024 15:25:43 +0100
Message-ID: <20240327142544.1728286-2-msp@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327142544.1728286-1-msp@baylibre.com>
References: <20240327142544.1728286-1-msp@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support a possible fzf driven kconfig script, all config symbols need
to be printed. As helpnewconfig already provides a very similar list,
this patch extends that functionality to print all config symbols with a
new command called helpallconfig.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 scripts/kconfig/Makefile |  4 +++-
 scripts/kconfig/conf.c   | 17 +++++++++++++----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ea1bf3b3dbde..87df82c03afb 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -77,7 +77,8 @@ localyesconfig localmodconfig: $(obj)/conf
 #  deprecated for external use
 simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
 	alldefconfig randconfig listnewconfig olddefconfig syncconfig \
-	helpnewconfig yes2modconfig mod2yesconfig mod2noconfig
+	helpallconfig helpnewconfig yes2modconfig mod2yesconfig \
+	mod2noconfig
 
 PHONY += $(simple-targets)
 
@@ -147,6 +148,7 @@ help:
 	@echo  '  mod2yesconfig	  - Change answers from mod to yes if possible'
 	@echo  '  mod2noconfig	  - Change answers from mod to no if possible'
 	@echo  '  listnewconfig   - List new options'
+	@echo  '  helpallconfig   - List all options and help text'
 	@echo  '  helpnewconfig   - List new options and help text'
 	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
 	@echo  '                    default value without prompting'
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index b5730061872b..3abc5f6b3a27 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -32,6 +32,7 @@ enum input_mode {
 	defconfig,
 	savedefconfig,
 	listnewconfig,
+	helpallconfig,
 	helpnewconfig,
 	olddefconfig,
 	yes2modconfig,
@@ -633,13 +634,14 @@ static void check_conf(struct menu *menu)
 	struct symbol *sym;
 	struct menu *child;
 
-	if (!menu_is_visible(menu))
+	if (input_mode != helpallconfig && !menu_is_visible(menu))
 		return;
 
 	sym = menu->sym;
-	if (sym && !sym_has_value(sym) &&
-	    (sym_is_changeable(sym) ||
-	     (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes))) {
+	if (input_mode == helpallconfig ||
+	    (sym && !sym_has_value(sym) &&
+	     (sym_is_changeable(sym) ||
+	      (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)))) {
 
 		switch (input_mode) {
 		case listnewconfig:
@@ -647,6 +649,7 @@ static void check_conf(struct menu *menu)
 				print_symbol_for_listconfig(sym);
 			break;
 		case helpnewconfig:
+		case helpallconfig:
 			printf("-----\n");
 			print_help(menu);
 			printf("-----\n");
@@ -678,6 +681,7 @@ static const struct option long_opts[] = {
 	{"alldefconfig",  no_argument,       &input_mode_opt, alldefconfig},
 	{"randconfig",    no_argument,       &input_mode_opt, randconfig},
 	{"listnewconfig", no_argument,       &input_mode_opt, listnewconfig},
+	{"helpallconfig", no_argument,       &input_mode_opt, helpallconfig},
 	{"helpnewconfig", no_argument,       &input_mode_opt, helpnewconfig},
 	{"olddefconfig",  no_argument,       &input_mode_opt, olddefconfig},
 	{"yes2modconfig", no_argument,       &input_mode_opt, yes2modconfig},
@@ -696,6 +700,7 @@ static void conf_usage(const char *progname)
 	printf("\n");
 	printf("Mode options:\n");
 	printf("  --listnewconfig         List new options\n");
+	printf("  --helpallconfig         List all options and help text\n");
 	printf("  --helpnewconfig         List new options and help text\n");
 	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
 	printf("  --oldconfig             Update a configuration using a provided .config as base\n");
@@ -783,6 +788,7 @@ int main(int ac, char **av)
 	case oldaskconfig:
 	case oldconfig:
 	case listnewconfig:
+	case helpallconfig:
 	case helpnewconfig:
 	case olddefconfig:
 	case yes2modconfig:
@@ -888,6 +894,9 @@ int main(int ac, char **av)
 			check_conf(&rootmenu);
 		} while (conf_cnt);
 		break;
+	case helpallconfig:
+		check_conf(&rootmenu);
+		break;
 	case olddefconfig:
 	default:
 		break;
-- 
2.43.0


