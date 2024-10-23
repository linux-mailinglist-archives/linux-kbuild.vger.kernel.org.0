Return-Path: <linux-kbuild+bounces-4289-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867E9AD3DB
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4915E28585F
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515201E2826;
	Wed, 23 Oct 2024 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4thB5RL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C5E1D0BA4;
	Wed, 23 Oct 2024 18:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707514; cv=none; b=nwil+SLtmfPnDA3y1OJqnA+BECrqtgXWnx9QooeTERPdOoF4nc7l975KqdFzAciNeHIX1bX7W7yxsUrUThewh0ONfyL0lcxs0SUK1EO7kn2DZn2WqcVbzXTyN7HRKx1TfcSaUQXS6oHF5yiSAJXoe/YkO4qDpWMAZQj11AV2TpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707514; c=relaxed/simple;
	bh=RB7y93I9LNK5locviyv6hDKYHXT35/Jru69K1LVDmic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzqUpiv+zYQq7b4RaHKXgHbRillRqxcwG1WbEjSa4n1kBFCSpoAx5D4nI/mhyJApl+/hRjbET/vMX4bwYm8jRkp346LJHGqhnOSfU/cctieLhPu9DWCJP+7IfjpMiANfJnHemneLlH1znzhHGCRxHyyR7U8yXx+HSaBObFTme+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4thB5RL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8E3C4CEC6;
	Wed, 23 Oct 2024 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707513;
	bh=RB7y93I9LNK5locviyv6hDKYHXT35/Jru69K1LVDmic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z4thB5RL6TjI66fYKyVAsWn/31yuKokY1pf1JH5FgI7o1nP4zmNHwCuDKKY9gxuEi
	 TELWTW1d2qf2iwThRclJobQV8OOflORMlBHvC7k8B4oJCUujZmVNYX/oGBWQPsUv9a
	 Euv7Tv1AVs7vKAyRp2OngZhFBwAf7yGO08GgixelZ/c0BRXidde7d1ONLQJLq8jjw2
	 oLH0Fb6y8/2cgKGHfa5MTbsW2GzcoKMBQVeatZqPy529AxZskwTfvXq8WHflRW6JX8
	 MkP+lgjrLAToVtWsvmql90CuLpLK7EgyYlDEelP9YcMXxit/M0zIQMDqiZD3dktBTI
	 T+QOK0xH6Ipzg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] kconfig: qconf: do not show goParent button in split view
Date: Thu, 24 Oct 2024 03:17:56 +0900
Message-ID: <20241023181823.138524-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023181823.138524-1-masahiroy@kernel.org>
References: <20241023181823.138524-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a menu is selected in the split view, the right pane displays the
goParent button, but it is never functional.

This is unnecessary, as you can select a menu from the menu tree in the
left pane.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index c922c34621a4..7c844c4a119e 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -436,8 +436,7 @@ void ConfigList::updateList()
 		return;
 	}
 
-	if (rootEntry != &rootmenu && (mode == singleMode ||
-	    (mode == symbolMode && rootEntry->parent != &rootmenu))) {
+	if (rootEntry != &rootmenu && mode == singleMode) {
 		item = (ConfigItem *)topLevelItem(0);
 		if (!item)
 			item = new ConfigItem(this, 0, true);
-- 
2.43.0


