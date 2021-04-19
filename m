Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADDA2363C0C
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 09:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhDSHDF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 03:03:05 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:59649 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhDSHDF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 03:03:05 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 13J71go5001636;
        Mon, 19 Apr 2021 16:01:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 13J71go5001636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618815703;
        bh=rGPWoGu8u+NrEvrE/+8mXHBd6hNxokkbe1+07VBm8yA=;
        h=From:To:Cc:Subject:Date:From;
        b=aOshXJaI9rF6MBJr80KvWL0TQaNSbgd8EB8o3OxEAFUw62tKppWT46atoPzZQgpTb
         T3uT+Zr57ypebJSruqKK+pL/+rmoT4JJLAnm1L0JGmwHC3BmCubfqXSqxWefFvThSQ
         7Vi1ND6LgW/BGQdzkQsrewdDu7WB/RFtUjRktG4ylAYARb+AM3bmLAmj7ggbXjUll5
         do+CYMy/dWsJoSIS93nD1D7jOPL45RxrRK45daEKiugSPgC/c06bSU7C7ZxNvcDL4v
         r8NGC/KuPyADeFtlkAe7SiG2nyefSiOGxdMb1g/JZfcdktR0kvgbe1B2opfUmHO/+3
         fkynb2e2aXJwA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Riku Voipio <riku.voipio@linaro.org>,
        Ben Hutchings <ben@decadent.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: deb-pkg: change the source package name to 'linux'
Date:   Mon, 19 Apr 2021 16:01:39 +0900
Message-Id: <20210419070139.1515431-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Change the source package name from 'linux-$(KERNELRELEASE)' to 'linux',
which is aligned with the source package from the Debian community.

The filenames will be changed as follows:

[before]
  linux-5.12.0-rc3+_5.12.0-rc3+-1.dsc
  linux-5.12.0-rc3+_5.12.0-rc3+.orig.tar.gz
  linux-5.12.0-rc3+_5.12.0-rc3+-1.diff.gz

[After]
  linux_5.12.0-rc3+-1.dsc
  linux_5.12.0-rc3+.orig.tar.gz
  linux_5.12.0-rc3+-1.diff.gz

Commit 3716001bcb7f ("deb-pkg: add source package") introduced
KDEB_SOURCENAME. If you are unhappy with the default name, you can
override it via KDEB_SOURCENAME.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.package | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index f952fb64789d..c5834a480545 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -25,7 +25,7 @@ include $(srctree)/scripts/Kbuild.include
 
 # Remove hyphens since they have special meaning in RPM filenames
 KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
-KDEB_SOURCENAME ?= linux-$(KERNELRELEASE)
+KDEB_SOURCENAME ?= linux
 KBUILD_PKG_ROOTCMD ?="fakeroot -u"
 export KDEB_SOURCENAME
 # Include only those top-level files that are needed by make, plus the GPL copy
-- 
2.27.0

