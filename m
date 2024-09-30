Return-Path: <linux-kbuild+bounces-3838-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0A698AA74
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 19:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BB3F286945
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 17:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BC218E02D;
	Mon, 30 Sep 2024 17:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYIRsQPQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4875103F;
	Mon, 30 Sep 2024 17:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727715752; cv=none; b=Kci8KuNWNp9/Kjv0Xi9/z9qaMK2ZL9YMoidssI3rCs757/zkD4VE2m4yRP/ywOhmvoQVdGohHqW3w0/tuODKxwBYIRzE1cj5ZyCzmVoZFz6NRGY6X3Lo1hDlgzDXWxGukyAiPrGyt8p6vkxmY/6IltppsZ8PuTRBQaccLvhNsDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727715752; c=relaxed/simple;
	bh=IdNUBN643bDwmAr2G+H5eoxHgPvXm4p8NntU3HAHOvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGRLLmjXGNYTt8fzbu18zzucXuFeswsRFgXC8pXEwwsPpXGC5eSphv8cCDcPABo9A2CDt5PqU6jDD5iFDE3QGzRQdkn6BD8IYB56s9xZp9yeRxmnf0jXSDtmhMwlHmyBSlzOsfKDXNONNPpR1+hZ/JAN+ToWk0THeNm+epjDVjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYIRsQPQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F54AC4CEC7;
	Mon, 30 Sep 2024 17:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727715750;
	bh=IdNUBN643bDwmAr2G+H5eoxHgPvXm4p8NntU3HAHOvY=;
	h=From:To:Cc:Subject:Date:From;
	b=TYIRsQPQBn0HQoh0mmTABJkxss6AEjyxwa8WRTBxxaVNYCD9OWkRdlR3zLEdmY2Cn
	 vXyM2vcUONEnGfyxAY5hKQIpiFfAchiSPnWieApi/U5VQ8LNWhPryQAzhMdej2wyrb
	 xf9A0D2CEoIJAjGpPxGCYW3FCycDY+CwitYaMyHnCjucYHFN9NBf897Ihac7S6q/Ox
	 aqSA4xbkj3pICiFVH97Vk9puBgNtAiHaDvIIMHQVF5u7u2rL7OpJx4NC5YgNsrPp4V
	 Mq8lfFQEeg4CP5I5taDKlxngNnAjTf2WSBzGmBAtF021fn2PUmxAVmXAduBnYlEqvI
	 fvZKjctpLnk6g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kconfig: clear expr::val_is_valid when allocated
Date: Tue,  1 Oct 2024 02:02:22 +0900
Message-ID: <20240930170226.475324-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 95573cac25c6 ("kconfig: cache expression values"), xconfig
emits a lot of false-positive "unmet direct dependencies" warnings.

While conf_read() clears val_is_valid flags, 'make xconfig' calculates
symbol values even before the conf_read() call. This is another issue
that should be addressed separately, but it has revealed that the
val_is_valid field is not initialized.

Fixes: 95573cac25c6 ("kconfig: cache expression values")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 78738ef412de..16f92c4a775a 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -47,6 +47,7 @@ static struct expr *expr_lookup(enum expr_type type, void *l, void *r)
 	e->type = type;
 	e->left._initdata = l;
 	e->right._initdata = r;
+	e->val_is_valid = false;
 
 	hash_add(expr_hashtable, &e->node, hash);
 
-- 
2.43.0


