Return-Path: <linux-kbuild+bounces-4737-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A199D3125
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F32EC1F2244A
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3881D7996;
	Tue, 19 Nov 2024 23:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUSZo3NA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD701D3593;
	Tue, 19 Nov 2024 23:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060637; cv=none; b=BfewvqXOlok2Feq0t9XBgPNGj2BhyI+/qdPktwqU54Ifn9cwVwVI46CmqmsOnFeFsUnaCQSMrHMbJSvlIPAgN+OKlgSfGTcgVrKeW3WRhjiPj5vfdLoSHmyOyk6BRsshcZ9RE0hCKcOYIgl17Z7L43l1MVVj2RqnAIN/c2Zc0Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060637; c=relaxed/simple;
	bh=GqDkYssQFSmrTIVTeBwR8TX2fFPnOl5VpA40QygcM4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpJdVLxLSyL5aKCC8gf3ba2RBriAD41p5oGqJMRL0WZRFgtRKL9LWkD/vqSmPzVcWymGRXUXCVG/eoP4BmNQEpBck8zD3PQ9xelqZo5eb9vzr+2Kg40EKuh/OCexJoUQUXQcM+P4w6dya+Iax4zEHD81F3uYQzxHlRVYoVzoDUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUSZo3NA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3878EC4CED7;
	Tue, 19 Nov 2024 23:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060637;
	bh=GqDkYssQFSmrTIVTeBwR8TX2fFPnOl5VpA40QygcM4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oUSZo3NAVkAzklPTXrB7TjjMZT/ZfZ8Kbu7HREuz0ETnAqchUcQXmEhBJQuywbJFH
	 dJqAk1hxP0Gr0rFu04oB32bLcLlX331KocoavVyFwrI2rDGntCZkc1E09SFPeQH8Jp
	 oq2TVsBI3FeWdAsPGzCqGr9E6XlykXQbLPGpS6i6mosM5HA6wTGV0BlWi7O+/twn7W
	 SIFjMgoMaRIMXcXmwRRBy/jp7hsttB4SvQNEn/wKXXgE3iGSEquoAF2DwdxMTHFF7n
	 WF3BjR2Dwdj/TKRLjlzzR6i7pZ1hexsGGp0+/7KfEG8jSVt3TgciBAhxXQ6mg21xEA
	 cBMCAEli85rMg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/15] modpost: remove DEF_FIELD_ADDR_VAR() macro
Date: Wed, 20 Nov 2024 08:56:43 +0900
Message-ID: <20241119235705.1576946-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119235705.1576946-1-masahiroy@kernel.org>
References: <20241119235705.1576946-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the former cleanups in do_pnp_card_entries(), this macro is no
longer used by anyone.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 57bd4e8da8d5..d34cf418ba70 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -136,19 +136,12 @@ struct devtable {
 #define DEF_FIELD(m, devid, f) \
 	typeof(((struct devid *)0)->f) f = TO_NATIVE(*(typeof(f) *)((m) + OFF_##devid##_##f))
 
-/* Define a variable v that holds the address of field f of struct devid
- * based at address m.  Due to the way typeof works, for a field of type
- * T[N] the variable has type T(*)[N], _not_ T*.
- */
-#define DEF_FIELD_ADDR_VAR(m, devid, f, v) \
-	typeof(((struct devid *)0)->f) *v = ((m) + OFF_##devid##_##f)
-
 /* Define a variable f that holds the address of field f of struct devid
  * based at address m.  Due to the way typeof works, for a field of type
  * T[N] the variable has type T(*)[N], _not_ T*.
  */
 #define DEF_FIELD_ADDR(m, devid, f) \
-	DEF_FIELD_ADDR_VAR(m, devid, f, f)
+	typeof(((struct devid *)0)->f) *f = ((m) + OFF_##devid##_##f)
 
 #define ADD(str, sep, cond, field)                              \
 do {                                                            \
-- 
2.43.0


