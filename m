Return-Path: <linux-kbuild+bounces-13179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qE20KJrnCGp4+gMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13179-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 23:54:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6B55DF71
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 23:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32366301C582
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 21:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78C1384CEC;
	Sat, 16 May 2026 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpcHu8wT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDB3383C86
	for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 21:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778968447; cv=none; b=fQRRvU4hUkP3qV1MTmQr0Z5XpnjN/p3VLJcJz4ZTI1YgX5HBHy1chSgDLh2G9qAnGmsL1tA5mCzU4idObJGStVUqQqREJvgyW0RHySNe6PawH94NftKtYmbrI50ZPoNo90QcUpKgT7mpWenz7xM6FNdrR4z8WOQwVKmauNZxZiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778968447; c=relaxed/simple;
	bh=5MRo+plLWr6PGOZ4zhMsWidC6F4OqQ609lLi14F9Ymo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9HRjUYlsOT/VaPB1jdPVm4xha34+pQV2krzSeuZDXRyCpdciPwPmOE7BsekRMc7OagsZx97c+iEWUouUYjnchiZE8HdWt6h3EIJ6UuM5l7n0JzxrdWoudlsCrkPQCf4X3lMSClNmsp5tuc/A1Q4YSafIsr1n7l+u3BaWzUQhYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpcHu8wT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so14408225e9.2
        for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2026 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778968444; x=1779573244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFLgugNq97yzMywfRHqXq0Fp1RLv0E8Jl7TXtWn7z2M=;
        b=CpcHu8wTL0g9jcvBw3PVt+rWWeYLuosP7l80nef+PjTw750FvfA3ySNypmpKzY8RNJ
         0T1VVV0ZdpP8R/D6gCbJhyuw1LFbPOJswpO+f7ybxm+lqQ2q9blB2DDCRyTolrqxmXxS
         UBU3x0ZNJRp9Urs7uwpKemVp18O88EFnmKXQYxbLBKg9k++TbqMlkKa24rDHaeE+64vv
         pO9xnOkC3mYaSgJeD0KTPJ+NFfqfIEjP+31acmYDdn95wNwW2i7xQlnYmKutmq296VZN
         Kto2TNF/v4FESJT5/WUchA4cJK46hJN0keWVBDiW6VahqrG+pNrnSd4vzSS9ji3Z/mU7
         iv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778968444; x=1779573244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFLgugNq97yzMywfRHqXq0Fp1RLv0E8Jl7TXtWn7z2M=;
        b=QHFTHh7hcL36fzP0Xhq+jd3sD7m6AnHCyRTA3uueqYxcAQUgJYXcsosE16KKPO92zF
         +kUVvKIRgf/EE1onyk2oaAG9QkcsmTZeACRucOCrU92SeOlfUtlIFYrkaf2uffIRL0MO
         F2SYFpRpLGGoINifkQmNvdAd9cZLZ3/YOukT4t7Ip1poTNgYrhPUV3LkPVEOedDmZjcS
         WUfDNM23670nExdzVnZzQelc/YtkD9JoxfrOTbqbccxmtdE9+S8RgrDD1RoHkH7ZRDyG
         V+FSq5b17XMLSN6GP/jbYNxkk/4b+Cc5BkJCQMBZlwSQXX5+abPf/UnqEmZ3N+9ea2Nn
         cN4A==
X-Forwarded-Encrypted: i=1; AFNElJ8wRtf+dbSx7hx5RUqJdByd7leaJ3COWulOnAvEdNi/z/GSmWKmPzGFLSEfsZqCUouPjklJ+xwVtMO1BgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDHlcrNgXCSGiX9chZf+CJwtnJwxlgZlWU+m50PIVE/5FEZiJd
	xkAHHY3aT6gs+96pYPIjUIiGw2DiR98FYbIL/QZnmp3NGachnpvRwoJj
X-Gm-Gg: Acq92OG/UfDNjkXoIIjDM7aN07v+lhJNMlCFZhi+Ia17Ooom9jdczzvfB5g+h/d7sB4
	9QxZmkSlliF4N6wpWtgWsRCDBhNaU5FIuhAJXDLzrW/AoRxNN+sI58wQDhgb7RMPbqtUoH3yO5Y
	QAysCKAIk/dEQGvE6jjEd+aHQd67A4bEtmjKDtJLNbY/+bNH+ZufGxIXvzewrBjV7kABZHFsihp
	EKEnAZoUvGf/spvYAru5McC1jVvcjw1LFb85YR8k0jchRKClU/l6pSzZb+jKajIB1Itx3dv4nI7
	zIqriGqHKtsmMNvoLhzjaWU8VTB+rciPEVH7Gz6hOUSDhwG3bPlAfXXaQyz8AfbUf7RSwSyPCcG
	Xeg48yWDX9LGjHruCLfYAV7HBA3sx+sfwJP5NY9gGP/HObWYUeLLxyquo8xlc/b5HZ8IPwDDpuk
	Eo6lZk6FRgDOkxfnAE9uVhcwyBv+ik9V2Z9ymmIXA9uIdGLPovfhyn/jQ=
