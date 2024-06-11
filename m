Return-Path: <linux-kbuild+bounces-2075-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF669042EE
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A0E9288309
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475DA152782;
	Tue, 11 Jun 2024 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/tQ9cJD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21228152517;
	Tue, 11 Jun 2024 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128574; cv=none; b=HSzlhtOD34AU/OoAmiEK9x5qeMyIOL2ZUPiOvsIYkt0WAbGBt/iaBDW2x96w5fSacEiLaaPdKZSzpLQci1Z6S9xIkYRg/lCpkUGQyCXyVOugI52hoidbOMvmXEg4qBe20bdCuL/zJVtqSgKoF0kINInIReY/wETh9GFbyPlnpNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128574; c=relaxed/simple;
	bh=HzGlcc1zoUQ21+21S1BHbLI+WRTcdDdm+q0L5lx0MlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ob2xj7DomKykm1WfrY9F2i2z9yFTQWOEz/ISAJAL+36hL8kvKrdyJ4A6AC8gHDlbnH6nOwDauClUDOMQ/tMvuJNFzp5IFcQGS1lXcZIH0cMGybtlqKsL0CcvSCnsMH4hLV6HDdaiyi9V7UtNIIGsxyr5Kg+lDoM16yuchXTDDPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/tQ9cJD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499CCC4AF49;
	Tue, 11 Jun 2024 17:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128574;
	bh=HzGlcc1zoUQ21+21S1BHbLI+WRTcdDdm+q0L5lx0MlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O/tQ9cJDKSZqc4E2aV5nWA3bgw9YHueKFMLGq6Ric0W1mG5zDh7eIyKEU5+6p8Ek4
	 4aINFnenyFzxx/IAnkEqCjk/ta8c57PnQMFbuYbGS6kW814nNIBCSV5VJwIOx/+4Y+
	 lIrfH0RCcuThoHKqAatZmvAsRVAhqAP5hf68EvVGuQ3s+FuTOC2F8d9alIfZFMJFkc
	 Hf7QXxDwxcqVHp/G74p+fsbYyaLBItLgbecIw/6v7Wez0498eCXhyVJK1HWosMfcQE
	 qe//AR/0gEtgdvlZGQ8Uo6pzrOprzxWPt/Nms3UcfcN9PyTiVcvTJj3GVfFzE5NKYG
	 kgdB8vYhWbpcA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 11/16] kconfig: remove expr_list_for_each_sym() macro
Date: Wed, 12 Jun 2024 02:55:20 +0900
Message-ID: <20240611175536.3518179-12-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611175536.3518179-1-masahiroy@kernel.org>
References: <20240611175536.3518179-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All users of this macro have been converted. Remove it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/expr.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
index 7acf27a4f454..1d1c4442c941 100644
--- a/scripts/kconfig/expr.h
+++ b/scripts/kconfig/expr.h
@@ -43,9 +43,6 @@ struct expr {
 #define EXPR_AND(dep1, dep2)	(((dep1)<(dep2))?(dep1):(dep2))
 #define EXPR_NOT(dep)		(2-(dep))
 
-#define expr_list_for_each_sym(l, e, s) \
-	for (e = (l); e && (s = e->right.sym); e = e->left.expr)
-
 struct expr_value {
 	struct expr *expr;
 	tristate tri;
-- 
2.43.0


