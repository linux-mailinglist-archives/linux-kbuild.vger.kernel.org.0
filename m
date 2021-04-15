Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B23C361127
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 19:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbhDORgf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 13:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233395AbhDORgf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 13:36:35 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A93C061574;
        Thu, 15 Apr 2021 10:36:10 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id k128so12901616wmk.4;
        Thu, 15 Apr 2021 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JjfztyTsL8rG5+j4jieAZ/yGI7MaHK8bmqCl1A5flW8=;
        b=NQlBHDELhlvSKzqr28t98+RaGsx7SHCcmnJgdfVhIqwnUMLXTOpmuUyCrGrsyYtXuk
         9Y/WIe9bU338e5YQGu4qKDlL7m+u9OCjnbv4+9C+Yj11QMgEghg4+O7gLPtAswDi8SJV
         sMoUx8vcGB3z/QVpKurCVYsaGnDKPM3ZfkWym9eZbbbVerSuvFzYVQsIGfcxydkADvac
         x43sjNRP2ht4avmefm6Qgy6MU0gSJ/Dq1HApkrhlhpc5g9S0ZP5yv1JvsQebXb5Icdo+
         3sm/fu1myoq2Mewls32D99g6dPwjREAix3puv0jOtYZpTDmBeuz2kHbCssSOcktYAlh/
         So8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JjfztyTsL8rG5+j4jieAZ/yGI7MaHK8bmqCl1A5flW8=;
        b=imuRyEXY573y7A+l/Okl2F+hh73AE0XMoLJycA5++geHQHDF6tv4scCZ83C/JdhAPf
         hFxpqKueCR4IEayRng4/QTg8YUmviwQ2blEHVCnBY8t4/rIqstXxzroVZO7IgETmTdSV
         Id9ZOZH1udvd1U2UR+lJyzlVSjFzI1rbA5lfrWwDMO4/p/Gi8zRtHOtONg+FESpBmn4i
         hor9stg2G5Se/r5PxAM5LLBSg9tdYHKXER7da4s4qNpOozdjPgOxWuOGRo4E4ZbZBmrt
         NaEvJvYXB1FOgjy+T3UhtJ/OeeDUPBUN/qntyeKFZqtauPtQnVL8LctLNw38ZNfF1unh
         xFfA==
X-Gm-Message-State: AOAM531UgTuX7GYftlEflBYYInQkg+Gl1/SXazNKlcl2eANcSnqg0k7Z
        cBIY9ELI5GqlW1s6VzdS3PXSFbp5vw==
X-Google-Smtp-Source: ABdhPJxQQQhuuyHCV60Am75GBGTJ5CIOqD5PsmKhwIGv04LZRn7K9UvvV/hpIvQYZhiVzJSBY0Z5Rw==
X-Received: by 2002:a1c:f618:: with SMTP id w24mr4220076wmc.93.1618508169476;
        Thu, 15 Apr 2021 10:36:09 -0700 (PDT)
Received: from localhost.localdomain ([46.53.252.24])
        by smtp.gmail.com with ESMTPSA id r22sm3817089wmh.11.2021.04.15.10.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 10:36:09 -0700 (PDT)
Date:   Thu, 15 Apr 2021 20:36:07 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2] kconfig: redo fake deps at include/config/*.h
Message-ID: <YHh5h7s52/Lqzlkn@localhost.localdomain>
References: <YHdmNrKFp1HqkfVR@localhost.localdomain>
 <CAK7LNARXt=9-Jw+0dTRhUhkS+r8N6U+m+of5OPEtK7i1XpHzkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARXt=9-Jw+0dTRhUhkS+r8N6U+m+of5OPEtK7i1XpHzkQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Make include/config/foo/bar.h fake deps files generation simpler.

* delete .h suffix
	those aren't header files, shorten filenames,

* delete tolower()
	Linux filesystems can deal with both upper and lowercase
	filenames very well,

* put everything in 1 directory
	Presumably 'mkdir -p' split is from dark times when filesystems
	handled huge directories badly, disks were round adding to
	seek times.

	x86_64 allmodconfig lists 12364 files in include/config.

	../obj/include/config/
	├── 104_QUAD_8
	├── 60XX_WDT
	├── 64BIT
		...
	├── ZSWAP_DEFAULT_ON
	├── ZSWAP_ZPOOL_DEFAULT
	└── ZSWAP_ZPOOL_DEFAULT_ZBUD

	0 directories, 12364 files

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 include/linux/compiler-version.h |    2 +-
 init/Kconfig                     |    2 +-
 kernel/gen_kheaders.sh           |    2 +-
 scripts/Makefile.build           |    4 ++--
 scripts/basic/fixdep.c           |   39 ++++-----------------------------------
 scripts/kconfig/confdata.c       |   15 +++++----------
 6 files changed, 14 insertions(+), 50 deletions(-)

--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -9,6 +9,6 @@
  * This header exists to force full rebuild when the compiler is upgraded.
  *
  * When fixdep scans this, it will find this string "CONFIG_CC_VERSION_TEXT"
- * and add dependency on include/config/cc/version/text.h, which is touched
+ * and add dependency on include/config/CC_VERSION_TEXT, which is touched
  * by Kconfig when the version string from the compiler changes.
  */
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -21,7 +21,7 @@ config CC_VERSION_TEXT
 
 	  - Ensure full rebuild when the compiler is updated
 	    include/linux/compiler-version.h contains this option in the comment
