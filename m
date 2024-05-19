Return-Path: <linux-kbuild+bounces-1884-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0C18C9365
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 06:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E1EA1C20A00
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 04:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7517F9450;
	Sun, 19 May 2024 04:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgQS5qfb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360378825;
	Sun, 19 May 2024 04:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716092675; cv=none; b=ZLU5YNL0eSOOH856Al7XVi5gqg0/uJr52NMnoR9MamKTcCg5fUIL+J99/YVBCrkJoK5g0NERHUY30/Ui1+8j9i2sectPbMpYipOHGiPbf5MQAcIjON0RmW0H9Lh+myrZ9Kkuy3hBVmYTTGZYohmrcg4aU8CWDUX3xHgWRr5H+uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716092675; c=relaxed/simple;
	bh=m3JiPLIUD7+2vAOeZi6GdJd6y7HtLZ87bSDnlBm1tsw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aXxWp8mC6eCvLdA6H30iK+Go+4TGbRZcuvY0ynr43rLcBxSZrRalNAXABldunajzSwzyA3TWlrR/Nl10jqngZ4YckGmsHPAoiFb52KDENztORX08uMz5dH4nFXQefWDMSgY1mSybn5874FH5II7GhCdslw3N2OKSr8RLQHFjthk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgQS5qfb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B03A9C32781;
	Sun, 19 May 2024 04:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716092674;
	bh=m3JiPLIUD7+2vAOeZi6GdJd6y7HtLZ87bSDnlBm1tsw=;
	h=From:To:Cc:Subject:Date:From;
	b=ZgQS5qfbUAVmuAQ6DdGgwL8QOZJuTLb9Ktj9mar/Sd9W4XHpQtSGBbFaxzCJ2pzbc
	 25I5oDwGaNSCnRzwX0MZukyOVrnTg+b+pNCJ1wz97dHufhUrydn7W8m6UUD8iiRveF
	 AtuXiyifxo3gjiS53mU6eelK6LoaR5VBLPDvQ05OHYu3SocQJByE5Ixc22H1y56hLv
	 gG2OdDfii5psuS0sAxvrC1ri9/6dSP3/G38nHNp+pnTqRgbjU9iwan51yAY8F+edEv
	 uCdL9A10kWuxafbgaNQXGsTVsgUn6+cB1dD9k33hd9xbZUva5CiGkmqBotwRyH+nsR
	 NWceAz7igkhEg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: remove unused expr_is_no()
Date: Sun, 19 May 2024 13:24:30 +0900
Message-Id: <20240519042430.1612039-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This has not been used since commit e911503085ae ("Kconfig: Remove
bad inference rules expr_eliminate_dups2()").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 1f30e0538471..f039c1a4fbc1 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -298,11 +298,6 @@ static inline int expr_is_yes(struct expr *e)
 	return !e || (e->type == E_SYMBOL && e->left.sym == &symbol_yes);
 }
 
-static inline int expr_is_no(struct expr *e)
-{
-	return e && (e->type == E_SYMBOL && e->left.sym == &symbol_no);
-}
-
 #ifdef __cplusplus
 }
 #endif
-- 
2.40.1


