Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3F023217E
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jul 2020 17:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgG2P3k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jul 2020 11:29:40 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:54314 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgG2P3k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jul 2020 11:29:40 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 06TFT5iv016641;
        Thu, 30 Jul 2020 00:29:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 06TFT5iv016641
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596036546;
        bh=QRGY5KyPyAu6gAEnoCYHadFp9xmMAfIGFPn8jJU/q30=;
        h=From:To:Cc:Subject:Date:From;
        b=LfFB/5OpKEIYtUxjI4N6gfwdAqUfpSBstNRfNzzuNP9NYHWVJoucfhyD5h1U6GXyE
         RTsF+fxkahemGycDAy+fbv36BSJjhNKnj1nrs72noi8ZjNA6UF8gHgoBVXL1Sw1ode
         3QmF0OJrY5B+OF1Px8FFdgtrH98HOeUkz15X1cdK97Rx/5JzxTTeoZxI1CCo/CEmMP
         xLfm13mEBy1+WrYgcuIa0EsGiw3TVlPK/wjtYqJrIpl4YN+vWz2esXfH7psKQPLYx0
         wWUFPJ5ACPZ168sh2u7fgGzllLpBdkxAoDyeVvX4/hxAJsFUvVOBOPn8nZ2M05ngji
         qzZkmwPvmfxyA==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        David Binderman <dcb314@hotmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: qconf: use delete[] instead of delete to free array
Date:   Thu, 30 Jul 2020 00:29:04 +0900
Message-Id: <20200729152904.136335-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cppcheck reports "Mismatching allocation and deallocation".

To make cppcheck check qconf.cc, you need to ensure qconf.moc
is not remaining.

$ rm -f scripts/kconfig/qconf.moc
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

 scripts/kconfig/qconf.cc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 4a616128a154..5a9e83a2f8c2 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1239,7 +1239,7 @@ void ConfigInfoView::clicked(const QUrl &url)
 
 	if (count < 1) {
 		qInfo() << "Clicked link is empty";
-		delete data;
+		delete[] data;
 		return;
 	}
 
@@ -1252,7 +1252,7 @@ void ConfigInfoView::clicked(const QUrl &url)
 	result = sym_re_search(data);
 	if (!result) {
 		qInfo() << "Clicked symbol is invalid:" << data;
-		delete data;
+		delete[] data;
 		return;
 	}
 
-- 
2.25.1

