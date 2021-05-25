Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78136390CA6
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 01:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbhEYXD6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 May 2021 19:03:58 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:51120 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhEYXD5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 May 2021 19:03:57 -0400
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1621983746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Coa/6AgcgN9DAYJTginr0IdsovL0lGETM6OI8BTtTcg=;
        b=rTh++prfoS03nUuGBEkI2idG7e1iRCEqC4in4g11lZQMAHuryD1L2pQ4LwzBKWh5WeK6eO
        8y1Tm7FmmuU8AlJ25CBy60GSM59N5QamDLlp5ULOvW98sfR//5uouM9Aes3RRAulT3001X
        EyBy83JrXpawPs9XCFj9OLO8vogJ6z1by7goSdMhbT4pFfBu262SbILeeCLioYZJO7oTeS
        V7O10sfK+sG9tTyK/OvNl7GXturDHJlY5o+gYtzqvRS0drM/aUmhaXAKuS0FCU8ypprHyy
        x9HtrnqpaMzdqtFMNAyNKFA3lUC4YJi+8gagbqlKJqQlYBVGv+cTFd38kjLF+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1621983746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Coa/6AgcgN9DAYJTginr0IdsovL0lGETM6OI8BTtTcg=;
        b=ziyLWtTzcAd413Vm1xhJ2FJ78iPqukDPWKrYtRYoH8LyqPugIoUW6h8p8RLBipxkQsgs7n
        JvUH/AUkKsD+AiCQ==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH v2 5/5] kbuild: introduce srcdeb-pkg target
Date:   Wed, 26 May 2021 01:01:39 +0200
Message-Id: <20210525230139.6165-6-bage@linutronix.de>
In-Reply-To: <20210525230139.6165-1-bage@linutronix.de>
References: <20210525230139.6165-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

A Debian source package can be generated only in combination with building
it afterwards. Introduce a target srcdeb-pkg that generates the source
package without building it (adding dpkg-buildpackage's -S flag).

Make the former deb-pkg run both srcdeb-pkg and bindeb-pkg to retain its
behavior.

Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/Makefile.package | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 360ce0ae2fa1..dd347355c95e 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -71,12 +71,17 @@ binrpm-pkg:
 
 PHONY += deb-pkg
 deb-pkg:
+	$(MAKE) srcdeb-pkg
+	$(MAKE) bindeb-pkg
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
@@ -146,6 +151,7 @@ help:
 	@echo '  rpm-pkg             - Build both source and binary RPM kernel packages'
 	@echo '  binrpm-pkg          - Build only the binary kernel RPM package'
 	@echo '  deb-pkg             - Build both source and binary deb kernel packages'
+	@echo '  srcdeb-pkg          - Build only the source kernel deb package'
 	@echo '  bindeb-pkg          - Build only the binary kernel deb package'
 	@echo '  snap-pkg            - Build only the binary kernel snap package'
 	@echo '                        (will connect to external hosts)'
-- 
2.30.2

