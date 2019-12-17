Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A301D122AA2
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 12:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfLQLwd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Dec 2019 06:52:33 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:29448 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfLQLwc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 06:52:32 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id xBHBpwpM016333;
        Tue, 17 Dec 2019 20:51:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xBHBpwpM016333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576583519;
        bh=a+hfI4JORzXhpsCVcvfC7LTXQBulUva6+4DpZgrovXU=;
        h=From:To:Cc:Subject:Date:From;
        b=lrEFZnVSRjXeMh9fEwvw/xmNHZpuarjJTBDtaj2Wc8veQzxEUncv1CToyU4pGugnv
         v9hef7f0ewG04UQoIKzE121VfJbNB42/3FvbJsCCTb3qfMDQ36x1+bEUqLpsG4Gqud
         FxBaYqL9sHa5ekvFU7kqpXP9zORpsPjPIcZPz3r2UHRHsfF8eU260cpdGFB4XBJ48l
         DMMDfBGIn3P0FSoGriBNxtCH0fKNETcl54A7DiyMHgNKfwOV/aaO+LPQIco1yui6eZ
         F9fLyif0n2NbZuQ8ELzSYaPyhw7YvVWhc56r3aIRibk7qz7xF7FKcmN7NAECJq3E4x
         R2M8nilKL0x4Q==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: remove ---help--- from documentation
Date:   Tue, 17 Dec 2019 20:51:51 +0900
Message-Id: <20191217115151.12465-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 84af7a6194e4 ("checkpatch: kconfig: prefer 'help' over
'---help---'"), scripts/checkpatch.pl warns the use of ---help---.

This still exists, but new code should avoid using it.
Let's stop advertising it in documentation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 74bef19f69f0..231e6a64957f 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -196,14 +196,11 @@ applicable everywhere (see syntax).
   or equal to the first symbol and smaller than or equal to the second
   symbol.
 
-- help text: "help" or "---help---"
+- help text: "help"
 
   This defines a help text. The end of the help text is determined by
   the indentation level, this means it ends at the first line which has
   a smaller indentation than the first line of the help text.
-  "---help---" and "help" do not differ in behaviour, "---help---" is
-  used to help visually separate configuration logic from help within
-  the file as an aid to developers.
 
 - misc options: "option" <symbol>[=<value>]
 
-- 
2.17.1

