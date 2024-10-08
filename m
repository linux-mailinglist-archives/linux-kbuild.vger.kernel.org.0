Return-Path: <linux-kbuild+bounces-3973-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EFA995700
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55A2F28A325
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BBA21BB13;
	Tue,  8 Oct 2024 18:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hH5a3woj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7933121BAE1
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412754; cv=none; b=X6Duilmf7OJFONvR2BfNylitV37HQ3qrdXFYfwQvlg0dDLQvv9i5y4+HWfph1LU02B+tXR6ndSeLGRbrYkfsJm7gM+B1s1UCNnC73EAMmYVGhuohGjywsQfGyYv6d/WRJuAb7avDAVOV7DVCUg1f5YV9TZGmYIFX4EIOUk6ydqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412754; c=relaxed/simple;
	bh=/LE4RdA8pusjopTkowR5788fIrd8xfB9an7aJ5zBUNQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VqxPolu6SNaEF3BZW0HkV3mDthYRdMKeac+ZsCPQ5Rk8ZZ0R97bEkthRkX5/RwDW1+kquZZzAIp9XR218+tOCVSggbHeqh9sQEceg8Y81OFap3L5wsNrU1z1TmTP4OjT4qzNUlOzGnfNHSYjD9krkTxfEqlfSS4HdtlqR7OoWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hH5a3woj; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-71dfa361499so2973176b3a.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412752; x=1729017552; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=noTpT7TMNCGwQMuY8x/MMQ5qdP9Xs2RZaKSa35+PR7Y=;
        b=hH5a3wojngBcRIdzmlRlFu34+BKL354cKJ+V2MZoyAEbwfJjoLQqpHMEPsCz3TwH4E
         5Eu1ct3zgN8T3pJ435wmICFPNNhmO7hDgLybZNY8Xd4Cn0TVQqk51/o9hfvmVZqxQ032
         c07yj3jWavMLGKLtl7KpqFBuV4PXz2PKhJ37X1UkhPWZLlSOiS2s7w0fNPFvdbHQbc+D
         XTBm0cfdNZoRZdoUmzdbXW/8IsJpWNE7QR9XJXcGSRYzyFriVMuVdo71FVch4MCzTfnO
         8KgneeSDazNEcT56iAGeiO56NhuhvuxWN1368oPq3dntnAiqS4D4ZvZW4zezFhc9YJHq
         zxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412752; x=1729017552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noTpT7TMNCGwQMuY8x/MMQ5qdP9Xs2RZaKSa35+PR7Y=;
        b=teuV38dJ7b9tbeRwTw7hm339OuEPiEZ9Pc/XZb12V8khMGQcef+aSJIlMmP5Y2Ati8
         oeduODW4e3ld2XCt7GOVuaC3EVrA2J35BCCoRlsEF68lWK6l2WTsjwUS+6c9iFHajpXI
         ZCSZZpVJPqlZS4R26Je4OGq3ANtnpa/kCqCsIAx0Fm55LSi2YxuscFEfC5ghEfIcd+w6
         R4/ZUb8vyYCS06zhgJqLRiEhIc7U/vOWxWkem7PENeg6rRkYXTgCds3t8nF1D3oiB+DZ
         alUHouKgFl1llpggmjCY8clGNLWEDhyKr1L9H9Paxg2jmih6HeHffIFw/scxBV+DI6Xy
         i3gw==
X-Forwarded-Encrypted: i=1; AJvYcCXtxelPMMMoCYzIkDjoU9ZyWdJ1JkA1xsF17k995Ntd1adnfv/UmpQAlIqqSYWrDTs8/XyRyiHxA1CCdDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzf1VaPXEaYbmlvXgQr9tj2PztcGF2nYNmKIcAGd7SR8c5tCW
	ZfsxAA0BpyELwLs5Cc8D8ldquMHr+Xb1Wg7nntMIoqzlrUstwgJ5GB4RlcK8CUwIy5r9AQLtxJ+
	Rvdrq+dOkx50zz+qtEp+wWu9CVA==
