Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34E0E235868
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgHBQSe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:18:34 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:48911 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgHBQSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:18:06 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 072GHOaq003720;
        Mon, 3 Aug 2020 01:17:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 072GHOaq003720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596385052;
        bh=ZR2FWOJCoBwcQ4UI0mBLm+oIcogMAJji5OgIw/+72aM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R3k56eW1kn70rjiilKrjvdzBL4dlQng9/U/UNm3rseHU8r+E2jJOOCXPo6wmPFQAq
         +2asqdD18pV0XSYVy9lA7EbJTROj8GQEhynufZ4/JXmY1g7zNEwo28WII4CX3WMQCB
         Yy6tu0QTs3iVS/cL9pXhiXPz+Y7AZwcJbFU96xbRlJNJuS0+za0jKJJKSpemWCEQOX
         f2s6snyPqgMtEMypQCJm73I0nb1Ib6xql0vxgKSTHHBroTgHPMwZEY5kCiDfl8tczH
         hg+9T1Yp5AIHY8a5THNaljNAzh7vg6D7JFv+kMFYxXpMTT2u3wZjfvXFFlNEGd2mgt
         IZBp/Fi6ZXkjw==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] kconfig: qconf: remove unused voidPix, menuInvPix
Date:   Mon,  3 Aug 2020 01:17:20 +0900
Message-Id: <20200802161721.921721-15-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802161721.921721-1-masahiroy@kernel.org>
References: <20200802161721.921721-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These are initialized, but not used by anyone.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 +-
 scripts/kconfig/qconf.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index a73665d9ca78..00b2f56186c2 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -291,7 +291,7 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	  updateAll(false),
 	  symbolYesPix(xpm_symbol_yes), symbolModPix(xpm_symbol_mod), symbolNoPix(xpm_symbol_no),
 	  choiceYesPix(xpm_choice_yes), choiceNoPix(xpm_choice_no),
-	  menuPix(xpm_menu), menuInvPix(xpm_menu_inv), menuBackPix(xpm_menuback), voidPix(xpm_void),
+	  menuPix(xpm_menu), menuBackPix(xpm_menuback),
 	  showName(false), showRange(false), showData(false), mode(singleMode), optMode(normalOpt),
 	  rootEntry(0), headerPopup(0)
 {
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 012414dcdee5..c46a79a69001 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -100,7 +100,7 @@ public slots:
 
 	QPixmap symbolYesPix, symbolModPix, symbolNoPix;
 	QPixmap choiceYesPix, choiceNoPix;
-	QPixmap menuPix, menuInvPix, menuBackPix, voidPix;
+	QPixmap menuPix, menuBackPix;
 
 	bool showName, showRange, showData;
 	enum listMode mode;
-- 
2.25.1

