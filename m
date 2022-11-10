Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84F3A624510
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Nov 2022 16:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiKJPGD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Nov 2022 10:06:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiKJPGC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2022 10:06:02 -0500
X-Greylist: delayed 66228 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Nov 2022 07:05:52 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD02E1D67B
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 07:05:52 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.49.48]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MYvTy-1oXEXQ1WGO-00UsGx; Thu, 10 Nov 2022 16:05:28 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id 218153C1BB;
        Thu, 10 Nov 2022 16:05:22 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id 079FF5B7; Thu, 10 Nov 2022 16:05:18 +0100 (CET)
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 0/3] MAINTAINERS: Update Kbuild and Kconfig entries
Date:   Thu, 10 Nov 2022 16:04:22 +0100
Message-Id: <20221110150425.164386-1-nicolas@fjasle.eu>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JuY3yvHdtM7QR8fYxwRpeaQUFvMe6B3wYeiiAyafHPXkI/+GFeI
 +6Anyi4IJ/L3rDMKp6Z3xF12Wq7bezR406xQvqDlLPTFufF7Ia6alaa+OUE19WR27Bc6W/W
 fq4IVJSXGK6Bip0v4gi7mx6Tdcuccr6YrT5ApJGdLMQhzo6pD+uvM7/daNB0XjMwnXHG9Xr
 6Afd4WQV11djFqPIq4qKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8oERaB42C8U=:sFT8txsK4iZb6zAQf531Ua
 5Z9ybJcZeT8nZk1ycrz/gbAlPe6jWwwvIQKphqvqxQVi4luuThkWN3ObDGSvKQadm3l1EegGk
 3+a1cq8pwmmrxY8oat4/imH64PpE2oUVMmiWrxrpKlIQRMwASE6D3a1V6ehkkf8QsDFBo071X
 HGWJCu8oWmRFaWsGFCRltVNO4dTFkyeG/CH0LBEsMN1dBH/oSuh2pfp2dLfMkw1J3sVLwhpmP
 bqblBaKYLS+kfpXLeHJqngXY4BcVBIW+1iH/Q9k9+qzZlXid8AYZTiV1O6S6bdkpbZ3zxSxOc
 pHKd/+6jM5RcexJ7IJW4wF4r0FZI2SrlETTve5LmRythPmESGQAdfk4tvlRR2v7d6tKWYmxSx
 JdCQZbF00BnjGoClf1uzOAmMDJYuVKSrbWRAWIIXpk29RKuiIdGRoo9hzO9McMLF/ba0eqQ00
 iBqxrJ0CdAwMmsUC3tK2Dat8bg1cPSLdTBCmPfb8G5Vl8cLN3ItiksHcUf/iNoV9My55H0cyb
 oOUfUZfG584sA0s6uVpZ0UdEHJeF2/e8ODJ6uztP9toMLYUTwYGT5nCq1S3SrR2FXSjGdtomS
 mT70LCAqxLsbQ8UjGEIUtK0FwtFrhtjQ7k6sSuvsFIoWDmgVz7uABHib4zde+ptDIyfXF3lQ1
 l30qUB2m+wE7UHhimMprXtNXlCSJafeBqbVPWIgjhgbhgrGwcrUbBK9OdYlOtrPawdNtePhlt
 uMHks5WN0/yG8/5M40DnBrAHXgwidWRzK6EQ4KOriQStNU9mlqEBsgnhdnXn7UbpjHrxPXy7y
 G7FQXTOddzK1oYzE0wwf8UATI8AT2E42T4o4vsG6Qka0KddmvlDBZUVvDhG6L3S9BBMuPxg1g
 y3dMxjpvM5h7LBqNihO1HhQx1lqN/bd/ZmjaQURRvix405/cft9UDqfe5pBSSKqs6THL3c1Tz
 b95MlTa56SfLeEGv2daIrnLapMmg1KHzPP2iwVLpANIQ2K7YWiyeyvPGTsTMdtPd+3v8LJ6kx
 0UZkCAoB3E+NrxuY0nF35FQgalXO1wfnVd4FcZ8hy+iBaF9ycOG+Bc2ftoA4wIKQ/zBatdxd4
 l2WM2cyk6uZB4BdZY+bmGzgzNp0fJQXRWY6EgKq9R5TFe1owrblMh0gzZifNyu7EOemWLGDV/
 k4SlIDQkiHnV47XttjzPEaAkzCCeaMvdoewhhxO1n0w5QBUtrHasIEFDUv8Y3NGdoJnE/SctB
 u6f7M4gYJRxm+Z67y5BQmY3FDRwY+pe0SpPSCnYtVjG+MufkUxusawGKDoZLJoCTZ8ZUtC6+3
 7aB0pZTx
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Update MAINTAINERS by adding myself to Kbuild reviewers and removing emeritus
maintainer.  Further, add the missing patchwork URLs for Kconfig and Kbuild.

Nicolas Schier (3):
  MAINTAINERS: Add Nicolas Schier to Kbuild reviewers
  MAINTAINERS: Remove Michal Marek from Kbuild maintainers
  MAINTAINERS: Add linux-kbuild's patchwork

 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.37.2

