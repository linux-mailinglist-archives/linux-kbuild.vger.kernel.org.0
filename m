Return-Path: <linux-kbuild+bounces-7746-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7635AECFB9
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 20:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C141716F5
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Jun 2025 18:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94792367AF;
	Sun, 29 Jun 2025 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBQeXHkT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FF92343BE;
	Sun, 29 Jun 2025 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751223005; cv=none; b=KCoRXrQAdSjRTlzJX/xMzsEd+HeWr7IuA5chpLrsjKr91dr4Wc0WgOjmZLTahjvUAQVsRhhpI5A1beoQEzHRHbopDPzLn99nLzldB1OW5rImQXpnB8+E1pL72/SVN5KHXjANuOlm1ae/uOWArtUcGG0qMI2FhYBYcPTDE7Uya0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751223005; c=relaxed/simple;
	bh=jXO9CYXR1CYzH/ai7xunxA45tjdY3czmBlhDe7G2lmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OygsQ3r9JkpybC/Tu81f41ck3dvXWJgqtdhtM+qfZMNEjeFSzbuU/8Schwo9OVDCMm2N9xJqM31IbE0+6c4hHCav0BmXRN0IRoQo94jnZ6Fm8LpnMlmTp2U6hSK2xnpH8Dzz+/EeY74jnPUBRvNWtukt0MX5Du/AFAQRjbqyzrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBQeXHkT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C3AFC4CEEB;
	Sun, 29 Jun 2025 18:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751223005;
	bh=jXO9CYXR1CYzH/ai7xunxA45tjdY3czmBlhDe7G2lmE=;
	h=From:To:Cc:Subject:Date:From;
	b=DBQeXHkTuSEE1R5rFSf+tlcvSWSf6lzx1DuSFer6Ff/7GRWFyyxOVOHqITj7zF8Dd
	 nYAE7eLs3MBsU7pNlCv+2DAwlu+XBWFdZyMiztZ20dO2gWWBwo0jVlU+0zX29FZTyf
	 /7suiEvbA0wzVUKF0lu+MHYgDHdxrfUoWIiwzPPtg+YZQrmZMHuiL+clN0bSvEyfSY
	 RWxRbSo80EBMsYLXrfZtwIGpD1e4cRQYpIOHmQQJq9j/m25DDJAHzzfVwHVpTXC2yE
	 GGDrPl+k2VJy0sNEnqDqpVQQIEU1jcjOVTPf8V8LT2HEzwt4AArV5ozMNi8x5kGe8b
	 ucL59bQG3/T4A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: qconf: fix ConfigList::updateListAllforAll()
Date: Mon, 30 Jun 2025 03:48:56 +0900
Message-ID: <20250629184958.411852-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ConfigList::updateListForAll() and ConfigList::updateListAllforAll()
are identical.

Commit f9b918fae678 ("kconfig: qconf: move ConfigView::updateList(All)
to ConfigList class") was a misconversion.

Fixes: f9b918fae678 ("kconfig: qconf: move ConfigView::updateList(All) to ConfigList class")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index dc056b0a8fde..a7c98bbbd8ac 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -486,7 +486,7 @@ void ConfigList::updateListAllForAll()
 	while (it.hasNext()) {
 		ConfigList *list = it.next();
 
-		list->updateList();
+		list->updateListAll();
 	}
 }
 
-- 
2.43.0


