Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB97F1A660
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2019 05:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbfEKDOZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 23:14:25 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:34419 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfEKDOY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 23:14:24 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x4B3ECOe025651;
        Sat, 11 May 2019 12:14:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x4B3ECOe025651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557544453;
        bh=Ej5OulpEUS8O5pVIHr0SZmVTAlpu2RMa77srJIMPuco=;
        h=From:To:Cc:Subject:Date:From;
        b=gepxBlwgOYgCEM9SEpDQMf93NIP8BmizNa0VsoElIE6c5945J/0kjctJK6y1J+oND
         x1jgWeMcba/X1vwYq5Ny0d6wUxzY+B5++yCMhsnRt4KGlEnYIn0xr4SciNsGGqhGfm
         oATJKVYOCbVhg2ixNSNonm491KQZICf9mYr1j+kPOAjmG7+BQmOrGlHdA0xgY9RCYM
         4Wmsh/sdxEZNoXEiWKAPVJxt03Pt4gxnnP4ggiIi074AuPUoiDLaKZAs6c8FInTZyC
         fgKHm8hHYn3vWc+kMmBrFOTWZxcQ8zQ+2Vi4OicQAcdVpJXjR5oohuIRh1ZruI+0q4
         s6KAM1hC8BaAw==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] .gitignore: exclude .get_maintainer.ignore and .gitattributes
Date:   Sat, 11 May 2019 12:13:54 +0900
Message-Id: <1557544434-21126-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Also, sort the patterns alphabetically. Update the comment since
we have non-git files here.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/.gitignore b/.gitignore
index d263ca9..7587ef56 100644
--- a/.gitignore
+++ b/.gitignore
@@ -81,12 +81,14 @@ modules.builtin
 /tar-install/
 
 #
-# git files that we don't want to ignore even if they are dot-files
+# We don't want to ignore the following even if they are dot-files
 #
+!.clang-format
+!.cocciconfig
+!.get_maintainer.ignore
+!.gitattributes
 !.gitignore
 !.mailmap
-!.cocciconfig
-!.clang-format
 
 #
 # Generated include files
-- 
2.7.4

