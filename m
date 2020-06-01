Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3A91E9DC1
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgFAF60 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:26 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40027 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaM7023694;
        Mon, 1 Jun 2020 14:57:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaM7023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991068;
        bh=JWm42uDBESIlwmxMe3fixzXBNn5Kpf5cMwSmCatQK2w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nKwLRGM7ihqMeT0F+2mw540O5BJ+GCnYxhLXTSh0yV4Jh6UVrUwZHnssIEzfCC96n
         ZNqdnso8cELZOw/SH8DHo0ZEoW5JJnH7xpZ2J7yfM9UcrhFeDGGXPi4nLeJOnHVorG
         CjDV8S4WPuUfyf0uBnEaoctzyLaFdW5MfYUzLPyv+d7SV4OyDlQyfKbnkpt26SvR3x
         uW5YFTaDRRz/1m5LGawDbu88YSJPet/vEv/WG27yA9fbBh9DcXPFbprR5ohDSeEa3M
         N0QMCJOEsz8aHhH7oDG3bri9KWulh+t1lsy/B6ldxN8MWsEtI9+DSWyOV4gY6NqvQD
         jpfkPtcoYQsYw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 28/37] modpost: remove -s option
Date:   Mon,  1 Jun 2020 14:57:22 +0900
Message-Id: <20200601055731.3006266-28-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The -s option was added by commit 8d8d8289df65 ("kbuild: do not do
section mismatch checks on vmlinux in 2nd pass").

Now that the second pass does not parse vmlinux, this option is
unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost |  2 +-
 scripts/mod/modpost.c    | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 16fe19724c34..bc9a03e8208d 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -62,7 +62,7 @@ __modpost: vmlinux.symvers
 
 else
 
-MODPOST += -s \
+MODPOST += \
 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
 
 ifeq ($(KBUILD_EXTMOD),)
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 93019349f022..b667f531a645 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -30,8 +30,6 @@ static int have_vmlinux = 0;
 static int all_versions = 0;
 /* If we are modposting external module set to 1 */
 static int external_module = 0;
-/* Warn about section mismatch in vmlinux if set to 1 */
-static int vmlinux_section_warnings = 1;
 /* Only warn about unresolved symbols */
 static int warn_unresolved = 0;
 /* How a symbol is exported */
@@ -2078,8 +2076,7 @@ static void read_symbols(const char *modname)
 		}
 	}
 
-	if (!is_vmlinux(modname) || vmlinux_section_warnings)
-		check_sec_ref(mod, modname, &info);
+	check_sec_ref(mod, modname, &info);
 
 	if (!is_vmlinux(modname)) {
 		version = get_modinfo(&info, "version");
@@ -2576,7 +2573,7 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "ei:mnsT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnT:o:awENd:")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = 1;
@@ -2599,9 +2596,6 @@ int main(int argc, char **argv)
 		case 'a':
 			all_versions = 1;
 			break;
-		case 's':
-			vmlinux_section_warnings = 0;
-			break;
 		case 'T':
 			files_source = optarg;
 			break;
-- 
2.25.1

