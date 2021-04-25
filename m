Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28EA036A50F
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 Apr 2021 08:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhDYGZX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 25 Apr 2021 02:25:23 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:20873 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhDYGZW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Apr 2021 02:25:22 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 13P6OBfK031298;
        Sun, 25 Apr 2021 15:24:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 13P6OBfK031298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619331852;
        bh=PnKoH46jC2hlI2RFjeXUsGTRDiZS/m4ORNfXQoL4UTs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wfQFlOhhfm8R81XlGhSUbU1BuIpevLjWD9jjtdCjP6uQix1ioK2GwDcywpL7qLZOE
         M8QHDLYM5kWkas/DkXm5L0v3hdiO4+Naf53SsLS+Ofz2AtB9/qgJy4lDbt9wAHCpW/
         mM0kZtMLZB+m9XUXMcAbX+eSwqsJikpQ5oeK2ViLPdwitdZxxWuFq6z8fCzGn69JyB
         DanbrPMfnnnod0Jh7M7y2okYBouEAcueCwkoeDI0J50ZrzpBpNGQrU3X3JaaAoRj0m
         O2PceCxPO388HB7MhhNWK0nF21Y1eenxipsd3c9r2Er+eyK3jy6VjSU12vX7RvSPiM
         64ZerMYYpuWmg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] .gitignore: ignore only top-level modules.builtin
Date:   Sun, 25 Apr 2021 15:24:05 +0900
Message-Id: <20210425062407.1183801-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210425062407.1183801-1-masahiroy@kernel.org>
References: <20210425062407.1183801-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

modules.builtin used to be created in every directory.

Since commit 8b41fc4454e3 ("kbuild: create modules.builtin without
Makefile.modbuiltin or tristate.conf"), modules.builtin is created only
in the top directory.

Add the '/' prefix so that it matches to only the modules.builtin located
in the top directory.

It has been more than one year since that change. I hope this will not
flood 'Untracked files' of 'git status'.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index deb68b7555ad..7afd412dadd2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -48,7 +48,6 @@
 *.xz
 *.zst
 Module.symvers
-modules.builtin
 modules.order
 
 #
@@ -64,6 +63,7 @@ modules.order
 /vmlinuz
 /System.map
 /Module.markers
+/modules.builtin
 /modules.builtin.modinfo
 /modules.nsdeps
 
-- 
2.27.0

