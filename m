Return-Path: <linux-kbuild+bounces-5212-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC69F86B5
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1367418974EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282ED204F93;
	Thu, 19 Dec 2024 21:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eCfZ6ZUL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CD9203711
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642502; cv=none; b=W1G235iV6LtvVzGLVJyCUBEcCadZaTWe08f6/m3a1EeT3wAoXGpD8p+39qooJ3Z9YWpCYYYobJ/fSj7+QzQFpDiNuqp4XLP7N1z4hz8eJSc2AMesAhH2RxlaQnejjKI71tR1AzdrdtOo33iajOohff6w8Nl7Clm9CPJk8m6r1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642502; c=relaxed/simple;
	bh=eBWSrd2j7HvMb7oRH1RLo5t203oukOJEVtlknSsCqM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dSqMAHp2TUiIe7vLS7mbBeZ04G1gTPtj/Cj8K+ZXcGMgTUsN40Ehb8PIqbB6xYQTn0dlNAzTyJbzo3/AF2BsMgx2Ywq2VpiXrls3Q2lgf2KbXXDOmXYLP3j7LIPVKG96W0+z/4uQq+MlALvRC1LXnUxcTXj7r6qbBNvAcfIq8s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eCfZ6ZUL; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-7fd481e3c0bso754445a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642499; x=1735247299; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=clWazEynvGGklOBHtSTCV/CnP6B5ZIpWEbRoz38skJM=;
        b=eCfZ6ZULewVSC7Fbc3a8iTJ2NKaH7WPS29TzPPMaFMlf5jw5mHl3JUWqCW1IE8M/Md
         d05K5yGEuhd85kZ41PTalstGWOR833kdQQqc9CW+c8sAs3E/jQFQxZc4ukwwgC7kgoc4
         DbiuI6CzSREiuajKNFs9ISwr+YX9RxLVryWEOwe8Hq1r5kjVVX1rrtgDIOCb2XBQrgPa
         Bd/TY98V3zJIuHZ2NbZg2JfCv/98IT+INXJ9y4ydVisa22ck7MRlf2Z5Kv1dQlWtfwFY
         fGux+ha5zovPFZPESsc9pXhG0awt5I7vo825C0biOtI1/zzHi9WOk+/7pn4ZknmREcD+
         v4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642499; x=1735247299;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clWazEynvGGklOBHtSTCV/CnP6B5ZIpWEbRoz38skJM=;
        b=wR/2HZxp4dJLRasSFC/HnlieUHH/bxFU8z4p7X5WVM2xUS0yqPipTJio6LDBlbFo/o
         aNCt4RWfokH9CzJ3RMjgnWNTBgWMXV+Xb5b71v+ZOl6a6mCI/nu3ufr+hbt+0t7b8nl/
         I4qFB1GxLrTz2p6MNpMWJsad3X20J5HN3PXnNXmimducXnSuzsY7hftX+wmApnAf/g7L
         ErUMSTxSv9cDS5Zl6Z06LvV+2pBk4tQ/of4WoNTmIC6knayZBGqbUQAhydzVnXV79UFc
         kI7bTmvK0WndLe/VPiLx+RYyWrEyNzIiXXoDFcQajvf716O8618w/+AXltD05s3T9Gbo
         2/DA==
X-Forwarded-Encrypted: i=1; AJvYcCVhwThRsazzv5ubS+rSO5as0lefsdxfT31+ssPoweAvJtDGd+YmooDxIcNDbBxR10050qwwHpidI58Gx5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3CoopirKWe7Mhpx3SQyTsZ+1jLebvMXNwKwTDcZ08QUADuka
	xENyr5z2zi1pxG2YrZKrh6g0sO7fJE5xPiorUyz8SNcSLPEq2HaV6YZtlpYaMXM43QJctWa3IgV
	rO1UkFov5fC6wqyL0+jfQRY5Dow==
