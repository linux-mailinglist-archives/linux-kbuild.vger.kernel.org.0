Return-Path: <linux-kbuild+bounces-3459-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DABE970110
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 10:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 997DFB21741
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2024 08:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BD0154C15;
	Sat,  7 Sep 2024 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrrVVKPa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFD71547F5;
	Sat,  7 Sep 2024 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725699215; cv=none; b=deMNxlfrkZ/Gqqs3N5d7OIJjJBIoPX04c36uxkStetbbNmD4FmTa+reBFLF2kFhQVlWcLNOMc3F3JL166/0S9HjZeD1RIIYu6CUgZjZwIEKp5CLWVBvA0j3CdaYxobE+EKyuIMDiceUEZG+0i7y2QfKnzGYiLpHOQBaY8N1HPVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725699215; c=relaxed/simple;
	bh=s+4kwcMdfrz+gOW0SVoEv7g6su2b8HF4jqTIvhtCsnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtEWDr9aKGBo4FsAc/2cXhovCvUoE82ZRmUt7wvctAfHJsFRE5Ol5m28D6tYdZOBhwVU9oFZ9USQn1NszxjTZFtOVP9zkzjlHVVliNurX2VBUnYCP1TDjEkSf5o2KQSyqv6B0o9zTsqQLhrxxaQf+gcXrvksE0N08NsZsMT28+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrrVVKPa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B55C4CEC8;
	Sat,  7 Sep 2024 08:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725699214;
	bh=s+4kwcMdfrz+gOW0SVoEv7g6su2b8HF4jqTIvhtCsnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KrrVVKPa5ljLuQPSiTXajE+Dqd8mNfnHPJqVlhoLIyAkXtx1nKg4gTv565jJcCOlF
	 8RElTVGepJ0PZgnuy1DiCL8DnyBStUMnTiXFBmeeqhHJ5JZgNtdZqJUls6JxWXcNmv
	 vDTW6uQj4cYQTWWZe5ifAF6nBGrUxdMugegS1JPaURZElf1WhPKczei9d3lC2QUwyG
	 Lm9yjoKsnJqFXSTgahXZDK6VYrnbIWECJsyYgtFTFO+i45UaCA0Z0R8WjewSNMrTCX
	 8dYfH1SLm3owd4ZyCdX8q8nJtmJYJzWZHUGKs9o05XDfLp4Di1yEaggK5vXoLcj1HR
	 EEjipxYN/0XfQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] kallsyms: change overflow variable to bool type
Date: Sat,  7 Sep 2024 17:53:23 +0900
Message-ID: <20240907085328.1374086-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240907085328.1374086-1-masahiroy@kernel.org>
References: <20240907085328.1374086-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the 'overflow' variable to bool. Also, remove unnecessary
parentheses.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index f6bb7fb2536b..03852da3d249 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -455,17 +455,17 @@ static void write_src(void)
 		 */
 
 		long long offset;
-		int overflow;
+		bool overflow;
 
 		if (!absolute_percpu) {
 			offset = table[i]->addr - relative_base;
-			overflow = (offset < 0 || offset > UINT_MAX);
+			overflow = offset < 0 || offset > UINT_MAX;
 		} else if (symbol_absolute(table[i])) {
 			offset = table[i]->addr;
-			overflow = (offset < 0 || offset > INT_MAX);
+			overflow = offset < 0 || offset > INT_MAX;
 		} else {
 			offset = relative_base - table[i]->addr - 1;
-			overflow = (offset < INT_MIN || offset >= 0);
+			overflow = offset < INT_MIN || offset >= 0;
 		}
 		if (overflow) {
 			fprintf(stderr, "kallsyms failure: "
-- 
2.43.0


