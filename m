Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B2C333B17
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 12:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbhCJLJQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 06:09:16 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:32316 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbhCJLJI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 06:09:08 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 12AB8SlE011639;
        Wed, 10 Mar 2021 20:08:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 12AB8SlE011639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615374509;
        bh=4BsdiKU/ZW/GV8GfbmBOPEz95+oAT8ixjLQ3sW7ASGk=;
        h=From:To:Cc:Subject:Date:From;
        b=ORwzzFgdYWmnoYhXdHaJg7vfA1KyjqBHzD/YHPwbYA0bqHYonp7xWm666iTqn6jix
         qox2sGT6/7qfyQOJeQMJVHVF67ojpH/Gs48GSUwKWjAH8wtYP5dKO82JARDpUoRjfR
         ifLWWBi1ztGFMaQ4IzSOQOMQZK63Jc+Ze127doG2DaJDHaXEdwCjLqP1iuk+6fGCOT
         /omTFF2pHQYQqLkGXt6pQekUiN/EIjdgF9euxlyit879b24Qbz8XFwVygO68Kk3QHS
         kd3m1+jYX1hXofbvuqUYAItdk7jfBE0WnsoIjc1pcBDUklUCDbvOCIYjhC0ZUTeEFG
         bH3dl6ExJMFHg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove unneeded -O option to dtc
Date:   Wed, 10 Mar 2021 20:08:24 +0900
Message-Id: <20210310110824.782209-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This piece of code converts the target suffix to the dtc -O option:

    *.dtb      ->  -O dtb
    *.dt.yaml  ->  -O yaml

Commit ce88c9c79455 ("kbuild: Add support to build overlays (%.dtbo)")
added the third case:

    *.dtbo     ->  -O dtbo

This works thanks to commit 163f0469bf2e ("dtc: Allow overlays to have
.dtbo extension") in the upstream DTC, which has already been pulled in
the kernel.

However, I think it is a bit odd because "dtbo" is not a format name.
At least, it does not show up in the help message of dtc.

$ scripts/dtc/dtc --help
  [ snip ]
  -O, --out-format <arg>
        Output formats are:
                dts - device tree source text
                dtb - device tree blob
                yaml - device tree encoded as YAML
                asm - assembler source

So, I am not a big fan of the second hunk of that change:

        } else if (streq(outform, "dtbo")) {
                dt_to_blob(outf, dti, outversion);

Anyway, we did not need to do this in Makefile in the first place.

guess_type_by_name() had already understood ".yaml" before commit
4f0e3a57d6eb ("kbuild: Add support for DT binding schema checks"),
and now does ".dtbo" as well.

Makefile does not need to duplicate the same logic. Let's leave it
to dtc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index eee59184de64..90a4e04cd8f5 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -327,7 +327,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-	$(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
+	$(DTC) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
-- 
2.27.0

