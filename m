Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC2C1DC644
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2020 06:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgEUEcS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 00:32:18 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:50204 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgEUEcQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 00:32:16 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04L4VLtS007830;
        Thu, 21 May 2020 13:31:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04L4VLtS007830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590035482;
        bh=XREDi7cQniQC6JrUn15gjq7aAsHa5WcXOyjUiUSR7A4=;
        h=From:To:Cc:Subject:Date:From;
        b=JY+7/RM4sCtjM07H0fmsksiUfo7OBpAdZLavpsAfodrMPX2Xf1wYJNAfxO56Dz1PL
         0TpL0H7H1r41QviMcWm7l+ZMn/+fvdLTyIBdBXorQODItT0oCCyNkGnWSQMoCQ4+SS
         K46ijVSmGVoMlRjYox1JdO77xiIwVPUx2yekOkxaC8DwVAuk9QDG8uEmmwMEAfvEd8
         noPU1bKoyptvf/EZ+zbO/b/9LtN6zFRUTnSJ4yDCTKcyswil4jYbMMMheoFqD6sscQ
         a7H75p+lkk9Y/1aKY/wJ6FGDgrdISLa4abNXzcNO6Nw6v8Ol2NietWu7NUlliXwhBS
         2sFb3oK8UT7Rg==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: doc: remove documentation about copying Module.symvers around
Date:   Thu, 21 May 2020 13:31:17 +0900
Message-Id: <20200521043117.242585-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a left-over of commit 39808e451fdf ("kbuild: do not read
$(KBUILD_EXTMOD)/Module.symvers").

Kbuild no longer supports this way.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/modules.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index e0b45a257f21..a45cccff467d 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -528,18 +528,6 @@ build.
 		will then do the expected and compile both modules with
 		full knowledge of symbols from either module.
 
-	Use an extra Module.symvers file
-		When an external module is built, a Module.symvers file
-		is generated containing all exported symbols which are
-		not defined in the kernel. To get access to symbols
-		from bar.ko, copy the Module.symvers file from the
-		compilation of bar.ko to the directory where foo.ko is
-		built. During the module build, kbuild will read the
-		Module.symvers file in the directory of the external
-		module, and when the build is finished, a new
-		Module.symvers file is created containing the sum of
-		all symbols defined and not part of the kernel.
-
 	Use "make" variable KBUILD_EXTRA_SYMBOLS
 		If it is impractical to add a top-level kbuild file,
 		you can assign a space separated list
-- 
2.25.1

