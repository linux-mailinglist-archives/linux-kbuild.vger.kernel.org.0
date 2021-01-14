Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435BD2F6D83
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 22:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbhANVvH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 16:51:07 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:39884 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbhANVvE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 16:51:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610661038; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bDsVTj2cKX1cZoU2AYambzFFPeSqYwzNNDgdqAFQBTs=; b=WLNz2fVhhIukf7LRLpZ/HNVyRC8WT7B1gMl1MpKnMcfxzJ3mCHgbTAFov4gmMUkNQf1TiqQ4
 YmZ/U1qIimyXgmLnph1gHl8I2gADngK1+bxPwaCygDbUg19kvOuvfb0sv6OiBneQZljVcb65
 gIDxTk7KonocOp/2EH4wFH2bBMM=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6000bc948fb3cda82f2c6e0f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Jan 2021 21:50:12
 GMT
Sender: jjohnson=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D45C4C433ED; Thu, 14 Jan 2021 21:50:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jjohnson)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FD8EC433CA;
        Thu, 14 Jan 2021 21:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FD8EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jjohnson@codeaurora.org
From:   Jeff Johnson <jjohnson@codeaurora.org>
To:     linux-kbuild@vger.kernel.org
Cc:     psodagud@quicinc.com, eberman@quicinc.com, ndesaulniers@google.com,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Jeff Johnson <jjohnson@codeaurora.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] kbuild: handle excessively long argument lists
Date:   Thu, 14 Jan 2021 13:49:50 -0800
Message-Id: <1610660990-18812-1-git-send-email-jjohnson@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610500731-30960-2-git-send-email-jjohnson@codeaurora.org>
References: <1610500731-30960-2-git-send-email-jjohnson@codeaurora.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>

Modules with a large number of compilation units may be
exceeding AR and LD command argument list. Handle this gracefully by
writing the long argument list in a file. The command line options
read from file are inserted in place of the original @file option.

The usage is well documented at
https://www.gnu.org/software/make/manual/html_node/File-Function.html

Signed-off-by: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
Signed-off-by: Jeff Johnson <jjohnson@codeaurora.org>
---

Changes in v2:
  - Remove spurious endif
  
scripts/Makefile.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 252b7d2..787dca2 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -425,7 +425,10 @@ $(obj)/lib.a: $(lib-y) FORCE
 # module is turned into a multi object module, $^ will contain header file
 # dependencies recorded in the .*.cmd file.
 quiet_cmd_link_multi-m = LD [M]  $@
-      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
+      cmd_link_multi-m =					\
+	$(file >$@.in,$(filter %.o,$^))				\
+	$(LD) $(ld_flags) -r -o $@ @$@.in;			\
+	rm -f $@.in
 
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

