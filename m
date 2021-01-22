Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE80E300CAC
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 20:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbhAVSjT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Jan 2021 13:39:19 -0500
Received: from mickerik.phytec.de ([195.145.39.210]:53988 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729829AbhAVSXe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jan 2021 13:23:34 -0500
X-Greylist: delayed 963 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 Jan 2021 13:21:18 EST
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1611338654; x=1613930654;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=b43XII4jJnJFqAsER8sZtwIeu6b8S9YogbUU4Zr4Dq4=;
        b=bJGuVtlO7hPRsUj2xENhLS7uzQTVmLArQ8ElxXR9kKQIyRBpNedbSoNgG3fSI3Cq
        mP3yNHD576Kgznm3tlvX/2WPvUZKTfGBmrcoaydSYPNPcqnZmxmsgV7DOM+WFs9r
        nL+rNfi/FlcojgVhdgOXJlHUN8f0topnwRHo2oJ8vo8=;
X-AuditID: c39127d2-0d3b770000001c86-f1-600b139dc3c9
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 1F.B6.07302.D931B006; Fri, 22 Jan 2021 19:04:14 +0100 (CET)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021012219041356-181776 ;
          Fri, 22 Jan 2021 19:04:13 +0100 
From:   Robert Karszniewicz <r.karszniewicz@phytec.de>
To:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Philipp Rudo <prudo@linux.ibm.com>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Robert Karszniewicz <r.karszniewicz@phytec.de>,
        Robert Karszniewicz <avoidr@posteo.de>
Subject: [PATCH] Documentation/Kbuild: Remove references to gcc-plugin.sh
Date:   Fri, 22 Jan 2021 19:04:13 +0100
Message-Id: <1611338653-175404-1-git-send-email-r.karszniewicz@phytec.de>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 22.01.2021 19:04:13,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 22.01.2021 19:04:14,
        Serialize complete at 22.01.2021 19:04:14
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupiluLIzCtJLcpLzFFi42JZI8DApTtPmDvBoH0aq8XK0+vZLZ4caGe0
        ONOda7GwbQmLxbz1Pxkt/uzawWTx8MENVouFZ6ItJk2fyOLA6TG74SKLx6ZVnWweExYdYPRY
        3DeZ1eNum43Hr8OiHp83yQWwR3HZpKTmZJalFunbJXBl3L//gLlgE2/Fp+6f7A2MK7m7GDk5
        JARMJE5d28raxcjFISSwlVFi6fvTzBDOeUaJg3+nM4NUsQFV7W6+BZYQEZjOKHFz5gGwFmaB
        G4wS7Se6WECqhAU8JZZ8nQVmswioSvTNfc4OYvMCxd/umsYEsU9O4ua5TrBJEgKNTBLzvhxm
        hUgISZxefJZ5AiPPAkaGVYxCuZnJ2alFmdl6BRmVJanJeimpmxiB4XV4ovqlHYx9czwOMTJx
        MB5ilOBgVhLhfWTJkSDEm5JYWZValB9fVJqTWnyIUZqDRUmcdwNvSZiQQHpiSWp2ampBahFM
        lomDU6qBMfveXt0Gvo6s7r8fVkydMy3e+oSw3nP1eZ+nJU/g2zvnvtrV9ctLlj7pCVn6i/lW
        1y3ThLk1m1ewf16VH3v4o8NOT32Rzy7uja2R01dH3TtysaNB1vTMv7q1Mw9eaZPiSTodHvg8
        RT3/2JOZ9j1PWQUXWWSvsN7xrs7w9Zmtzw82FGu8T/Dt5lRiKc5INNRiLipOBADd4Ds3HQIA
        AA==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

gcc-plugin.sh has been removed in commit
1e860048c53e ("gcc-plugins: simplify GCC plugin-dev capability test").

Signed-off-by: Robert Karszniewicz <r.karszniewicz@phytec.de>
---
 Documentation/kbuild/gcc-plugins.rst |  6 ------
 scripts/dummy-tools/gcc              | 15 ---------------
 2 files changed, 21 deletions(-)

diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
index 4b1c10f88e30..63379d0150e3 100644
--- a/Documentation/kbuild/gcc-plugins.rst
+++ b/Documentation/kbuild/gcc-plugins.rst
@@ -47,12 +47,6 @@ Files
 	This is a compatibility header for GCC plugins.
 	It should be always included instead of individual gcc headers.
 
-**$(src)/scripts/gcc-plugin.sh**
-
-	This script checks the availability of the included headers in
-	gcc-common.h and chooses the proper host compiler to build the plugins
-	(gcc-4.7 can be built by either gcc or g++).
-
 **$(src)/scripts/gcc-plugins/gcc-generate-gimple-pass.h,
 $(src)/scripts/gcc-plugins/gcc-generate-ipa-pass.h,
 $(src)/scripts/gcc-plugins/gcc-generate-simple_ipa-pass.h,
diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
index 33487e99d83e..a484de576e6f 100755
--- a/scripts/dummy-tools/gcc
+++ b/scripts/dummy-tools/gcc
@@ -74,18 +74,3 @@ if arg_contain -S "$@"; then
 		exit 0
 	fi
 fi
-
-# For scripts/gcc-plugin.sh
-if arg_contain -print-file-name=plugin "$@"; then
-	plugin_dir=$(mktemp -d)
-
-	sed -n 's/.*#include "\(.*\)"/\1/p' $(dirname $0)/../gcc-plugins/gcc-common.h |
-	while read header
-	do
-		mkdir -p $plugin_dir/include/$(dirname $header)
-		touch $plugin_dir/include/$header
-	done
-
-	echo $plugin_dir
-	exit 0
-fi
-- 
2.7.4

