Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5E21D66FA
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgEQJtf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:49:35 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38296 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727125AbgEQJte (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:34 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4L7018560;
        Sun, 17 May 2020 18:49:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4L7018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708951;
        bh=6Cr9X2+4BN3lVVZXhv05Fyg+wVggFB+AaKLKTTsUPlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bup/iJkGpO7CpryozjlUvShNo2kHLXyFqBwt5QaqHD98AmbzDSNJ0rv4spEKK6qcg
         dLrZPhW+TbZponso5fudJRA2WKp0xnvNklZ+mhXbC9wrARfmxQZVNOsGhxaA5lGXZF
         Fo9LpYKdaKJ3kPIj4NsDSVCrM9M5LVHMXAy9tKwdqmvSU7+7Ehmg/JCIWKXu7oHlGn
         /qoXcAFc+pyHUCjkMYBeRzGxqJ2Lph0j84FjS+ozvh8vZHBDHrNr0pJWEnniAshs9m
         NsIwmuqakHBYKf4D/MVLyNGyR+SxHfin5jbNRCGUGgCGIv+DvDSmFcIZdfAwoRbTJV
         qTKX0ey1TW63Q==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/29] modpost: move -T option close to the modpost command
Date:   Sun, 17 May 2020 18:48:40 +0900
Message-Id: <20200517094859.2376211-11-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The '-T -' option reads the file list from stdin.

It is clearer to put it close to the piped command.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.modpost | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index b79bf0e30d32..da7730a43819 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -66,7 +66,7 @@ __modpost:
 
 else
 
-MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - \
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s \
 	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
 
 ifeq ($(KBUILD_EXTMOD),)
@@ -88,7 +88,7 @@ modules := $(sort $(shell cat $(MODORDER)))
 # Read out modules.order instead of expanding $(modules) to pass in modpost.
 # Otherwise, allmodconfig would fail with "Argument list too long".
 quiet_cmd_modpost = MODPOST $(words $(modules)) modules
-      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST)
+      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST) -T -
 
 __modpost:
 	$(call cmd,modpost)
-- 
2.25.1

