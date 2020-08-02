Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA465235856
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgHBQSH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:07 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48900 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOai003720;
        Mon, 3 Aug 2020 01:17:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOai003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385048;
        bh=de8yjMPnXxE5FpGJ8JaPEl9WrzMvvXqUqs2K+MZKH1U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1c+/2Hej244di0Vsvb41LYaC31R+CCo8JeEinT99YWv/7K5PQXignaDC70rw98dI0
         sJbgLtn7pzKHqrDIb48AOZDjvqcEfrSbhVoxNQLlID5boJJz80cXzCeP3JbsWQkZF2
         sATLb9Mg01CL5FoiyguApYKo1M2qvKIGuiAVq+qAXJuV6PnIfigUDXI/Gd5Yx2zIHS
         4x6NL6BMeZEB3nxntCBNC+6IiqwTHR3KdZSSAt0BpuDasIqbVBG6+2WS4uOqlUC3Aq
         x1VlUwcEsp3lLlrWyWl0BesKCsd13QPjO6D7ASRR+i2qLPAs++Y/S4z59e1D0kCxIb
         dRY7VdW6RSndQ==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/16] kconfig: qconf: omit parent to QHBoxLayout()
Date:   Mon,  3 Aug 2020 01:17:12 +0900
Message-Id: <20200802161721.921721-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Instead of passing 0 (i.e. nullptr), leave it empty.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index a74bfc65b633..81d55e75cf71 100644
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

