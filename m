Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD7D370E60
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 May 2021 20:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbhEBSLT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 May 2021 14:11:19 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:37455 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbhEBSLS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 May 2021 14:11:18 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 142I9wPl004068;
        Mon, 3 May 2021 03:10:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 142I9wPl004068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619979000;
        bh=+LNLguQplCoZtSV+3NwrlLlo2vqKKeKdbo1HKDLdTww=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LUX9YSyJ4vrYpLhpMKfMMGCacAjxYHIhgBqpNT30Uz7ppA2i/bZqG8evAVQHh8PSh
         08TAX0FEB71M6p+MJ1kQzgF/8RJAcve/77YqnewvGMIGxXTKvY5//fOhsxIwKUsuAf
         CmERJ4iPussSFTWzzsKF8jxlzRflnqOYjGSdo3uYL7yH/4XWaWY+4cv3Y7VCbciejh
         6yP0K+t6hIdxkN46wFfiA43v7ZnNkslMbyKum0v8PoR2LAtWJEmWCU70NvGaorSQLk
         tXPA6oKgKGofJtguV4WcqsZHWRNphw81nmguO0+EAobWz4TyUY0+AteGvfvSEMxj94
         YXzy81CMm8rmQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kbuild: refactor modname-multi by using suffix-search
Date:   Mon,  3 May 2021 03:09:57 +0900
Message-Id: <20210502180957.3419490-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210502180957.3419490-1-masahiroy@kernel.org>
References: <20210502180957.3419490-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Improve the readability slightly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0da58af8d192..865a5d4bdf1a 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -109,7 +109,7 @@ subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, list them all.
 modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
-		$(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=))))
+		$(if $(filter $*.o, $(call suffix-search, $m, .o, -objs -y -m)),$(m:.o=))))
 
 __modname = $(if $(modname-multi),$(modname-multi),$(basetarget))
 
-- 
2.27.0

