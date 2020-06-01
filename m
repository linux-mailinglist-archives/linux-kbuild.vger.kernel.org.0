Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986DF1E9DB2
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgFAF6X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:23 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40002 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLr023694;
        Mon, 1 Jun 2020 14:57:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLr023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991062;
        bh=QeQlYsVShtipD6xSMzcGZNTncldeQ++6rmoWFJayBAU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HWlv/OEQts6qQgmvJCk3Qv2EiAXvhLXJQ26WDU4TH02/HjNJpyxIWeZ46jDfgwhOG
         58UboniRrFY2VzR5EGUCOKS6Q3dtXCKX3r91YidJOpgQ+xy6I9VMhDxAQWSEZci2js
         iidI3AC9G6ZBAoSoS/BHLfTMm105y/nFKkD8JWX+et5kq5NfjfgQEweGi4bDnhMxK5
         JdTTrZpuY1vKXyyb7CuWPF9bITvaxdrS9owoRtxyunjTuMl2QjCUHWIuAHsDsB1gOS
         P47OrGH0SjSLTCYvIRpAf/YbzchdCxaJ7FSKXQGf7dVEXUo3tiSN04JWqhhBcYwuzF
         rRFMPagwKzLpw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 14/37] modpost: re-add -e to set external_module flag
Date:   Mon,  1 Jun 2020 14:57:08 +0900
Message-Id: <20200601055731.3006266-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Previously, the -i option had two functions; load a symbol dump file,
and set the external_module flag.

I want to assign a dedicate option for each of them.

Going forward, the -i is used to load a symbol dump file, and the -e
to set the external_module flag.

With this, we will be able to use -i for loading in-kernel symbols.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 4 ++++
 scripts/mod/modpost.c    | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index e527bf838954..b017085dc91a 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -79,6 +79,10 @@ src := $(obj)
 # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
 include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
+
+# modpost option for external modules
+MODPOST += -e
+
 endif
 
 # modpost options for modules (both in-kernel and external)
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index b8e521f50b2d..4a2f27d97bf1 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2552,10 +2552,12 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "i:mnsT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnsT:o:awENd:")) != -1) {
 		switch (opt) {
-		case 'i':
+		case 'e':
 			external_module = 1;
+			break;
+		case 'i':
 			*dump_read_iter =
 				NOFAIL(calloc(1, sizeof(**dump_read_iter)));
 			(*dump_read_iter)->file = optarg;
-- 
2.25.1

