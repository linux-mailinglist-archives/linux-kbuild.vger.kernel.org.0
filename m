Return-Path: <linux-kbuild+bounces-7028-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA05AAEF26
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 01:15:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 222731BC5D0D
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 23:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA862918EB;
	Wed,  7 May 2025 23:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iVWRwtEf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44C1291899
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746659660; cv=none; b=br3Btpc8AdDoPBLsHprvKNza2RH434lFRsoRscOmwP2dBYRF31UuXbQxhBADsniaat/uTWfS7pmr55X0yhhy6eqcQQHO+8el6+4uE5Ow38EbQdcFib7puozx1C5crlVJyvjes/8ojQ++ktXxZr4I2iw20plI/nKyNmi3FqVq1VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746659660; c=relaxed/simple;
	bh=t+KcDYFBubxRjvVzWaCC/X/nGG8YAukt+n1mnpI92hk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S4AtyADACJR9GtgWyOe/0wt+ZclSsl9eY6PSpJED2JRdVfnBYzlDDSUWZp4M6nHgw8lmmmprj+9PG4mr6dmPASWn5tSg4Au0RFMH2weIGT/11021VtF+VENu2Mxc4iTTUJ3TfCLLRSYaH6ksp8D4tXQqohNz+JUd8Z/DP+1EZto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iVWRwtEf; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22e7e097ef7so2949385ad.2
        for <linux-kbuild@vger.kernel.org>; Wed, 07 May 2025 16:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746659658; x=1747264458; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=efSDC5+Dl7EnH8XUtaWbMs/fjy125/V0busFxh2CY0I=;
        b=iVWRwtEfE+fnAijWYXXgyPbhMkMFiDLmmd1dwq0F/q7YtTcj3c35V8rsn8PkkLV3rE
         ZPQKXsRcE+PZ70fifGgi52WYMknwsBCEKLZAa6pcEYnixWKlhbzlVtSXHQqVxuJUMW86
         rgvyqR+/wqiOoqa3i3vAuGjbDbcCoPsjByqqbe2S/VbGt5H/pT2wuPQGKkSv+Su7PcMi
         qtT9U03A5F+P+B2EPbhTS99y3UyOBxUbboVzFigxOcX9DmGBN1Jj9X1NkuWGh9pSZgNv
         3BmjeAI2ZHq9ZIo4ARIAG41WZrGcbyIyRfEOzgO/gzsg+OtH0GA7ZUyrWhgbzKNkekeP
         41wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746659658; x=1747264458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=efSDC5+Dl7EnH8XUtaWbMs/fjy125/V0busFxh2CY0I=;
        b=EQDkTtb3cOxEPVZPvFUCazCkFlSn5nQX88XRkKxL8VfUVdBFV9G+e5DIK+lEoMkxg9
         n5TaZnsjrUTKmxeeKZEaxjcBW6K8VVgMRhQshh+fFrBsTXv/7ZIw/0OsKd+0x9YO83jb
         9mNzdH6CkLUeE0FO+mfsPxqpupTFXCA38z8cwHQ7kE7Et48dT0qPhgFNaVQTh4dCgqJM
         r7F+pf6HeFDEDqr8LIQ+WORuJ+vqxPSsBiSZKwoDTFNbeAdYirA3yrV1Jy0uDVovYVy4
         +NotJwE/amfSdzUPKpXCr2i0dVLcjxPn8badoWbO5yfA71pz2JpNE9eVlw809wFLqyX0
         F0Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUuOybs83dZdnfO0knsTSPO/mk7tKFsZmqRr6OgRK8+T1HIB/XivcBG/2agpEhs92485eiA0bc9ev7Fr+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrSuBuHAL1taJoFxn4oMEgzLwLzN5AXJXMHWdXEgF4w6wsaKFZ
	D5e++bRWfxM8sck6dzxI/jsyPAI6B3/4fWgDpNQLvs3JLphk9q7XaENdK/nYQQIXCo4CrXXT9o3
	RGadLqvknhRhc+nsEWUc5sV8svg==
X-Google-Smtp-Source: AGHT+IE3nDZyEO7hL72+sm+zsni9dWKaI13OBOvHRmL3kwKFr3USZq6KDfdsW4gRFAtr0y1Ncxjt9x2Qkeoq6ooxZAU=
X-Received: from plbju1.prod.google.com ([2002:a17:903:4281:b0:220:d79f:a9bd])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:f8b:b0:224:1ec0:8a1d with SMTP id d9443c01a7336-22e5ea8c623mr72791025ad.30.1746659658002;
 Wed, 07 May 2025 16:14:18 -0700 (PDT)
Date: Wed,  7 May 2025 23:14:09 +0000
In-Reply-To: <20250507231403.377725-7-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507231403.377725-7-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=5208; i=samitolvanen@google.com;
 h=from:subject; bh=t+KcDYFBubxRjvVzWaCC/X/nGG8YAukt+n1mnpI92hk=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBnSL+28GHUdPkxiVtcOjrqdvadx5co1WpP0n1fW3Xnmv
 +1JkeKLjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRgwKMDJu0XV0PM6nPOfPa
 4tXkBwsWTS06J77swsryw3O3nbMxrX/CyHBDx7T/WIEYO1e5zM38NKNAqR4Xd7YJxw+l/5s9ef2 vC+wA
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250507231403.377725-12-samitolvanen@google.com>
Subject: [PATCH v3 5/5] Documentation/kbuild: Add new gendwarfksyms kABI rules
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Document the "byte_size" and "type_string" kABI stability rules.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 Documentation/kbuild/gendwarfksyms.rst | 97 ++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 5 deletions(-)

diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuild/gendwarfksyms.rst
index 9694ec99d190..ed366250a54e 100644
--- a/Documentation/kbuild/gendwarfksyms.rst
+++ b/Documentation/kbuild/gendwarfksyms.rst
@@ -125,14 +125,17 @@ the rules. The fields are as follows:
   qualified name of the DWARF Debugging Information Entry (DIE).
 - `value`: Provides rule-specific data.
 
-The following helper macro, for example, can be used to specify rules
+The following helper macros, for example, can be used to specify rules
 in the source code::
 
-	#define __KABI_RULE(hint, target, value)                             \
-		static const char __PASTE(__gendwarfksyms_rule_,             \
+	#define ___KABI_RULE(hint, target, value)			    \
+		static const char __PASTE(__gendwarfksyms_rule_,	     \
 					  __COUNTER__)[] __used __aligned(1) \
 			__section(".discard.gendwarfksyms.kabi_rules") =     \
-				"1\0" #hint "\0" #target "\0" #value
+				"1\0" #hint "\0" target "\0" value
+
+	#define __KABI_RULE(hint, target, value) \
+		___KABI_RULE(hint, #target, #value)
 
 
 Currently, only the rules discussed in this section are supported, but
@@ -223,6 +226,87 @@ Example usage::
 	KABI_ENUMERATOR_IGNORE(e, C);
 	KABI_ENUMERATOR_VALUE(e, LAST, 2);
 
+Managing structure size changes
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A data structure can be partially opaque to modules if its allocation is
+handled by the core kernel, and modules only need to access some of its
+members. In this situation, it's possible to append new members to the
+structure without breaking the ABI, as long as the layout for the original
+members remains unchanged.
+
+To append new members, we can hide them from symbol versioning as
+described in section :ref:`Hiding members <hiding_members>`, but we can't
+hide the increase in structure size. The `byte_size` rule allows us to
+override the structure size used for symbol versioning.
+
+The rule fields are expected to be as follows:
+
+- `type`: "byte_size"
+- `target`: The fully qualified name of the target data structure
+  (as shown in **--dump-dies** output).
+- `value`: A positive decimal number indicating the structure size
+  in bytes.
+
+Using the `__KABI_RULE` macro, this rule can be defined as::
+
+        #define KABI_BYTE_SIZE(fqn, value) \
+                __KABI_RULE(byte_size, fqn, value)
+
+Example usage::
+
+	struct s {
+                /* Unchanged original members */
+		unsigned long a;
+                void *p;
+
+                /* Appended new members */
+                KABI_IGNORE(0, unsigned long n);
+	};
+
+	KABI_BYTE_SIZE(s, 16);
+
+Overriding type strings
+~~~~~~~~~~~~~~~~~~~~~~~
+
+In rare situations where distributions must make significant changes to
+otherwise opaque data structures that have inadvertently been included
+in the published ABI, keeping symbol versions stable using the more
+targeted kABI rules can become tedious. The `type_string` rule allows us
+to override the full type string for a type or a symbol, and even add
+types for versioning that no longer exist in the kernel.
+
+The rule fields are expected to be as follows:
+
+- `type`: "type_string"
+- `target`: The fully qualified name of the target data structure
+  (as shown in **--dump-dies** output) or symbol.
+- `value`: A valid type string (as shown in **--symtypes**) output)
+  to use instead of the real type.
+
+Using the `__KABI_RULE` macro, this rule can be defined as::
+
+	#define KABI_TYPE_STRING(type, str) \
+		___KABI_RULE("type_string", type, str)
+
+Example usage::
+
+	/* Override type for a structure */
+	KABI_TYPE_STRING("s#s",
+		"structure_type s { "
+			"member base_type int byte_size(4) "
+				"encoding(5) n "
+			"data_member_location(0) "
+		"} byte_size(8)");
+
+	/* Override type for a symbol */
+	KABI_TYPE_STRING("my_symbol", "variable s#s");
+
+The `type_string` rule should be used only as a last resort if maintaining
+a stable symbol versions cannot be reasonably achieved using other
+means. Overriding a type string increases the risk of actual ABI breakages
+going unnoticed as it hides all changes to the type.
+
 Adding structure members
 ------------------------
 
@@ -276,6 +360,8 @@ The examples include `KABI_(RESERVE|USE|REPLACE)*` macros that help
 simplify the process and also ensure the replacement member is correctly
 aligned and its size won't exceed the reserved space.
 
+.. _hiding_members:
+
 Hiding members
 ~~~~~~~~~~~~~~
 
@@ -305,4 +391,5 @@ member to a union where one of the fields has a name starting with
                 unsigned long b;
         };
 
-With **--stable**, both versions produce the same symbol version.
+With **--stable**, both versions produce the same symbol version. The
+examples include a `KABI_IGNORE` macro to simplify the code.
-- 
2.49.0.987.g0cc8ee98dc-goog


