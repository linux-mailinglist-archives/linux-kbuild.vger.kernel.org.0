Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D306300CD7
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 20:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbhAVTmZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Jan 2021 14:42:25 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:25957 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730635AbhAVT25 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jan 2021 14:28:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611343709; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=RKZpAN3hHH21q8uEMRdSq93uKV3xozpo4PTQZAPka5U=; b=Bg7dBbz7++2eqymu9tPFaPboQRr0o1mhmM9LvpDiJ4zMxK3YmMLh8KlKnZ6RnvngTDZj8dvV
 9aMdNdLP40Hj+u86IHiZDlLPAATqUWcoB2zz4Il8R8WPgL+Xy/WdIi5G1VNMk5FkDC3dtaVI
 KqiFeiL4WBQw2XnTgW2tiN2W6iQ=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 600b273bfb02735e8c21d7a8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 Jan 2021 19:27:55
 GMT
Sender: eberman=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 32E6BC43462; Fri, 22 Jan 2021 19:27:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E4B6C43461;
        Fri, 22 Jan 2021 19:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E4B6C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Sami Tolvanen <samitolvanen@google.com>,
        Trilok Soni <tsoni@codeaurora.org>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Jeff Johnson <jjohnson@codeaurora.org>
Subject: [RFC 1/2] Kbuild: Make composite object searching more generic
Date:   Fri, 22 Jan 2021 11:27:17 -0800
Message-Id: <1611343638-28206-2-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611343638-28206-1-git-send-email-eberman@codeaurora.org>
References: <1611343638-28206-1-git-send-email-eberman@codeaurora.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Reduce repeated logic around expanding composite objects in preparation
for later commit to support nested composite objects.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 scripts/Makefile.lib | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 213677a5..93e4f10 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -56,15 +56,19 @@ else
 obj-y		:= $(filter-out %/, $(obj-y))
 endif
 
+# Expand $(foo-objs) $(foo-y) by calling $(call suffix-search,foo.o,-objs -y)
+suffix-search = $(foreach s,$(2),$($(1:.o=$s)))
 # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
-multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))), $(m))))
-multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))), $(m))))
+multi-search = $(sort $(foreach m,$(1), $(if $(strip $(call suffix-search,$(m),$(2) -)), $(m))))
+multi-used-y := $(call multi-search,$(obj-y),-objs -y)
+multi-used-m := $(call multi-search,$(obj-m),-objs -y -m)
 multi-used   := $(multi-used-y) $(multi-used-m)
 
 # Replace multi-part objects by their individual parts,
 # including built-in.a from subdirectories
-real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
-real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
+real-search = $(foreach m,$(1), $(if $(strip $(call suffix-search,$(m),$(2) -)),$(call suffix-search,$(m),$(2)),$(m)))
+real-obj-y := $(call real-search, $(obj-y),-objs -y)
+real-obj-m := $(call real-search, $(obj-m),-objs -y -m)
 
 always-y += $(always-m)
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

