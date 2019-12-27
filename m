Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE3E12B960
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2019 19:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfL0SEr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Dec 2019 13:04:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:60412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728573AbfL0SDN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Dec 2019 13:03:13 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 028682173E;
        Fri, 27 Dec 2019 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577469792;
        bh=CML4ynmYXN0xB1zt3WrGElGGQONxilXaUfFuXX/uags=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wuhadizj9ACl8nWNgJJeIeGh+7Y1OQnD2EC1Fgnc+SI+XoF38x9B9wVdZKEwTFLVc
         qLrIxnDQRqk6qhRFz7oQa2X+8fLFxznFkisKYQ/fYYPH1VrmNofvXcyS603+MdG/23
         1mTL1WG5bstfDw2ej0cOI58uB9JkyTKkzCQ5C3ZU=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Thomas Hebb <tommyhebb@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 41/57] kconfig: don't crash on NULL expressions in expr_eq()
Date:   Fri, 27 Dec 2019 13:02:06 -0500
Message-Id: <20191227180222.7076-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191227180222.7076-1-sashal@kernel.org>
References: <20191227180222.7076-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Thomas Hebb <tommyhebb@gmail.com>

[ Upstream commit 272a72103012862e3a24ea06635253ead0b6e808 ]

NULL expressions are taken to always be true, as implemented by the
expr_is_yes() macro and by several other functions in expr.c. As such,
they ought to be valid inputs to expr_eq(), which compares two
expressions.

Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 scripts/kconfig/expr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index ed29bad1f03a..96420b620963 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -201,6 +201,13 @@ static int expr_eq(struct expr *e1, struct expr *e2)
 {
 	int res, old_count;
 
+	/*
+	 * A NULL expr is taken to be yes, but there's also a different way to
+	 * represent yes. expr_is_yes() checks for either representation.
+	 */
+	if (!e1 || !e2)
+		return expr_is_yes(e1) && expr_is_yes(e2);
+
 	if (e1->type != e2->type)
 		return 0;
 	switch (e1->type) {
-- 
2.20.1

