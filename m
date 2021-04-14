Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74A235FD87
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 00:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhDNWBx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 18:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbhDNWBv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 18:01:51 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919DDC06175F;
        Wed, 14 Apr 2021 15:01:29 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id s7so21166051wru.6;
        Wed, 14 Apr 2021 15:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=FAGNlCOd0wF83qmtqyhrB5/0f/HHXqiabR5Gj8rrqJE=;
        b=gO4jRfFfFwHU9yKsW+sB3vsflayIPAOeX1icy6miGR6MjkntlJ9u9fB3lC3MYpc8y0
         GRpL009GuTuGacZ+e3hMcFoYd/zXl1gKHDUoWFCYMekrLQwzqHtMMbXNgZrXWRNQU1WH
         Oq/ScSbIKNTwSIfHhAPj2L0y3f2zc8H99z3qx7Au3Ave0FjUbPVgj/yFEvbKQon/SLnc
         H81B/SnbhLrZNd2Q7hrBWfScjSjkmEBUgBIuLf2Zn9EU7QWj+V6dvGKffUiSuTIWtDy2
         +NBo40Ib+Guq9iDHgs99x8++9Q9hOh6nV18s5tYg5PpQqewfjfIPWAbejItiJ87vvzey
         zXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=FAGNlCOd0wF83qmtqyhrB5/0f/HHXqiabR5Gj8rrqJE=;
        b=rGFKi1gL6oQ8xNmvWrwL24LmiasOo1YXSWe+u8JY/Uj6NQFFstpk52GHLU5NeRThBk
         +rpEhuCdNU1bP0+cNquCSYLrTolzqQu35PAO0XQnTdIB9tmaIxCsAJmGkP1IDcR828Zn
         5SWwNoaowO7KTLaDkKO9WUEf8ObNpzYmwUgCwCvCLXGBHEELFGzBIcr2H46Oh4OxRiHY
         obtHxFoXruwGQnJyGzDwr7hJFQRxopeMbceTKVmkICh4E0XvxYNkk1cyX87Wm2x/ijWv
         kQuH/0ETwmJtacs6puwriw0Axig9gzeMrnyQfninlMgJwLXt14V99Y06NRig5hGdyU8P
         7FHg==
X-Gm-Message-State: AOAM531aw3Ao2fQmHkMA8R53hsQ7LBLUqA9bsZjXHHtLiPSjOo60cnhd
        CqGybjTD/vJDlAILw5q/5g==
X-Google-Smtp-Source: ABdhPJwXGHY97jKwhTzjslBMG2BW/7LCHuDXTpLFLHj3pa+HuIz2MoKzaWP/e/+NvlMNq3n5vhOAyQ==
X-Received: by 2002:a5d:47c4:: with SMTP id o4mr52335wrc.138.1618437688372;
        Wed, 14 Apr 2021 15:01:28 -0700 (PDT)
Received: from localhost.localdomain ([46.53.253.139])
        by smtp.gmail.com with ESMTPSA id c2sm514490wmr.22.2021.04.14.15.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 15:01:27 -0700 (PDT)
Date:   Thu, 15 Apr 2021 01:01:26 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     masahiroy@kernel.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        akpm@linux-foundation.org
Subject: [PATCH] kconfig: redo fake deps at include/config/*.h
Message-ID: <YHdmNrKFp1HqkfVR@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
	├── 6LOWPAN
	├── 6LOWPAN_DEBUGFS
	├── 6LOWPAN_GHC_EXT_HDR_DEST
	├── 6LOWPAN_GHC_EXT_HDR_FRAG
	├── 6LOWPAN_GHC_EXT_HDR_HOP
	├── 6LOWPAN_GHC_EXT_HDR_ROUTE

		...
	├── ZSTD_COMPRESS
	├── ZSTD_DECOMPRESS
	├── ZSWAP
	├── ZSWAP_COMPRESSOR_DEFAULT
	├── ZSWAP_COMPRESSOR_DEFAULT_LZO
	├── ZSWAP_DEFAULT_ON
	├── ZSWAP_ZPOOL_DEFAULT
	└── ZSWAP_ZPOOL_DEFAULT_ZBUD

	0 directories, 12364 files

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 include/linux/compiler-version.h |    2 +-
 init/Kconfig                     |    2 +-
 scripts/Makefile.build           |    4 ++--
 scripts/basic/fixdep.c           |   30 +++---------------------------
 scripts/kconfig/confdata.c       |   11 +++--------
 5 files changed, 10 insertions(+), 39 deletions(-)

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
@@ -124,36 +124,12 @@ static void xprintf(const char *format, ...)
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
 /*
  * Print out a dependency path from a symbol name
  */
 static void print_dep(const char *m, int slen, const char *dir)
 {
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
+	xprintf("    $(wildcard %s/%.*s) \\\n", dir, slen, m);
 }
 
 struct item {
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -130,19 +130,14 @@ static size_t depfile_prefix_len;
 static int conf_touch_dep(const char *name)
 {
 	int fd, ret;
-	const char *s;
-	char *d, c;
+	char *d;
 
 	/* check overflow: prefix + name + ".h" + '\0' must fit in buffer. */
 	if (depfile_prefix_len + strlen(name) + 3 > sizeof(depfile_path))
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