X-Received: by 2002:a05:600c:1f94:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-48fe60de736mr133151715e9.5.1778968443504;
        Sat, 16 May 2026 14:54:03 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c90b27sm158383415e9.8.2026.05.16.14.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:54:02 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: jani.nikula@linux.intel.com,
	akpm@linux-foundation.org,
	gary@garyguo.net,
	ljs@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	qingfang.deng@linux.dev,
	yann.prono@telecomnancy.net,
	demiobenour@gmail.com,
	ej@inai.de,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH v3 2/3] Documentation: add kconfirm
Date: Sat, 16 May 2026 22:53:53 +0100
Message-ID: <20260516215354.449807-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516215354.449807-1-julianbraha@gmail.com>
References: <20260516215354.449807-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0CC6B55DF71
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,linux-foundation.org,garyguo.net,kernel.org,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,gmail.com,inai.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13179-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,crates.io:url]
X-Rspamd-Action: no action

Add usage documentation and a brief description for kconfirm to
Documentation/dev-tools/

---
 Documentation/dev-tools/index.rst    |   1 +
 Documentation/dev-tools/kconfirm.rst | 222 +++++++++++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 Documentation/dev-tools/kconfirm.rst

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 59cbb77b33ff..130ebc0d7282 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -40,3 +40,4 @@ Documentation/process/debugging/index.rst
    autofdo
    propeller
    container
