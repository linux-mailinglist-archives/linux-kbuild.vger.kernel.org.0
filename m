Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46D281A365
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 21:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbfEJT24 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 15:28:56 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44275 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbfEJT24 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 15:28:56 -0400
Received: by mail-pg1-f194.google.com with SMTP id z16so3456189pgv.11
        for <linux-kbuild@vger.kernel.org>; Fri, 10 May 2019 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ualberta-ca.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=qMnUdYLZmFExJ+hHXsoAzxxjCVfYuwBhrdITveBsfzY=;
        b=gsn7BZr8oUYYfJiiMC0a1WV7LZPlxlE3om8MZdzzPecbHDog+2ke60hXNHFDFaso1y
         i7NdlhWyJN0vwBtd51lEzr6RRw5aO2BjX9my1gWYUdLTLXNgEHhEOtj+Ozk0xsaPo8cQ
         CbLfn6eYXHnNlwb8ix+/jMEPsH2MzlGbFEEsV5KA7M92OtKzErVDzgsUyqosoXv7XHmI
         x8gC1QUutkrHPp11/0hhAGG/i3zGMVEGZNY9eFsIfIIIkLs5MoX5r6/tcigJGfuTeeqm
         7jjL7XWXJs1ff45HEzt5XhuiT+ycvVjwM9srHcedL5ctdABBeA+hpoUIH/xS5lDalE2S
         EpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=qMnUdYLZmFExJ+hHXsoAzxxjCVfYuwBhrdITveBsfzY=;
        b=ZCSP7/LF0dCp0GwTx9fAyxz6Tdg0iVrUXCJ0OQ7RN85a1JyMnx6HjZDSbvrs7z4mQX
         +//XFhrQTuqCZGKEPTTwYK15ffOvgowsRbweL32ALqwj/tHzaXOoWQdaR+YJA1CU1Jbh
         RGmagcaKClR8Zn57SitzTmcO732jMauNwmcA/qXK2DVVc1QmQTQA3RL9sR9vsrggFrsH
         Sd1KnNRuhjzXgZohvuH5zzHq5pOOq6N3u/4xAWxju/X4zp55OMHsT98W04QuA7U3ZRG5
         gotm+lR2RoqxKTVWg8iJe64jPaLrF2sFkaGHmX0fC1kkxhsKHbh4qlRTmCpFlLdIg+MU
         d0cg==
X-Gm-Message-State: APjAAAUDVHVQSp0mPt3tFJJuM+mt1XEizeYJu7dcPWBMkUjZZ6ANKaGn
        HlVnzPOHJ7Yvj/jyJKs0HClcHniZdcVnKgvd
X-Google-Smtp-Source: APXvYqxZCZSi9VasWx0yzJyq9eqbQo7dKjq0T3RikLOG5bE3RiAOz6BLsv/REyr45uafgS4v6PP3Dg==
X-Received: by 2002:aa7:8052:: with SMTP id y18mr16700919pfm.36.1557516535007;
        Fri, 10 May 2019 12:28:55 -0700 (PDT)
Received: from localhost ([157.230.165.46])
        by smtp.gmail.com with ESMTPSA id p12sm6923648pgg.26.2019.05.10.12.28.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 10 May 2019 12:28:54 -0700 (PDT)
Date:   Fri, 10 May 2019 13:28:52 -0600
From:   Jacob Garber <jgarber1@ualberta.ca>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jacob Garber <jgarber1@ualberta.ca>
Subject: [PATCH] kconfig: use snprintf for formatting pathnames
Message-ID: <20190510192852.4dwfeicp3ebv3epm@ualberta.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Valid pathnames will never exceed PATH_MAX, but these file names
are unsanitized and can cause buffer overflow if set incorrectly.
Use snprintf to avoid this. This was flagged during a Coverity scan
of the coreboot project, which also uses kconfig for its build system.

Signed-off-by: Jacob Garber <jgarber1@ualberta.ca>
---
 scripts/kconfig/confdata.c | 7 ++++---
 scripts/kconfig/lexer.l    | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 08ba146a8..847fe428a 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -194,7 +194,7 @@ char *conf_get_default_confname(void)
 	name = expand_string(conf_defname);
 	env = getenv(SRCTREE);
 	if (env) {
-		sprintf(fullname, "%s/%s", env, name);
+		snprintf(fullname, sizeof(fullname), "%s/%s", env, name);
 		if (is_present(fullname))
 			return fullname;
 	}
@@ -843,10 +843,11 @@ int conf_write(const char *name)
 	} else
 		basename = conf_get_configname();
 
-	sprintf(newname, "%s%s", dirname, basename);
+	snprintf(newname, sizeof(newname), "%s%s", dirname, basename);
 	env = getenv("KCONFIG_OVERWRITECONFIG");
 	if (!env || !*env) {
-		sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
+		snprintf(tmpname, sizeof(tmpname),
+			 "%s.tmpconfig.%d", dirname, (int)getpid());
 		out = fopen(tmpname, "w");
 	} else {
 		*tmpname = 0;
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index c9df1c8b9..6354c905b 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -378,7 +378,8 @@ FILE *zconf_fopen(const char *name)
 	if (!f && name != NULL && name[0] != '/') {
 		env = getenv(SRCTREE);
 		if (env) {
-			sprintf(fullname, "%s/%s", env, name);
+			snprintf(fullname, sizeof(fullname),
+				 "%s/%s", env, name);
 			f = fopen(fullname, "r");
 		}
 	}
-- 
2.21.0

