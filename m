Return-Path: <linux-kbuild+bounces-5937-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE63A4AE1F
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Mar 2025 23:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 916D518946F6
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Mar 2025 22:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9531CAA7D;
	Sat,  1 Mar 2025 22:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4Xns9mL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABED189BB0;
	Sat,  1 Mar 2025 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740867644; cv=none; b=HiPh3UHi/wqSKvWVm6tndUxYNWSz51471QxayPam7y3UsTeMgSxgGOMtVn5ysQDaR32TWZaoM9BUYu6UU6X2QILgbVsrzjPIiYhJp1rm34OXFbFNvolCWNri8hRFX+fLouEJy2IvdBoG2RuLiKeJ1l2bebBMMPVU7OkcKdis/Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740867644; c=relaxed/simple;
	bh=bWi5F8JskvMUXwDgg6TYargD0S/3onvbWna1Z9b1pt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnQHvitFZPsXfFMUjp8gb47oksZ+CWFGJv/6C8Yl56zwPjoEIvGBc8EpwcjPZ8ELk4uSu/cewvIaK5hEJGV1uymtuXg4+3NGJATshdaRcz3gfnpXVAGKxAA3AnxRMUTO64zoFSZ9c0q9slzR7XqORQatLx94MeIsEm3G9KNq318=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4Xns9mL; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47208e35f9cso39753131cf.3;
        Sat, 01 Mar 2025 14:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740867641; x=1741472441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w2JFrSTKfau8m6kxQWUnIa48KZ7ucuFBY64RIjU9F4I=;
        b=P4Xns9mLIB/r9QqIXWMpx+yYJTOCzWHKWK7GC2VI0y7V+GBHE96SKbY1paM5ly5Kma
         YMV75WfY014Fm4H4TIV8nUjqklFo+knAjIxy5njBc+G4ZN85VYBMEMI7Q8JoijEZhcuw
         jhowRc78296+SjpVE8CR7070N/rM1zEuHEYw4LUsvKRq3ibe7sGFpMcJXxdigP4zGmbt
         0MtOE8FHEsWixMHNIrBZJESBIBdh9ieyfg+MKSN/0NrWlEOcJY++UgJfrRpnDgtN1XeY
         eZHa1b/y16zPayzwGRpddvr4UptqJxU5JMqw7Q0xq+Sf4q0V4JbOwFF55OpG2Tw1mB1B
         /66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740867641; x=1741472441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2JFrSTKfau8m6kxQWUnIa48KZ7ucuFBY64RIjU9F4I=;
        b=M3WbOXQX7Bwfh/er5ddlSR6MaaD1JrXC0bW62KlA7KIiOORLLyS1/dplgsSekzpx06
         2krvihMaASXi0XgYu3oo4/c/0u8nbn7uaS6recuSvf2qqiDWeo3W1pnqzh4C+6PHzNwk
         4isubELjPMG9rQlhQdzgqvZypvm5FSa5hO5M7I3f+XFa4dsQZzn6FcZX9h0RLkj6O/1o
         8Kro9ZRRuLRnUU33f1fZbcHK/ROtP7VKaFpE8dwEFP53SUVWTGwpmQsknkNVHmyDQNXy
         U3resDYS//BjRbeIqb4K7VMkPggjmfalq882VwtNlJgTp+3TjJaWE64NyFyE0ibYqDkV
         73QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRRWvH6c7bQzqfUBbucize+s27XMdcwClwHvOeoAqtS+Fa7BpwOfkPpx9NPvCY/f3cUuAMU8h+uRGkwas=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuL8bRF7QEkXdGDFutcT83My5TfL/M19qb2N/oHuPAyW7nsqhm
	N7zFolJK+ZjwUcwHUghfey6NnFDHpKE6soahk/zqnYtWkLEtkmEF
X-Gm-Gg: ASbGnct2F8p4+TpRFBhhfUQTDw/8bL83KFiUf/pdsLSLuXmFWd047QD+PmLcqMjQk/L
	pNTh/8wyhP9e7aANwsjEXe6WnLz+3Iqlm1w8X9YgAsc+Evac/qhAMENtHsXW3abAjj4qNljLLnJ
	5zQCNYkrMvujyyZF1Y/6dZWBxY85ai+b//5Txv/WKzF8t+P03rHhNsuICjpPMJwayET29iOdFJH
	ISqPYkqrZxAeDWp4sCqVuMvLaNzIlZmlXevZv5elGB/lcC2id+9W90b/DlomZ2YKt/5Hs71uEa7
	xLYxry4XmEZJsQqpCa0FtMkLmcdsPREErWADV/ABRM44HA==
X-Google-Smtp-Source: AGHT+IGAPwp+ISQn26o9aqiS0lxaAntODE0R4hb1MMh8gugmxccnoljIhp8g8WWDVGlv0CoUEvB+aw==
X-Received: by 2002:a05:6214:226b:b0:6e6:668a:a27f with SMTP id 6a1803df08f44-6e8a0cfff83mr134583676d6.17.1740867641363;
        Sat, 01 Mar 2025 14:20:41 -0800 (PST)
Received: from iman-pc.home ([142.198.73.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976346fcsm36843696d6.14.2025.03.01.14.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 14:20:41 -0800 (PST)
From: Seyediman Seyedarab <imandevel@gmail.com>
X-Google-Original-From: Seyediman Seyedarab <ImanDevel@gmail.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Seyediman Seyedarab <ImanDevel@gmail.com>
Subject: [PATCH v2] kbuild: fix argument parsing in scripts/config
Date: Sat,  1 Mar 2025 17:21:37 -0500
Message-ID: <20250301222137.18617-1-ImanDevel@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script previously assumed --file was always the first argument,
which caused issues when it appeared later. This patch updates the
parsing logic to scan all arguments to find --file, sets the config
file correctly, and resets the argument list with the remaining
commands.

It also fixes --refresh to respect --file by passing KCONFIG_CONFIG=$FN
to make oldconfig.

Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
---
Changes in v2:
Specified the script name in the commit message.

 scripts/config | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/scripts/config b/scripts/config
index ff88e2faefd3..ea475c07de28 100755
--- a/scripts/config
+++ b/scripts/config
@@ -32,6 +32,7 @@ commands:
                              Disable option directly after other option
 	--module-after|-M beforeopt option
                              Turn option into module directly after other option
+	--refresh            Refresh the config using old settings
 
 	commands can be repeated multiple times
 
@@ -124,16 +125,22 @@ undef_var() {
 	txt_delete "^# $name is not set" "$FN"
 }
 
-if [ "$1" = "--file" ]; then
-	FN="$2"
-	if [ "$FN" = "" ] ; then
-		usage
+FN=.config
+CMDS=()
+while [[ $# -gt 0 ]]; do
+	if [ "$1" = "--file" ]; then
+		if [ "$2" = "" ]; then
+			usage
+		fi
+		FN="$2"
+		shift 2
+	else
+		CMDS+=("$1")
+		shift
 	fi
-	shift 2
-else
-	FN=.config
-fi
+done
 
+set -- "${CMDS[@]}"
 if [ "$1" = "" ] ; then
 	usage
 fi
@@ -217,9 +224,8 @@ while [ "$1" != "" ] ; do
 		set_var "${CONFIG_}$B" "${CONFIG_}$B=m" "${CONFIG_}$A"
 		;;
 
-	# undocumented because it ignores --file (fixme)
 	--refresh)
-		yes "" | make oldconfig
+		yes "" | make oldconfig KCONFIG_CONFIG=$FN
 		;;
 
 	*)
-- 
2.48.1


