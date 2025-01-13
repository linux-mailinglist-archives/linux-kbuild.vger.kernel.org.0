Return-Path: <linux-kbuild+bounces-5463-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1553DA0BB7B
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B40C3A728F
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B620C3DAC13;
	Mon, 13 Jan 2025 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKzl9sEW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5583DAC0F;
	Mon, 13 Jan 2025 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780601; cv=none; b=MRW4kDkDPKBo+6jiIh+sUJD9v+Is3PFV6nDtE5jY4iE3rtIzxmA50DFQU60/zhKd0y8qm4IwmwY7XXeqEiDLwEdWr9tVapZe3zq8SdKsb9f8qlLVcM134yrMzZCBkEjQgRMKYbXRc8qqYU3ZN+0ZV7+80Ef/fsRotaVMoGD2LHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780601; c=relaxed/simple;
	bh=irRz0rENFFet/M5R/l3u/tAEsJgv8MwLdXc5mdYqJa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GCGJgmyj5np2F+a5F10QR2WqmHtAN2+3YFj59Zxn7mmXAhAbsQSp//1OR756jElr5TQSOw8TcspHLlIP4NIzMZ+P7mZzEhxjHhqCzTT3TzxI8J/YkCtnyVqVOL/KcbmfAAyb02raYaSfmQ7c7yisZu7+wm8bUCf+CJpb05HV9Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKzl9sEW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD56C4CED6;
	Mon, 13 Jan 2025 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780601;
	bh=irRz0rENFFet/M5R/l3u/tAEsJgv8MwLdXc5mdYqJa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HKzl9sEW61tLiFRhVyh09jnN1MKEu9IuOaNLbmpGLHrAS+2IIuIMWSxdUw4qIRY3s
	 cVibJe7LTGvXoeFT/5WCK5SC/9yk8LG6QJccf6c8s8WN7PlQpJWjZ7vnHcJGZVKfxM
	 aPWGDsiSwggi5obr+eONOkfXXP+gjTLbbOwl4AmR6MXRRg/VYaq7v/35Sw0yhszRCJ
	 7fIc61jcn7SX4ACCQFr6ZMKS2v2wfz4Qfn4D/DMOY8MTV5aWidTfvZKrMVccEF5vpq
	 tu1yc/Mc80hc7pahTyfb0gRDV+4utNBkMFUXzbR+KacuSjKFfDZpno7pjn9Vyb1U4S
	 YuxySDy5G709A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 15/17] genksyms: fix syntax error for attribute after 'union'
Date: Tue, 14 Jan 2025 00:00:53 +0900
Message-ID: <20250113150253.3097820-16-masahiroy@kernel.org>
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

For example, with CONFIG_MODVERSIONS=y on v6.13-rc1:

    $ make -s KCFLAGS=-D__GENKSYMS__ fs/lockd/svc.i
    $ cat fs/lockd/svc.i | scripts/genksyms/genksyms -w
        [ snip ]
    ./include/net/addrconf.h:35: syntax error

The syntax error occurs in the following code in include/net/addrconf.h:

    union __packed {
            [ snip ]
    };

The issue arises from __attribute__ immediately after the 'union'
keyword.

This commit allows the 'union' keyword to be followed by attributes.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 33639232a709..a2cd035a78c9 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -236,16 +236,16 @@ type_specifier:
 	   so that it is easier to expand the definition fully later.  */
 	| STRUCT_KEYW attribute_opt IDENT
 		{ remove_node($1); (*$3)->tag = SYM_STRUCT; $$ = $3; }
-	| UNION_KEYW IDENT
-		{ remove_node($1); (*$2)->tag = SYM_UNION; $$ = $2; }
+	| UNION_KEYW attribute_opt IDENT
+		{ remove_node($1); (*$3)->tag = SYM_UNION; $$ = $3; }
 	| ENUM_KEYW IDENT
 		{ remove_node($1); (*$2)->tag = SYM_ENUM; $$ = $2; }
 
 	/* Full definitions of an s/u/e.  Record it.  */
 	| STRUCT_KEYW attribute_opt IDENT class_body
 		{ record_compound($1, $3, $4, SYM_STRUCT); $$ = $4; }
-	| UNION_KEYW IDENT class_body
-		{ record_compound($1, $2, $3, SYM_UNION); $$ = $3; }
+	| UNION_KEYW attribute_opt IDENT class_body
+		{ record_compound($1, $3, $4, SYM_UNION); $$ = $4; }
 	| ENUM_KEYW IDENT enum_body
 		{ record_compound($1, $2, $3, SYM_ENUM); $$ = $3; }
 	/*
@@ -255,7 +255,7 @@ type_specifier:
 		{ add_symbol(NULL, SYM_ENUM, NULL, 0); $$ = $2; }
 	/* Anonymous s/u definitions.  Nothing needs doing.  */
 	| STRUCT_KEYW attribute_opt class_body		{ $$ = $3; }
-	| UNION_KEYW class_body				{ $$ = $2; }
+	| UNION_KEYW attribute_opt class_body		{ $$ = $3; }
 	;
 
 simple_type_specifier:
-- 
2.43.0


