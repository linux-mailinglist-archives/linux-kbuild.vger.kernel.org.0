Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9257C687A71
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Feb 2023 11:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbjBBKlW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Feb 2023 05:41:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBBKlV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Feb 2023 05:41:21 -0500
Received: from orbyte.nwl.cc (orbyte.nwl.cc [IPv6:2001:41d0:e:133a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD0492279B
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Feb 2023 02:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nwl.cc;
        s=mail2022; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=flS2YhkUWgcxcgspZmcnTdUcD4uWn7cqF4geM2HsYwI=; b=ZrIjclI/E18usGKtZJ4CG063Hu
        F4Rj0HdF3imxUsPRy28c/qvA8qCKFhThfkGfJiSfOa44at8jftfo+f5YrlVV7584VuY3OcONHeMic
        I19cLHjunSnAWiNQvIv8hp4bVmJTb/qL/0+E+9xbLq8inFMbohj8dizuj+Y2HhzDT0GvZTdHlGQra
        P2EsjaZWC+pEtl3Eyev++GOB3Pptou8Bch3KdJDYoYOKr3MJ8NPmeSOwpOAKFR70LOlI82wnbIPT2
        pGEFobvRcuRvtETRIcTEWpHwT7hcikviwUWFW8WQFVfcEhHzjOTv8VDYUD/TTGHpwk2zIRUaxqQ9K
        Phq2QIKA==;
Received: from localhost ([::1] helo=xic)
        by orbyte.nwl.cc with esmtp (Exim 4.94.2)
        (envelope-from <phil@nwl.cc>)
        id 1pNX1q-0007Os-6P; Thu, 02 Feb 2023 11:41:18 +0100
From:   Phil Sutter <phil@nwl.cc>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Dave Young <dyoung@redhat.com>
Subject: [PATCH] tools/vm/Makefile: Honor EXTRA_* flags
Date:   Thu,  2 Feb 2023 11:41:11 +0100
Message-Id: <20230202104111.12317-1-phil@nwl.cc>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Passing custom compiler flags is pretty much impossible otherwise due to
the way standard variables CFLAGS and LDFLAGS are being assigned to.

The recursive make call in tools/lib/api already supports EXTRA_CFLAGS
at least, so follow this path instead of reinventing the wheel.

Signed-off-by: Phil Sutter <phil@nwl.cc>
Cc: Dave Young <dyoung@redhat.com>
---
Please keep me in Cc, I'm not subscribed to this list.
---
 tools/vm/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/vm/Makefile b/tools/vm/Makefile
index 9860622cbb151..ce1ed324d6c01 100644
--- a/tools/vm/Makefile
+++ b/tools/vm/Makefile
@@ -8,8 +8,8 @@ TARGETS=page-types slabinfo page_owner_sort
 LIB_DIR = ../lib/api
 LIBS = $(LIB_DIR)/libapi.a
 
-CFLAGS = -Wall -Wextra -I../lib/
-LDFLAGS = $(LIBS)
+CFLAGS = -Wall -Wextra -I../lib/ $(EXTRA_CFLAGS)
+LDFLAGS = $(LIBS) $(EXTRA_LDFLAGS)
 
 all: $(TARGETS)
 
-- 
2.38.0

