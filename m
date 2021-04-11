Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FF535B302
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 12:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233514AbhDKKO5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 06:14:57 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:60622 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235123AbhDKKO4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 06:14:56 -0400
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1618136079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wd/BIX/T87DqZRsUNG1oh6/GmVH+vUs28kJhYAzfhQA=;
        b=ygqe/tRvQbhRiCqoDIUJ/aH3raWyU9jDh2I83w1pbC192rdlKc+eU0j9Jb38eNDvizyYFN
        8zrtp1Vpb1ijIY8rmZGv/aaq971B8OazPF+KMYuPcK+0dWg+9Hqzaie/fVUPTug3ec/LlD
        5XAUWQnGVUpzQ+wBZwUq2yprgVeDrw1ioDM08WQU2Q4iYbzSz0D77IypofuN6gw/ceBTGx
        LHEFC4z9teMQneEbDl8ZeL22iCr72gKGoXBbTFymE5zRMND+DeTCacIUlbpcRBpMvAfQoT
        4Mpe0JPhbFZSvl7j7R01C4XHn652Sl9rqHGEYZvCeMKJsZiLajQ2cqOPitOKVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1618136079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wd/BIX/T87DqZRsUNG1oh6/GmVH+vUs28kJhYAzfhQA=;
        b=c8RoIeTh+MAy9v8gnbCgVZ+iBWcyt3xbVCc16JQKDIryOJGl5fHTt0ZZFVRH4FRt6JCcRt
        POZ6IAjEPePWXbCA==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH 6/6] kbuild: introduce srcdeb-pkg target
Date:   Sun, 11 Apr 2021 12:14:22 +0200
Message-Id: <20210411101422.7092-7-bage@linutronix.de>
In-Reply-To: <20210411101422.7092-1-bage@linutronix.de>
References: <20210411101422.7092-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

A Debian source package can be generated only in combination with building
it afterwards. Introduce a target srcdeb-pkg that generates the source
package without building it (adding dpkg-buildpackage's -S flag).

Make the former deb-pkg depend on both srcdeb-pkg and bindeb-pkg to retain
its behavior.

Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/Makefile.package | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 280f3a2fa334..78a363623c3a 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -69,13 +69,16 @@ binrpm-pkg:
 		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
 
 PHONY += deb-pkg
-deb-pkg:
+deb-pkg: srcdeb-pkg bindeb-pkg
+
+PHONY += srcdeb-pkg
+srcdeb-pkg:
 	$(MAKE) clean
 	$(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
 	$(call cmd,src_tar,$(KDEB_SOURCENAME))
 	origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
 		mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
-	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -us -uc
+	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -S -us -uc
 
 PHONY += bindeb-pkg
 bindeb-pkg:
@@ -145,6 +148,7 @@ help:
 	@echo '  rpm-pkg             - Build both source and binary RPM kernel packages'
 	@echo '  binrpm-pkg          - Build only the binary kernel RPM package'
 	@echo '  deb-pkg             - Build both source and binary deb kernel packages'
+	@echo '  srcdeb-pkg          - Build only the source kernel deb package'
 	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
 	@echo '  snap-pkg            - Build only the binary kernel snap package'
 	@echo '                        (will connect to external hosts)'
-- 
2.30.2

