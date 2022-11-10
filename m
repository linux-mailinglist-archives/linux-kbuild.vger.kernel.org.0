Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E834624540
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Nov 2022 16:11:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiKJPLO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Nov 2022 10:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKJPLN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2022 10:11:13 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADAA82654F
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 07:11:06 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.49.48]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M9WiK-1owQu42K3Q-005d7Q; Thu, 10 Nov 2022 16:05:28 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id 774713C07B;
        Thu, 10 Nov 2022 16:05:19 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id 251116F8; Thu, 10 Nov 2022 16:05:18 +0100 (CET)
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 2/3] MAINTAINERS: Remove Michal Marek from Kbuild maintainers
Date:   Thu, 10 Nov 2022 16:04:24 +0100
Message-Id: <20221110150425.164386-3-nicolas@fjasle.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221110150425.164386-1-nicolas@fjasle.eu>
References: <20221110150425.164386-1-nicolas@fjasle.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5RQhQefduvxoNw3AEOOY3vCtE6E7WVpCA2t+wby+JXKbOIye6zA
 S7NcNVGlOkEfkbaO1NUWTs0TbS469UgEph/8grSIyliX4g/bbpi5A3SI1jTLAErceTSvznp
 KGDlqNoxW5wIdwp1wUFkp7Q8Ckr+a32g4zhjnIRsx7/u8GwuZc8K0klThWyQFg2CGAxGMCI
 TVO/DEuxbxZkmLfUlL4LA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V1TH+1O40/M=:gecFQC0+IAj4SsT1nI2x9V
 /h0JeotrMUgAVmGXeE1GnCNn0aTrRuaaoLnsPcJklpQTcR8JYrFtZtoUQEzxX4KuneLde8w+P
 yGDsdLgupHv/mRHNU35zoRqt0QNxwcPb1HBZGj8fP0n1LmX0/2B7B1VLU8apIlVaAcsjV//Gv
 mV0A0XOypax0HJum7z8njUTBSp7Azg+0QSUyonoVI2ssx+jt5L6/W0qjEBbItCb1yaL5lVOMG
 fRP8465IxgdlJDhCeTit7uRqdtac5KyWxN5aWC2Zaq0O64ASyLEw5g4aFYYJKbdAFSyxWsmbk
 2Htqyy54oi+8tFES9GZGjRnlAw11BDHO5OVCrH0Acl+Rnr0bFKfzJTwMDxPMOKFH/s3cVPOT9
 kHFatvaoVcmTmQzNx+aLeYDWcbHVE63HN/+fHcAh1U/r1otpINIxMVb3hR6NYEEXi81K9aTrN
 MqWEealZkya2PIxFCctP2b0+IqkJXOvhER1OgfWZjA3l/umTnzpEoGV614JPvNkXZ1pLSaHrl
 c27Wus1ujjHokrqgSmATNV9A7OADBAizbQbqH/3vETb03EIUV/juuvpu9y00BTBqO3JJfGvgn
 eUeok/ANVzkHtrnGSgdaAr08p057vw3OrZmR3YvIQdcqsFYt6JiqlkD+g8gNalReL9qSJJUXA
 +6HH8z5V+ZMZNPOvdV8j9UASwTzONgcTL5o6bKxjiQi/LwbOs1ajHLnWleIEY5HQ6HypZMfJa
 zu3WLNowRCNQt7u9VC1jt+AH7TUSuZepOlqHEesH3moqVvu0NCS584/YnZFi7EUWzxaICe1RZ
 81iEGAw
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Remove Michal Marek from Kbuild maintainers as there is response since
October 2017.

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 61a6848192c5..45c88bb34b6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11083,7 +11083,6 @@ F:	fs/autofs/
 
 KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
 M:	Masahiro Yamada <masahiroy@kernel.org>
-M:	Michal Marek <michal.lkml@markovi.net>
 R:	Nick Desaulniers <ndesaulniers@google.com>
 R:	Nicolas Schier <nicolas@fjasle.eu>
 L:	linux-kbuild@vger.kernel.org
-- 
2.37.2

