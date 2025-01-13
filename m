Return-Path: <linux-kbuild+bounces-5461-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC67A0BB51
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C41F1888EDB
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2573A3DABE1;
	Mon, 13 Jan 2025 15:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdWwVceL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1D28EC9D;
	Mon, 13 Jan 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780599; cv=none; b=Ueqcf8KfE620v01Cyf9EjPfKxz8OEgp7qp3jgjY7GIKqUVrAd5YpOxQ/82TrJS2PYcXIESLGufQRe+/OcdUEhcuwWZ/h/sbb55f53oO8C3cSYl87PZdhSmxG4NU7zp7tt+6C5dUQzRuk0uf5nWw3lA1NQlzR1RVoF2KJWNQMEqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780599; c=relaxed/simple;
	bh=pgv9FKCG4AUzpL30eZ4Yc5tAtzFwIXBxtFKEtiHS16o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVntp1rnG6jaPHpXGKtGmo6NA+T/P/2Td8xQYqiCWlFP5D5QrHwZE/wYfDs8UEyQy8HGiWMQUB6VfO1VFyT67U1mC6bqYC6RFT5IOIRN33Fh5YkHhQZDg4lwPiVpYXLArReNOgawKnzRvUowltHB6xPMB0/AActc1d2Y41gVgpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdWwVceL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36065C4CEE4;
	Mon, 13 Jan 2025 15:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780598;
	bh=pgv9FKCG4AUzpL30eZ4Yc5tAtzFwIXBxtFKEtiHS16o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DdWwVceLCHMLuzuEgLSNK2rbCDEULeWdGW76ek/OpnvdnsvhiTMGlJnWYatEv4XU3
	 NrnY7jhihiKc8cjbgMBakm+DiwqNfRbEfv7yi7TOCNBB8ZsJe7CqdcJFYIjx96DagE
	 3wd/66jbKGtV/QkfJF5/tpZyuHYpKLmbkpcqMzk9PjVUYtwjMdGetl6Q8dtZlCtTlj
	 2R7K7dzKAaFDFZGilK/ZgMNmBBsHjWm7kdXal+gYUCRERlXNHTg53s5gLAx6cxgiLu
	 wkwuNCG61LkEN4l3rvnYKF4Vj1OBNq0KSA+BuQBF0pNeHBiwbGVAp10SC8iqOtmGbG
	 0w/K2COTaj1AQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 13/17] genksyms: fix syntax error for attribute after abstact_declarator
Date: Tue, 14 Jan 2025 00:00:51 +0900
Message-ID: <20250113150253.3097820-14-masahiroy@kernel.org>
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

    $ make -s KCFLAGS=-D__GENKSYMS__ kernel/module/main.i
    $ cat kernel/module/main.i | scripts/genksyms/genksyms -w
        [ snip ]
    kernel/module/main.c:97: syntax error

The syntax error occurs in the following code in kernel/module/main.c:

    static void __mod_update_bounds(enum mod_mem_type type __maybe_unused, void *base,
                                    unsigned int size, struct mod_tree_root *tree)
    {
            [ snip ]
    }

The issue arises from __maybe_unused, which is defined as
__attribute__((__unused__)).

This commit allows direct_abstract_declarator to be followed with
attributes.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 49d3e536b9a8..82774df50642 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -383,8 +383,8 @@ abstract_declarator:
 	ptr_operator
 	| ptr_operator abstract_declarator
 		{ $$ = $2 ? $2 : $1; }
-	| direct_abstract_declarator
-		{ $$ = $1; dont_want_type_specifier = false; }
+	| direct_abstract_declarator attribute_opt
+		{ $$ = $2; dont_want_type_specifier = false; }
 	;
 
 direct_abstract_declarator:
-- 
2.43.0


