Return-Path: <linux-kbuild+bounces-5464-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AADA0BB5E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:13:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 010B816B4B0
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFD41C5D56;
	Mon, 13 Jan 2025 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkAwDzYX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3447C1C5D53;
	Mon, 13 Jan 2025 15:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780603; cv=none; b=fj7hg2NVwEj7SPnez1tTRYS5pzmckRqi+0Klufv4v7U4rQiJDoki21GvVj487fAbueUNq0pXt/5Qsg2MnDRkkymxMn2vxqStINugT1XOx6Pcb6PHMNXicjCyccojYCxXXiQiytkMNTkid5+QrQHnoyZO77GysWbxOC5Q6/f49J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780603; c=relaxed/simple;
	bh=M8vxA+N6dxX1TDO6D2OqIt0UpI6aGCTC68g5bvsCVds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6ZIcuTKw59JhOsZBWz1a7oeiCbez/iTcGZUFzTx/80EwvcCMt6mgj4tO03PgU202wNZYGbvSHWlt4OH2b2oBslKysxvNgCUlCaE2y/zBRH8VvLTMFvTZZ5hyXa1KFDxl8oIoe4qzTDXql7K9mlmtsWo0cC4AgvbEi0mO/13yxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkAwDzYX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AB3C4CED6;
	Mon, 13 Jan 2025 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780602;
	bh=M8vxA+N6dxX1TDO6D2OqIt0UpI6aGCTC68g5bvsCVds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CkAwDzYX9FDk8Z3p19UlBIP0v/oKHMBDrh+11EN+EoJv2+nH2MzYlFm9/vhCX8xcL
	 FD90BR/Zy+xtqY85AhxVooQRq38MW3wyisRdvYNCXMEfrfBq88E2krpdDDlRE9OWEZ
	 cTmifRjxWy8DRTnjYjgExtL9TXScIy6vOg1Ufq8++PsIxKwlpCNomFqb5uoA7s5tHC
	 nL7f1T73HRh7yZ8lyBmSj7ftmo/2e+Xa9u0z8zu/Hed/jaU3eMJxsS4kO0ko/L5OIi
	 3CLFOEA2pq8I1Oc3XSPmpg4xgOHuQUDKYci8va0NszQtttuPVcYIWHze0yCpbxijZY
	 S2quhq23BgoQA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 16/17] genksyms: fix syntax error for builtin (u)int*x*_t types
Date: Tue, 14 Jan 2025 00:00:54 +0900
Message-ID: <20250113150253.3097820-17-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113150253.3097820-1-masahiroy@kernel.org>
References: <20250113150253.3097820-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A longstanding issue with genksyms is that it has hidden syntax errors.

When a syntax error occurs, yyerror() is called. However,
error_with_pos() is a no-op unless the -w option is provided.

You can observe syntax errors by manually passing the -w option.

For example, genksyms fails to parse the following code in
arch/arm64/lib/xor-neon.c:

    static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
    {
            [ snip ]
    }

The syntax error occurs because genksyms does not recognize the
uint64x2_t keyword.

This commit adds support for builtin types described in Arm Neon
Intrinsics Reference.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/lex.l | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index a1f969dcf24f..22aeb57649d9 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -51,6 +51,7 @@ MC_TOKEN		([~%^&*+=|<>/-]=)|(&&)|("||")|(->)|(<<)|(>>)
 
 %%
 
+u?int(8|16|32|64)x(1|2|4|8|16)_t	return BUILTIN_INT_KEYW;
 
  /* Keep track of our location in the original source files.  */
 ^#[ \t]+{INT}[ \t]+\"[^\"\n]+\".*\n	return FILENAME;
-- 
2.43.0


