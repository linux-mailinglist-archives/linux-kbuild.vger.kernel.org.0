Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8FD1C8257
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2020 08:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgEGGQT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 May 2020 02:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgEGGQT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 May 2020 02:16:19 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBF4C061A0F
        for <linux-kbuild@vger.kernel.org>; Wed,  6 May 2020 23:16:18 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g10so3422809lfj.13
        for <linux-kbuild@vger.kernel.org>; Wed, 06 May 2020 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wiYD5tW/PmqR5opgkm9JKCV25eOS1wSJbln1sNRMx4w=;
        b=kWVc1CrFMXlfPbU3a0XtM8pE+VRKrz61onn2dDKxeSVPpLOvz3OLCWDu90sPhGoaJY
         YeDhxzeZdS5lAiBzISPczMX4Czp7SIiNwkHupYXzxnA7QnWkYR+84xJJiyS4at1Ez4n3
         ibHOWh+kvnvfZDO3QLhGBle1B5P1zjOIFxW187ZwkBRywCuJBb8STjNYircb2SweDR0y
         0o8nCdZfcvAlX0Cp+cd8BJ4ZD3Fvtr4abZvOwkiNf39bPFDb1LegkcsMw7pt7dCp9vxz
         MHbxB+Q9pCU2Kl3gabJUkNxjUHPoR23895R2FeKnh0myb+H2kmnfokYI1hjBcEBu9Hsv
         C1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wiYD5tW/PmqR5opgkm9JKCV25eOS1wSJbln1sNRMx4w=;
        b=hrmNN3VM7LJbCrBQh4LiOaMKObUPjMRHEW+a/K1jC1GlMl58mYDHnKpg9u5ODTvTrC
         K9jeGf/1SAQWCneXSE+Z3jhMmMVj7Ub06ACHXyD1HA+uvsagidyIn6o11PYf9d2ZufaV
         rswTtVY4aNH6fQ6iSCLI2e0cjY1SE0o0ijLk9lNBp6iU56o8QoI1+qyiNaV6l7rnmmoM
         weFPVjlxG4pdSDZQhUnp4KqhoidzlJQJke3jW3F9ZJiLZTcBa2wCtZpUElW5P8/tv3V5
         6ZFCghg9RsWZvXRcfNzjhEb8Cne3f76UfT35Ayxh3zgVdjH+ZgV0eTk/TmrWLkQcdXG+
         4Ymg==
X-Gm-Message-State: AGi0PuYkUnblzqaHB1uSUjOxtDHQYez8HzOMPrBVU605DPHLXJOWaOeJ
        VMl1sdtyTmGYZQMgV/l6pNe7y8NfIWUF8mhc
X-Google-Smtp-Source: APiQypLMWKTLUWf+E64tsiKHpPmRVGMyi2WKZeO06xQTlO0zeF+72B7FpAd2xsjsG9lgyA9+RRtfKg==
X-Received: by 2002:a05:6512:10d0:: with SMTP id k16mr7726434lfg.71.1588832176916;
        Wed, 06 May 2020 23:16:16 -0700 (PDT)
Received: from localhost.localdomain (91-153-194-104.elisa-laajakaista.fi. [91.153.194.104])
        by smtp.gmail.com with ESMTPSA id l9sm2621241lje.57.2020.05.06.23.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 23:16:16 -0700 (PDT)
From:   Jukka Kaartinen <jukka.kaartinen@unikie.com>
To:     linux-kbuild@vger.kernel.org
Cc:     yamada.masahiro@socionext.com, lukas.bulwahn@gmail.com,
        jouni.hogander@unikie.com, dan.carpenter@oracle.com,
        Jukka Kaartinen <jukka.kaartinen@unikie.com>
Subject: [PATCH v2] kconfig: Extend kconfig with setall option
Date:   Thu,  7 May 2020 09:16:11 +0300
Message-Id: <20200507061611.27202-1-jukka.kaartinen@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506125236.16415-3-jukka.kaartinen@unikie.com>
References: <20200506125236.16415-3-jukka.kaartinen@unikie.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

setall will set all possible dependencies automatically to
value "y".