+   kconfirm
diff --git a/Documentation/dev-tools/kconfirm.rst b/Documentation/dev-tools/kconfirm.rst
new file mode 100644
index 000000000000..8790672c9a87
--- /dev/null
+++ b/Documentation/dev-tools/kconfirm.rst
@@ -0,0 +1,222 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+========
+kconfirm
+========
+
+kconfirm is a static analysis tool for the kernel's Kconfig.  It checks
+the entire tree-wide Kconfig, and reports misusage like dead code.  In the
+case of dead default statements, these can be a code smell.
+
+kconfirm has some additional, optional checks. The first is for dead links
+in the Kconfig help texts.  Since this has a high potential for false
+positives (due to websites blocking bots) and slows down runtime
+significantly, it is disabled by default.
+
+Another optional check is for config options that select visible config
+options.  Examples of how to enable the optional checks are included
+below.
+
+kconfirm is written in Rust and lives in ``scripts/kconfirm``.  Other
+than the dead link checks, kconfirm aims for zero false positives.
+
+By default, kconfirm checks the same architecture as your kernel build,
+but you can also enable checking more architectures with
+``--enable-arch`` or disable checking your default architecture with
+``--disable-arch``.  Alarms are deduplicated across all affected
+architectures; kconfirm displays a tag with the corresponding Kconfig
+architecture config option names.  For example, ``[RISCV]`` indicates
+that an alarm is specific to RISC-V, while ``[ARM, X86]`` indicates that
+an alarm affects both arm and x86. Running on each architecture will take
+approximately one minute on modern consumer hardware.
+
+**NOTE**: kconfirm does not modify or compile the source tree; it is
+strictly a static checker.
+
+
+Getting Started
+===============
+
+
+kconfirm's Minimum Supported Rust Version (MSRV) is v1.85.0, because
+it uses Rust edition 2024, and this is the earliest supported version.
+
+kconfirm requires the Cargo package manager and an internet connection
+to download its dependencies from crates.io.
+
+In ``scripts/kconfirm/`` run the following to download the dependencies::
+
+  cargo vendor
+
+Then, kconfirm can be built and run from the top of the
+kernel source tree::
+
+  make kconfirm
+
+The compiled ``kconfirm-linux`` binary will be available in
+``scripts/kconfirm/target/release/``.
+
+The default checks currently cover dead code analysis, as well as invalid
+(reverse) ranges and constant conditions.  ``select_visible`` and
+``dead_links`` must be turned on explicitly with ``--enable-check``;
+conversely, any default check can be turned off with ``--disable-check``.  Both
+options accept either a comma-separated list or repeated flags, so the
+following two invocations are equivalent::
+
+  kconfirm-linux --linux-path . --enable-check select_visible,dead_link
+  kconfirm-linux --linux-path . --enable-check select_visible --enable-check dead_link
+
+
+Options
+=======
+
+**NOTE**: kconfirm's arguments must be provided in the ``KCONFIRM_ARGS``
+environment variable if running with ``make``. See `Examples`_.
+
+Available options:
+
+``--linux-path PATH``
+  The path to the linux source tree to analyze. ``make`` uses this
+  option to pass the current linux tree, but this option can be used
+  when running the tool directly with another source tree.
+  See `Examples`_.
+
+``--enable-check CHECK[,CHECK...]``
+
+  Enable one or more checks in addition to the default set.  May be
+  given multiple times, or as a single comma-separated list.  See
+  `Available checks`_ below for valid names.
+
+``--disable-check CHECK[,CHECK...]``
+
+  Disable one or more checks from the default set.  May be given
+  multiple times, or as a single comma-separated list.
+
+``--enable-arch ARCH[,ARCH...]``
+
+    Enable one or more architectures in addition to the default
+    architecture.  May be given multiple times, or as a single
+    comma-separated list.
+
+``--disable-arch ARCH[,ARCH...]``
+
+    Disable one or more architectures from the default set.  May be given
+    multiple times, or as a single comma-separated list.
+
+``-h, --help``
+
+  Show the help message and exit.
+
+``-V, --version``
+
+  Show version information and exit.
+
+
+Available checks
+================
+
+Each check has a string name that is accepted by ``--enable`` and
+``--disable``.  Checks marked *(default)* are enabled unless turned off
+explicitly.
+
+``duplicate_dependency`` *(default)*
+
+  Reports duplicated ``depends on`` entries on a single Kconfig symbol.
+
+``duplicate_range`` *(default)*
+
+  Reports duplicated ``range`` entries on a single Kconfig symbol.
+
+``dead_range`` *(default)*
+
+  Reports ``range`` entries that will never be evaluated, due to an
+  unconditional range entry.
+
+``duplicate_select`` *(default)*
+
+  Reports duplicated ``select`` entries on a single Kconfig symbol.
+
+``dead_select`` *(default)*
+
+  Reports dead ``select`` entries that will never be evaluated, due to an
+  unconditional select entry of the same config option.
+
+``duplicate_imply`` *(default)*
+
+  Reports duplicated ``imply`` entries on a single Kconfig symbol.
+
+``dead_imply`` *(default)*
+
+  Reports dead ``imply`` entries that will never be evaluated, due to an
+  unconditional imply entry for the same config option.
+
+``duplicate_default`` *(default)*
+
+  Reports duplicated ``default`` entries on a single Kconfig symbol.
+
+``dead_default`` *(default)*
+
+  Reports ``default`` entries that can never be selected, for example
+  because their condition is unsatisfiable.
+
+``constant_condition`` *(default)*
+
+  Reports conditions for any entries that always evaluate to ``true``.
+
+``reverse_range`` *(default)*
+
+  Reports invalid ranges for int and hex configuration options.
+
+``failed_parse`` *(default)*
+
+  Reports a parsing failure of the Kconfig. Cannot be disabled.
+
+``select_visible``
+
+  Reports configuration options that ``select`` a config option that is
+  visible to users.
+
+``dead_link``
+
+  Reports broken URLs found in Kconfig help text.  Because this
+  performs network requests it can be quite slow, and is disabled by
+  default. May also have false positives.
+
+``ungrouped_attribute``
+
+  Reports ungrouped entries, like ``select`` and ``depends on``.
+  This is a style check, and is disabled by default.
+
+``duplicate_default_value``
+
+  Reports duplicate default values that have different conditions.
+  Suggests combining the conditions using a logical-or ``||``.
+  This is a style check, and is disabled by default.
+
+
+Examples
+========
+
+Compile (as needed) and run on the current tree::
+
+  make kconfirm
+
+To additionally enable the dead link and select-visible checks::
+
+  make kconfirm KCONFIRM_ARGS="--enable-check=dead_link,select_visible"
+
+To disable a check (here, ``duplicate_dependency``) while keeping the
+rest of the default set::
+
+  make kconfirm KCONFIRM_ARGS="--disable-check duplicate_dependency"
+
+To enable an architecture (here, ``RISC-V``) while keeping the
+default architecture enabled::
+
+  make kconfirm KCONFIRM_ARGS="--enable-arch riscv"
+
+To run the default checks against a kernel tree separate from the
+current directory, such as ``~/repos/linux``::
+
+  scripts/kconfirm/target/release/kconfirm-linux --linux-path ~/repos/linux
-- 
2.53.0


