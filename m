Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2E7388BFC
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 17:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfHJPyV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 11:54:21 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:34077 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfHJPyV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:21 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7AFrG8v009713;
        Sun, 11 Aug 2019 00:53:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7AFrG8v009713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565452399;
        bh=d/Z7awvrYGMGgW5gebyxG8uA/SddYL0ui4DyfJdxS5Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IQHZVwb0Bl/e5zBR92jGac/U7vVDzGHJ0MAp4usJPEVqFBobrgakJoA2YHNYi7T9A
         q+l8IWsSyck9kt7sqAGBwq7FhSN1y7Aj8EJO2KvpSfqrAhGc/bf6tMAcHkvNZ/KIX/
         ay4Wk/O5fGoP78N0PatHXVWEUWLCAaibZnIsbGXBYubZgpoqEFbrgHIV56GW2GtM2b
         WWy8ZWOGDtzDvr4BlY7CSXu+qVsESw5LMEtF1+F/ryDorkPY9/Bh8bswIIO8SETBWy
         mu2zyDhXj9n6yYOQC0rkJ+Dfsc30wR0J2yWxXOev+7GZCCTR9dlXiHmU1J1wkSiUbR
         Mr3BPcS2/TS5Q==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] kbuild: refactor part-of-module more
Date:   Sun, 11 Aug 2019 00:52:58 +0900
Message-Id: <20190810155307.29322-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Make it even shorter.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2f66ed388d1c..64e47a9a54c5 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -98,8 +98,7 @@ endif
 # ---------------------------------------------------------------------------
 
 # Default is built-in, unless we know otherwise
-$(foreach x, i ll lst o s symtypes, $(patsubst %.o,%.$(x),$(real-obj-m))): \
-	part-of-module := y
+part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
 
 modkern_cflags =                                          \
 	$(if $(part-of-module),                           \
-- 
2.17.1

