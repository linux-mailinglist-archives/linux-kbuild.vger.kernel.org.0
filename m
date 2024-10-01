Return-Path: <linux-kbuild+bounces-3852-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6AB98B7D3
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 11:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90F9B1C21E63
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 09:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1613419CC01;
	Tue,  1 Oct 2024 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4ubeKcR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354519ABCB;
	Tue,  1 Oct 2024 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773354; cv=none; b=rPgNNCKj8Y2c3m3Snm/VpPVafVpZ697XY8gqoesxg+gRTxtq8IyOIgQPRADIn9bipaD2My+UT4U8Epe/ZiGm1Mq1AsAgjJ2G5SF74kN1+dCJfoi2kKbvTBuq5njJng9xClrk58/gzqkC/Gh9Mjjic/IBAE289gnKZyF6vdwL/6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773354; c=relaxed/simple;
	bh=6bf5fSHj60t3k4yhPDUaRPovE0nur9YRMmZw68ogcyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tAXLh4feRMgB6K67YHAdCE23CxBIJTYKqRaYbexMyf+v30DDTwZHDryhv56rUeWr5YRhCgbXuoRn8uQL0Vb2pMibbhiKE4J42e/RK+H95BtylMuExV99OYUMqeBnGNdnS2r6EvyFl1q/WA8vu27RPFQfZ7Zt7vYkowTo2SktBmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4ubeKcR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F075C4CEC6;
	Tue,  1 Oct 2024 09:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727773353;
	bh=6bf5fSHj60t3k4yhPDUaRPovE0nur9YRMmZw68ogcyU=;
	h=From:To:Cc:Subject:Date:From;
	b=A4ubeKcRZU2j6ThTxZUlFYodHpwGp/gsahSoDaeouA+16K8/I2wTIg+cdviIb7Z2a
	 SG4EMlY16FMVnjykuSHWX48SRKAsZ4Q7ApQmYYJO/yiLkvlRnLDki5C9mBc8XY/BWT
	 Mb95xqE0JdZ8PanrSeDIAtCWUM+rzRjTVmr+D5eBn2b5ARiuREzP/K5I6zjbiwnhnB
	 XKb3FsHbP4fDuL7oItv1PIchypmY44Jgc/TZkkSt4ZWkX3vK5LFHdgLIkrbFHTR+Vk
	 h67HQyOOtXo8g6wjlGVr25Ty7tNdXUZXLRZ7OLj3knXPtBpjaj1CthioUJRl8m7CMF
	 1dVzvjqUMW2XQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] kconfig: qconf: fix buffer overflow in debug links
Date: Tue,  1 Oct 2024 18:02:22 +0900
Message-ID: <20241001090226.2784447-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If you enable the "Option -> Show Debug Info" and click a click, the
program terminates with the following error:

    *** buffer overflow detected ***: terminated

The buffer overflow is caused by the following line:

    strcat(data, "$");

The buffer needs one more byte to accommodate the additional character.

Fixes: c4f7398bee9c ("kconfig: qconf: make debug links work again")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 7dba8014ead4..e260cab1c2af 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1166,7 +1166,7 @@ void ConfigInfoView::clicked(const QUrl &url)
 {
 	QByteArray str = url.toEncoded();
 	const std::size_t count = str.size();
-	char *data = new char[count + 1];
+	char *data = new char[count + 2];  // '$' + '\0'
 	struct symbol **result;
 	struct menu *m = NULL;
 
-- 
2.43.0


