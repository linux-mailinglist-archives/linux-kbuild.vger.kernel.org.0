Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE6D2DD155
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Dec 2020 13:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgLQMRv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Dec 2020 07:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbgLQMRv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Dec 2020 07:17:51 -0500
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9475C061285;
        Thu, 17 Dec 2020 04:17:35 -0800 (PST)
Received: from zn.tnic (p200300ec2f10f600410f6ed9c6f20697.dip0.t-ipconnect.de [IPv6:2003:ec:2f10:f600:410f:6ed9:c6f2:697])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 59FC81EC0598;
        Thu, 17 Dec 2020 13:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1608207454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=TPWaO67d3hE3RjpDT8ArmjOCcGJTwKzOlw0QHfcSZyQ=;
        b=qtp2TRZe+Y/uy/kI9RCvDIwbEqUu2HhXNE1pVLRIuA0i5hs+g5a794Tj47QH0Abilxj2eB
        fGSKuWxeIXKge5bPL/PGhdi2np79AnJ07kBzyRGXKmPSfDywFZuea8FBqi83UlKP4+iNlu
        K7rDcHsGBc8f93nvRbor0pdK9ytCHRI=
From:   Borislav Petkov <bp@alien8.de>
To:     linux-kbuild@vger.kernel.org
Cc:     LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] Makefile: Add {kvm_guest,xen}.config targets to make help's output
Date:   Thu, 17 Dec 2020 13:17:25 +0100
Message-Id: <20201217121725.16842-1-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Add the targets which add Kconfig items to the .config so that the
kernel can be run as a guest, to the main 'make help' output so that
they can be found easier and there's no need to grep the tree each time
to remember what they should be called.

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 scripts/kconfig/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index e46df0a2d4f9..fdfae4f6943e 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -143,6 +143,8 @@ help:
 	@echo  '                    default value without prompting'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
+	@echo  '  kvm_guest.config - Enable Kconfig items for running this kernel as a KVM guest'
+	@echo  '  xen.config	  - Enable Kconfig items for running this kernel as a Xen guest'
 
 # ===========================================================================
 # object files used by all kconfig flavours
-- 
2.29.2

