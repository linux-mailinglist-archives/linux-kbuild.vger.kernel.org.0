Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DC520E55E
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 00:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgF2VgO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 17:36:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:60598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728459AbgF2Skn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:43 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D4AB1233F6;
        Mon, 29 Jun 2020 09:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593423343;
        bh=PB+3AQAalgU2HfA/Ow/B31cXbQPKTJ+EqjMYiPpBE6M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V+fzcmZIz1xFsARlxvRksUz/DLcAnRUzzDClqT4BG/Zw2/3YuVGAjbfe3BQTORL4I
         T4fxISy+GjbYMETFO3K7KsnVqumbJK8spCNQntGO/57KUG5bCKu8b7kr2ScVo16vj3
         wjA8BVPoiz6Bw3SDQT2fUqB61cbLCrQRlKj0KmWQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jpqCS-006cAJ-Fg; Mon, 29 Jun 2020 11:35:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] kconfig: qconf: ensure that only one item will be highlighted
Date:   Mon, 29 Jun 2020 11:35:36 +0200
Message-Id: <9cc77cb28cf641d537b3dd08892f3d655f26ffb2.1593423060.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593423060.git.mchehab+huawei@kernel.org>
References: <cover.1593423060.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The logic which is used by search to show a new link lacks
support for un-selecting a previously-selected item.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kconfig/qconf.cc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 0e06afa08908..67dac2406a98 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1662,6 +1662,13 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 	}
 
 	if (list) {
+		/* Clear an already-selected item */
+		if (!list->selectedItems().isEmpty()) {
+			item = (ConfigItem*)list->selectedItems().first();
+			if (item)
+				item->setSelected(false);
+		}
+
 		item = list->findConfigItem(menu);
 		if (item) {
 			item->setSelected(true);
-- 
2.26.2

