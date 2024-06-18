Return-Path: <linux-kbuild+bounces-2182-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351590C98E
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F4041F23EB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7700161307;
	Tue, 18 Jun 2024 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QiOc3ytU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFFE160883;
	Tue, 18 Jun 2024 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706956; cv=none; b=AHJsdjVrF4pLMG9nADlkvxrUneqvRjTIkXLzoJe24gAVyGhs4Jq99JfEvMOJk3XeJVAv+XVT3ofin/YQC0xelN9cYqI3TIM3htMvMSXX8pYkOAMJB0WvjdCQuFLyKyXs+yTtT4XlmEve/mrSxA4RTZd7Kz8kZwmCPOitpp06Q+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706956; c=relaxed/simple;
	bh=ZIqKG4dfGzGHuy2CAY617V+u0zO994KWrSlA5Ftv9to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAFCRPC0gFww2bQr5L7g8MG2bP1X4/qDVVnzU75GReyr1glxfm10KoPkve1p5DiY4RHaBZCDnnJCWkEbBt43k5Nr6fxRdgrmwK4MniPzaQChvmCbbl2Utx/00AbX97d5DJZbknyS82CnyGWiJ374CJoMq0QIDvWT4dlh6nYGx5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QiOc3ytU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04AAC3277B;
	Tue, 18 Jun 2024 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706956;
	bh=ZIqKG4dfGzGHuy2CAY617V+u0zO994KWrSlA5Ftv9to=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QiOc3ytUQvt17de9IAGqpIonmogfbdNazMojnILiUzpyVqMBo3IpAKpnEv8VMWJbp
	 hwOwCNTt0sQk5jTNYx0VCGonAR8BtRPZztiunRV3yHjQkbMj3RB7+mNpf1hQZLc5kw
	 CGAYpfptcWXB47TClF90eTePdfCEHxMNaAOAL0tdL1ld+hS+c1UDIvJvmRRZ+NI77v
	 l3Z6XeupFUlFRTaA2s7JeaTP6EcqrBlZzUvXLXml0nD7A2CfyhB1fn/srVTYwM1XU4
	 M1cCSUHr4E79iSrk65F/sVKp7WsZZm5ghAbI0pPGWNe0jGJ4FDDJKfuo+0XQ/0i1Uk
	 kZzLLAIHX18Qw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 07/12] kconfig: remove expr_list_for_each_sym() macro
Date: Tue, 18 Jun 2024 19:35:26 +0900
Message-ID: <20240618103541.3508486-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618103541.3508486-1-masahiroy@kernel.org>
References: <20240618103541.3508486-1-masahiroy@kernel.org>
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

(no changes since v1)

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


