Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF711CD097
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2020 06:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbgEKEXP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 May 2020 00:23:15 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:29748 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgEKEXP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 May 2020 00:23:15 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04B4LsSl009856;
        Mon, 11 May 2020 13:21:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04B4LsSl009856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589170915;
        bh=bEd3hBdLhKUwiRkpNdiCa9W/1TH8Wtl6cdq8NlrF14Q=;
        h=From:To:Cc:Subject:Date:From;
        b=befzyPqsVsx2syuhFxp9p3bHbYTwnF9na1iJjkcFtrZuEsAUiCR57FjAh2LZgozLt
         QYSv3U1HPIqe523P/m7N96jfhZY+htjvMmQz9gyGuqtNJOEM1uZw4LXN7yfrt99sqM
         54xQ5cy4vDKxFWuwxjkv4dwsUEBsom3FPn2eOQ+IRunljIYd4cye/W/qXOh5tHDQPg
         AWOmbnh69qkGpCKA54DyuoioAD4uc8S8KillSpfPNB5Z4I6EgSmbkOGp2NAB1M3tQr
         HY5lVGMR3BV1vNsk2DPlZttslCSi89jcjeFHSzmo9MrE3FGUp+CzCvX1li/2OgvE+P
         /OXaJCnUw8w5g==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: make module name conflict fatal error
Date:   Mon, 11 May 2020 13:21:49 +0900
Message-Id: <20200511042149.1712876-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I think all the warnings have been fixed by now. Make it a fatal error.

Check it before modpost because we need to stop building *.ko files.
Also, pass modules.order via a script parameter.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 |  7 +++++--
 scripts/modules-check.sh | 16 +++++++++++++---
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 1162cb04860c..a2e4d0945500 100644
--- a/Makefile
+++ b/Makefile
@@ -1328,9 +1328,12 @@ all: modules
 # using awk while concatenating to the final file.
 
 PHONY += modules
-modules: $(if $(KBUILD_BUILTIN),vmlinux) modules.order
+modules: $(if $(KBUILD_BUILTIN),vmlinux) modules_check
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
+
+PHONY += modules_check
+modules_check: modules.order
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh $<
 
 modules.order: descend
 	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(build-dirs)) > $@
diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index f51f446707b8..43de226071ae 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -3,14 +3,24 @@
 
 set -e
 
+if [ $# != 1 ]; then
+	echo "Usage: $0 <modules.order>" >& 2
+	exit 1
+fi
+
+exit_code=0
+
 # Check uniqueness of module names
 check_same_name_modules()
 {
-	for m in $(sed 's:.*/::' modules.order | sort | uniq -d)
+	for m in $(sed 's:.*/::' $1 | sort | uniq -d)
 	do
-		echo "warning: same module names found:" >&2
+		echo "error: the following would cause module name conflict:" >&2
 		sed -n "/\/$m/s:^:  :p" modules.order >&2
+		exit_code=1
 	done
 }
 
-check_same_name_modules
+check_same_name_modules "$1"
+
+exit $exit_code
-- 
2.25.1

