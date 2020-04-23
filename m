Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAA71B5221
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 03:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgDWBuM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Apr 2020 21:50:12 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:30682 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgDWBuL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Apr 2020 21:50:11 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 03N1nLDO004902;
        Thu, 23 Apr 2020 10:49:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 03N1nLDO004902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587606562;
        bh=etjXsdFQORx4gLL7yHfpFDxgLm5eIEPJc35auHNsBS8=;
        h=From:To:Cc:Subject:Date:From;
        b=qZAxa/rkaHwdJxkUk5kkw4qWye8Zrg4JdltEyNEtugUn2sfkVWT0/nSATXwdkAdup
         wnym18jHZ/hhFRyUKa1m9AaFouFBUbzcDkrxfw0W0+hBhgBPvVg8lR721KdO30zfhZ
         QI23Iw+2ehr6twstWDyWaBhuTn7ZjcUNnppq8CXPSdmndSlqzcyj1ccQvvAef8B81F
         jbHMsW7sQss96WnEgg5lhGsiB7QSl3xYrTJrLiLxxJG7LJnTQ7S8Z3TdlDe20k+Ql9
         cwUb7QfGYFOpKnTaRL0K8TYXD3ewK++Ep0WyHmXRr6aUglYjipWZ4F7A9GGpiyqtMo
         NmOoGG8A8MmkQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: kbuild: fix the section title format
Date:   Thu, 23 Apr 2020 10:49:19 +0900
Message-Id: <20200423014919.31713-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Make it consistent with the other sections.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 04d5c01a2e99..b80257a03830 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1241,7 +1241,8 @@ When kbuild executes, the following steps are followed (roughly):
 	will be displayed with "make KBUILD_VERBOSE=0".
 
 
---- 6.9 Preprocessing linker scripts
+6.9 Preprocessing linker scripts
+--------------------------------
 
 	When the vmlinux image is built, the linker script
 	arch/$(ARCH)/kernel/vmlinux.lds is used.
-- 
2.25.1

