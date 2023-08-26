Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F88678942C
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Aug 2023 09:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbjHZHOe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 26 Aug 2023 03:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbjHZHOK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 26 Aug 2023 03:14:10 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B85AF2133
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Aug 2023 00:14:07 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bf7423ef3eso11629705ad.3
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Aug 2023 00:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693034047; x=1693638847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bw2vMsREcv77KurmsfcR7swCy8AJPq+KbriFrDX4PYQ=;
        b=D5u2AjQcDsFKZ6gyFgKYdA9ekITPYtKILfZSMR7BD+CCW7jwDfa4AJNc3myvWKf/5h
         6Vqhap2NyOYTqzndBtHoV97TuEvbpv8noHIpPRD6OEJ9n/iM/N4z6Co6mVNFwrmNcuwo
         WbqCmVPC42aUHOiNMQpu7109NZzp6PnpR9pdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693034047; x=1693638847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw2vMsREcv77KurmsfcR7swCy8AJPq+KbriFrDX4PYQ=;
        b=Pu3PcplSlZrm8cvE/jXfggovaWM6lXB+RyIMj2NlaYWHoUGk9RniXaHuo2GBDtTLcZ
         J9FBYINF0Xv3IU+hIK51newnlda8rhh1xOKAlRgI1mHcQv2nWamONkc9IP4dx3JT6YpV
         6TvImg7BY8X+i7JfVS0HfEgMsmSfR9V8mfZgP8qIibORK+r4oCoLDjH7ZWhDWbDk4f7L
         8tjmSaOJ0PSDEPD9NeS2ghG1a1J4jC5Jc0lRb9JYsVoqHFSao0cpFZ2BlKJlB5GEcfD8
         nxmAhfSoN1WLTwYEBidnV5lZSNFb8OhOTp/vXFH+WT+Wx9zm7A7f57taZL3SCWQlBILE
         eq8w==
X-Gm-Message-State: AOJu0YyTQRW/lVxqAcTRZ3Rh46fz0eoB7u8E29MSLJtP6Lj52VtjdXj0
        IfwbYQJZqCWJL7v1uad8qXZ+4A==
X-Google-Smtp-Source: AGHT+IEPE5/mQHDL2cI1rWkGWf1H9bzL0SNhk927KOlXZzcOKt4MQ0Y+aaiCAigt2QWS9leNJjdupA==
X-Received: by 2002:a17:902:e888:b0:1bd:edac:af44 with SMTP id w8-20020a170902e88800b001bdedacaf44mr21152605plg.51.1693034047207;
        Sat, 26 Aug 2023 00:14:07 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:e5a4:5dc1:67ab:c8f5])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001bc68602e54sm2986168pln.142.2023.08.26.00.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 00:14:06 -0700 (PDT)
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] kconfig: add warn-unknown-symbols sanity check
Date:   Sat, 26 Aug 2023 16:13:52 +0900
Message-ID: <20230826071359.2060501-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Introduce KCONFIG_WARN_UNKNOWN_SYMBOLS environment variable,
which makes Kconfig warn about unknown .config symbols.

This is especially useful for continuous kernel uprevs when
some symbols can be either removed or renamed between kernel
releases (which can go unnoticed otherwise).

By default KCONFIG_WARN_UNKNOWN_SYMBOLS generates warnings,
which are non-terminal. There is an additional environment
variable KCONFIG_WERROR that overrides this behaviour and
turns warnings into errors.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 Documentation/kbuild/kconfig.rst | 11 +++++++++++
 scripts/kconfig/confdata.c       | 23 +++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index 6530ecd99da3..4de1f5435b7b 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -56,6 +56,17 @@ KCONFIG_OVERWRITECONFIG
 If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
 break symlinks when .config is a symlink to somewhere else.
 
+KCONFIG_WARN_UNKNOWN_SYMBOLS
+----------------------------
+This environment variable makes Kconfig warn about all unrecognized
+symbols in the .config file.
+
+KCONFIG_WERROR
+--------------
+If set, Kconfig will treat `KCONFIG_WARN_UNKNOWN_SYMBOLS` warnings as
+errors.
+
+
 `CONFIG_`
 ---------
 If you set `CONFIG_` in the environment, Kconfig will prefix all symbols
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 992575f1e976..c24f637827fe 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -349,7 +349,12 @@ int conf_read_simple(const char *name, int def)
 	char *p, *p2;
 	struct symbol *sym;
 	int i, def_flags;
+	bool found_unknown = false;
+	const char *warn_unknown;
+	const char *werror;
 
+	warn_unknown = getenv("KCONFIG_WARN_UNKNOWN_SYMBOLS");
+	werror = getenv("KCONFIG_WERROR");
 	if (name) {
 		in = zconf_fopen(name);
 	} else {
@@ -437,6 +442,13 @@ int conf_read_simple(const char *name, int def)
 			if (def == S_DEF_USER) {
 				sym = sym_find(line + 2 + strlen(CONFIG_));
 				if (!sym) {
+					if (warn_unknown) {
+						conf_warning("unknown symbol: %s",
+							     line + 2 + strlen(CONFIG_));
+						found_unknown = true;
+						continue;
+					}
+
 					conf_set_changed(true);
 					continue;
 				}
@@ -471,6 +483,13 @@ int conf_read_simple(const char *name, int def)
 
 			sym = sym_find(line + strlen(CONFIG_));
 			if (!sym) {
+				if (warn_unknown && def != S_DEF_AUTO) {
+					conf_warning("unknown symbol: %s",
+						     line + strlen(CONFIG_));
+					found_unknown = true;
+					continue;
+				}
+
 				if (def == S_DEF_AUTO)
 					/*
 					 * Reading from include/config/auto.conf
@@ -519,6 +538,10 @@ int conf_read_simple(const char *name, int def)
 	}
 	free(line);
 	fclose(in);
+
+	if (found_unknown && werror)
+		exit(1);
+
 	return 0;
 }
 
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

