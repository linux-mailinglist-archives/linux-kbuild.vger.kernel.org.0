Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C23986DFC8
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jul 2019 06:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfGSEhb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jul 2019 00:37:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:59802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728967AbfGSEAA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jul 2019 00:00:00 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 976E8218A3;
        Fri, 19 Jul 2019 03:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563508799;
        bh=gRwU8Ad+q7ah0c5cfg+KjB1NnhI4v/yX8xGvX/agMaM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rY+xyvFejigLGALtHU0XegMII7EHTTsFJyT1dlKiHh/MZt/bkJHsbIgtoNXhcuFZE
         e4t1tBUfYvBBVDw5G/WAkMGMSGR7wf8tZVM74vOD4JEcCMMvayjSehriN/4FYqni1W
         Iqwx/R+2/KbAJf9F7P1KMeuX08WNx1bR6WgXEaUI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 095/171] fixdep: check return value of printf() and putchar()
Date:   Thu, 18 Jul 2019 23:55:26 -0400
Message-Id: <20190719035643.14300-95-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719035643.14300-1-sashal@kernel.org>
References: <20190719035643.14300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit 6f9ac9f4427ec0470ccffbf852cfaf326677cc21 ]

When there is not enough space on your storage device, the build will
fail with 'No space left on device' error message.

The reason is obvious from the message, so you will free up some disk
space, then you will resume the build.

However, sometimes you may still see a mysterious error message:

  unterminated call to function 'wildcard': missing ')'.

If you run out of the disk space, fixdep may end up with generating
incomplete .*.cmd files.

For example, if the disk-full error occurs while fixdep is running
print_dep(), the .*.cmd might be truncated like this:

   $(wildcard include/config/

When you run 'make' next time, this broken .*.cmd will be included,
then Make will terminate parsing since it is a wrong syntax.

Once this happens, you need to run 'make clean' or delete the broken
.*.cmd file manually.

Even if you do not see any error message, the .*.cmd files after any
error could be potentially incomplete, and unreliable. You may miss
the re-compilation due to missing header dependency.

If printf() cannot output the string for disk shortage or whatever
reason, it returns a negative value, but currently fixdep does not
check it at all. Consequently, fixdep *successfully* generates a
broken .*.cmd file. Make never notices that since fixdep exits with 0,
which means success.

Given the intended usage of fixdep, it must respect the return value
of not only malloc(), but also printf() and putchar().

This seems a long-standing issue since the introduction of fixdep.

In old days, Kbuild tried to provide an extra safety by letting fixdep
output to a temporary file and renaming it after everything is done:

  scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(dot-target).tmp;\
  rm -f $(depfile);                                                    \
  mv -f $(dot-target).tmp $(dot-target).cmd)

It was no help to avoid the current issue; fixdep successfully created
a truncated tmp file, which would be renamed to a .*.cmd file.

This problem should be fixed by propagating the error status to the
build system because:

[1] Since commit 9c2af1c7377a ("kbuild: add .DELETE_ON_ERROR special
    target"), Make will delete the target automatically on any failure
    in the recipe.

[2] Since commit 392885ee82d3 ("kbuild: let fixdep directly write to
    .*.cmd files"), .*.cmd file is included only when the corresponding
    target already exists.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/basic/fixdep.c | 51 +++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index facbd603adf6..9ba47b0a47b9 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -99,6 +99,7 @@
 #include <unistd.h>
 #include <fcntl.h>
 #include <string.h>
+#include <stdarg.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <ctype.h>
@@ -109,6 +110,36 @@ static void usage(void)
 	exit(1);
 }
 
+/*
+ * In the intended usage of this program, the stdout is redirected to .*.cmd
+ * files. The return value of printf() and putchar() must be checked to catch
+ * any error, e.g. "No space left on device".
+ */
+static void xprintf(const char *format, ...)
+{
+	va_list ap;
+	int ret;
+
+	va_start(ap, format);
+	ret = vprintf(format, ap);
+	if (ret < 0) {
+		perror("fixdep");
+		exit(1);
+	}
+	va_end(ap);
+}
+
+static void xputchar(int c)
+{
+	int ret;
+
+	ret = putchar(c);
+	if (ret == EOF) {
+		perror("fixdep");
+		exit(1);
+	}
+}
+
 /*
  * Print out a dependency path from a symbol name
  */
@@ -116,7 +147,7 @@ static void print_dep(const char *m, int slen, const char *dir)
 {
 	int c, prev_c = '/', i;
 
-	printf("    $(wildcard %s/", dir);
+	xprintf("    $(wildcard %s/", dir);
 	for (i = 0; i < slen; i++) {
 		c = m[i];
 		if (c == '_')
@@ -124,10 +155,10 @@ static void print_dep(const char *m, int slen, const char *dir)
 		else
 			c = tolower(c);
 		if (c != '/' || prev_c != '/')
-			putchar(c);
+			xputchar(c);
 		prev_c = c;
 	}
-	printf(".h) \\\n");
+	xprintf(".h) \\\n");
 }
 
 struct item {
@@ -324,13 +355,13 @@ static void parse_dep_file(char *m, const char *target)
 				 */
 				if (!saw_any_target) {
 					saw_any_target = 1;
-					printf("source_%s := %s\n\n",
-					       target, m);
-					printf("deps_%s := \\\n", target);
+					xprintf("source_%s := %s\n\n",
+						target, m);
+					xprintf("deps_%s := \\\n", target);
 				}
 				is_first_dep = 0;
 			} else {
-				printf("  %s \\\n", m);
+				xprintf("  %s \\\n", m);
 			}
 
 			buf = read_file(m);
@@ -353,8 +384,8 @@ static void parse_dep_file(char *m, const char *target)
 		exit(1);
 	}
 
-	printf("\n%s: $(deps_%s)\n\n", target, target);
-	printf("$(deps_%s):\n", target);
+	xprintf("\n%s: $(deps_%s)\n\n", target, target);
+	xprintf("$(deps_%s):\n", target);
 }
 
 int main(int argc, char *argv[])
@@ -369,7 +400,7 @@ int main(int argc, char *argv[])
 	target = argv[2];
 	cmdline = argv[3];
 
-	printf("cmd_%s := %s\n\n", target, cmdline);
+	xprintf("cmd_%s := %s\n\n", target, cmdline);
 
 	buf = read_file(depfile);
 	parse_dep_file(buf, target);
-- 
2.20.1

