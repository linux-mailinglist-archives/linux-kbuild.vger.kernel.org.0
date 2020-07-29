Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04133232314
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jul 2020 19:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgG2RDX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jul 2020 13:03:23 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:32760 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726509AbgG2RDW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jul 2020 13:03:22 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 06TH2fR8004951;
        Thu, 30 Jul 2020 02:02:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 06TH2fR8004951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596042163;
        bh=/quLecZaYRWSG8zNo/l95Sqb36deisphhafekyKEbXc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jst0FeN/uUCiPLAEens27yVdywQ/+wEss5zArnpidLF0+ViQYCU1AV2KZRd46rjHG
         J9UtTTdM5nAEyLbVckizSPsd8vTp5KT/XXIflRwiW+RrsyNGqTIM/d0yTDgrpn9mel
         qjcj4+QrDhy1R8T9ZVv9MYQ87JNCS6A3dVPqMYfRh7OS0PsbYMXJpOND+DBrJCKOCN
         yAaWEPIVwKWakxB5ddoHPz2O17ORjGsg1fu2YNxGw9qdkrELNx8zY+6J5PnSBBq7np
         LVCrC7GwV60Xxc4C2KF6imjGiFnnqloqYClvi34R0U3ehBccH+0JXS6Q++q9tpIWpX
         ZepssRmFrze5g==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     David Binderman <dcb314@hotmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] kconfig: qconf: use delete[] instead of delete to free array
Date:   Thu, 30 Jul 2020 02:02:39 +0900
Message-Id: <20200729170239.160208-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200729170239.160208-1-masahiroy@kernel.org>
References: <20200729170239.160208-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cppcheck reports "Mismatching allocation and deallocation".

$ cppcheck scripts/kconfig/qconf.cc
Checking scripts/kconfig/qconf.cc ...
scripts/kconfig/qconf.cc:1242:10: error: Mismatching allocation and deallocation: data [mismatchAllocDealloc]
  delete data;
         ^
scripts/kconfig/qconf.cc:1236:15: note: Mismatching allocation and deallocation: data
 char *data = new char[count + 1];
              ^
scripts/kconfig/qconf.cc:1242:10: note: Mismatching allocation and deallocation: data
  delete data;
         ^
scripts/kconfig/qconf.cc:1255:10: error: Mismatching allocation and deallocation: data [mismatchAllocDealloc]
  delete data;
         ^
scripts/kconfig/qconf.cc:1236:15: note: Mismatching allocation and deallocation: data
 char *data = new char[count + 1];
              ^
scripts/kconfig/qconf.cc:1255:10: note: Mismatching allocation and deallocation: data
  delete data;
         ^

Fixes: c4f7398bee9c ("kconfig: qconf: make debug links work again")
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Remove the description about the remaining qconf.moc

 scripts/kconfig/qconf.cc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index bb0a0bd511b9..3a11940ff5dc 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1238,7 +1238,7 @@ void ConfigInfoView::clicked(const QUrl &url)
 
 	if (count < 1) {
 		qInfo() << "Clicked link is empty";
-		delete data;
+		delete[] data;
 		return;
 	}
 
@@ -1251,7 +1251,7 @@ void ConfigInfoView::clicked(const QUrl &url)
 	result = sym_re_search(data);
 	if (!result) {
 		qInfo() << "Clicked symbol is invalid:" << data;
-		delete data;
+		delete[] data;
 		return;
 	}
 
-- 
2.25.1

