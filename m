Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B97D31C5BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Feb 2021 04:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhBPDLV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Feb 2021 22:11:21 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:32432 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhBPDLV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Feb 2021 22:11:21 -0500
Received: from grover.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 11G3A8ch028393;
        Tue, 16 Feb 2021 12:10:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 11G3A8ch028393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613445009;
        bh=dBe0gGOx1OvVHpAym9sqBVoT4U+1i4jHpB2ONSTd2I0=;
        h=From:To:Cc:Subject:Date:From;
        b=TArhaOeYa41d8mTB+CbWOOoRdz3iscskjLSWqARmnF7ChwdW+oThXMyw0pcqi3dv5
         ZEEsOOzXSA/MNCxkDvo5TFvqaKbBQfm9afI/umtOuJHhRty19iRjahP4niA2VNW5aC
         HJc6w7H1nJpq/ZBwELAe/0qkLEnqz3GoNS+ksfKeuvLvsyRn63i4957MnPiW3rSk9Z
         +1WzJUwN5EGcxVW4/ValtLAHp5XlJwddXPFBHUaBdaqxUCXX9e2n18RI1v8bfK6D6N
         xA3Cs7YnonPLHc9kVgdYxu3sHdZqPoyCcMp4cT2VV+h4V79YMmODhMxyfco3c00+os
         qzVbtpbdc3bow==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     David Laight <david.laight@aculab.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: remove ld-version macro
Date:   Tue, 16 Feb 2021 12:10:03 +0900
Message-Id: <20210216031004.552417-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is no direct user of ld-version; you can use CONFIG_LD_VERSION
if needed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Kbuild.include | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 08e011175b4c..509e0856d653 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -141,13 +141,9 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
 
-# ld-version
-# Note this is mainly for HJ Lu's 3 number binutil versions
-ld-version = $(shell $(LD) --version | $(srctree)/scripts/ld-version.sh)
-
 # ld-ifversion
 # Usage:  $(call ld-ifversion, -ge, 22252, y)
-ld-ifversion = $(shell [ $(ld-version) $(1) $(2) ] && echo $(3) || echo $(4))
+ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
 
 ######
 
-- 
2.27.0

