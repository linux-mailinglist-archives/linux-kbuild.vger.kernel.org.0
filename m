Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3120B9FDF
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Sep 2019 00:23:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfIUWXR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 21 Sep 2019 18:23:17 -0400
Received: from cavan.codon.org.uk ([93.93.128.6]:42081 "EHLO
        cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfIUWXQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Sep 2019 18:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=codon.org.uk; s=63138784; h=Subject:Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=B+a2MTidxC1AbLvWfiUlt87RQGuqwtaiTd5K8DDerzM=; b=IGzfjKuAlE4yL6XBv05IlNKmc6
        tGYZgqXMP4ArYZidHXy9C83ZvR3fEIZuSqvOwjjxysP52QBqUSYuL0P5NIb74npvfaElzmfAGq4Qs
        0JsQODWCiQOZe4D/QoSIPexU0xOGEk/O5ASxkirTI1cjqoGKw60EhRaRpiWWJh5lIwZo=;
Received: from [2604:5500:c004:0:c42d:463d:d00a:7d00] (helo=x210-mjg59.webpass.net)
        by cavan.codon.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mjg59@codon.org.uk>)
        id 1iBnmZ-0003IT-Pi; Sat, 21 Sep 2019 23:23:14 +0100
From:   Matthew Garrett <mjg59@srcf.ucam.org>
To:     linux-kbuild@vger.kernel.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Matthew Garrett <mjg59@google.com>
Date:   Sat, 21 Sep 2019 15:23:04 -0700
Message-Id: <20190921222304.23267-1-mjg59@srcf.ucam.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Do-Not-Run: Yes
X-SA-Exim-Connect-IP: 2604:5500:c004:0:c42d:463d:d00a:7d00
X-SA-Exim-Mail-From: mjg59@codon.org.uk
Subject: [PATCH] Corrected formatting of header in kbuild module docs
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: No (on cavan.codon.org.uk); Unknown failure
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Alex Gaynor <alex.gaynor@gmail.com>

Minor formatting fixup.

Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Matthew Garrett <mjg59@google.com>
---
 Documentation/kbuild/modules.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 24e763482650..6716508fb79c 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -495,7 +495,8 @@ build.
 	will be written containing all exported symbols that were not
 	defined in the kernel.
 
---- 6.3 Symbols From Another External Module
+6.3 Symbols From Another External Module
+----------------------------------------
 
 	Sometimes, an external module uses exported symbols from
 	another external module. kbuild needs to have full knowledge of
-- 
2.21.0