X-Google-Smtp-Source: AGHT+IFpvXX0vIlQH5KAo17JTxu452Yd9q/FUXEA6Jqw9ws0fLFVjMTh9aCKxl4PDOhzik0oW8AS17kUHRwkbGNdNR0=
X-Received: from pjtq6.prod.google.com ([2002:a17:90a:c106:b0:2e2:9f67:1ca3])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2b8e:b0:2ee:49c4:4a7c with SMTP id 98e67ed59e1d1-2f452e39845mr680990a91.18.1734642498967;
 Thu, 19 Dec 2024 13:08:18 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:55 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=13480; i=samitolvanen@google.com;
 h=from:subject; bh=eBWSrd2j7HvMb7oRH1RLo5t203oukOJEVtlknSsCqM0=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3Uqd+jsvGHmXBTVfdF5xgmPTtuBjx6prCrbKNNsIp
 l1ZkDO7o5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAEwkcDYjQ9upundHn9qYd4Zd
 v8T4pvVnx6Ilc8s030jenFF6tvHaY36G/8FqfPfbJWQPnOV9uUvxbSLb26uXTLyKGewuvFpQvTf rLDMA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-38-samitolvanen@google.com>
Subject: [PATCH v7 18/18] Documentation/kbuild: Add DWARF module versioning
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Add documentation for gendwarfksyms changes, and the kABI stability
features that can be useful for distributions even though they're not
used in mainline kernels.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 Documentation/kbuild/gendwarfksyms.rst | 308 +++++++++++++++++++++++++
 Documentation/kbuild/index.rst         |   1 +
 2 files changed, 309 insertions(+)
 create mode 100644 Documentation/kbuild/gendwarfksyms.rst

diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuild/gendwarfksyms.rst
new file mode 100644
index 000000000000..e4beaae7e456
--- /dev/null
+++ b/Documentation/kbuild/gendwarfksyms.rst
@@ -0,0 +1,308 @@
+=======================
+DWARF module versioning
+=======================
+
+1. Introduction
+===============
+
+When CONFIG_MODVERSIONS is enabled, symbol versions for modules
+are typically calculated from preprocessed source code using the
+**genksyms** tool.  However, this is incompatible with languages such
+as Rust, where the source code has insufficient information about
+the resulting ABI. With CONFIG_GENDWARFKSYMS (and CONFIG_DEBUG_INFO)
+selected, **gendwarfksyms** is used instead to calculate symbol versions
+from the DWARF debugging information, which contains the necessary
+details about the final module ABI.
+
+1.1. Usage
+==========
+
+gendwarfksyms accepts a list of object files on the command line, and a
+list of symbol names (one per line) in standard input::
+
+        Usage: gendwarfksyms [options] elf-object-file ... < symbol-list
+
+        Options:
+          -d, --debug          Print debugging information
+              --dump-dies      Dump DWARF DIE contents
+              --dump-die-map   Print debugging information about die_map changes
+              --dump-types     Dump type strings
+              --dump-versions  Dump expanded type strings used for symbol versions
+          -s, --stable         Support kABI stability features
+          -T, --symtypes file  Write a symtypes file
+          -h, --help           Print this message
+
+
+2. Type information availability
+================================
+
+While symbols are typically exported in the same translation unit (TU)
+where they're defined, it's also perfectly fine for a TU to export
+external symbols. For example, this is done when calculating symbol
+versions for exports in stand-alone assembly code.
+
+To ensure the compiler emits the necessary DWARF type information in the
+TU where symbols are actually exported, gendwarfksyms adds a pointer
+to exported symbols in the `EXPORT_SYMBOL()` macro using the following
+macro::
+
+        #define __GENDWARFKSYMS_EXPORT(sym)                             \
+                static typeof(sym) *__gendwarfksyms_ptr_##sym __used    \
+                        __section(".discard.gendwarfksyms") = &sym;
+
+
+When a symbol pointer is found in DWARF, gendwarfksyms can use its
+type for calculating symbol versions even if the symbol is defined
+elsewhere. The name of the symbol pointer is expected to start with
+`__gendwarfksyms_ptr_`, followed by the name of the exported symbol.
+
+3. Symtypes output format
+=========================
+
+Similarly to genksyms, gendwarfksyms supports writing a symtypes
+file for each processed object that contain types for exported
+symbols and each referenced type that was used in calculating symbol
+versions. These files can be useful when trying to determine what
+exactly caused symbol versions to change between builds. To generate
+symtypes files during a kernel build, set `KBUILD_SYMTYPES=1`.
+
+Matching the existing format, the first column of each line contains
+either a type reference or a symbol name. Type references have a
+one-letter prefix followed by "#" and the name of the type. Four
+reference types are supported::
+
+        e#<type> = enum
+        s#<type> = struct
+        t#<type> = typedef
+        u#<type> = union
+
+Type names with spaces in them are wrapped in single quotes, e.g.::
+
+        s#'core::result::Result<u8, core::num::error::ParseIntError>'
+
+The rest of the line contains a type string. Unlike with genksyms that
+produces C-style type strings, gendwarfksyms uses the same simple parsed
+DWARF format produced by **--dump-dies**, but with type references
+instead of fully expanded strings.
+
+4. Maintaining a stable kABI
+============================
+
+Distribution maintainers often need the ability to make ABI compatible
+changes to kernel data structures due to LTS updates or backports. Using
+the traditional `#ifndef __GENKSYMS__` to hide these changes from symbol
+versioning won't work when processing object files. To support this
+use case, gendwarfksyms provides kABI stability features designed to
+hide changes that won't affect the ABI when calculating versions. These
+features are all gated behind the **--stable** command line flag and are
+not used in the mainline kernel. To use stable features during a kernel
+build, set `KBUILD_GENDWARFKSYMS_STABLE=1`.
+
+Examples for using these features are provided in the
+**scripts/gendwarfksyms/examples** directory, including helper macros
+for source code annotation. Note that as these features are only used to
+transform the inputs for symbol versioning, the user is responsible for
+ensuring that their changes actually won't break the ABI.
+
+4.1. kABI rules
+===============
+
+kABI rules allow distributions to fine-tune certain parts
+of gendwarfksyms output and thus control how symbol
+versions are calculated. These rules are defined in the
+`.discard.gendwarfksyms.kabi_rules` section of the object file and
+consist of simple null-terminated strings with the following structure::
+
+	version\0type\0target\0value\0
+
+This string sequence is repeated as many times as needed to express all
+the rules. The fields are as follows:
+
+- `version`: Ensures backward compatibility for future changes to the
+  structure. Currently expected to be "1".
+- `type`: Indicates the type of rule being applied.
+- `target`: Specifies the target of the rule, typically the fully
+  qualified name of the DWARF Debugging Information Entry (DIE).
+- `value`: Provides rule-specific data.
+
+The following helper macro, for example, can be used to specify rules
+in the source code::
+
+	#define __KABI_RULE(hint, target, value)                             \
+		static const char __PASTE(__gendwarfksyms_rule_,             \
+					  __COUNTER__)[] __used __aligned(1) \
+			__section(".discard.gendwarfksyms.kabi_rules") =     \
+				"1\0" #hint "\0" #target "\0" #value
+
+
+Currently, only the rules discussed in this section are supported, but
+the format is extensible enough to allow further rules to be added as
+need arises.
+
+4.1.1. Managing definition visibility
+=====================================
+
+A declaration can change into a full definition when additional includes
+are pulled into the translation unit. This changes the versions of any
+symbol that references the type even if the ABI remains unchanged. As
+it may not be possible to drop includes without breaking the build, the
+`declonly` rule can be used to specify a type as declaration-only, even
+if the debugging information contains the full definition.
+
+The rule fields are expected to be as follows:
+
+- `type`: "declonly"
+- `target`: The fully qualified name of the target data structure
+  (as shown in **--dump-dies** output).
+- `value`: This field is ignored.
+
+Using the `__KABI_RULE` macro, this rule can be defined as::
+
+	#define KABI_DECLONLY(fqn) __KABI_RULE(declonly, fqn, )
+
+Example usage::
+
+	struct s {
+		/* definition */
+	};
+
+	KABI_DECLONLY(s);
+
+4.1.2. Adding enumerators
+=========================
+
+For enums, all enumerators and their values are included in calculating
+symbol versions, which becomes a problem if we later need to add more
+enumerators without changing symbol versions. The `enumerator_ignore`
+rule allows us to hide named enumerators from the input.
+
+The rule fields are expected to be as follows:
+
+- `type`: "enumerator_ignore"
+- `target`: The fully qualified name of the target enum
+  (as shown in **--dump-dies** output) and the name of the
+  enumerator field separated by a space.
+- `value`: This field is ignored.
+
+Using the `__KABI_RULE` macro, this rule can be defined as::
+
+	#define KABI_ENUMERATOR_IGNORE(fqn, field) \
+		__KABI_RULE(enumerator_ignore, fqn field, )
+
+Example usage::
+
+	enum e {
+		A, B, C, D,
+	};
+
+	KABI_ENUMERATOR_IGNORE(e, B);
+	KABI_ENUMERATOR_IGNORE(e, C);
+
+If the enum additionally includes an end marker and new values must
+be added in the middle, we may need to use the old value for the last
+enumerator when calculating versions. The `enumerator_value` rule allows
+us to override the value of an enumerator for version calculation:
+
+- `type`: "enumerator_value"
+- `target`: The fully qualified name of the target enum
+  (as shown in **--dump-dies** output) and the name of the
+  enumerator field separated by a space.
+- `value`: Integer value used for the field.
+
+Using the `__KABI_RULE` macro, this rule can be defined as::
+
+	#define KABI_ENUMERATOR_VALUE(fqn, field, value) \
+		__KABI_RULE(enumerator_value, fqn field, value)
+
+Example usage::
+
+	enum e {
+		A, B, C, LAST,
+	};
+
+	KABI_ENUMERATOR_IGNORE(e, C);
+	KABI_ENUMERATOR_VALUE(e, LAST, 2);
+
+4.3. Adding structure members
+=============================
+
+Perhaps the most common ABI compatible change is adding a member to a
+kernel data structure. When changes to a structure are anticipated,
+distribution maintainers can pre-emptively reserve space in the
+structure and take it into use later without breaking the ABI. If
+changes are needed to data structures without reserved space, existing
+alignment holes can potentially be used instead. While kABI rules could
+be added for these type of changes, using unions is typically a more
+natural method. This section describes gendwarfksyms support for using
+reserved space in data structures and hiding members that don't change
+the ABI when calculating symbol versions.
+
+4.3.1. Reserving space and replacing members
+============================================
+
+Space is typically reserved for later use by appending integer types, or
+arrays, to the end of the data structure, but any type can be used. Each
+reserved member needs a unique name, but as the actual purpose is usually
+not known at the time the space is reserved, for convenience, names that
+start with `__kabi_` are left out when calculating symbol versions::
+
+        struct s {
+                long a;
+                long __kabi_reserved_0; /* reserved for future use */
+        };
+
+The reserved space can be taken into use by wrapping the member in a
+union, which includes the original type and the replacement member::
+
+        struct s {
+                long a;
+                union {
+                        long __kabi_reserved_0; /* original type */
+                        struct b b; /* replaced field */
+                };
+        };
+
+If the `__kabi_` naming scheme was used when reserving space, the name
+of the first member of the union must start with `__kabi_reserved`. This
+ensures the original type is used when calculating versions, but the name
+is again left out. The rest of the union is ignored.
+
+If we're replacing a member that doesn't follow this naming convention,
+we also need to preserve the original name to avoid changing versions,
+which we can do by changing the first union member's name to start with
+`__kabi_renamed` followed by the original name.
+
+The examples include `KABI_(RESERVE|USE|REPLACE)*` macros that help
+simplify the process and also ensure the replacement member is correctly
+aligned and its size won't exceed the reserved space.
+
+4.3.2. Hiding members
+=====================
+
+Predicting which structures will require changes during the support
+timeframe isn't always possible, in which case one might have to resort
+to placing new members into existing alignment holes::
+
+        struct s {
+                int a;
+                /* a 4-byte alignment hole */
+                unsigned long b;
+        };
+
+
+While this won't change the size of the data structure, one needs to
+be able to hide the added members from symbol versioning. Similarly
+to reserved fields, this can be accomplished by wrapping the added
+member to a union where one of the fields has a name starting with
+`__kabi_ignored`::
+
+        struct s {
+                int a;
+                union {
+                        char __kabi_ignored_0;
+                        int n;
+                };
+                unsigned long b;
+        };
+
+With **--stable**, both versions produce the same symbol version.
diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index cee2f99f734b..e82af05cd652 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -21,6 +21,7 @@ Kernel Build System
     reproducible-builds
     gcc-plugins
     llvm
+    gendwarfksyms
 
 .. only::  subproject and html
 
-- 
2.47.1.613.gc27f4b7a9f-goog


