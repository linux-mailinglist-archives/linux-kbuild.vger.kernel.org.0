Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1EF39463E
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 May 2021 19:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhE1RP3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 May 2021 13:15:29 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:28762 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhE1RP2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 May 2021 13:15:28 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 14SHDNo4032433;
        Sat, 29 May 2021 02:13:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 14SHDNo4032433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622222004;
        bh=l4ntX8x0JtCnBD5KvAYnltkw9P8JET4BzHSY0clkT+4=;
        h=From:To:Cc:Subject:Date:From;
        b=qG1HF8AMk74YxygPm10dKl4QlVXWPTQEIsJ5NlFRI0L3GsanBtevVbVclrfYo5Fml
         a+itgFn7yKa/t8Ri+LQgX0K4SEPldBkIYOa7ljsnh+PJHHsiX+ACXdMDIvB0KEKXH9
         hOyM2plZ+ACmM6qEtqrKagaXOALtuQEhzX2+pceq9jkA0wu0ozhii64qK1K091KLfQ
         GXMVpFbCBN29JaJbERxF8PKLdvC1WKyVvap53j3fod3X/HVRf6FmG/tr+Y5QLnodNu
         2Y/xQm47j4BvvEQdtt9cpexsmopIcL8y95dcdncfzeTsdnqumBh8v1cXx5vRf03/cE
         kpPUllbWxCAMg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: constify long_opts
Date:   Sat, 29 May 2021 02:13:21 +0900
Message-Id: <20210528171321.158586-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

getopt_long() does not modify the logopts structure.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index bfa1ea8f5f98..5d84b44a2a2a 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -678,7 +678,7 @@ static void check_conf(struct menu *menu)
 		check_conf(child);
 }
 
-static struct option long_opts[] = {
+static const struct option long_opts[] = {
 	{"help",          no_argument,       NULL,            'h'},
 	{"silent",        no_argument,       NULL,            's'},
 	{"oldaskconfig",  no_argument,       &input_mode_opt, oldaskconfig},
-- 
2.27.0

