Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554C6246EAD
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Aug 2020 19:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730791AbgHQReY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 13:34:24 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:42206 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388851AbgHQQhR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 12:37:17 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 07HGah92005234;
        Tue, 18 Aug 2020 01:36:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 07HGah92005234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597682204;
        bh=oTu3bdPiFJx6B3VYv5DJErfghI5Gn3CTBiFBpyiGp8c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nSKNr+GTgAZYtk+OsW4FeO/OpOJWMkyaSgsEj2sYJzerTiy/CHpuRGmq9nyIHaFlr
         X1y+i8zraNKwVBhzlkzwn1epfTDnjNXx5sDgu50a6EZHMgHKQn9AmDNvXFcIDWJxjU
         FT1H0nFAH1OzBLZ5aNDgcKXGzdbFZD0pr9N1mOV+gJyqBZhYStwPTm5kacxYTBuCHe
         1MQegbmil9Ti2ifDZYC+wLT/tOFn0mhtJ8eDAzqS/i+opuwka56/ZC07IBUKI8pvoP
         RnZMLN9GObVSq50ZDx0+EQzUdrtkAiPSg99HYx2Xr5pIoJ8SzOBnHTxXztHShel3D1
         o0KCxYSE/k2Vg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kconfig: qconf: remove unused colNr
Date:   Tue, 18 Aug 2020 01:36:31 +0900
Message-Id: <20200817163631.37034-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200817163631.37034-1-masahiroy@kernel.org>
References: <20200817163631.37034-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is not used at all.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 0b97a9817d2b..f97376a8123f 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -30,7 +30,7 @@ class ConfigSettings : public QSettings {
 };
 
 enum colIdx {
-	promptColIdx, nameColIdx, noColIdx, modColIdx, yesColIdx, dataColIdx, colNr
+	promptColIdx, nameColIdx, noColIdx, modColIdx, yesColIdx, dataColIdx
 };
 enum listMode {
 	singleMode, menuMode, symbolMode, fullMode, listMode
-- 
2.25.1

