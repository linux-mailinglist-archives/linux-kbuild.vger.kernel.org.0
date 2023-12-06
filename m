Return-Path: <linux-kbuild+bounces-272-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D778075BB
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 17:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30D97282082
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 16:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A3CA495ED;
	Wed,  6 Dec 2023 16:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjMSOw7B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B3495E5;
	Wed,  6 Dec 2023 16:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B32DC433CD;
	Wed,  6 Dec 2023 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701881397;
	bh=FX+9AhxDxlGRN82cSVqdO9N0FZ8uSRwwg3QjeC/0Mas=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DjMSOw7B5jO2x5mPAweB3Xl4F32nqQGjnDGsEpf6E2LmZWeGj7N60eCMNUo06QcYc
	 HzE+e3J3m5NH7X/lAPSLpx1uSMkPR+BHLsr/QyNlLprW1r2lehZTwmODw8nVEmDMPt
	 FB4PtyWddxrrtnV2yzxjrPnlk5+iZZFjIcklwuelqMHU7jvwcbEuxp1EwjJxeOSwA+
	 yBWhm2E5ZPiuz3laL4KI+FZBF/BTjj+461IXuWy7VTC/oT4qO+L5DPfn/83ptPIC3X
	 Z9MrC2gude9VnEchZqRa4o/Xs7t2fxlkiqo5CGy8rTOaP1rQVHcwk9FuE5KFvFj/ob
	 NFfE4y4W0cNIQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 06 Dec 2023 09:49:46 -0700
Subject: [PATCH v2 1/2] um: net: Fix return type of uml_net_start_xmit()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-1-91311b4c37b0@kernel.org>
References: <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-0-91311b4c37b0@kernel.org>
In-Reply-To: <20231206-enable-wincompatible-function-pointer-types-strict-w-1-v2-0-91311b4c37b0@kernel.org>
To: masahiroy@kernel.org
Cc: ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
 keescook@chromium.org, samitolvanen@google.com, nicolas@fjasle.eu, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Nathan Chancellor <nathan@kernel.org>, richard@nod.at, 
 johannes@sipsolutions.net, linux-um@lists.infradead.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216; i=nathan@kernel.org;
 h=from:subject:message-id; bh=FX+9AhxDxlGRN82cSVqdO9N0FZ8uSRwwg3QjeC/0Mas=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKkFy4yM9rpx5k+aJFGn0zux+OThjG4PN0Xeu38ildb0L
 Try56NTRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZiISyPDf++JHOfWvMiT8D9s
 9XZnbP6jop/80vaNC30W3jE/UrZtQg3DP6U7D9haSvYXqy28Pu33Ec66nsn6HUc2+Bv9/flOYe/
 0JF4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
warning in clang aims to catch these at compile time, which reveals:

  arch/um/drivers/net_kern.c:353:21: warning: incompatible function pointer types initializing 'netdev_tx_t (*)(struct sk_buff *, struct net_device *)' (aka 'enum netdev_tx (*)(struct sk_buff *, struct net_device *)') with an expression of type 'int (struct sk_buff *, struct net_device *)' [-Wincompatible-function-pointer-types-strict]
    353 |         .ndo_start_xmit         = uml_net_start_xmit,
        |                                   ^~~~~~~~~~~~~~~~~~
  1 warning generated.

->ndo_start_xmit() in 'struct net_device_ops' expects a return type of
'netdev_tx_t', not 'int'. Adjust the return type of uml_net_start_xmit()
to match the prototype's to resolve the warning. While UML does not
currently implement support for kCFI, it could in the future, which
means this warning becomes a fatal CFI failure at run time.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310031340.v1vPh207-lkp@intel.com/
Acked-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: richard@nod.at
Cc: johannes@sipsolutions.net
Cc: linux-um@lists.infradead.org
---
 arch/um/drivers/net_kern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/drivers/net_kern.c b/arch/um/drivers/net_kern.c
index 3d7836c46507..cabcc501b448 100644
--- a/arch/um/drivers/net_kern.c
+++ b/arch/um/drivers/net_kern.c
@@ -204,7 +204,7 @@ static int uml_net_close(struct net_device *dev)
 	return 0;
 }
 
-static int uml_net_start_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t uml_net_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct uml_net_private *lp = netdev_priv(dev);
 	unsigned long flags;

-- 
2.43.0


