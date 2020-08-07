Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558E523EA2D
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 11:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgHGJVF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Aug 2020 05:21:05 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:41483 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbgHGJTg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Aug 2020 05:19:36 -0400
Received: from localhost.localdomain (softbank060134047170.bbtec.net [60.134.47.170]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0779JBQ4032147;
        Fri, 7 Aug 2020 18:19:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0779JBQ4032147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596791958;
        bh=AtaO72kIEhCNgoEFY9X5BFXl6EJl/6Ls5KeH6V0Uaek=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kH2DXN07MY/6qlwup6uvDfLgSzdsAmu0BAUY/rJ5BK96v4geFmVf+YgDTw91GdVLq
         13uH0g7B/jKX/Fi6LKx/xwMaEj9Me0fs80hJ/kSOHFdyElBSIzzzdbIP4xr6hA+yib
         oVmv3Aygy18zatt3iYJoi18SpaAjGTcEzBvlPegEax5P3512Ci+TjR07K/jEKUJP2J
         A7RrhaJERbhGHvW6zAOpH0iPX7rDiBlZUKyoi84wmcwGRhcuvuYnVzj1DCRsiitm7O
         Fm71td8gIH9QyhuDL/aknT4oJjTGybe8ckU1zeZIfenNJfYxlVyD5JUXv2woWf8Z/O
         py/hTtSibio3Q==
X-Nifty-SrcIP: [60.134.47.170]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/19] kconfig: qconf: omit parent to QHBoxLayout()
Date:   Fri,  7 Aug 2020 18:18:58 +0900
Message-Id: <20200807091909.2985787-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200807091909.2985787-1-masahiroy@kernel.org>
References: <20200807091909.2985787-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Instead of passing 0 (i.e. nullptr), leave it empty.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/qconf.cc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index a4b522bb32e5..0b93db2d61aa 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1296,7 +1296,8 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow *parent)
 	QVBoxLayout* layout1 = new QVBoxLayout(this);
 	layout1->setContentsMargins(11, 11, 11, 11);
 	layout1->setSpacing(6);
-	QHBoxLayout* layout2 = new QHBoxLayout(0);
+
+	QHBoxLayout* layout2 = new QHBoxLayout();
 	layout2->setContentsMargins(0, 0, 0, 0);
 	layout2->setSpacing(6);
 	layout2->addWidget(new QLabel("Find:", this));
-- 
2.25.1

