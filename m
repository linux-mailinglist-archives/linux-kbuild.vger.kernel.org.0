Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03161262190
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Sep 2020 22:56:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729305AbgIHU4l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Sep 2020 16:56:41 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:32333 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729941AbgIHU4i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Sep 2020 16:56:38 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 088Ku0N4015321;
        Wed, 9 Sep 2020 05:56:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 088Ku0N4015321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599598561;
        bh=LX+XJs0yGQNfGdRdOODWn2d8GyxE3kmbFFKuth+1obY=;
        h=From:To:Cc:Subject:Date:From;
        b=c13f+fwghiGlkOh/iS+d87XXylCY1v40ms1Bi3rnW2Y42HlCZQbVDcZ2lYSmCS9/3
         E9k8Jum3BUAqWqYh/EymQCGWPXbtobclHxwLqdGIDOJ/RM654+nmCEvinbKDtG+miv
         LhGMzA39jvrOEj2ceix01rJB+djf9mNBa2ReO6UNjJJ/iE2bHybGgADZn2+zxbFEm7
         2F/3mEQq7JxDvBO8RudfxYdFaIOYOsL4f0/j8C290DCjDX33Hwjk8A0fk09/Ynwhy9
         OoatrKPPo7wZQ3WJH4oM3uTwwRoDVfwvSk6udWwlBVHQgiwdnq0ja3T7xFHvLxhaCy
         HnZ1QKWhlZkRw==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: do not create built-in objects for external module builds
Date:   Wed,  9 Sep 2020 05:55:57 +0900
Message-Id: <20200908205557.2746352-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'make M=/path/to/your/external/module' creates a pointless built-in.a
in the top of the external module directory because KBUILD_BUILTIN is
set to 1.

Clear KBUILD_BUILTIN when we are building external modules so that
'make M=...' and 'make M=... modules' work equivalently.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ec2330ce0fc5..29878033f9d6 100644
--- a/Makefile
+++ b/Makefile
@@ -1692,7 +1692,8 @@ else # KBUILD_EXTMOD
 #                      Install the modules built in the module directory
 #                      Assumes install directory is already created
 
-# We are always building modules
+# We are always building only modules.
+KBUILD_BUILTIN :=
 KBUILD_MODULES := 1
 
 build-dirs := $(KBUILD_EXTMOD)
-- 
2.25.1

