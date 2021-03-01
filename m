Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14703280B2
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Mar 2021 15:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236277AbhCAOXj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Mar 2021 09:23:39 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:54417 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236073AbhCAOXa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Mar 2021 09:23:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614608589; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=kxpjN5BLsS6IrOHRTrvVRXRLxpfeOvCv7+DYloD1HU8=; b=KR6Qz6dPSX37FbRUf+S1XBpYPiQ061cqpijUCFR002liqW2eYBfe32CQd0axepyZyNPP3kYJ
 O+rfGZ/eQQ+QHlwBkBIqDuJhD+cB+alig/955IFtg74VZg1TGt+q97tPiPxwC59r8omWsdUB
 mIDlMVzjtIy65c9UViaXL9liTJI=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI2MjRjMSIsICJsaW51eC1rYnVpbGRAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 603cf8ac12935cdcee66e111 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 14:22:36
 GMT
Sender: jshriram=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7026AC43462; Mon,  1 Mar 2021 14:22:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from th-lint-009.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jshriram)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BBB15C433C6;
        Mon,  1 Mar 2021 14:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BBB15C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jshriram@codeaurora.org
From:   Jeevan Shriram <jshriram@codeaurora.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jeevan Shriram <jshriram@codeaurora.org>,
        linux-kernel@vger.kernel.org, tsoni@codeaurora.org
Subject: [PATCH] scripts: Fix incremental build header re-generation
Date:   Mon,  1 Mar 2021 06:22:20 -0800
Message-Id: <1614608540-1025-1-git-send-email-jshriram@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

compile.h and autoconf.h are ignored when checking headers sha as they
are always re-generated for every kernel compilation. However,
these two headers are packaged into kheaders tar. During incremental
compilation of kernel, kheaders tar file is always generated and re-packaged
irrespective of the changes in headers.

Change-Id: I7a64faebb81df44c32230b0fea1d6df09d7ce66f
Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
---
 kernel/gen_kheaders.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index c1510f0..5499f72 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -51,8 +51,7 @@ this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
 if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
 if [ -f kernel/kheaders.md5 ] &&
 	[ "$(head -n 1 kernel/kheaders.md5)" = "$headers_md5" ] &&
-	[ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
-	[ "$(tail -n 1 kernel/kheaders.md5)" = "$tarfile_md5" ]; then
+	[ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ]; then
 		exit
 fi
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

