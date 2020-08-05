Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD46E23CF38
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Aug 2020 21:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbgHETRV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Aug 2020 15:17:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:64905 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729059AbgHER7v (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Aug 2020 13:59:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596650391; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=kg0EF5rfNOmYrsglJGmq1Vj6cS50it6TVyt41Nu8U+I=; b=T+GRg4K5xNDU+n6IiYgqYFJ6js5BJSC2wXJpYEJtI7zfDtZhlxmDje/2uo0AZvdOxVq6Ft9U
 lWXSaneba2B9D0uPMyfihqe2L+r5KSTY1SrrVVYIMjlg6ylowrMWMtWeVt6CfeeNMlLr7yHt
 cbZzbbZcPCAzVP1P6CTKYdw+OLQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f2af37790893260dd5ddddd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 05 Aug 2020 17:59:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9626BC433A0; Wed,  5 Aug 2020 17:59:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76DC1C43395;
        Wed,  5 Aug 2020 17:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76DC1C43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Steve Muckle <smuckle@google.com>,
        Trilok Soni <tsoni@codeaurora.org>
Subject: [PATCH] kbuild: Add dtc flag test
Date:   Wed,  5 Aug 2020 10:58:48 -0700
Message-Id: <1596650328-14869-1-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Host dtc may not support the same flags as kernel's copy of dtc. Test
if dtc supports each flag when the dtc comes from host.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 scripts/Makefile.lib | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 841ac03..2722a67 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -274,25 +274,35 @@ quiet_cmd_gzip = GZIP    $@
 
 # DTC
 # ---------------------------------------------------------------------------
+ifeq ("$(origin DTC)", "command line")
+PHONY += $(DTC)
+dtc-option = $(call try-run, $(DTC) $1 -v,$1)
+else
+# Just add the flag. DTC is compiled later as a prerequisite, so there's no dtc
+# to test the flag against. This is okay because we're not testing flags which
+# aren't supported by in-kernel dtc to begin with.
+dtc-option = $1
+endif
+
 DTC ?= $(objtree)/scripts/dtc/dtc
-DTC_FLAGS += -Wno-interrupt_provider
+DTC_FLAGS += $(call dtc-option,-Wno-interrupt_provider)
 
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
-DTC_FLAGS += -Wno-unit_address_vs_reg \
-	-Wno-unit_address_format \
-	-Wno-avoid_unnecessary_addr_size \
-	-Wno-alias_paths \
-	-Wno-graph_child_address \
-	-Wno-simple_bus_reg \
-	-Wno-unique_unit_address \
-	-Wno-pci_device_reg
+DTC_FLAGS += $(call dtc-option,-Wno-unit_address_vs_reg) \
+	$(call dtc-option,-Wno-unit_address_format) \
+	$(call dtc-option,-Wno-avoid_unnecessary_addr_size) \
+	$(call dtc-option,-Wno-alias_paths) \
+	$(call dtc-option,-Wno-graph_child_address) \
+	$(call dtc-option,-Wno-simple_bus_reg) \
+	$(call dtc-option,-Wno-unique_unit_address) \
+	$(call dtc-option,-Wno-pci_device_reg)
 endif
 
 ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
-DTC_FLAGS += -Wnode_name_chars_strict \
-	-Wproperty_name_chars_strict \
-	-Winterrupt_provider
+DTC_FLAGS += $(call dtc-option,-Wnode_name_chars_strict) \
+	$(call dtc-option,-Wproperty_name_chars_strict) \
+	$(call dtc-option,-Winterrupt_provider)
 endif
 
 DTC_FLAGS += $(DTC_FLAGS_$(basetarget))
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

