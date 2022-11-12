Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 169D96267F3
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Nov 2022 09:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbiKLIKf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Nov 2022 03:10:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234787AbiKLIKd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Nov 2022 03:10:33 -0500
X-Greylist: delayed 147877 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 12 Nov 2022 00:10:29 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94EC613E38
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Nov 2022 00:10:29 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.96.85]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MsqIi-1p9F821Z16-00t8xn; Sat, 12 Nov 2022 09:07:26 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id B005D3C09F;
        Sat, 12 Nov 2022 09:07:23 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id 1B0866F8; Sat, 12 Nov 2022 09:07:22 +0100 (CET)
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 0/3] MAINTAINERS: Update Kbuild and Kconfig entries
Date:   Sat, 12 Nov 2022 09:07:14 +0100
Message-Id: <20221112080717.17914-1-nicolas@fjasle.eu>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XN7bIIK1QwtfwAfOknQCosHUGYmdYxSObGJU2rlPyjVwZn/nhwJ
 0lAoLnH+Ja7HvMom0ZmaWo3w2swkvXTKD9PEinX6UmVKzKL6nRM2SslLVMOjn7uIAqCAjTR
 GWNgdpon4BeHUtZTxhnMjQNJ1vivJ4fsqbQGgzTIJ39W8ME4upJKqCFJyj0ZCA2VTpEH13s
 SEbEszgM87APzMU4ThpxQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+7naH8oVwSc=:c+OHTZiqNlNvoWqip21XvR
 aDXnSv+/DYtdd96XwYgINrcp36eOPnP3mV2sSTaKEf0MoM5zqP/Qf1gOlaxck0KxEPvHmmcyr
 V9MPaemVvC7bpprrilFUcudqldajSFYgAgLtTn6bd9uOwDzYjrP7K49b2zbKH9EUFa1GKiPh9
 0SfCFPFQtz5k9F/udN4wLL8c8PZqzjkCq9rZDNCWLb4W6RxDYHWRJM4LnZhMZiKd3OpeokZRu
 8rEPHIPsujhT1chp44tna2pZBvPAuXXK6Q9wPeMGQ0zuOIHQ41+nlZL3M4lhUZUR06TD+Fc28
 6DMsA/9cYBSU3gzBezG/I4mMfgao68v2N26yonOn2rRRMltzwOkuZaOb61ZW14ELWZzIqrNMO
 4RR0Nm9Br9GXmiOhuHRcsYA/MtntjwrXg6l98PRVSDn5iDPsreauIOpJ8G29jTb4P6tHxB6dy
 9A82RCdAf3M+JiQBI8H7pesh4hm8f3Ish5LuYbys+1GBSKXmjeVo8xlJBAFOIkKopjbnVankr
 c+n7FtM9tcw3Ka9jQZ/9LitQYFhv0U+dC2vVm4whdWCl17grBUBuACrUwX2p5S/E8lRyKP90P
 atFUN9+VFcEvXi9pPcC9dMawix5YLH9vRs2FvxJ0gkUpMwA3o6d/oI+GpTEnLeFG/2SSbxD2q
 cw9ytPiW2H/dlH6IfKUmBJETVijWPAAQPOXfT2qRbVY6LR4S+wUooUeSL7DAEGKajqpmMZd1a
 TZeGBTWk4jFr9Y/RtbQ1ezwSm+y+/RaXBr/KjiWlhQFl3AHwwxLGfeWC2LE0p+bPCZw2Xhqjl
 HroFqWg+1DekYqeEgZiBAVUi2GdIhQYWF6iCDXdem8hb5ZMLmzAjom7l8mxNvy5mQFRzBR6uc
 +1aXpDvlWdVDyU76haUtaOrsFrhXwHw6Hnx9bq73i6X2GbL8qyZK3o5D+BAPuz8U8Ipbj6fSH
 kvaWyXQw+LAmKEZXhS4PJPrzxO/BD3lRhs1NAFA3fHy6vpziENDUvACAmqqjENeP/K3lavkDs
 cYz2tOAXZgYg4QMt8fqMF0SSrNaja9Ae+1I+3jrQE1XOP72YFfjSCupsu9FfgdqZdytQYeDOy
 Bl0XYiKUPn/2J3R/+TAyHhktwJPhCIZmVH7a3AzJ35w45TI8ISMdozMg48ESEadrW8P3pd5jr
 7Shb22B0NKs7BUkqmY0yKzXyCLEp7FEe04FiPId5TuKyjuATWaPh1K6+9C70SRAodoIVsKg35
 9rPTTOpBEynFt6JopzAPUVcnYUo+nmNwpWRyzPp3SAHLmYtoxfmOOJRZatbX039le4JkGyi/O
 zjtE914pAweA8axPM2xM0Jwo8nYoRg==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Update MAINTAINERS by adding Nathan and myself to Kbuild reviewers and moving