X-Google-Smtp-Source: AGHT+IGtpxdMd1s0GqDjj3A1x/xHJTGLLYvXcWGscZ8OXRzRdLj3KYX1d6a0ORk0NdpZ6U/bTRE1O+oJekLFTGg+vgM=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:7687:b0:71d:fb06:e79b with
 SMTP id d2e1a72fcca58-71dfb06ea3amr18395b3a.0.1728412751653; Tue, 08 Oct 2024
 11:39:11 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:43 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=11978; i=samitolvanen@google.com;
 h=from:subject; bh=/LE4RdA8pusjopTkowR5788fIrd8xfB9an7aJ5zBUNQ=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNZrX723LiT3Rfdb16vnXSd/UjhoyJxac3rNv7RWde
 VtjFixc21HKwiDGwSArpsjS8nX11t3fnVJffS6SgJnDygQyhIGLUwAmcsiO4X/wtdATVcs3/4xP
 LlU7sqXt4avYOUX+58+KnQnf9EDMbXMhw/8y+/sWFWYex+9EvxMNLdOIiK1TXVNpdetpId9lLa9 1LFwA
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-40-samitolvanen@google.com>
Subject: [PATCH v4 19/19] Documentation/kbuild: Add DWARF module versioning
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
Acked-by: Neal Gompa <neal@gompa.dev>
---
 Documentation/kbuild/gendwarfksyms.rst | 274 +++++++++++++++++++++++++
 Documentation/kbuild/index.rst         |   1 +
 2 files changed, 275 insertions(+)
 create mode 100644 Documentation/kbuild/gendwarfksyms.rst

diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbuild/gendwarfksyms.rst
new file mode 100644
index 000000000000..4b89743d2a88
--- /dev/null
+++ b/Documentation/kbuild/gendwarfksyms.rst
@@ -0,0 +1,274 @@
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
+Similarly to genksyms, gendwarfksyms supports writing a symtypes file
+for each processed object that contain types for exported symbols and
+each referenced type that was used in calculating symbol versions. These
+files can be useful when trying to determine what exactly caused symbol
+versions to change between builds.
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
+not used in the mainline kernel.
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
+4.1.1. Managing structure visibility
+====================================
+
+A structure declaration can change into a full definition when
+additional includes are pulled into the translation unit. This changes
+the versions of any symbol that references the structure even if the ABI
+remains unchanged. As it may not be possible to drop includes without
+breaking the build, the `struct_declonly` rule can be used to specify a
+data structure as declaration-only, even if the debugging information
+contains the full definition.
+
+The rule fields are expected to be as follows:
+
+- `type`: "struct_declonly"
+- `target`: The fully qualified name of the target data structure
+  (as shown in **--dump-dies** output).
+- `value`: This field is ignored and is expected to have the value ";".
+
+Using the `__KABI_RULE` macro, this rule can be defined as::
+
+	#define KABI_STRUCT_DECLONLY(fqn) \
+		__KABI_RULE(struct_declonly, fqn, ;)
+
+Example usage::
+
+	struct s {
+		/* definition */
+	};
+
+	KABI_STRUCT_DECLONLY(s);
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
+  (as shown in **--dump-dies** output).
+- `value`: The name of the enumerator to ignore.
+
+Using the `__KABI_RULE` macro, this rule can be defined as::
+
+	#define KABI_ENUMERATOR_IGNORE(fqn, field) \
+		__KABI_RULE(enumerator_ignore, fqn, field)
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
+
+4.3. Adding structure members
+=============================
+
+Perhaps the most common ABI compatible changeis adding a member to a
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
+To reserve space in a struct, adding a member of any type with a name
+that starts with `__kabi_` will result in the name being left out of
+symbol versioning::
+
+        struct s {
+                long a;
+                long __kabi_reserved_0; /* reserved for future use */
+        };
+
+The space reserved by this member can be later taken into use by
+wrapping it into a union, which includes the original type and the
+replacement struct member::
+
+        struct s {
+                long a;
+                union {
+                        long __kabi_reserved_0; /* original type */
+                        struct b b; /* replaced field */
+                };
+        };
+
+As long as the reserved member's name in the union starts with
+`__kabi_reserved_`, the original type will be used for symbol
+versioning and rest of the union is ignored. The examples include
+`KABI_(RESERVE|USE)*` macros that help simplify the process and also
+ensure the replacement member's size won't exceed the reserved space.
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
2.47.0.rc0.187.ge670bccf7e-goog


