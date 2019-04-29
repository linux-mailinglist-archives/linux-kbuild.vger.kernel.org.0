Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA91AE5F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2019 17:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbfD2PS2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Apr 2019 11:18:28 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:50892 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728249AbfD2PS2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Apr 2019 11:18:28 -0400
Received: from grover.flets-west.jp (softbank126125154137.bbtec.net [126.125.154.137]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x3TFI1nY005205;
        Tue, 30 Apr 2019 00:18:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x3TFI1nY005205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1556551082;
        bh=y7m/Zbtbgnjkpx7PoLSWgCOzAu/1IfpmrgyIWbMKpRs=;
        h=From:To:Cc:Subject:Date:From;
        b=AblYnwhOIGTIAu1NrJ21cegN9ywsGUPizB5VL8huzgU3lde/Qne9RpZG55SAkcXZG
         9rQuWGlQo+ReikfpcKHfqsGKgh85/6ioSxoLZgvQKbSqRTLRH13pifk617gE8xQ0gv
         nvBu09TqwpP0FYB0Og3zX+KS1j4ILtgQFZOfOPppePgKmILvEJo1SRHkii4uP+jJId
         2Xiv2ipp3bhaqFsRn5h0Uhdntbpm8VPK98nhBhbMkqVqoEcafKAJDVN08O8oTKBW8j
         xrNqoYpkJiPt0dNcyP6VJPfCmH/wAI3I9q/TXI1vUriJbDq3M0FkrWJEYLN6EtKCey
         rBulr4PY2Valw==
X-Nifty-SrcIP: [126.125.154.137]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] .gitignore: add / prefix/suffix to generated include directories
Date:   Tue, 30 Apr 2019 00:17:53 +0900
Message-Id: <1556551073-19433-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Clarify these directory paths are relative to the top of source tree.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/.gitignore b/.gitignore
index a20ac26..e7bb6c6 100644
--- a/.gitignore
+++ b/.gitignore
@@ -90,10 +90,10 @@ modules.builtin
 #
 # Generated include files
 #
-include/config
-include/generated
-include/ksym
-arch/*/include/generated
+/include/config/
+/include/generated/
+/include/ksym/
+/arch/*/include/generated/
 
 # stgit generated dirs
 patches-*
-- 
2.7.4

