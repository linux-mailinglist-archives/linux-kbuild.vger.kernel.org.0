Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9B33112198
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2019 03:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbfLDCwS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Dec 2019 21:52:18 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:52231 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfLDCwR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 21:52:17 -0500
X-Greylist: delayed 124053 seconds by postgrey-1.27 at vger.kernel.org; Tue, 03 Dec 2019 21:52:16 EST
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id xB42pqN2021272;
        Wed, 4 Dec 2019 11:51:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com xB42pqN2021272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1575427913;
        bh=h1Zzop3sqPtOLhqGWdfgR6EWkFWSOPCC1FE6B+QXfJs=;
        h=From:To:Cc:Subject:Date:From;
        b=DAY8ZOIUsVXdtaFP9Kgqfik+1jq26HX2kyZsm3hHV7nUPETSmr/bCJ9tIFXtv8+Cy
         YUZbGu22saWM3h4NInFBKycZ7+fXMml8+EGruC4mXjrhl7koDBAxIX7aqzaCGDxzw6
         DdWroYmh4wXNJ/NYCS3EVlZK4rHCGJI8FurIZ0l20K8TSMCyNmNEnKI32+f83fRehd
         /WO9yMuGnmai3BUoW9yMDxaTJs7xAMkeDWME2ldLilumPo90mUME/CpWfeP8zrWeDM
         UrV8DX1DkHGe/AUK5vMFsbja/DQKcFuTCow8YpvcMQawN1Qo2f6Qf90rEj3G5sErCZ
         A8TnCIHd3mt1g==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: fix 'No such file or directory' warning when cleaning
Date:   Wed,  4 Dec 2019 11:51:48 +0900
Message-Id: <20191204025148.32101-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit fcbb8461fd23 ("kbuild: remove header compile test"),
'make clean' with O= option in the pristine source tree emits
'No such file or directory' warning.

$ git clean -d -f -x
$ make O=foo clean
make[1]: Entering directory '/home/masahiro/linux/foo'
find: ‘usr/include’: No such file or directory
make[1]: Leaving directory '/home/masahiro/linux/foo'

Fixes: fcbb8461fd23 ("kbuild: remove header compile test")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 24543a30b9f0..e5895a79c45f 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -95,7 +95,7 @@ endif
 # asm-generic/*.h is used by asm/*.h, and should not be included directly
 header-test- += asm-generic/%
 
-extra-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h'))
+extra-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
-- 
2.17.1

