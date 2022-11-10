Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47379624512
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Nov 2022 16:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbiKJPGO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Nov 2022 10:06:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiKJPGM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2022 10:06:12 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD2E1D67B
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 07:06:06 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.49.48]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MQvGz-1ofAtz1WWV-00O2Tn; Thu, 10 Nov 2022 16:05:28 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id D02EC3C1BA;
        Thu, 10 Nov 2022 16:05:21 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id 119126CE; Thu, 10 Nov 2022 16:05:18 +0100 (CET)
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 1/3] MAINTAINERS: Add Nicolas Schier to Kbuild reviewers
Date:   Thu, 10 Nov 2022 16:04:23 +0100
Message-Id: <20221110150425.164386-2-nicolas@fjasle.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221110150425.164386-1-nicolas@fjasle.eu>
References: <20221110150425.164386-1-nicolas@fjasle.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tUMni6PAgwQ60hQFfsW/++EG1GidmMFTTKvrRpUtRdKAcOu/GOg
 oOjWAdY3gCo1MHm5V5Mp7alZ/xDaNak/B+aAcUKJU/ZMpu8KIiDyGejH4OFU+A7IHExKa2D
 E15gSLJ7T31G42x+cm7C1TotqcCtItO3KPf4QG+r+8c2y8+hStQuJ/eRnvG15toMBrgyEKy
 pjyBkcpr8f+cIFQatSruw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9CBd+omlYUI=:0KRZTgWscCg5NU6FUfntiq
 P0CT8i8DqHn3NH9KxkfnB+DXLzssnYYO/a0tY/lJc88jH8u2aRxUzPsKawMFQ7Z6g0gk8piEC
 wZ4+m5EftPomzDNHIu3frM6kyc3ff/zuGUr0PG8tSfKzikcclrtjPMBjJJJbnzCNz4QZXuiTM
 86gU/1COdPet6AkJB1NZEneO76Vy00McYG9+RrHjl+ZjKe5LpegNuUOJ3UTXANpMEVasDaeTk
 aEpBproWikxzcE3G/PtAAgoBRCoVdWNQ6P38jO+DzJxMVRFUC0dLrF7AI6cH/XYTtpc0ZEEFU
 sYV07HS0sGfPtzm9iBhyQP5gFRICVy7MR1NcxGkILR7UVMLyfWjadOfEy+/eE+4DbHnLQJNgM
 y+qMzqUfy26hPTAY6s0gbroLz3AMeyamBleqEmsRviHXV4RSn8gssruMwD0sGn/lyIvraUGDk
 BENfRqPwa25zyetRczhWhVjJVZijLS3dRseTqQANmyvEmmGlyvb32To0Y7LUEWWOhA3wKUzgU
 zqBGVvGgHCwPIzRkrAVwOPSPEzRQ13J/vlvICgpOWVrFf/xbDek0RSsTdQ623w07W9Oo559zD
 oSn2z2nZTY+bQPs0LZYHeAf4AM1Ler9I77QbkcBVvx517B3K+g8Ql6RN5VKa6ybiHUGUZsxEO
 IEVaRGnL7xmdeMCi3/d7ncRJFOVejvrh4wx3S132rkMEPij2DWtfIoHo0ziWtbFTFfBs4cf/R
 T5rdPwEhqt7W5l1nB3y1VeXZenQgkTScdEq1LknDqSNVYWTpMIItDMZLwLKcLSztfBnfm8hHV
 PU3iAxBrKo9o/rRbCTB7E43qFhTE2XNjHf8GnltO6AXLuepST4MHV21pXuo4gFXvZ2pFSUzSC
 Hh9WN/7/4R9Ob37zrPJyRzHLSfmyQQ3ub1M1aBxAWVxKi5Gu1SEFH20pTgTaawO/2wUNszvl1
 kEsA15hsdBURVnhGpf1XKTuyxHt9m8wIwLR0DSSQadStNc6NWynF5h0Jc2k185itHQYYRiioV
 1usG5SaauJxL6DpImQ+bHe7wKNVNr1yOue45rc6hrkqZPnSMlugdfW/eE03AeS1uJ/cLvN+Ce
 8WzOXEqhKxUVKcEC8cirVjSxLAnkrPEq+2gJvS3I0TwwBM1VUvC7wW5cJPAlz0vtn0KLivWVR
 ezda3Q/7W7VojmtR37FMGVEXyQP4Jap/IR+WHaM9e/Akidy+2slqPXDKTGK85M+oDQRIuTghO
 C/NUgqWnUWpm5QbFC28IlExNhIZ1RertuUeInLN7GEWaf9CTCf51yOY3jWyzgdxYPyFA1A8Nt
 Iu/VTnGP
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As suggested by Nick, add myself to Kbuild reviewers since I have been
reviewing patches for some time.  Citing from Nick's commit 36f1386d34120:
"I still have a long way to go in terms of mastery of GNU make, but at the
least I can help with more code review."

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf0f18502372..61a6848192c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11085,6 +11085,7 @@ KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
 M:	Masahiro Yamada <masahiroy@kernel.org>
 M:	Michal Marek <michal.lkml@markovi.net>
 R:	Nick Desaulniers <ndesaulniers@google.com>
+R:	Nicolas Schier <nicolas@fjasle.eu>
 L:	linux-kbuild@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
-- 
2.37.2

