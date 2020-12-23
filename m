Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3598A2E1900
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Dec 2020 07:37:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgLWGgr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Dec 2020 01:36:47 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:23166 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgLWGgr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Dec 2020 01:36:47 -0500
Received: from grover.flets-west.jp (softbank126090214151.bbtec.net [126.90.214.151]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0BN6ZjT7023241;
        Wed, 23 Dec 2020 15:35:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0BN6ZjT7023241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608705346;
        bh=hdujoO3eLZTEZDlzcvqKBeeeZcqqO8ik6LRLHgF30h4=;
        h=From:To:Cc:Subject:Date:From;
        b=W31AAk6K0fOFFRHx+1ShYn7RztZZmNqNqfCIj+QpZCaJs7G/AdO2iUyHPp49LteMu
         CDGfWQqyId9GyQqf0KaWYsQLFExgje5Q9LeAhfQoeI1hQLWq7yL0MqnxX4xj8Hfwl3
         Zc218iqc7CxOrJB+UjMzF36RgHXG6e9rUbYzOtXo5M/wtanLJ+vQzQK2lcSGlaTqqJ
         bNi6dEAfZSYxZ+YgTiCMEq52gxx15QgZ9ybcgRuas1JMeD9LCvobvvNuTsFEmWbhUl
         1a4CMfvX/9A1Uj8aOSpG0UqLx4EYZQ2QqcOmnZnQim9qHS0rY8GDdzh4T5VFypkTKu
         a+CSD+QppYB8A==
X-Nifty-SrcIP: [126.90.214.151]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: remove 'kvmconfig' and 'xenconfig' shorthands
Date:   Wed, 23 Dec 2020 15:35:42 +0900
Message-Id: <20201223063542.649924-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Linux 5.10 is out. Remove the 'kvmconfig' and 'xenconfig' shorthands
as previously announced.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/Makefile | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index e46df0a2d4f9..2c40e68853dd 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -94,16 +94,6 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
 	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
-PHONY += kvmconfig
-kvmconfig: kvm_guest.config
-	@echo >&2 "WARNING: 'make $@' will be removed after Linux 5.10"
-	@echo >&2 "         Please use 'make $<' instead."
-
-PHONY += xenconfig
-xenconfig: xen.config
-	@echo >&2 "WARNING: 'make $@' will be removed after Linux 5.10"
-	@echo >&2 "         Please use 'make $<' instead."
-
 PHONY += tinyconfig
 tinyconfig:
 	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
-- 
2.27.0

