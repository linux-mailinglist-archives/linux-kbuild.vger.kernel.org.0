Return-Path: <linux-kbuild+bounces-13095-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ElKJ0ib/2lQ8QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13095-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 22:38:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 870325015F3
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 22:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7776A3003D2C
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 May 2026 20:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D2038552C;
	Sat,  9 May 2026 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFVFEE5h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CF737EFF6
	for <linux-kbuild@vger.kernel.org>; Sat,  9 May 2026 20:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778359104; cv=none; b=VcqCPeX6fU3BOtUOryxKdCna0ICWl2DuisgFHv8dKArmoccmxI7WkrKN2HuoiEk2Wo0jIlMXK2fJY/idWwjNiep35ZHju2RWuzjovxYIsP//tu9GC8LFxRuSTJD2JvxI+k9Oia7VwZLLvi/k0rZzUdXlnqZ0sqZaBxFXbmH/BO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778359104; c=relaxed/simple;
	bh=ccdSo84sr8qu78iNEyB1pzjAiCl5ax6ZU8nj5CEUIqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioSdX4bu3oxyi4+2/0ItVdwLyYExWlswHizcdteXmbMYayVHGl7Ayqa4qk6aP6CA6WqrOLe9srWkVvMxms+g5qjVdFOUPneHckiFzIMretSnx8BKeLy+4oOn1MGLxk08AnCgh5bdSW+pWv4dX25CagyReJexqx5IoWYkX/gZZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFVFEE5h; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso20855425e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 09 May 2026 13:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778359099; x=1778963899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3qgUsX5Ynu3eBdzTZe+QC4Hx6s+MWvYIyWZO/VZNAs=;
        b=cFVFEE5hfYHoNZbFelhmINa398R5624VIFM6bGXhnGk+J6uBIU8knOuhNViN9SmF5/
         OAEUjnYEUzPs1jlOKLOabuIa5nSthGaV5cB+UIMnEBjy12+xGS8Q0O6qxK7c/fcRB0lT
         4pC2jQ28Jq/Kbqsrw3bcQKMmEM9+JjnwFl2YvMz+j/CjlEx8OlJvl+5dU20QnTP3a+XB
         FpkpktFNumOxZ3vBw3r6eEvWL4V8LzpHsHdsCPce2wuKMfhuxIAa+j5zMFm51RT6QzQK
         i2b+KA73aPjUEgLJ1cdawIMDtvJ4H7hLtJWgxN5tHKJKCcYiGU8bwHI19MsRvZGhKsep
         Gksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778359099; x=1778963899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3qgUsX5Ynu3eBdzTZe+QC4Hx6s+MWvYIyWZO/VZNAs=;
        b=IV4DUqULG4G0Tkm+7NtHCZ4/ADMgDUQAsaskgOtDpGWmXCcUWmgTyOioJ2/pwroDxj
         Tn25+CS3ecFI7zm3fI1qW2JUcMUTk/EZ0Z2GLfEBykIbxjouE6xuzwYVnfzXYMewb9sR
         J0bXXUjE08N3knPFzhI4SjOi/tj3Mb12JGBGywQbnBceDMggBb1wbdpXNP/odCsUqN4O
         xViJmaYlbw3ZTCay0idtZlaUBpAZpILzANxL5slFE12CZeRVR+nf/aU1j63U00/enU1E
         lASc8k4LrYc4xW8P46jqXkM1KHB3FnE6dei6cdW5UJe4OJeXwTDv5vCAuDlgfCaoBirR
         W8Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9NQ/juMFRepyV/nJfDTSWuNO6EkJ75w7SCuiiR/UHG2qdNP4d+wnBaMSe4XIIyihPqnvkTI6pTmFoef4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV4AeZk7GC2d2kCzbMLnAjx9JDo02m7dSkGz3yaHAu19y4zM85
	zkks7+ybQreTTHIOgGJ1giJt5I29iyAeanQH/6W9WOAptv4hrMHp8X3G
