Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E62BA126145
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 12:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfLSLwX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 06:52:23 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:53153 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbfLSLwX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 06:52:23 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id xBJBpA5E025113;
        Thu, 19 Dec 2019 20:51:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com xBJBpA5E025113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576756271;
        bh=13lrGAJJ2x/6FuBvyBEwfGd2aNby5ZIL20FfDY8lhqI=;
        h=From:To:Cc:Subject:Date:From;
        b=b7IHOHfY0A0wMqmrhiyzNrbSEJOen74MGyrMd7xy6fRQ1TpVOpyYLshSMpw8sRqAM
         VKirQRVgkBjDthaeqrpOW5bc0D2Xeliw5wHcx7hRneRSfWyB3ovVIFwAbnz54hnvzn
         CjJRFv7SCSy769UzDCXBQjBE3LWXAKc5B2owJsXtOvbyZKCEfz3wsCNaWY9eHJreFV
         SyLATB43U+HCCA2k7cVrh7Q46BW8FTDmmyEUDa7SpyUOUC8tnnJvHXDskXOtjpbW3b
         GHZLGy9ME2FniUai6YL0m30AksBpwv0PpmWh2FoRshDz96BpVZjpUrOvyRha7JNDkw
         mPsg99rnxkWsQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Johan Hovold <johan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: clarify the difference between obj-y and obj-m w.r.t. descending
Date:   Thu, 19 Dec 2019 20:51:00 +0900
Message-Id: <20191219115100.958-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Kbuild descends into a directory by either 'y' or 'm', but there is an
important difference.

Kbuild combines the built-in objects into built-in.a in each directory.
The built-in.a in the directory visited by obj-y is merged into the
built-in.a in the parent directory. This merge happens recursively when
Kbuild is ascending back towards the top directory, so built-in objects
are linked into vmlinux eventually. This works properly only when the
Makefile that specifies obj-y is reachable by the chain of obj-y.

On the other hand, Kbuild does not take built-in.a from the directory
visited by obj-m. This it, all the objects in that directory are supposed
to be modular. If Kbuild descends into a directory by obj-m, but the
Makefile in the sub-directory specifies obj-y, those objects are just
left orphan.

The current statement "Kbuild only uses this information to decide that
it needs to visit the directory" is misleading. Clarify the difference.

Reported-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index b9b50553bfc5..d7e6534a8505 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -297,9 +297,19 @@ more details, with real examples.
 	If CONFIG_EXT2_FS is set to either 'y' (built-in) or 'm' (modular)
 	the corresponding obj- variable will be set, and kbuild will descend
 	down in the ext2 directory.
-	Kbuild only uses this information to decide that it needs to visit
-	the directory, it is the Makefile in the subdirectory that
-	specifies what is modular and what is built-in.
+
+	Kbuild uses this information not only to decide that it needs to visit
+	the directory, but also to decide whether or not to link objects from
+	the directory into vmlinux.
+
+	When Kbuild descends into the directory with 'y', all built-in objects
+	from that directory are combined into the built-in.a, which will be
+	eventually linked into vmlinux.
+
+	When Kbuild descends into the directory with 'm', in contrast, nothing
+	from that directory will be linked into vmlinux. If the Makefile in
+	that directory specifies obj-y, those objects will be left orphan.
+	It is very likely a bug of the Makefile or of dependencies in Kconfig.
 
 	It is good practice to use a `CONFIG_` variable when assigning directory
 	names. This allows kbuild to totally skip the directory if the
-- 
2.17.1

