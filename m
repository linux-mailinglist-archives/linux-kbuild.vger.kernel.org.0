Return-Path: <linux-kbuild+bounces-5240-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC419FC5E7
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2024 16:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90A5C188227C
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2024 15:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650511B2193;
	Wed, 25 Dec 2024 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRRNEmpA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA7D1A8F6B;
	Wed, 25 Dec 2024 15:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735140844; cv=none; b=PS+rpnE0oWwqAidbd77fEIJ3HdUckw+Vj2wcpF2FXx3/HpHw7WOlscRgEmZyDpxfbnUXzEk4TmGzKwWKek4LVgYY+D6XYcKn2BSCHsrmdKPqj+VdlOBey7zYKqee0vEM3FwpNrxb2UxTcLZi9+BvCVsvuJWICnjSMEgsBnaswgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735140844; c=relaxed/simple;
	bh=FYQVmq938nLORzg1zBjp/HyD8HK1GzETHgHf3wuxId0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ToR+clHr67kDrN8yhSMPgEVQ/c/r14xEYHdOuJ4rGypQtRt1wXJOYNd6WkFd+UPcNoclb8LoSRXueey2cjcA0DJ1LEuf2bA5tJPk01tc98eYV0sWYCZjE7pE8wbcJQLLAnFRrg9CXptShi1PuQUdljHyyzID3BQVIWMqgT1pH0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRRNEmpA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E533C4CED1;
	Wed, 25 Dec 2024 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735140844;
	bh=FYQVmq938nLORzg1zBjp/HyD8HK1GzETHgHf3wuxId0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PRRNEmpARuO7Tw8Drb1w23FGryFWNJKE93qSZqUrTr1guh/cW5InyFlqQjXNXnLd0
	 8tiEat9ul5n1lFcVMRxh8NPsmttCwfcdNuteF5USxsPHF9wbQ8Ep+DyCl1dLowCx1n
	 v0BnPiOjyjTUkxHi37Kx6h4pHSuF7WmH4AUWDDx8zYrSfKeOkfT/KmcvPbJiitbn0L
	 /NPqh1ta2Dd9x7nrRNiiNaOQ46z+UOkd4mHt30hoqRvEvI0nvYvGH/2N+VSi5vvwpM
	 G+rRsiYCXlM/PgUGXlvd98lr5kLXGBsHdjWaYmci/RqVdGXVupMmCuH15MN+MS0N+/
	 zqEzDig7lo66w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH 1/3] modpost: fix the missed iteration for the max bit in do_input()
Date: Thu, 26 Dec 2024 00:33:35 +0900
Message-ID: <20241225153343.134590-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241225153343.134590-1-masahiroy@kernel.org>
References: <20241225153343.134590-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This loop should iterate over the range from 'min' to 'max' inclusively.
The last interation is missed.

Fixes: 1d8f430c15b3 ("[PATCH] Input: add modalias support")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 5b5745f00eb3..ff263c285977 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -656,7 +656,7 @@ static void do_input(char *alias,
 
 	for (i = min / BITS_PER_LONG; i < max / BITS_PER_LONG + 1; i++)
 		arr[i] = TO_NATIVE(arr[i]);
-	for (i = min; i < max; i++)
+	for (i = min; i <= max; i++)
 		if (arr[i / BITS_PER_LONG] & (1ULL << (i%BITS_PER_LONG)))
 			sprintf(alias + strlen(alias), "%X,*", i);
 }
-- 
2.43.0


