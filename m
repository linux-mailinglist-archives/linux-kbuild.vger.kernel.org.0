Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84912C758F
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 23:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387758AbgK1VtR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Nov 2020 16:49:17 -0500
Received: from condef-07.nifty.com ([202.248.20.72]:28339 "EHLO
        condef-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731689AbgK1R7u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 12:59:50 -0500
X-Greylist: delayed 332 seconds by postgrey-1.27 at vger.kernel.org; Sat, 28 Nov 2020 12:59:49 EST
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-07.nifty.com with ESMTP id 0ASBqODC004562;
        Sat, 28 Nov 2020 20:52:24 +0900
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0ASBpD6G027804;
        Sat, 28 Nov 2020 20:51:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0ASBpD6G027804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606564280;
        bh=+Q9Bo6bhmRT3Oowam9MhLdZfQ4zpQ4qSQzfxJXEgOWc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0jcB4czYOgWJLr3rR6z21bKcQhXGtFQdrSGQ6S1g3aQbbQ6gDYCJg+ZksDhOP3VxG
         CegtSWpWJzm+StBhptN6yL6HMFNnlLozKv85ktx+Ks2fwgbHI8gn3mFhswGzHaDVOQ
         ehp9kb2+cdfSPzqDd+LfIUgbuw4J6RQdBcEEIhkXpr0TNcPCDqlb74XecTHzvebJLP
         d1gAX0aPitxLi1Hpy7qPDIJ0wqxPz4bvpgWrvib06sM+rl0QsMSI2Uu4xcOrIubwoR
         Jq446aY4JfrZeZKA81NxizPN2kTuLzkhnlpgHZUuigfZ0ccjSkl8vAUsaUyIfmiLsG
         /XqnS8osD/kAQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] kbuild: doc: document subdir-y syntax
Date:   Sat, 28 Nov 2020 20:51:08 +0900
Message-Id: <20201128115108.179256-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128115108.179256-1-masahiroy@kernel.org>
References: <20201128115108.179256-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is no explanation about subdir-y.

Let's document it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---

(no changes since v1)

 Documentation/kbuild/makefiles.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 4fd6b327a19f..a276bfa93675 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -319,6 +319,21 @@ more details, with real examples.
 	that directory specifies obj-y, those objects will be left orphan.
 	It is very likely a bug of the Makefile or of dependencies in Kconfig.
 
+	Kbuild also supports dedicated syntax, subdir-y and subdir-m, for
+	descending into subdirectories. It is a good fit when you know they
+	do not contain kernel-space objects at all. A typical usage is to let
+	Kbuild descend into subdirectories to build tools.
+
+	Examples::
+
+		# scripts/Makefile
+		subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
+		subdir-$(CONFIG_MODVERSIONS) += genksyms
+		subdir-$(CONFIG_SECURITY_SELINUX) += selinux
+
+	Unlike obj-y/m, subdir-y/m does not need the trailing slash since this
+	syntax is always used for directories.
+
 	It is good practice to use a `CONFIG_` variable when assigning directory
 	names. This allows kbuild to totally skip the directory if the
 	corresponding `CONFIG_` option is neither 'y' nor 'm'.
-- 
2.27.0

