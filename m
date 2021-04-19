Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE6A3648BA
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 19:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238717AbhDSRGf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 13:06:35 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:42560 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhDSRGf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 13:06:35 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 13JH5ATv011272;
        Tue, 20 Apr 2021 02:05:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 13JH5ATv011272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618851910;
        bh=XXhY11gaoSvzWbW6ID0kHAhI4BbC74X5B25rQcrZHrU=;
        h=From:To:Cc:Subject:Date:From;
        b=RZ9iFlnHqMlII0RPn5w0OycB9aITRKf7j08eU7E7C+h1f9kDe+bSexuQrBDT0oUXH
         ltJvPAcKMECFqmpoQF7AZ4Uxoh9vlcNi+51tEG10nSyKQONCr8XMRaAM7WbaT1ySKF
         gKoFt+UGiyeet6843kqCZCe8jpTAWNNmenNjlMN2NGYRK6/3iz/qgSLjbpmk4i6td1
         8MsQvy9x3ze5psT01M3ShbYhF4l/OXtPfh3Afh3nZEquPtPKtKHRqj7YXFwKJ4qIio
         QanO4BGdeL80DKdWAH5iGyDBkEsD/K5I4DpqQCIHkfStGH4ii+ucB5mlc9CzD8S6fW
         qLrRkLelf92UA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Riku Voipio <riku.voipio@linaro.org>,
        Ben Hutchings <ben@decadent.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v2] kbuild: deb-pkg: change the source package name to linux-upstream
Date:   Tue, 20 Apr 2021 02:05:05 +0900
Message-Id: <20210419170505.1578725-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Change the source package name from 'linux-$(KERNELRELEASE)' to
'linux-upstream'.

Initially, I tried to use 'linux' to be aligned with the Debian
kernel package, but Ben suggested 'linux-upstream' so that it is
clearly distinguished from distribution packages. [1]

The filenames will be changed as follows:

[Before]
  linux-5.12.0-rc3+_5.12.0-rc3+-1.dsc
  linux-5.12.0-rc3+_5.12.0-rc3+.orig.tar.gz
  linux-5.12.0-rc3+_5.12.0-rc3+-1.diff.gz

[After]
  linux-upstream_5.12.0-rc3+-1.dsc
  linux-upstream_5.12.0-rc3+.orig.tar.gz
  linux-upstream_5.12.0-rc3+-1.diff.gz

Commit 3716001bcb7f ("deb-pkg: add source package") introduced
KDEB_SOURCENAME. If you are unhappy with the default name, you can
override it via KDEB_SOURCENAME.

[1]: https://lore.kernel.org/linux-kbuild/06ffa2a690d57f867b4bc1b42f0026917b1dd3cd.camel@decadent.org.uk/T/#m2c4afa0eca5ced5e57795b002f2dbcb05d7a4a44

Suggested-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Use 'linux-upstream' for the package name

 scripts/Makefile.package | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index f952fb64789d..b74c65284fb2 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -25,7 +25,7 @@ include $(srctree)/scripts/Kbuild.include
 
 # Remove hyphens since they have special meaning in RPM filenames
 KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
-KDEB_SOURCENAME ?= linux-$(KERNELRELEASE)
+KDEB_SOURCENAME ?= linux-upstream
 KBUILD_PKG_ROOTCMD ?="fakeroot -u"
 export KDEB_SOURCENAME
 # Include only those top-level files that are needed by make, plus the GPL copy
-- 
2.27.0

