Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76E85523CC
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2019 08:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbfFYGy4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Jun 2019 02:54:56 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:38726 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfFYGyz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 02:54:55 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x5P6sbLb032133;
        Tue, 25 Jun 2019 15:54:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x5P6sbLb032133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561445678;
        bh=TNZgQbXRguicaXB5bK2OEDuofgSIJ5TA0+AwdgEkL6g=;
        h=From:To:Cc:Subject:Date:From;
        b=TjjEtn2y1PhsEii0RP4Ve84DpJCRGnRxyRSMcnnQ7hQ0FaLCZcrG8fFKDbp3HpNqn
         qYaAtd9kBBcicrfVztRJLaZja3rNYSiZ5tGePV8kKtkseRaI2N/VZkU4QSW7wJYyen
         xskbrArpZToD/W6mPosxq9zwweCDMXfCSsHtjNF91l9TjjcFbJ8YGdPXxtAcuPLYGf
         zjuW8AnamobAPG1Ea6fr3z7kQxrsgQ4R36w36tZyX4TtvIDZOzGNtdEl7LL4STp/5L
         twJmrUXfg5VN8xvW2KhCqLZQSSheY9qh0OpJCcgrR27HRKsQCzWAwR/Ik7cNpmrTGJ
         DAUwTPdzwcn3w==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] fixdep: check return value of printf() and putchar()
Date:   Tue, 25 Jun 2019 15:54:19 +0900
Message-Id: <20190625065419.26324-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When there is not enough space on your storage device, the build will
fail with 'No space left on device' error message.

The reason is obvious from the message, so you will free up some disk
space, then you will resume the build.

However, sometimes you may still see a mysterious error message:

  unterminated call to function 'wildcard': missing ')'.

If you run out of the disk space, fixdep may end up with generating
incomplete .*.cmd files.

For example, if the disk shortage occurs while fixdep is running
print_dep(), the .*.cmd might be truncated like this:

   $(wildcard include/config/

When you run 'make' next time, this broken .*.cmd will be included,
then GNU Make will terminate parsing since it is a wrong syntax.

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

It did not avoid the current issue; fixdep created a truncated tmp file
reporting success, so the broken tmp would be renamed to a .*.cmd file.

By propagating the error code to the build system, this problem should
be solved because:

[1] Since commit 9c2af1c7377a ("kbuild: add .DELETE_ON_ERROR special
    target"), Make will delete the target automatically on any failure
    in the recipe.

[2] Since commit 392885ee82d3 ("kbuild: let fixdep directly write to
    .*.cmd files"), .*.cmd file is included only when the corresponding
    target already exists.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - Add prror()

 scripts/basic/fixdep.c | 51 +++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index facbd603adf6..4ac973f2dc8c 100644
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
+ * The return value of printf() and putchar() must be checked to catch any
+ * error like "No space left on device".
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
2.17.1

