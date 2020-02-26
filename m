Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7DF71706B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 18:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgBZRyE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 12:54:04 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:24983 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgBZRyD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 12:54:03 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 01QHrREQ000886;
        Thu, 27 Feb 2020 02:53:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 01QHrREQ000886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582739608;
        bh=0ukicgoAH0jaOd0t0OEOCVvWpsosXabrsOxj2/s/m/Q=;
        h=From:To:Cc:Subject:Date:From;
        b=FV6VqWeJkHiy/cD9Lp2Vq00Ga6v7Swe1AYfnm5CSR/6PmKr6ug1wD1/MiNzW0MD8v
         LWP6p9Yx6sbwVVNdB5+FkuE9+4WIWlL5zh04GgS4Dfl7GSXc71T9MK0VCSuWxiYxfd
         woG8YYkOdhlcQuHmFmAWdJ0r38fIw4Ay1cl7pWLG4OLgSwwJSI+aIQ02IEtnM0O/TA
         Vqdl9qbgZ2b9eb8LgQIv5MTiu41hhLvOfuNofncs8wk5nn/u1al4d1RqYr9p2XjPcA
         YAFJMIETZgs4Ccq0M8mrLxs57PHXHs4/b3lUgnV/ZyEJScrfoDLKMu+zEIn2XHAZvd
         R/mQFoKDFtwPQ==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] kbuild: remove trailing slash from devicetree/binding/ for descending
Date:   Thu, 27 Feb 2020 02:53:25 +0900
Message-Id: <20200226175325.8787-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

obj-* needs a trailing slash for a directory, but subdir-* does not
because it already implies a directory.

Also, change subdir-y to subdir- to ensure this is effective only
for cleaning targets.

This makes the cleaning log consistent. (no trailing slash)

Before:

  $ make clean
  CLEAN   Documentation/devicetree/bindings/

After:

  $ make clean
  CLEAN   Documentation/devicetree/bindings

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index d77bb607aea4..39569a2e1953 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -2,7 +2,8 @@
 # Makefile for Sphinx documentation
 #
 
-subdir-y := devicetree/bindings/
+# for cleaning
+subdir- := devicetree/bindings
 
 # Check for broken documentation file references
 ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
-- 
2.17.1

