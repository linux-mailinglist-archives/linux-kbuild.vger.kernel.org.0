Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7542F4104
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Jan 2021 02:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbhAMBT5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 20:19:57 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:20055 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbhAMBT5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 20:19:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610500773; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YSG/qQ1q1fMOG/Hav8fx9/REuPQIkzfFlEODaYgoTI8=; b=nZAt1C3oEnHU7iMP0pCARVIOZYNHzxAcbX2zbuqsuJ2juADqhRy8521z9lwcQkTd4ip4+Uuh
 2Dbj7X0RpELAdfHEYzl6Eyzk3Hy4bCHhB9+KXn+pT4QJIZ3OYJe0xxXdA2gr5qrOh6V1Bm4D
 fjb7YGdAJlKnk6xnx+GiINk9f8Y=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ffe4a8a415a6293c5eb7b69 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Jan 2021 01:19:06
 GMT
Sender: jjohnson=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B92C3C43461; Wed, 13 Jan 2021 01:19:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jjohnson)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BDB5C433CA;
        Wed, 13 Jan 2021 01:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7BDB5C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jjohnson@codeaurora.org
From:   Jeff Johnson <jjohnson@codeaurora.org>
To:     linux-kbuild@vger.kernel.org
Cc:     psodagud@quicinc.com, eberman@quicinc.com,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Jeff Johnson <jjohnson@codeaurora.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: simplify cmd_mod
Date:   Tue, 12 Jan 2021 17:18:50 -0800
Message-Id: <1610500731-30960-1-git-send-email-jjohnson@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>

Modules with a large number of compilation units can exceed execv
argument list resulting in E2BIG (Argument list too long) error.

Fix this by replacing shell 'echo > file' into a more native
$(file op filename[,text]) option.

Signed-off-by: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
Signed-off-by: Jeff Johnson <jjohnson@codeaurora.org>
---
 scripts/Makefile.build | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4c058f1..252b7d2 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -279,10 +279,11 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call if_changed_rule,cc_o_c)
 	$(call cmd,force_checksrc)
 
-cmd_mod = { \
-	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
-	$(undefined_syms) echo; \
-	} > $@
+cmd_mod = $(file >$@,\
+		$(if $($*-objs)$($*-y)$($*-m), \
+			$(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), \
+			$(@:.mod=.o))) \
+	$(undefined_syms) echo >> $@
 
 $(obj)/%.mod: $(obj)/%.o FORCE
 	$(call if_changed,mod)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

