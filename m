Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44CE20D814
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2020 22:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729876AbgF2Tfg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 15:35:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:44030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730741AbgF2TfP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 15:35:15 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FDB1247FF;
        Mon, 29 Jun 2020 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593444620;
        bh=iCNVEYT0btqHC0D3l6LW31GrcM8Zir8v9HVDlG+Dwyw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AKVhp77ZLk6f5RgxsDdpH7/g2Oo73M93U/mKo1eBtd+kvgLbYf04xgvGtM4ng5UHP
         ppFkErIdL+9mfzMTMeScfJ0rH63c+qmD+7XdAl5V4DLkGfSsroCyGacQ1RgY6fktnw
         rwLaA4dQT9E/NypyIzcyq5mbb0aLhn+TokJ41fbM=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jpvje-007CT4-5V; Mon, 29 Jun 2020 17:30:18 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: qconf: don't show goback button on splitMode
Date:   Mon, 29 Jun 2020 17:30:17 +0200
Message-Id: <781cc3dc06dfe179f19c8aca8068c14890bace52.1593444492.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593444492.git.mchehab+huawei@kernel.org>
References: <cover.1593444492.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

the goback button does nothing on splitMode. So, why display
it?

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index d0bcc0b717f0..f49fbac91995 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -437,9 +437,10 @@ void ConfigList::updateList(ConfigItem* item)
 	if (rootEntry != &rootmenu && (mode == singleMode ||
 	    (mode == symbolMode && rootEntry->parent != &rootmenu))) {
 		item = (ConfigItem *)topLevelItem(0);
-		if (!item)
+		if (!item && mode != symbolMode) {
 			item = new ConfigItem(this, 0, true);
-		last = item;
+			last = item;
+		}
 	}
 	if ((mode == singleMode || (mode == symbolMode && !(rootEntry->flags & MENU_ROOT))) &&
 	    rootEntry->sym && rootEntry->prompt) {
-- 
2.26.2

