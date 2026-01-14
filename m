Return-Path: <linux-kbuild+bounces-10576-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BCD1E8CA
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 12:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3C3E30383AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 11:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E1C39B485;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cP/jdpHY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE54397AD5;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768391300; cv=none; b=YEwXNwgvKtFF/vIYS5ShhCu11zpeKdm/uxWf5eZP+LRqS9ZnAy5LTVJVNmy6qOUYlVvdIfKdAvGTQZUBnuEmCZMq3GViba5vnDFtTvE46umx4wLQN5K+YSW+waICPNkb5nSxqkDSlBFzGB2iZlxMfe2LyPtPMGFlCbey8+KcjtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768391300; c=relaxed/simple;
	bh=itZm7+NqmjDrS2S2W3s6dD97eDpRBUoj9scmd7Fi6Hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IzgnQrtM6qRLlCrHWWCD5FT5LqN72f22iOyO0ECyy+aTlAsWq4tp0+3BeAwbhgFwjrHnKYFBySg+So5ryPQvTogqZ3Z3xALo4zSppaYegqioQvNHcZIlB4Xgo84QW70XIX5AfhqHytG7WozwZfxe+OR0yvPHzeTUwCpM/9WNCro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cP/jdpHY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A4EEC4AF09;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768391300;
	bh=itZm7+NqmjDrS2S2W3s6dD97eDpRBUoj9scmd7Fi6Hw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cP/jdpHYRfknIjFhKftFZWoFTgPuNrn8Amjd1D5Fpr+8h6MEHTjHG+GaPwaXeRTgR
	 5jTBtwvbiE+wzwDMubMOi3MbvFozz6FyjaYcr7b9aNBvG0TPihYq9ctpcmNNgKLFf0
	 ryjRhJWi2M83++GWmdnbFqRHG2X7a+LKRnLh/+UQG7N0VOOuB9BzWsQqqWPLXX4lAh
	 YeMPT9AqFLpfmA5XVdFNufZBBfTjnGks/nDcRMHmjhBU39ki5x1tGbXZBAxyBZ+hv9
	 BwOsK8VWI4qjR57KTN6WZOQXymBN5Ygpukr/JMtVGJHkAw0khFxcqo2XNj1O/chIPh
	 PBPrLUE7yiZkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3627CD29FF8;
	Wed, 14 Jan 2026 11:48:20 +0000 (UTC)
From: Jihan LIN via B4 Relay <devnull+linjh22s.gmail.com@kernel.org>
Date: Wed, 14 Jan 2026 19:47:45 +0800
Subject: [PATCH v2 2/2] Documentation/kbuild: gendwarfksyms: Style cleanup
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-documents_gendwarfksyms-v2-2-297c98bd62c6@gmail.com>
References: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
In-Reply-To: <20260114-documents_gendwarfksyms-v2-0-297c98bd62c6@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jihan LIN <linjh22s@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768391298; l=7018;
 i=linjh22s@gmail.com; s=linjh22s_machine; h=from:subject:message-id;
 bh=IVbk2N3mcUpfhvLm0UAY7BJ8NCOumqNVuu6yKkFDS1g=;
 b=f9ysjk13q5trgseJ84mN1HL9z2JYqANKJw9EMcuTs91wizu7F58GR3uSWra7ZxwReoHO48yVz
 B448kjIaBJaDzqycYP35t8IrZ+1hDzolG++SzSSQx3yq8l0Mqwo53bZ
X-Developer-Key: i=linjh22s@gmail.com; a=ed25519;
 pk=MnRQAVFy1t4tiGb8ce7ohJwrN2YFXd+dA7XmzR6GmUc=
X-Endpoint-Received: by B4 Relay for linjh22s@gmail.com/linjh22s_machine
 with auth_id=592
X-Original-From: Jihan LIN <linjh22s@gmail.com>
Reply-To: linjh22s@gmail.com

From: Jihan LIN <linjh22s@gmail.com>

The indentation in gendwarfksyms.rst currently uses a mix of tabs and
spaces.
Convert all indentation to tabs, and match the usage output and code
examples with theirs references.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Jihan LIN <linjh22s@gmail.com>
---
 Documentation/kbuild/gendwarfksyms.rst | 100 ++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuild/gendwarfksyms.rst
index 0e153d13b052da6edcf65950739730c123cd49db..fea8e87e14c62f579d320da5c2bfe139d50cd5a6 100644
--- a/Documentation/kbuild/gendwarfksyms.rst
+++ b/Documentation/kbuild/gendwarfksyms.rst
@@ -43,17 +43,17 @@ Usage
 gendwarfksyms accepts a list of object files on the command line, and a
 list of symbol names (one per line) in standard input::
 
-        Usage: gendwarfksyms [options] elf-object-file ... < symbol-list
+	Usage: gendwarfksyms [options] elf-object-file ... < symbol-list
 
-        Options:
-          -d, --debug          Print debugging information
-              --dump-dies      Dump DWARF DIE contents
-              --dump-die-map   Print debugging information about die_map changes
-              --dump-types     Dump type strings
-              --dump-versions  Dump expanded type strings used for symbol versions
-          -s, --stable         Support kABI stability features
-          -T, --symtypes file  Write a symtypes file
-          -h, --help           Print this message
+	Options:
+	  -d, --debug          Print debugging information
+	      --dump-dies      Dump DWARF DIE contents
+	      --dump-die-map   Print debugging information about die_map changes
+	      --dump-types     Dump type strings
+	      --dump-versions  Dump expanded type strings used for symbol versions
+	  -s, --stable         Support kABI stability features
+	  -T, --symtypes file  Write a symtypes file
+	  -h, --help           Print this message
 
 
 Type information availability
