Return-Path: <linux-kbuild+bounces-5459-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB224A0BB36
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 16:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6B2A7A034E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Jan 2025 15:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A61284A7F;
	Mon, 13 Jan 2025 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOyuPKxU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B05B284A5E;
	Mon, 13 Jan 2025 15:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780596; cv=none; b=kqLVkacKf5XdOdUiRJfHNUS9jqZo/EvSR15EboFfXhGd8X/awbdFTCQEeolH0jBR7VcZMOZZaoFngggD8YRqx5TmW7UIvyS9QIy/EbNgPOI++aNYe346zBZ9zyIF0sGxd7lXF93cZUrSJ9exgP9FseRmDSMqFhL91BFBvpDQl/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780596; c=relaxed/simple;
	bh=kTQ5gOGpVQ9PHwyiEtrh257p/iiiDkX5GwwMnmZsaUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVDALtzJntwgBspux7x/o5axz1sXzCO3OkBvPrGExeLAjeSTSlVeYep8GO1S2BS9hHAN0ZTTZvo53luSNAAsTLq4U8E4HaTAHLj7pev+nkVySDadzi0vxkX0/q2SzwdCWLpz0Vr1JxHxm6EtrTJvDdTjQaGVMY3p8Exa0cSk9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOyuPKxU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78948C4CED6;
	Mon, 13 Jan 2025 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780596;
	bh=kTQ5gOGpVQ9PHwyiEtrh257p/iiiDkX5GwwMnmZsaUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KOyuPKxU/uiMoYl/MXgGCeN4Dp6G6v98YPIntEtMGBEDvMwfAE+p0cedy68nDlCkQ
	 N98rQbX3EYQ+k3Ss8FGyzkIo9Ik8w72rpXr4veikMhMHuqpXJkan3CHh1Aq6wvKOCL
	 8ZWH20up4LWzNv4/gdWaST18oNT7U4VDALNapkMTESFrfNs9sYgaNk7R6sQMsvqHE+
	 qZHgctKfTafHJ3bVINR8q6a5hXmg8eBkf31qQAFPProuw7G4C9RR5765P8jGZDJl5N
	 RIoseEWWHP6v5G+ScPXBNUY0AvFZ6F8oaBBOWAuDjAYLcC7cW8nq4eW73KgA9+hZar
	 0LIVqhyU+CxnQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 11/17] genksyms: fix syntax error for attribute before abstract_declarator
Date: Tue, 14 Jan 2025 00:00:49 +0900
Message-ID: <20250113150253.3097820-12-masahiroy@kernel.org>
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

    $ make -s KCFLAGS=-D__GENKSYMS__ init/main.i
    $ cat init/main.i | scripts/genksyms/genksyms -w
        [ snip ]
    ./include/linux/efi.h:1225: syntax error

The syntax error occurs in the following code in include/linux/efi.h:

    efi_status_t
    efi_call_acpi_prm_handler(efi_status_t (__efiapi *handler_addr)(u64, void *),
                              u64 param_buffer_addr, void *context);

The issue arises from __efiapi, which is defined as either
__attribute__((ms_abi)) or __attribute__((regparm(0))).

This commit allows abstract_declarator to be prefixed with attributes.

To avoid conflicts, I tweaked the rule for decl_specifier_seq. Due to
this change, a standalone attribute cannot become decl_specifier_seq.
Otherwise, I do not know how to resolve the conflicts.

The following code, which was previously accepted by genksyms, will now
result in a syntax error:

    void my_func(__attribute__((unused))x);

I do not think it is a big deal because GCC also fails to parse it.

    $ echo 'void my_func(__attribute__((unused))x);' | gcc -c -x c -
    <stdin>:1:37: error: unknown type name 'x'

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/parse.y | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index cd933a95548d..54e16c2e0b4b 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -203,8 +203,9 @@ decl_specifier_seq_opt:
 	;
 
 decl_specifier_seq:
-	decl_specifier				{ decl_spec = *$1; }
+	attribute_opt decl_specifier		{ decl_spec = *$2; }
 	| decl_specifier_seq decl_specifier	{ decl_spec = *$2; }
+	| decl_specifier_seq ATTRIBUTE_PHRASE	{ decl_spec = *$2; }
 	;
 
 decl_specifier:
@@ -216,7 +217,6 @@ decl_specifier:
 		}
 	| type_specifier	{ dont_want_type_specifier = true; $$ = $1; }
 	| type_qualifier
-	| ATTRIBUTE_PHRASE
 	;
 
 storage_class_specifier:
@@ -406,8 +406,8 @@ direct_abstract_declarator1:
 		{ $$ = $4; }
 	| direct_abstract_declarator1 BRACKET_PHRASE
 		{ $$ = $2; }
-	| open_paren abstract_declarator ')'
-		{ $$ = $3; }
+	| open_paren attribute_opt abstract_declarator ')'
+		{ $$ = $4; }
 	| open_paren error ')'
 		{ $$ = $3; }
 	| BRACKET_PHRASE
-- 
2.43.0


