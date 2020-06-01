Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34AF1EA814
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 19:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgFAREc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 13:04:32 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:54644 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgFAREc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 13:04:32 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 051H3YsA023599;
        Tue, 2 Jun 2020 02:03:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 051H3YsA023599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591031015;
        bh=Dd0LoO9Kr6VJfNgtMRdGvuMGsxYhaWCpVC47pufepAE=;
        h=From:To:Cc:Subject:Date:From;
        b=rqtizz04frZHiSHLkP7dNmYTsDaYV0Kt9nJCGXuCdMPjHGpCZo4sLhKbQb0DW3rKU
         xLwf6ZSjt/gGAqRfsAFu4+PsUcrcjSSs+00By8pclHNh56/RSxHUp7i2bn+m1AUbg8
         GtCjc8iELFofix8Hzjwh5gUJW48em/gCZ6iNul7qmXzAtivE3jnN4yC7qXJNe8z5VV
         Ih1BuSiF8mq4stOU/Xo9WETur8l2ik3gynYDsKvymQyxLJdG/z115w8iuNaUAgTjMf
         kquZ4oVHxAanWmbX7G6IzcRa2tx4Saxg+2rM8delbBkt7uGVlIEG5k1HpMTblzIBoY
         UwZH390kdelrg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: doc: rename LDFLAGS to KBUILD_LDFLAGS
Date:   Tue,  2 Jun 2020 02:03:28 +0900
Message-Id: <20200601170328.3053311-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit d503ac531a52 ("kbuild: rename LDFLAGS to KBUILD_LDFLAGS") missed
to update the documentation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 2a18aea7c043..6515ebc12b6f 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -910,7 +910,7 @@ When kbuild executes, the following steps are followed (roughly):
 7.1 Set variables to tweak the build to the architecture
 --------------------------------------------------------
 
-    LDFLAGS
+    KBUILD_LDFLAGS
 	Generic $(LD) options
 
 	Flags used for all invocations of the linker.
@@ -919,7 +919,7 @@ When kbuild executes, the following steps are followed (roughly):
 	Example::
 
 		#arch/s390/Makefile
-		LDFLAGS         := -m elf_s390
+		KBUILD_LDFLAGS         := -m elf_s390
 
 	Note: ldflags-y can be used to further customise
 	the flags used. See chapter 3.7.
-- 
2.25.1