Signed-off-by: Jukka Kaartinen <jukka.kaartinen@unikie.com>
---
 scripts/kconfig/kconfig | 77 +++++++++++++++++++++++++++++++++--------
 scripts/kconfig/lconf.c | 16 +++++++++
 2 files changed, 79 insertions(+), 14 deletions(-)

diff --git a/scripts/kconfig/kconfig b/scripts/kconfig/kconfig
index 2762c8dc04a8..7dd7bca2e0e8 100755
--- a/scripts/kconfig/kconfig
+++ b/scripts/kconfig/kconfig
@@ -1,34 +1,83 @@
-#!/bin/sh
+#!/bin/bash
 # SPDX-License-Identifier: GPL-2.0
 
 usage() {
-	echo "kconfig [search|set] string"
+	echo "kconfig [search|set|setall|val|out] string"
+	echo "      search         Search config option"
+	echo "      set            Config option"
+	echo "      setall         Set all possible dependencies to 'y'"
+	echo "      val            Value for config option"
+	echo "      out            Directory for O=<out>"
+	echo ""
+	echo " example:"
+	echo "   $0 set I2C val y"
 	exit 1;
 }
 
-if [ "$1" = "" ] ; then
-	usage
-fi
+search=""
+search_val=""
+config=""
+config_val=""
+output=""
+setting=""
+
+while [[ $# -gt 0 ]]
+do
+	key="$1"
+	case $key in
+		search)
+			search=1
+			search_val="$2"
+			shift # past argument
+			shift # past value
+			;;
+		set)
+			config=1
+			config_val="$2"
+			shift # past argument
+			shift # past value
+			;;
+		setall)
+			all="y"
+			shift # past argument
+			;;
+		val)
+			setting="$2"
+			shift # past argument
+			shift # past value
+			;;
+		out)
+			output="O=$2"
+			shift # past argument
+			shift # past value
+			;;
+		*)    # unknown option
+			echo "Unknown option: $1"
+			usage
+			exit 1
+			;;
+	esac
+done
 
-if [ "$1" = "search" ] ; then
+if [ "$search" != "" ] ; then
 
-	search=$2
-	NCONFIG_MODE=kconfig_search SEARCH=${search} make lconfig
+	if [ $search_val = "" ] ; then
+		echo "nothing to search"
+		exit 1
+	fi
 
-elif [ "$1" = "set" ] ; then
+	NCONFIG_MODE=kconfig_search SEARCH=${search_val} make lconfig ${output}
 
-	config=$2
-	setting=$3
+elif [ "$config" != "" ] ; then
 
-	if [ $config = "" ] ; then
+	if [ $config_val = "" ] ; then
 		echo "nothing to set"
 		exit 1
 	fi
 
-	NCONFIG_MODE=kconfig_set CONFIG=${config} SETTING=${setting} make lconfig
+	ALLYES=${all} NCONFIG_MODE=kconfig_set CONFIG=${config_val} SETTING=${setting} make lconfig ${output}
 
 else
 	usage
 fi
 
-
diff --git a/scripts/kconfig/lconf.c b/scripts/kconfig/lconf.c
index cde717f36eb1..b8634f8f662d 100644
--- a/scripts/kconfig/lconf.c
+++ b/scripts/kconfig/lconf.c
@@ -14,6 +14,7 @@
 
 static int indent;
 static char line[128];
+static char *ask_from_user;
 
 static int get_depends(struct symbol *sym);
 
@@ -57,6 +58,12 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 		return 0;
 	}
 
+	if (ask_from_user) {
+		line[0] = 'y';
+		line[1] = '\0';
+		return 0;
+	}
+
 	fflush(stdout);
 	xfgets(line, 128, stdin);
 
@@ -232,8 +239,17 @@ static void kconfig_set(void)
 	struct symbol *sym;
 	char *config;
 	char *setting;
+	char *allyes;
 	int res;
 
+	allyes = getenv("ALLYES");
+	if (allyes) {
+		if (strncmp(allyes, "y", 1) == 0) {
+			ask_from_user = "y";
+			printf("Set all dependencies to yes.\n");
+		}
+	}
+
 	config = getenv("CONFIG");
 	if (!config)
 		return;
-- 
2.17.1

