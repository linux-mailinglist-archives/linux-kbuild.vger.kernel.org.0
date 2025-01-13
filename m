Return-Path: <linux-kbuild+bounces-5465-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC71DA0BB61
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FE6616B5C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DD51FBBF0;
	Mon, 13 Jan 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCmMqQzy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC201C5D78;
	Mon, 13 Jan 2025 15:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780604; cv=none; b=NCfyagb2EadEk17/2q9vUOa0+nozoszZ2qBnpfFQfGz9MoSwp9x15v64K5AguL5HHnui6e4M/Vez5iOddw6IMcYL/M4kc5zE9V2kuzFXFyugmFjJVpyPj0YbZfl2Rl5NeiCaznaD+iHuPwdkF4EbvgvSTTdnPsVukXyc6TTDNso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780604; c=relaxed/simple;
	bh=kIUvhNzM7OmNhQu+exGqY1ty6rurLo/YLLZzSzfmQ/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGWD9rs9fx4lwMxfB/Ayrnzdtv7hWeVAbDlWxm+lnBIXE5CJgyb16Q6zx87xrYV2F0zqxDljaHnvs9ZzMVuzDxSVA/tkvGw3O0GxSClGNTEJDuq20x/Hu37jf8YKDUfiL+9G02X4wd+g5n2HXph97W9M3B5XM8VXxM4A3iKCMx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCmMqQzy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44520C4CEE3;
	Mon, 13 Jan 2025 15:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780604;
	bh=kIUvhNzM7OmNhQu+exGqY1ty6rurLo/YLLZzSzfmQ/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OCmMqQzyeMMEGwd30DLMRA3NsZ7I/ViBExUa0BbOAfk4LsXhFig578Ps7i0xuPAfm
	 RLUzSYFt0oOC3Ugc6jsimHiIrpvNpvGPY/arHY+lD32wB3271+k+UR7kiOmFP74/DL
	 WcZD9JSHzNFIfR0iQw5nCH8DAQQT/82D6seDVpqpA0rr8OfLn3j+xgN2MTGFBxxBKI
	 pUIlrdlvexAnq0ZREh5D3fn7WNNiXZfvyKx8TVoOjDsigptnWVkD8xGyl/Rqm467ef
	 VwxQeTy1N5JtDoj6gJcoSQbEMY5eV99TPbpn7mp6b4uCg/dDeEelyXmqSN7N8J8/Sm
	 AZxeNo3roFAMg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 17/17] genksyms: fix syntax error for attribute before init-declarator
Date: Tue, 14 Jan 2025 00:00:55 +0900
Message-ID: <20250113150253.3097820-18-masahiroy@kernel.org>
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

For example, genksyms fails to parse the following valid code:

    int x, __attribute__((__section__(".init.data")))y;

Here, only 'y' is annotated by the attribute, although I am not aware
of actual uses of this pattern in the kernel tree.

When a syntax error occurs, yyerror() is called. However,
error_with_pos() is a no-op unless the -w option is provided.

You can observe syntax errors by manually passing the -w option.

    $ echo 'int x, __attribute__((__section__(".init.data")))y;' | scripts/genksyms/genksyms -w
    <stdin>:1: syntax error

This commit allows attributes to be placed between a comma and
init_declarator.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index a2cd035a78c9..ee600a804fa1 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -173,9 +173,9 @@ init_declarator_list:
 		  $$ = $1;
 		  dont_want_type_specifier = true;
 		}
-	| init_declarator_list ',' init_declarator
-		{ struct string_list *decl = *$3;
-		  *$3 = NULL;
+	| init_declarator_list ',' attribute_opt init_declarator
+		{ struct string_list *decl = *$4;
+		  *$4 = NULL;
 		  free_list(*$2, NULL);
 		  *$2 = decl_spec;
 
@@ -186,7 +186,7 @@ init_declarator_list:
 		  add_symbol(current_name,
 			     is_typedef ? SYM_TYPEDEF : SYM_NORMAL, decl, is_extern);
 		  current_name = NULL;
-		  $$ = $3;
+		  $$ = $4;
 		  dont_want_type_specifier = true;
 		}
 	;
-- 
2.43.0


