Return-Path: <linux-kbuild+bounces-236-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C888880219D
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 09:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EECB280C56
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 08:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6642912;
	Sun,  3 Dec 2023 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNblV9Jx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F5B290E
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Dec 2023 08:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42534C433C8;
	Sun,  3 Dec 2023 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701590753;
	bh=M2GMrw4loolCdNbmGSsgw9g7ot6QbobVN3Xw7lbG/rU=;
	h=From:To:Cc:Subject:Date:From;
	b=TNblV9JxiWK9vM5Uzfx7EhgT61zuRC+CsWQPb9fqZXVyeswt9NNqjbxL1jqTLMvag
	 QbAyup2l15WPZEy4o7QJoG6reqzPQ6DWyIUrv4GpbUFZW15twpTbasZZ9MrR6mPenP
	 RvcK4lyNnhV4GD+StEWvqbHz9Zfe0o6Ah91LvT883+/NCOBXlVEZwwhP8JVYs1mGmc
	 CwyE93JcXybDN+mQN3obYGyf+1QH9EemO701U2LNCYTfJqQeMGSZuvTLLEjfr/pPEy
	 MtCuJFxjX4BOUtxe5lp1+WtYdn7hV3WcYVG0sDiqXCcYjxSPdHwAiUpL/StN4rxOEs
	 8AwNWFbYaN9vw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: determine base DTB by suffix
Date: Sun,  3 Dec 2023 17:05:48 +0900
Message-Id: <20231203080548.1869540-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using the -dtbs syntax, you need to ensure to list the base first,
as follows:

    foo-dtbs := foo_base.dtb foo_overlay1.dtbo foo_overlay2.dtbo
    dtb-y := foo.dtb

You cannot do this arrangement:

    foo-dtbs := foo_overlay1.dtbo foo_overlay2.dtbo foo_base.dtb

This restriction comes from $(firstword ...), but it is unneeded to
rely on the order in the -dtbs syntax.

Instead, you can simply determine the base by suffix because the
base (*.dtb) and overlays (*.dtbo) use different suffixes.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1a965fe68e01..cd5b181060f1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -83,8 +83,8 @@ dtb-$(CONFIG_OF_ALL_DTBS)       += $(dtb-)
 multi-dtb-y := $(call multi-search, $(dtb-y), .dtb, -dtbs)
 # Primitive DTB compiled from *.dts
 real-dtb-y := $(call real-search, $(dtb-y), .dtb, -dtbs)
-# Base DTB that overlay is applied onto (each first word of $(*-dtbs) expansion)
-base-dtb-y := $(foreach m, $(multi-dtb-y), $(firstword $(call suffix-search, $m, .dtb, -dtbs)))
+# Base DTB that overlay is applied onto
+base-dtb-y := $(filter %.dtb, $(call real-search, $(multi-dtb-y), .dtb, -dtbs))
 
 always-y			+= $(dtb-y)
 
-- 
2.40.1