emeritus maintainer Marek to CREDITS.  Further, add the missing patchwork URLs
for Kconfig and Kbuild.

Nicolas Schier (3):
  MAINTAINERS: Add Nathan and Nicolas to Kbuild reviewers
  MAINTAINERS: Remove Michal Marek from Kbuild maintainers
  MAINTAINERS: Add linux-kbuild's patchwork

 CREDITS     | 4 ++++
 MAINTAINERS | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

Changes v1 -> v2:
  * patch1: Also add Nathan to Kbuild reviewers (Nick, Nathan), and update commit msg
  * patch2: Add missing 'no' to commit msg (Randy)
  * patch2: Add CREDITS entry for Michal (Nick)


Range-diff against v1:
1:  e827247c902b ! 1:  efd3cbed0d42 MAINTAINERS: Add Nicolas Schier to Kbuild reviewers
    @@ Metadata
     Author: Nicolas Schier <nicolas@fjasle.eu>
     
      ## Commit message ##
    -    MAINTAINERS: Add Nicolas Schier to Kbuild reviewers
    +    MAINTAINERS: Add Nathan and Nicolas to Kbuild reviewers
     
    -    As suggested by Nick, add myself to Kbuild reviewers since I have been
    -    reviewing patches for some time.  Citing from Nick's commit 36f1386d34120:
    -    "I still have a long way to go in terms of mastery of GNU make, but at the
    -    least I can help with more code review."
    +    As suggested by Nick, add Nathan and myself to Kbuild reviewers to share more
    +    review responsibilities.
     
         Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
    +    Acked-by: Nick Desaulniers <ndesaulniers@google.com>
    +    Acked-by: Nathan Chancellor <nathan@kernel.org>
     
      ## MAINTAINERS ##
    -@@ MAINTAINERS: KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
    +@@ MAINTAINERS: F:	fs/autofs/
    + KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
      M:	Masahiro Yamada <masahiroy@kernel.org>
      M:	Michal Marek <michal.lkml@markovi.net>
    ++R:	Nathan Chancellor <nathan@kernel.org>
      R:	Nick Desaulniers <ndesaulniers@google.com>
     +R:	Nicolas Schier <nicolas@fjasle.eu>
      L:	linux-kbuild@vger.kernel.org
2:  88524e0789c3 ! 2:  c31750a47b44 MAINTAINERS: Remove Michal Marek from Kbuild maintainers
    @@ Metadata
      ## Commit message ##
         MAINTAINERS: Remove Michal Marek from Kbuild maintainers
     
    -    Remove Michal Marek from Kbuild maintainers as there is response since
    -    October 2017.
    +    Remove Michal Marek from Kbuild maintainers as there is no response from him
    +    since October 2017.  Add an entry for Michal in CREDITS.
    +
    +    Michal, thanks for maintaining Kbuild for almost eight years!
     
         Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
    +    Cc: Michal Marek <michal.lkml@markovi.net>
         Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
     
    + ## CREDITS ##
    +@@ CREDITS: S: 482 Shadowgraph Dr.
    + S: San Jose, CA  95110
    + S: USA
    + 
    ++N: Michal Marek
    ++E: michal.lkml@markovi.net
    ++D: Kbuild Maintainer 2009-2017
    ++
    + N: Martin Mares
    + E: mj@ucw.cz
    + W: http://www.ucw.cz/~mj/
    +
      ## MAINTAINERS ##
     @@ MAINTAINERS: F:	fs/autofs/
      
      KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
      M:	Masahiro Yamada <masahiroy@kernel.org>
     -M:	Michal Marek <michal.lkml@markovi.net>
    + R:	Nathan Chancellor <nathan@kernel.org>
      R:	Nick Desaulniers <ndesaulniers@google.com>
      R:	Nicolas Schier <nicolas@fjasle.eu>
    - L:	linux-kbuild@vger.kernel.org
3:  0e05c2d815d2 ! 3:  59eeba8ee2b7 MAINTAINERS: Add linux-kbuild's patchwork
    @@ Commit message
         Add patchwork URL for Kconfig and Kbuild.
     
         Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
    +    Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
     
      ## MAINTAINERS ##
     @@ MAINTAINERS: KCONFIG
-- 
2.37.2

