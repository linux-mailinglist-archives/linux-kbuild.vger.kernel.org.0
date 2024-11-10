Return-Path: <linux-kbuild+bounces-4604-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E026A9C3049
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 643A4281FF4
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAA1146000;
	Sun, 10 Nov 2024 01:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7gQgzTR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63540145B39;
	Sun, 10 Nov 2024 01:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202619; cv=none; b=iwPB7SkVD2klwbk6lTzwTdJBy79y+sRpg4d52EXHfYrZDxix21yQJrG3TWE5b5T38OiFcmJOv0Z6hyyTt2b/5ksfr6+r7odMvwCEbSZo/pG8YnhAP+I4DWtaRv7zMY6PAmbvqpad1ZCLxo5DQE3O4f+pp73R6sXGO3LTxTtYPn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202619; c=relaxed/simple;
	bh=CuefUAuu2ymiIcWDp7fjjKsIw2/LHtdF4FuH73CuyK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkVbMED3lKs90r8vV05Y9RJvtqXsTJ0gaAPjpsoEuwH8riy+oi8VuFrcgP0B756XJIgozoxYE5S/IDVviPee+PaMJCQHono1bo9Xye0IoiOj/+EJPnz7aKu0on4iOTvSnisVH0RxnSjyDGkCMlHsijUUfWgBRL7lI8ECoIMS2y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7gQgzTR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A9CC4CED4;
	Sun, 10 Nov 2024 01:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202619;
	bh=CuefUAuu2ymiIcWDp7fjjKsIw2/LHtdF4FuH73CuyK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i7gQgzTRVWoE3MSGJo91WHpUNSu3jtq16SwETWmoDxFzWgfy+IA/6eqHr0gmxctPD
	 Ezay9mIHwLgrsAcz3ji5zL6xLNl5C8bMWaBByQn6TrXO6X0voGE9Ab1c4GABhbVT3C
	 GnuhVYXofepqdtV0hrIZtiHJ5xQdzTCSCzKNyrgWaKIsoHRBShdA5CAcWftM24CTHN
	 i7RtSxOMkUTCKCsAo3jd2bd5NPcXMbYDEYOHj6oOJ5JKxFWfaVtExBVUdYMA3sFy+O
	 nuZRaX78Gidhg1Q1KSCPrp9M51rI5LAgKJy07TVClwSqjNoK7Fd46dpsU5YsBbc4W2
	 cVU0U0X79lgJA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <n.schier@avm.de>
Subject: [PATCH v2 01/11] kbuild: replace two $(abs_objtree) with $(CURDIR) in top Makefile
Date: Sun, 10 Nov 2024 10:34:29 +0900
Message-ID: <20241110013649.34903-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241110013649.34903-1-masahiroy@kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kbuild changes the working directory until it matches $(abs_objtree).

When $(need-sub-make) is empty, $(abs_objtree) is the same as $(CURDIR).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
---

(no changes since v1)

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 8dceb6830486..891d28e54791 100644
--- a/Makefile
+++ b/Makefile
@@ -228,12 +228,12 @@ else # need-sub-make
 
 # We process the rest of the Makefile if this is the final invocation of make
 
-ifeq ($(abs_srctree),$(abs_objtree))
+ifeq ($(abs_srctree),$(CURDIR))
         # building in the source tree
         srctree := .
 	building_out_of_srctree :=
 else
-        ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
+        ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
                 # building in a subdirectory of the source tree
                 srctree := ..
         else
-- 
2.43.0