X-Gm-Gg: Acq92OGccGozBSroIBXhxerIiTZHDyIPEVgRAzSOjMErcmRkDn3WZXsmDMawkkuob3d
	82T4fUeZsNjz+2WeUEnByZHrS8eum9MqCnK8qolsqY4QJXfl+8Mb1OwgwrvVP6mSyJr7HT9Qkko
	JTAmtb5No4XdVVoiUxQGurzmLxarg7RAUBgrjSo0ch9VJ+IRqbOpPqb0GnMHrgQZ3w3Md9Z47Pk
	O4vKPgRWyEUfBMae0RLyagJKrP37mvDTOhlnLGkuMeW2C3LEMK5qSLX1IbF2W/W3y2cpcVMYf/5
	55PhEMbtNjA+enUp1X0p7JhkG3t9W8/n88IrlyEZfCvMt6rv6AcitgS2Qy9cgzROCIPAQaMnBOZ
	C9b1Y4FdZ/YRSQwiD2m7dS/oa7eCtny5jLduFO/JPEfXmX38P8bD1uduhCbd1CoKJLt/3FfEDfY
	qDN1HcGEiV1YymyJkCzBjCaAfM1GhjAHyPVbTsZFPzs8Oqi7xRLBDolm0=
X-Received: by 2002:a05:600d:b:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48e6748a661mr106742005e9.3.1778359098604;
        Sat, 09 May 2026 13:38:18 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db0b95asm39394605e9.9.2026.05.09.13.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 13:38:18 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH v2 2/2] Documentation: dev-tools: add kconfirm
Date: Sat,  9 May 2026 21:38:08 +0100
Message-ID: <20260509203808.1142311-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260509203808.1142311-1-julianbraha@gmail.com>
References: <20260509203808.1142311-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 870325015F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,linux-foundation.org,garyguo.net,kernel.org,arndb.de,linuxfoundation.org,lwn.net,linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-13095-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add usage documentation and a brief description for kconfirm to
Documentation/dev-tools/

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Documentation/dev-tools/index.rst    |   1 +
 Documentation/dev-tools/kconfirm.rst | 196 +++++++++++++++++++++++++++
 2 files changed, 197 insertions(+)
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
index 000000000000..f57bd40508d4
--- /dev/null
+++ b/Documentation/dev-tools/kconfirm.rst
@@ -0,0 +1,196 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+========
+kconfirm
+========
+
+kconfirm is a static analysis tool for the kernel's Kconfig system.  It
+checks the entire tree-wide Kconfig, and reports misusage like
+dead code.  In the case of dead default statements, these can be a code
+smell.
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
+Alarms are deduplicated across all affected architectures; kconfirm
+displays a tag with the corresponding Kconfig architecture config option
+names. For example, ``[RISCV]`` indicates that an alarm is specific to
+RISC-V, while ``[ARM, X86]`` indicates that an alarm affects both arm and
+x86.
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
+kconfirm also requires the Cargo package manager and an internet
+connection for compilation of its dependencies.
+
+If Cargo is available, kconfirm can be built and run from the top of the
+kernel source tree::
+
+  make kconfirm
+
+The compiled ``kconfirm-linux`` binary will be available in
+``scripts/kconfirm/target/release/``.
+
+The default checks currently cover dead code analysis, as well as invalid
+(reverse) ranges and constant conditions.  ``select_visible`` and
+``dead_links`` must be turned on explicitly with ``--enable``; conversely,
+any default check can be turned off with ``--disable``.  Both options
+accept either a comma-separated list or repeated flags, so the following
+two invocations are equivalent::
+
+  kconfirm-linux --linux-path . --enable select_visible,dead_link
+  kconfirm-linux --linux-path . --enable select_visible --enable dead_link
+
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
+``--enable CHECK[,CHECK...]``
+
+  Enable one or more checks in addition to the default set.  May be
+  given multiple times, or as a single comma-separated list.  See
+  `Available checks`_ below for valid names.
+
+``--disable CHECK[,CHECK...]``
+
+  Disable one or more checks from the default set.  May be given
+  multiple times, or as a single comma-separated list.
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
+``failed_parse`` *(default)*
+
+  Reports a parsing failure of the Kconfig.
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
+``UngroupedAttribute``
+
+  Reports ungrouped entries, like ``select`` and ``depends on``.
+  This is a style check, and is disabled by default.
+
+``DuplicateDefaultValue``
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
+  make kconfirm KCONFIRM_ARGS="--enable=dead_link,select_visible"
+
+To disable a check (here, ``duplicate_dependency``) while keeping the
+rest of the default set::
+
+  make kconfirm KCONFIRM_ARGS="--disable duplicate_dependency"
+
+To run the default checks against a kernel tree separate from the
+current directory, such as ``~/repos/linux``::
+
+  scripts/kconfirm/target/release/kconfirm-linux --linux-path ~/repos/linux
-- 
2.53.0