@@ -69,9 +69,9 @@ TU where symbols are actually exported, gendwarfksyms adds a pointer
 to exported symbols in the `EXPORT_SYMBOL()` macro using the following
 macro::
 
-        #define __GENDWARFKSYMS_EXPORT(sym)                             \
-                static typeof(sym) *__gendwarfksyms_ptr_##sym __used    \
-                        __section(".discard.gendwarfksyms") = &sym;
+	#define __GENDWARFKSYMS_EXPORT(sym)				\
+		static typeof(sym) *__gendwarfksyms_ptr_##sym __used	\
+			__section(".discard.gendwarfksyms") = &sym;
 
 
 When a symbol pointer is found in DWARF, gendwarfksyms can use its
@@ -94,14 +94,14 @@ either a type reference or a symbol name. Type references have a
 one-letter prefix followed by "#" and the name of the type. Four
 reference types are supported::
 
-        e#<type> = enum
-        s#<type> = struct
-        t#<type> = typedef
-        u#<type> = union
+	e#<type> = enum
+	s#<type> = struct
+	t#<type> = typedef
+	u#<type> = union
 
 Type names with spaces in them are wrapped in single quotes, e.g.::
 
-        s#'core::result::Result<u8, core::num::error::ParseIntError>'
+	s#'core::result::Result<u8, core::num::error::ParseIntError>'
 
 The rest of the line contains a type string. Unlike with genksyms that
 produces C-style type strings, gendwarfksyms uses the same simple parsed
@@ -151,8 +151,8 @@ the rules. The fields are as follows:
 The following helper macros, for example, can be used to specify rules
 in the source code::
 
-	#define ___KABI_RULE(hint, target, value)			    \
-		static const char __PASTE(__gendwarfksyms_rule_,	     \
+	#define ___KABI_RULE(hint, target, value)                            \
+		static const char __PASTE(__gendwarfksyms_rule_,             \
 					  __COUNTER__)[] __used __aligned(1) \
 			__section(".discard.gendwarfksyms.kabi_rules") =     \
 				"1\0" #hint "\0" target "\0" value
@@ -273,18 +273,18 @@ The rule fields are expected to be as follows:
 
 Using the `__KABI_RULE` macro, this rule can be defined as::
 
-        #define KABI_BYTE_SIZE(fqn, value) \
-                __KABI_RULE(byte_size, fqn, value)
+	#define KABI_BYTE_SIZE(fqn, value) \
+		__KABI_RULE(byte_size, fqn, value)
 
 Example usage::
 
 	struct s {
-                /* Unchanged original members */
+		/* Unchanged original members */
 		unsigned long a;
-                void *p;
+		void *p;
 
-                /* Appended new members */
-                KABI_IGNORE(0, unsigned long n);
+		/* Appended new members */
+		KABI_IGNORE(0, unsigned long n);
 	};
 
 	KABI_BYTE_SIZE(s, 16);
@@ -353,21 +353,21 @@ reserved member needs a unique name, but as the actual purpose is usually
 not known at the time the space is reserved, for convenience, names that
 start with `__kabi_` are left out when calculating symbol versions::
 
-        struct s {
-                long a;
-                long __kabi_reserved_0; /* reserved for future use */
-        };
+	struct s {
+		long a;
+		long __kabi_reserved_0; /* reserved for future use */
+	};
 
 The reserved space can be taken into use by wrapping the member in a
 union, which includes the original type and the replacement member::
 
-        struct s {
-                long a;
-                union {
-                        long __kabi_reserved_0; /* original type */
-                        struct b b; /* replaced field */
-                };
-        };
+	struct s {
+		long a;
+		union {
+			long __kabi_reserved_0; /* original type */
+			struct b b; /* replaced field */
+		};
+	};
 
 If the `__kabi_` naming scheme was used when reserving space, the name
 of the first member of the union must start with `__kabi_reserved`. This
@@ -392,11 +392,11 @@ Predicting which structures will require changes during the support
 timeframe isn't always possible, in which case one might have to resort
 to placing new members into existing alignment holes::
 
-        struct s {
-                int a;
-                /* a 4-byte alignment hole */
-                unsigned long b;
-        };
+	struct s {
+		int a;
+		/* a 4-byte alignment hole */
+		unsigned long b;
+	};
 
 
 While this won't change the size of the data structure, one needs to
@@ -405,14 +405,14 @@ to reserved fields, this can be accomplished by wrapping the added
 member to a union where one of the fields has a name starting with
 `__kabi_ignored`::
 
-        struct s {
-                int a;
-                union {
-                        char __kabi_ignored_0;
-                        int n;
-                };
-                unsigned long b;
-        };
+	struct s {
+		int a;
+		union {
+			char __kabi_ignored_0;
+			int n;
+		};
+		unsigned long b;
+	};
 
 With **--stable**, both versions produce the same symbol version. The
 examples include a `KABI_IGNORE` macro to simplify the code.

-- 
2.51.0



