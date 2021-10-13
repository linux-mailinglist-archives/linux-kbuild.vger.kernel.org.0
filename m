Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EFF42B779
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Oct 2021 08:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhJMGjI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Oct 2021 02:39:08 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:59497 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhJMGjI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Oct 2021 02:39:08 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 19D6aPug030197;
        Wed, 13 Oct 2021 15:36:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 19D6aPug030197
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634106986;
        bh=uh555ogoVopmgQsC3VCDBjBfCTqg/qreN2LFFwAIv0A=;
        h=From:To:Cc:Subject:Date:From;
        b=idPWaNlEoM5sjDwU3u1q+W+VCa1GSODdzCbzYJG+SPFaKry7oi2J6EvdY8iCYgDyn
         hMYeusJKyV6cBCjigT/S5LWHt1TMB5RVYTQAm1QnvhgLsEG8hly5Yvh95UHTVYnA52
         i2SeH1KUDCd3JDtWlrTrEIoQlSPrpVHc5L8AfuWx3Y4H6JA/aM7f4xFs3vbrCiNO6S
         BM0EBnfAOOOD+C6E9MiKzQv4MOhEsPDchYMHp9IkKLfWuRrCsMJBRDTS++Sb8kSOkq
         1d75WpBKeVgDMF3Oa83O4Ja0V28/FGBq0glt63mcPJrqlUks97IOwWTpzUAJgaT/su
         NBtuTnSi0LG9g==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
Subject: [PATCH 1/2] sh: remove meaningless archclean line
Date:   Wed, 13 Oct 2021 15:36:21 +0900
Message-Id: <20211013063622.548590-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The vsyscall directory is cleaned up by the ordinary way
via arch/sh/kernel/Makefile:

  obj-$(CONFIG_VSYSCALL)          += vsyscall/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sh/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 88ddb6f1c75b..781463900621 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -200,7 +200,6 @@ archprepare:
 
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
-	$(Q)$(MAKE) $(clean)=arch/sh/kernel/vsyscall
 
 archheaders:
 	$(Q)$(MAKE) $(build)=arch/sh/kernel/syscalls all
-- 
2.30.2

