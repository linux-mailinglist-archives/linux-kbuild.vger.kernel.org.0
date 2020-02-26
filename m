Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9911C170669
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 18:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbgBZRpb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 12:45:31 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:64470 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgBZRpb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 12:45:31 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 01QHj1hX027457;
        Thu, 27 Feb 2020 02:45:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 01QHj1hX027457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582739102;
        bh=wHYTdHTVndm1iEwuP4oVebWI1ltNgDzshUcclCf018M=;
        h=From:To:Cc:Subject:Date:From;
        b=MgzOC99AUCZ6ArR7yLjwwLfee5vjCC+VRrH2IzFcmisXKy+U0H430pjYvPWW6c1yH
         AOCnypfFN4cQnZBi1YQpK07pMLRk4aHvWHGB8DSXlV84zIIJPCk/xi9X25N7xumDPj
         oGsnf3HGZVwCsuLqQJwcEcGI/h6VFGt+BSxK/qbSjKqYYuJWD/y9taIuTj3Z7nnPpp
         tzlwFl3I1F1OA+0dZbSVLL/P1X/Fkaw85UBdgq7jRRVVoPtxZWTdHfZn9wbYQLLGe0
         oueGsoIe9LUdoW7timrxPtps3emEDi2pljNEIu+kRMTAsS3l4oYWnXo/M15ujecfJ9
         o8h6Xuk6bEVWw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH] kbuild: get rid of trailing slash from subdir- example
Date:   Thu, 27 Feb 2020 02:44:58 +0900
Message-Id: <20200226174458.8115-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

obj-* needs a trailing slash for a directory, but subdir-* does not.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 0e0eb2c8da7d..c9adfa1f9e21 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -765,7 +765,7 @@ is not sufficient this sometimes needs to be explicit.
 	Example::
 
 		#arch/x86/boot/Makefile
-		subdir- := compressed/
+		subdir- := compressed
 
 The above assignment instructs kbuild to descend down in the
 directory compressed/ when "make clean" is executed.
-- 
2.17.1

