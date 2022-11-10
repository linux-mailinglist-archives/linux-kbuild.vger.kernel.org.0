Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68DCC624511
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Nov 2022 16:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbiKJPGE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Nov 2022 10:06:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiKJPGC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Nov 2022 10:06:02 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CB91DF11
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Nov 2022 07:05:53 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.49.48]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N7hrw-1p77Jw0axO-014jwP; Thu, 10 Nov 2022 16:05:30 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id 3B8113C1BC;
        Thu, 10 Nov 2022 16:05:22 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id 337A9974; Thu, 10 Nov 2022 16:05:18 +0100 (CET)
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 3/3] MAINTAINERS: Add linux-kbuild's patchwork
Date:   Thu, 10 Nov 2022 16:04:25 +0100
Message-Id: <20221110150425.164386-4-nicolas@fjasle.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221110150425.164386-1-nicolas@fjasle.eu>
References: <20221110150425.164386-1-nicolas@fjasle.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+52nCadw1fAkswWJNUX0/wZ4Ufp7Okby+8Uv+6p/3XklQowDXq+
 FblQ/bL6fny3DxqsoU6vT0XF7A69Uri0EQTcclUKQda+2AAWxkAmCm2SQWRZgFPkMWGsI3c
 oUbJtDrMrmwVB2yQPBBnlEOcYKMrJOgqdas/1YUDP6cmdjI937O5ENXBN5h4od0GDtY+Pbk
 8F+CwrtZ2zARHwVWGoH4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sNIbWP8VOhA=:BBNpbcTYRfk+YRxXWLuHSx
 vRO+mqLdPeqptQmO58mBCBSAeklYx/27C5FuntxbPhUlRXr85O5vUTodfb239+xXDM53Jadyc
 YzaG+EMRWhP8lJm9wBw7wm0etVDTsPTcK0aZCc3ld2mB5UTdCod4IEm9Yu8tDysddlUZdKfms
 MoJNRMR5WZj1GMB0La+YF1K85EGlUNqQardD5jnkCa0fw69REw/xpChoS4XCCLZNbpgXQw4bz
 sqwlVmn/AB49QJbfocTfz4TRDWtfPHFMfyWGrcr71z/H0GVzOUC5FitTABLENCrqu1sFKroq/
 4CX8S2n6/huAfkr0aFNQfEu9xEVkLp172Y7mnNGsx10Ap58s7vPeEwol2vZky8Qk3eFZ+0Ltq
 jrXinp/naCpZkwkc8O7NTwUxTVJ92U9WIuRzAD+/pHDvWiufxx0QLu15oOE1YdgIrK6/pnd03
 MIp9lJNY+fqR4nplRs0E45xVb7omcfDcz/ha0MI/lnn+MEkZhIWoDWUAOJxR7gq8i5r5bjIca
 zt4mPATSs+0eFp6zqxD45g3cL344l5oRyzj9MZFIXmlDfEgg618Pikc9IywTqaFH7RwKYdng0
 /iBrn0eDeA0rPDk3k1NUjxVm3r+H9MHeThWeZx4wt4eruALTkFqeAzqQskbXpPLJ3nAhvQVAs
 4ii6icR+6Pc0qvmdrKNt3q9nYlxuPgpZOWEAUXNvmK11gg4IXYI+S7XAbImC78SmFxLK9T3Bm
 bhgTcX42mKl2whzoLJYzIK13KDNuptjMyJMQYrAdHNofzW1vlPBhrQ7OZmZ5geAcD33/NqvnX
 Z/vsn+r
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add patchwork URL for Kconfig and Kbuild.

Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 45c88bb34b6b..b031b52e32a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11026,6 +11026,7 @@ KCONFIG
 M:	Masahiro Yamada <masahiroy@kernel.org>
 L:	linux-kbuild@vger.kernel.org
 S:	Maintained
+Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig
 F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
@@ -11087,6 +11088,7 @@ R:	Nick Desaulniers <ndesaulniers@google.com>
 R:	Nicolas Schier <nicolas@fjasle.eu>
 L:	linux-kbuild@vger.kernel.org
 S:	Maintained
+Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
 F:	Documentation/kbuild/
 F:	Makefile
-- 
2.37.2

