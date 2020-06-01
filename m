Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D261D1E9DBD
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgFAF6Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:25 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40008 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLv023694;
        Mon, 1 Jun 2020 14:57:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLv023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991064;
        bh=M0QIACDAMEg1I/5ZJ7oG1lK0GQ0SehV+xiXMe4lYcZc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UE+O7ja251FnXiORhxf21kmwXLzIMLWPOo4V961eafT9BH9/OZxk0yCATWvf+Q8TM
         3BbXh7msM352iAD5WrhAw9xOvLNqWBp8q1HkWTv0DvJh/NgOYw0z5HkcWJFZ4XPfGF
         6MmbbBnUXRvDdMP6xlji/hcQ++XPKQB1AqpPkT9LEfbsbtO8hq/4n2EAwDdN4l67t8
         PRev8ihn6UiThGlRIUxKXomdCfLoeB4V3Wo1FdOLvcb+yLxMBYOWHMF56esIhqifnB
         ssEbVlE7+5nVwdYL4RSUv5Pr+d9K2jJsjSEGFEL8HOmEpwh8HPNZTubsdu8+WJwoyo
         tVDsWRw3+Qx3w==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 18/37] modpost: invoke modpost only when input files are updated
Date:   Mon,  1 Jun 2020 14:57:12 +0900
Message-Id: <20200601055731.3006266-18-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, the second pass of modpost is always invoked when you run
'make' or 'make modules' even if none of modules is changed.

Use if_changed to invoke it only when it is necessary.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 20 ++++++++++++++++----
 scripts/mod/modpost.c    | 32 +++++++++++++++++++++-----------
 2 files changed, 37 insertions(+), 15 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 6db692a5d547..7d564a39f938 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -90,20 +90,25 @@ endif
 
 # modpost options for modules (both in-kernel and external)
 MODPOST += \
-	$(addprefix -i ,$(input-symdump)) \
+	$(addprefix -i ,$(wildcard $(input-symdump))) \
 	$(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)
 
 ifneq ($(findstring i,$(filter-out --%,$(MAKEFLAGS))),)
 MODPOST += -n
 endif
 
+$(input-symdump):
+	@:
+
 # Read out modules.order to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
 quiet_cmd_modpost = MODPOST $@
-      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST) -T -
+      cmd_modpost = sed 's/ko$$/o/' $< | $(MODPOST) -T -
 
-$(output-symdump): FORCE
-	$(call cmd,modpost)
+$(output-symdump): $(MODORDER) $(input-symdump) FORCE
+	$(call if_changed,modpost)
+
+targets += $(output-symdump)
 
 __modpost: $(output-symdump)
 ifneq ($(KBUILD_MODPOST_NOFINAL),1)
@@ -113,6 +118,13 @@ endif
 PHONY += FORCE
 FORCE:
 
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
+PHONY += FORCE
+FORCE:
+
 endif
 
 .PHONY: $(PHONY)
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 4a2f27d97bf1..b839c48689df 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2375,6 +2375,25 @@ static void add_srcversion(struct buffer *b, struct module *mod)
 	}
 }
 
+static void write_buf(struct buffer *b, const char *fname)
+{
+	FILE *file;
+
+	file = fopen(fname, "w");
+	if (!file) {
+		perror(fname);
+		exit(1);
+	}
+	if (fwrite(b->p, 1, b->pos, file) != b->pos) {
+		perror(fname);
+		exit(1);
+	}
+	if (fclose(file) != 0) {
+		perror(fname);
+		exit(1);
+	}
+}
+
 static void write_if_changed(struct buffer *b, const char *fname)
 {
 	char *tmp;
@@ -2407,16 +2426,7 @@ static void write_if_changed(struct buffer *b, const char *fname)
  close_write:
 	fclose(file);
  write:
-	file = fopen(fname, "w");
-	if (!file) {
-		perror(fname);
-		exit(1);
-	}
-	if (fwrite(b->p, 1, b->pos, file) != b->pos) {
-		perror(fname);
-		exit(1);
-	}
-	fclose(file);
+	write_buf(b, fname);
 }
 
 /* parse Module.symvers file. line format:
@@ -2508,7 +2518,7 @@ static void write_dump(const char *fname)
 			symbol = symbol->next;
 		}
 	}
-	write_if_changed(&buf, fname);
+	write_buf(&buf, fname);
 	free(buf.p);
 }
 
-- 
2.25.1

