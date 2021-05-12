Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A9837B742
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 May 2021 09:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhELH7O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 May 2021 03:59:14 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:42319 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhELH7N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 03:59:13 -0400
Received: from grover.RMN.KIBA.LAB.jp (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 14C7vbPu028192;
        Wed, 12 May 2021 16:57:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 14C7vbPu028192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620806263;
        bh=O/74YeIerUaZTHjo5L0h/rjW9ksuxe7/2Vi6Bj2jJgk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n2k0HLwaBPboTgP2aiPtOAYjUwvuJnkFDiFB1OgJUDZSgKFVvpj6nh42+dmUz4/x4
         wNn1GipEOEKuBhSzv+9EpBiMPTc/IoSAyLGQ7/u/r8xAagWORVpUP949arlUTq/96W
         51bi3R1b71lQRW5vtoV72vlnRh8r+dZlsKtpmvAitOUOApRu18gSCgyS18uaVwWlT3
         toqfITN41W+LrGOoq0UX6xL1fEAE2oFFJ1u+TRI37C9MjDRfMg2AmDCjhxdjp9iW9Q
         gGns0yMTtnY5egP5pjAI+0pJCD0ehipmX9g4WbYxC0EIUrtvLAxP6Pae8AF046oRB3
         C7UAtXlp9z3Rw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-kernel@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp
Subject: [PATCH 3/5] h8300: move core-y in arch/h8300/Makefile to arch/h8300/Kbuild
Date:   Wed, 12 May 2021 16:57:27 +0900
Message-Id: <20210512075729.60291-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210512075729.60291-1-masahiroy@kernel.org>
References: <20210512075729.60291-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use obj-y to clean up Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/h8300/Kbuild   | 1 +
 arch/h8300/Makefile | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/h8300/Kbuild b/arch/h8300/Kbuild
index a4e40e534e6a..b2583e7efbd1 100644
--- a/arch/h8300/Kbuild
+++ b/arch/h8300/Kbuild
@@ -1 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-y	+= kernel/ mm/ boot/dts/
diff --git a/arch/h8300/Makefile b/arch/h8300/Makefile
index ba0f26cfad61..eb4cb8f6830c 100644
--- a/arch/h8300/Makefile
+++ b/arch/h8300/Makefile
@@ -30,9 +30,6 @@ ifeq ($(CROSS_COMPILE),)
 CROSS_COMPILE := $(call cc-cross-prefix, h8300-unknown-linux- h8300-linux-)
 endif
 
-core-y	+= arch/$(ARCH)/kernel/ arch/$(ARCH)/mm/
-core-y	+= arch/$(ARCH)/boot/dts/
-
 libs-y	+= arch/$(ARCH)/lib/
 
 boot := arch/h8300/boot
-- 
2.27.0

