Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6A1765199
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 07:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbfGKFpy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 01:45:54 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:59467 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfGKFpx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:53 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x6B5ip8T031345;
        Thu, 11 Jul 2019 14:44:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x6B5ip8T031345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562823898;
        bh=iZRH/pqcP+K+A+neVC6JVPL+Vc4UBQc7CTbEdrMj1B8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mlVGsQwYQrxJg90PTLm52mBuqGweoB+CPzQbf6QvCV0ZUtIl7a1bvZOTnzt0sQLcp
         f8fDC1/p3uD+3JlI93ZJO4w0J6r9cr3seTLJtkxha//rjK2bEAfwKlwerAkkO63T0J
         yEX+3+VMFdAeVAPazEHvof9Oa419QX6AZLYWwLS2qohjske8vaxATuhSGVvR+aSTWr
         RCTQrAeTGVh5/3UWqR4h8DOH0Ji/UQHwLVeifXEZ4ZmcMC1LN99D9LwbivpQ+sH7Cc
         +hOpKqz7+QXkHs/O8vXHyRllYVdjVORSLCkP6DNygPTN9tSeRXDkudZUd1WUOqOqet
         anh8tFjYBKNzw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] kbuild: remove the first line of *.mod files
Date:   Thu, 11 Jul 2019 14:44:32 +0900
Message-Id: <20190711054434.1177-10-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The current format of *.mod is like this:

  line 1: directory path to the .ko file
  line 2: a list of objects linked into this module
  line 3: unresolved symbols (only when CONFIG_TRIM_UNUSED_KSYMS=y)

Now that *.mod and *.ko are created in the same directory, the line 1
provides no valuable information. It can be derived by replacing the
extension .mod with .ko.

Cut the first line.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/Makefile.build      | 4 ++--
 scripts/adjust_autoksyms.sh | 2 +-
 scripts/mod/sumversion.c    | 9 ++-------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 9fb30633acd2..2709646b1a5d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -279,7 +279,7 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 $(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
-	@{ echo $(@:.o=.ko); echo $@; \
+	@{ echo $@; \
 	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
 
 quiet_cmd_cc_lst_c = MKLST   $@
@@ -461,7 +461,7 @@ cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^) $(cmd_secanalysis
 
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
-	@{ echo $(@:.o=.ko); echo $(filter %.o,$^); \
+	@{ echo $(filter %.o,$^); \
 	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 8b44bb80a451..89871cae3954 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -48,7 +48,7 @@ cat > "$new_ksyms_file" << EOT
 
 EOT
 sed 's/ko$/mod/' modules.order |
-xargs -n1 sed -n -e '3{s/ /\n/g;/^$/!p;}' -- |
+xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
 
diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
index 166f3fa247a9..63062024ce0e 100644
--- a/scripts/mod/sumversion.c
+++ b/scripts/mod/sumversion.c
@@ -398,7 +398,7 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 	char *sources, *end, *fname;
 	char filelist[PATH_MAX + 1];
 
-	/* objects for a module are listed in the second line of *.mod file. */
+	/* objects for a module are listed in the first line of *.mod file. */
 	snprintf(filelist, sizeof(filelist), "%.*smod",
 		 (int)strlen(modname) - 1, modname);
 
@@ -407,13 +407,8 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
 		/* not a module or .mod file missing - ignore */
 		return;
 
-	sources = strchr(file, '\n');
-	if (!sources) {
-		warn("malformed versions file for %s\n", modname);
-		goto release;
-	}
+	sources = file;
 
-	sources++;
 	end = strchr(sources, '\n');
 	if (!end) {
 		warn("bad ending versions file for %s\n", modname);
-- 
2.17.1

