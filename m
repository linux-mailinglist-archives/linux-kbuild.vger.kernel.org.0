Return-Path: <linux-kbuild+bounces-5460-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A452A0BB55
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 649A916B187
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4491A28EC95;
	Mon, 13 Jan 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6s6jKkr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C26428EC90;
	Mon, 13 Jan 2025 15:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780598; cv=none; b=IhCx4OfpoqGRWSA125SwgR0Hwox3qcBMTDxN7vinRG6l8tnpgp5Gzs/kBOEnwWg8xqDxnAsexaC0C8SqxFOtp+K4hhNPovgjhnEe/4dWtCE3SojYWv8H31LRhVsYvlVq85CJ20fmp24dxXrtwuJEg2HdIJq4ywhkX295X1Y/3Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780598; c=relaxed/simple;
	bh=AG7pHJDASGQ58M1lrrHCxlNDhJODKLJBdg+zBnInz6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ADGfrUxlxX6lZpBixvSTN7EcgNXBeyHR6amoJdY9fGnF6812IZqw2TiUiek7SvXWlvCgwSqHiMEXqpzd89kxbqULHt7vLEhjQFhw2kekqysKMssBqb6l1TbmH6Wxz+I+1XZ3Yn0trvbYmswi5J1WezNfV2c+1L2twTzUk0BHAzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6s6jKkr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26EAC4CEE2;
	Mon, 13 Jan 2025 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780597;
	bh=AG7pHJDASGQ58M1lrrHCxlNDhJODKLJBdg+zBnInz6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H6s6jKkrHlmvC/OsWBWJ6bp2GrfWXip/OWkMRAc5xcbWiiiuOdKg3Ut4yKI+n7g3a
	 Ji72gd0o1mroZvzzp/mdWjyON4r3hxOUUmsUBtJwAa9J/7tBqrQm5cPpqrN+jXqmCT
	 K5McMI7qx6HOyz26OSmF9ewoO6ggjAQ65+neeaXTsJZQL4YYUh4oVk0jEERhlaTfMW
	 cP/KNWqCRgh/YNTbBW3x46LR2VK/7cHuybVeaCx9qn7i/7O4f3ooyqnZqOxtW1SS/k
	 b4RsIrttUYpslMWtjfRf0+jivFEunkDnDpu/Xx1Uf4tA7kV7iIHGH5i6n9xT9TweNl
	 tNsMO3+3NGcVA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 12/17] genksyms: fix syntax error for attribute before nested_declarator
Date: Tue, 14 Jan 2025 00:00:50 +0900
Message-ID: <20250113150253.3097820-13-masahiroy@kernel.org>
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

    $ make -s KCFLAGS=-D__GENKSYMS__ drivers/acpi/prmt.i
    $ cat drivers/acpi/prmt.i | scripts/genksyms/genksyms -w
        [ snip ]
    drivers/acpi/prmt.c:56: syntax error

The syntax error occurs in the following code in drivers/acpi/prmt.c:

    struct prm_handler_info {
            [ snip ]
            efi_status_t (__efiapi *handler_addr)(u64, void *);
            [ snip ]
    };

The issue arises from __efiapi, which is defined as either
__attribute__((ms_abi)) or __attribute__((regparm(0))).

This commit allows nested_declarator to be prefixed with attributes.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index 54e16c2e0b4b..49d3e536b9a8 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -345,8 +345,8 @@ direct_nested_declarator1:
 		{ $$ = $4; }
 	| direct_nested_declarator1 BRACKET_PHRASE
 		{ $$ = $2; }
-	| '(' nested_declarator ')'
-		{ $$ = $3; }
+	| '(' attribute_opt nested_declarator ')'
+		{ $$ = $4; }
 	| '(' error ')'
 		{ $$ = $3; }
 	;
-- 
2.43.0