-	    line so fixdep adds include/config/cc/version/text.h into the
+	    line so fixdep adds include/config/CC_VERSION_TEXT into the
 	    auto-generated dependency. When the compiler is updated, syncconfig
 	    will touch it and then every file will be rebuilt.
 
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -36,7 +36,7 @@ all_dirs="$all_dirs $dir_list"
 #
 # When Kconfig regenerates include/generated/autoconf.h, its timestamp is
 # updated, but the contents might be still the same. When any CONFIG option is
-# changed, Kconfig touches the corresponding timestamp file include/config/*.h.
+# changed, Kconfig touches the corresponding timestamp file include/config/*.
 # Hence, the md5sum detects the configuration change anyway. We do not need to
 # check include/generated/autoconf.h explicitly.
 #
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -238,8 +238,8 @@ endif # CONFIG_STACK_VALIDATION
 
 # Rebuild all objects when objtool changes, or is enabled/disabled.
 objtool_dep = $(objtool_obj)					\
-	      $(wildcard include/config/orc/unwinder.h		\
-			 include/config/stack/validation.h)
+	      $(wildcard include/config/ORC_UNWINDER		\
+			 include/config/STACK_VALIDATION)
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 cmd_gen_ksymdeps = \
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -34,7 +34,7 @@
  * the config symbols are rebuilt.
  *
  * So if the user changes his CONFIG_HIS_DRIVER option, only the objects
- * which depend on "include/config/his/driver.h" will be rebuilt,
+ * which depend on "include/config/HIS_DRIVER" will be rebuilt,
  * so most likely only his driver ;-)
  *
  * The idea above dates, by the way, back to Michael E Chastain, AFAIK.
@@ -74,7 +74,7 @@
  *
  * and then basically copies the .<target>.d file to stdout, in the
  * process filtering out the dependency on autoconf.h and adding
- * dependencies on include/config/my/option.h for every
+ * dependencies on include/config/MY_OPTION for every
  * CONFIG_MY_OPTION encountered in any of the prerequisites.
  *
  * We don't even try to really parse the header files, but
@@ -124,38 +124,6 @@ static void xprintf(const char *format, ...)
 	va_end(ap);
 }
 
-static void xputchar(int c)
-{
-	int ret;
-
-	ret = putchar(c);
-	if (ret == EOF) {
-		perror("fixdep");
-		exit(1);
-	}
-}
-
-/*
- * Print out a dependency path from a symbol name
- */
-static void print_dep(const char *m, int slen, const char *dir)
-{
-	int c, prev_c = '/', i;
-
-	xprintf("    $(wildcard %s/", dir);
-	for (i = 0; i < slen; i++) {
-		c = m[i];
-		if (c == '_')
-			c = '/';
-		else
-			c = tolower(c);
-		if (c != '/' || prev_c != '/')
-			xputchar(c);
-		prev_c = c;
-	}
-	xprintf(".h) \\\n");
-}
-
 struct item {
 	struct item	*next;
 	unsigned int	len;
@@ -220,7 +188,8 @@ static void use_config(const char *m, int slen)
 	    return;
 
 	define_config(m, slen, hash);
-	print_dep(m, slen, "include/config");
+	/* Print out a dependency path from a symbol name. */
+	xprintf("    $(wildcard include/config/%.*s) \\\n", slen, m);
 }
 
 /* test if s ends in sub */
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -130,19 +130,14 @@ static size_t depfile_prefix_len;
 static int conf_touch_dep(const char *name)
 {
 	int fd, ret;
-	const char *s;
-	char *d, c;
+	char *d;
 
-	/* check overflow: prefix + name + ".h" + '\0' must fit in buffer. */
-	if (depfile_prefix_len + strlen(name) + 3 > sizeof(depfile_path))
+	/* check overflow: prefix + name + '\0' must fit in buffer. */
+	if (depfile_prefix_len + strlen(name) + 1 > sizeof(depfile_path))
 		return -1;
 
 	d = depfile_path + depfile_prefix_len;
-	s = name;
-
-	while ((c = *s++))
-		*d++ = (c == '_') ? '/' : tolower(c);
-	strcpy(d, ".h");
+	strcpy(d, name);
 
 	/* Assume directory path already exists. */
 	fd = open(depfile_path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
@@ -465,7 +460,7 @@ int conf_read_simple(const char *name, int def)
 					 * Reading from include/config/auto.conf
 					 * If CONFIG_FOO previously existed in
 					 * auto.conf but it is missing now,
-					 * include/config/foo.h must be touched.
+					 * include/config/FOO must be touched.
 					 */
 					conf_touch_dep(line + strlen(CONFIG_));
 				else
