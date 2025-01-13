Return-Path: <linux-kbuild+bounces-5457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A36B3A0BB33
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEC627A0116
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35295246344;
	Mon, 13 Jan 2025 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RxmAiebt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6B324633F;
	Mon, 13 Jan 2025 15:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780595; cv=none; b=tsVMGfW0mNQE6paZTEd+DYr9shAAOE+s60GeKF913Ok07rK43rKsMadTQFz2FSPehfpUJRNBGcjDQYb8xQvpG0NrbtStVAmoxC2wgmE7Ljf1p6GaSfjRLNVkv6VWqPBJa3NAWeENCH4DsIlJCjQXIU5Fxf1dwLzASJ4/krWDvvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780595; c=relaxed/simple;
	bh=PfKY4hMHBliNrr+kB89PDTK5pTJ42rOLJlyN9uzG4mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZL7zxme9r3iWFjuV3EvjcDMkT+UR/N8edyWB1aFFgeCEsywwUrqKmC1/ExuX7/2qXNeM5XfOOTwYXjiUHYU4tkdeAvNCVDVIkbHD/NKqFA6U7kbCLkRBxYXTzU7/R/Mxqk/NgOKFWozOlN7dHXYgojaZamhBqN9TnsPuCTy/xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RxmAiebt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA006C4CEE5;
	Mon, 13 Jan 2025 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780593;
	bh=PfKY4hMHBliNrr+kB89PDTK5pTJ42rOLJlyN9uzG4mc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RxmAiebtvyZPCC94xe9haKdtqusNNEmaizgExpkrAXG21XJEZAQgcHCgg80rOXzAH
	 ProxzWMix3qtzz22CMO3LKB/vL48r1O4beGC63O8SbO6xix1D1rH60m9OrcprWHWDt
	 37ceVZqpm8SYHgYmLdt2zZv7owN2Z2twS/EK2GwmMbjXD5q1x6FPGPomkZGMslXv2D
	 s2/IpeozkfiC2nvqou3ox0jmxsvKzQSTSgCK7ES0K2QIKwO6fO1NrLSpTcihavyti1
	 M1GtIgaHRA0ol7LeNPxhXa94nLEUA7VxVrfW1zUVsHjQreWEgt8ssAoRk5hDyvx6Fs
	 jWSIDe3tb7RKw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 09/17] genksyms: record attributes consistently for init-declarator
Date: Tue, 14 Jan 2025 00:00:47 +0900
Message-ID: <20250113150253.3097820-10-masahiroy@kernel.org>
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

I believe the missing action here is a bug.

For rules with no explicit action, the following default is used:

    { $$ = $1; }

However, in this case, $1 is the value of attribute_opt itself. As a
result, the value of attribute_opt is always NULL.

The following test code demonstrates inconsistent behavior.

    int x __attribute__((__aligned__(4)));
    int y __attribute__((__aligned__(4))) = 0;

The attribute is recorded only when followed by an initializer.

This commit adds the correct action to propagate the value of the
ATTRIBUTE_PHRASE token.

With this change, the attribute in the example above is consistently
recorded for both 'x' and 'y'.

[Before]

    $ cat <<EOF | scripts/genksyms/genksyms -d
    int x __attribute__((__aligned__(4)));
    int y __attribute__((__aligned__(4))) = 0;
    EOF
    Defn for type0 x == <int x >
    Defn for type0 y == <int y __attribute__ ( ( __aligned__ ( 4 ) ) ) >
    Hash table occupancy 2/4096 = 0.000488281

[After]

    $ cat <<EOF | scripts/genksyms/genksyms -d
    int x __attribute__((__aligned__(4)));
    int y __attribute__((__aligned__(4))) = 0;
    EOF
    Defn for type0 x == <int x __attribute__ ( ( __aligned__ ( 4 ) ) ) >
    Defn for type0 y == <int y __attribute__ ( ( __aligned__ ( 4 ) ) ) >
    Hash table occupancy 2/4096 = 0.000488281

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 33a6aab53b69..e3c160046143 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -480,7 +480,7 @@ member_bitfield_declarator:
 
 attribute_opt:
 	/* empty */					{ $$ = NULL; }
-	| attribute_opt ATTRIBUTE_PHRASE
+	| attribute_opt ATTRIBUTE_PHRASE		{ $$ = $2; }
 	;
 
 enum_body:
-- 
2.43.0


