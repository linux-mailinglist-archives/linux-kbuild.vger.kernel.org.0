Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDB036A510
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Apr 2021 08:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhDYGZX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 25 Apr 2021 02:25:23 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:20872 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhDYGZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Apr 2021 02:25:22 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 13P6OBfJ031298;
        Sun, 25 Apr 2021 15:24:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 13P6OBfJ031298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619331852;
        bh=IDaty5KBUv4KvNn1NKFpnKgaifUb/3fKJ0ylZZpF9Fw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VNgJOMUzKHt35KK6YEKMbfAmoPHnWS8CSMFt/imppV54FoxLVHJRF4GImBDb/Zz9E
         B3+vy+eLeVfRibG4njgTdllCzZkFnUBwcTpzI06UcV0jeJKKxlWO8tuF5Qz6Unp9EB
         KkcLntjC/jUVVQXMaTdp2THB3daCq1LYn7VSKn6DfNOB7d80+wj97a52/xFEDxUOHF
         umKLXMubnWSFfaC3TfrggTXKvRpzTkYP9wkFhXndjupcxC71vL2hfFQjMoI1zLaqc2
         gTP54BMaJvP1RImisd9WesJDUqY+PUSlJCi12pGBj5BFNaRNocmTquO6bF8jKlxJ/y
         tZD8kYd6XJPfA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] .gitignore: move tags and TAGS close to other tag files
Date:   Sun, 25 Apr 2021 15:24:04 +0900
Message-Id: <20210425062407.1183801-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210425062407.1183801-1-masahiroy@kernel.org>
References: <20210425062407.1183801-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For consistency, move tags and TAGS close to the cscope and GNU Global
patterns.

I removed the '/' prefix in case somebody wants to manually create tag
files in sub-directories.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .gitignore | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitignore b/.gitignore
index df8d3146a43f..deb68b7555ad 100644
--- a/.gitignore
+++ b/.gitignore
@@ -54,8 +54,6 @@ modules.order
 #
 # Top-level generic files
 #
-/tags
-/TAGS
 /linux
 /modules-only.symvers
 /vmlinux
@@ -114,6 +112,10 @@ patches-*
 patches
 series
 
+# ctags files
+tags
+TAGS
+
 # cscope files
 cscope.*
 ncscope.*
-- 
2.27.0

