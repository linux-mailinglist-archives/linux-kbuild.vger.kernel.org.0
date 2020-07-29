Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E364E232337
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jul 2020 19:13:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgG2RNM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jul 2020 13:13:12 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:40635 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2RNL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jul 2020 13:13:11 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 06THCgws019450;
        Thu, 30 Jul 2020 02:12:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 06THCgws019450
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596042763;
        bh=lk0I/Dg28bXoBBt4r0Lfq8tN0wHrQnDacMX36px4Pkc=;
        h=From:To:Cc:Subject:Date:From;
        b=YosVqdP/+0GpnsdGPeZerw1+Fd13ETNid8Yt6CEnTzoznrCJcttVAC9Mm4tVnfqJB
         xs8IBbKl9x7xgszsB5ERLqHHTy5eHHN/AzJHE0jgK45ObANXPOq1x5/3lKJdsErdxx
         BbjEoGv3L9DzsFm22cQyy/Hj5ANEQ9RH6DaF5JH/Q/QGf5A044DUngPtZCQFwhull6
         IH5PO9/PdhX9i9oSoyrQmRDB/tE2+r13YsQYsAVG200b2G4M10WAenRM5P6WjKzT5m
         mHJr3i5SG6QQmeoEIFdiqxcT6qb3XCObKEmTSQZ+GB9tuIdAHAVy0zWTfSY3X1Y/qa
         ZIS+qD3SrBGRQ==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: qconf: remove "goBack" debug message
Date:   Thu, 30 Jul 2020 02:12:40 +0900
Message-Id: <20200729171240.163494-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Every time the goback icon is clicked, the annoying message "goBack"
is displayed on the console.

I guess this line is the left-over debug code of commit af737b4defe1
("kconfig: qconf: simplify the goBack() logic").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 006e7493306c..1c61c768b99e 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1735,7 +1735,6 @@ void ConfigMainWindow::listFocusChanged(void)
 
 void ConfigMainWindow::goBack(void)
 {
-qInfo() << __FUNCTION__;
 	if (configList->rootEntry == &rootmenu)
 		return;
 
-- 
2.25.1

