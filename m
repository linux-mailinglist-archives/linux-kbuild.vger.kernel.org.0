Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97012DC09C
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Dec 2020 13:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgLPM7Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Dec 2020 07:59:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgLPM7P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Dec 2020 07:59:15 -0500
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C121C061794
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Dec 2020 04:58:33 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4CwwCd1nKfzQlkH;
        Wed, 16 Dec 2020 13:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :subject:subject:message-id:from:from:date:date:received; s=
        mail20150812; t=1608123482; bh=acFwuj+cZCAuu08v9+krGO9yozoZTGMXI
        Lu/Dtv7eC4=; b=VsqHJTfMeKhbNHPWHpCwApwCu9uQOaRrpkcG2XGeu6LA2gAya
        WY6eDVyFunnBeX9R7IIUsDG/7u+rpavzIAvsFPtjmAPi5++R7cGeupjKKK96PMcg
        R5sTkH5V/foRP4zlTjCAMs/s2FIejsQiJPcf/H3+Nq4aWzU1B+ca/YwV88pYe8wk
        rRXDvCFkGap2yhVEaKs6hFTops7aDyrwrGRX+727IpVYyhVXVe3t+ZGSFPtVw98X
        jh+WifFWT2rdR9RcSUNrA6BP3qX94kIRioshBpjuFXs7Zxs2cfli/Woe7LcjlXDb
        WtwbaMGRshptNbaQkKtxvScih6v7bVu0/W+7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1608123483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=+LyXq4csngvvIfM1+fmW0T1qLM4w6BDjshIgBzwUO8Q=;
        b=hQIoQWmp9pOqbp255l1lRRljM9+cvtI19UA4bgT6rI4xPc+ioZvBBo8GlaiZlInwWFVR4q
        seboFsCGu+YYt+FbzO+wywJECSgPWuis2HEhhZOVZgTxPeGewbBHjabgdMFZxaoco7yhBm
        USzxPzOdrH4KYvAkTRqDF9AauPm/Cs9xCzpD7vVFGstPhF2RKCaBj9a+mF48u4+ml/pYCy
        IolP7RHgGplfwHrSWRmLjsWodz7rRl9JX33o5MKchHa8fXp+USHMeoKGVTd1Y2lWjX9DC4
        HI9/1/Y0FyX4Zg25nx8xbiCz3t61bTXgMxjRP2B+K9J1N0SqXpeyxNH6A6S/Ig==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id pnknVZgi441P; Wed, 16 Dec 2020 13:58:02 +0100 (CET)
Date:   Wed, 16 Dec 2020 13:58:02 +0100 (CET)
From:   torvic9@mailbox.org
To:     "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Message-ID: <924931182.70312.1608123482150@office.mailbox.org>
Subject: [PATCH] Makefile: use smaller dictionary size for xz module
 compression
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -4.41 / 15.00 / 15.00
X-Rspamd-Queue-Id: 4BEBD1863
X-Rspamd-UID: 28e7e4
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

By default, xz without parameters uses a dictionary size of 8 MB.
However, most modules are much smaller than that.
The xz manpage states that 'increasing dictionary size usually improves 
compression ratio, but a dictionary bigger than the uncompressed file 
is waste of memory'.
Use a dictionary size of 2 MB for module compression, resulting in
slightly higher compression speed while still maintaining a good
compression ratio.

Signed-off-by: Tor Vic <torvic9@mailbox.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 076d4e6b9..f9a6d0a4d 100644
--- a/Makefile
+++ b/Makefile
@@ -1058,7 +1058,7 @@ ifdef CONFIG_MODULE_COMPRESS
     mod_compress_cmd = $(KGZIP) -n -f
   endif # CONFIG_MODULE_COMPRESS_GZIP
   ifdef CONFIG_MODULE_COMPRESS_XZ
-    mod_compress_cmd = $(XZ) -f
+    mod_compress_cmd = $(XZ) --lzma2=dict=2MiB -f
   endif # CONFIG_MODULE_COMPRESS_XZ
 endif # CONFIG_MODULE_COMPRESS
 export mod_compress_cmd
-- 
2.29.2
