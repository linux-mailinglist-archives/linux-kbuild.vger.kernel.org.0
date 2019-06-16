Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 406F947633
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2019 19:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfFPRuB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Jun 2019 13:50:01 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:52511 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfFPRuB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Jun 2019 13:50:01 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x5GHmCb3032735;
        Mon, 17 Jun 2019 02:48:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x5GHmCb3032735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560707293;
        bh=Te693hygqCk6T69KjghvaUj9Rx8zaxGUTGHMI/OphOA=;
        h=From:To:Cc:Subject:Date:From;
        b=JTjezIzOW7STPIX7uzZ/YRLpPKesR4u7WdeD2VTiUifcJfYIklwCHHte5/8XmYhUw
         b/A+3Fh4o8in3SEUdbrr6cy2EheRPJZeoArTjyU+B7iTUPt6egppuZQlS2BNic1HJ7
         tDVg9OGLnL5GAF3627aTM06Nh4LETvKqfU2aMivm+pxJlVitS3yNL2PZH/NrEAzH92
         4BB5yRA25f0ERq92WeQ+iGnJRLNPnDMGAxf+B4HWGrU1EYGRQj59EiKzqMGaDrnA00
         OXRWMXevCHvrx/pZ+ZQ032xkvar2tYJ9M8cze6vwgl6O2p1eSVNTOh1Y3EAN3W2tHH
         o13UcG2csZAaQ==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-kernel@vger.kernel.org,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Stefan Agner <stefan@agner.ch>, Joel Stanley <joel@jms.id.au>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 1/2] lib/raid6: remove duplicated CFLAGS_REMOVE_altivec8.o
Date:   Mon, 17 Jun 2019 02:48:04 +0900
Message-Id: <20190616174805.3069-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

No intended change in behavior.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 lib/raid6/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index e723eacf7868..74004037033f 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -26,7 +26,6 @@ CFLAGS_REMOVE_altivec1.o  += -msoft-float
 CFLAGS_REMOVE_altivec2.o  += -msoft-float
 CFLAGS_REMOVE_altivec4.o  += -msoft-float
 CFLAGS_REMOVE_altivec8.o  += -msoft-float
-CFLAGS_REMOVE_altivec8.o  += -msoft-float
 CFLAGS_REMOVE_vpermxor1.o += -msoft-float
 CFLAGS_REMOVE_vpermxor2.o += -msoft-float
 CFLAGS_REMOVE_vpermxor4.o += -msoft-float
-- 
2.17.1

