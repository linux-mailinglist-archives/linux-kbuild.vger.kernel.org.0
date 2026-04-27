Return-Path: <linux-kbuild+bounces-12887-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD9rEOag72kcDgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12887-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 19:46:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC4F477DF6
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 19:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4872F30268B2
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2026 17:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A143B39FCCA;
	Mon, 27 Apr 2026 17:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0HsdFrS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15053E63BD
	for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 17:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311895; cv=none; b=V9+koL3tc8ZJZaubgdewUOX7lBkccqdRJ0IkYbAA6JTcmmCW/MxHyInwfWmldhqDjNacD0co6fRPqfmv/OjT5XNKZ7XmIy1e07mMvPsogJdxddNLftmKylAv9Xl9DnJt0QhsVa6wP2EzB9nzpZYqmE1MnGjgG45Xx5GhMGCjj/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311895; c=relaxed/simple;
	bh=aG2/pIddFBYwHDjRtPjqjVuxTTwpcBTrMMTxoCM0eGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4Z8/sg5xzh7/+ne9ojKrgnDlTwVD2DL4R8WfMpcNX/0HjU+x4EiyBdGJf2mwCA5uPXeGlnGPMkALt1hiFBE1CH3Y+wiyekmDO+Ige4xv5MMWrtp0lbLftWqBs2oNTRAor5rpRzrnecuZEn8MdyT9xxhswzYfORedOuzu+4AC30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n0HsdFrS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48909558b3aso105404125e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2026 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311887; x=1777916687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIyqmWrjFxeDbps0CNbpJmCmgB+UMGp2ijYl3BYcDRw=;
        b=n0HsdFrSigDTC2LXgqIPdlD+od8Cm4vKPz5Grk/D22b3febRJK6VzhrXhXLVQMnEOW
         yFcCGeB2UHHSZ5Z5l51n/Cr+Cx/vWcIkPpP9w7wR23bfOyFvR83V3OSPp9uu1JlgPQc/
         /5nT86rVA68kGKptijVAfexSqqWcoZ7xgJLAtFh5ohdIdS8+1ZtTSoyAyS+9wpplOlpQ
         CVVwhWubN8pkfhKI96ClsvYe9yV0TE1ALJRRR6cn/x1dVNvPrxkY/nTjk5XcmBznicH9
         anoXSGByHAGZJdoRDTHe8xlpL4xJt+wBrfRmqjQfVMYWAYGJAXVRmO+2GqvDGzzhCo5Y
         dU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311887; x=1777916687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIyqmWrjFxeDbps0CNbpJmCmgB+UMGp2ijYl3BYcDRw=;
        b=jbF65bSPgXvPIH9fNufeIBD5zpTEyEn5pS6gclCZnX+zATz6mL4zWOq37sOWKItQz2
         2mPHPDWOcd5GBsLWhcQAbGlQ4k6iHChhUVc1EopcQVexpKogH8y5zHqEhN4a9IrNncnm
         l7SxALKVqY49vsFBD/4tVQVxKsF/XXyCfK79Oy9RNHAcZ2LAqrz0oJe4iw4MBiqUxYvI
         2CKX+/Ghtl3tEiQzSjHK9Hd9rDflxojMAPrsGYmeA8hSfo+EhkY73F7nl9RwCc0ECYg3
         9xNwpmp9U313Luga9gEte2F6MrL4Tqca44+3ipuc7gnUCVROhOwt1rIwsNZPSxPgS4w1
         Hjsg==
X-Forwarded-Encrypted: i=1; AFNElJ/FC8tu2QTcDuypWAlhJ91q1q9h66umD9YXwgbB0s3LfmXaM1j8khkVyoyaz0GDA8/b4bjWusB4rHIO1wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqH54wz9P/vfJp7Lp0iGii6BYP9n98o3BNa2ZmMBs1IXXHYvM/
	ooXvL2vWdT6+2ZKCBQ6nu5ACFkpwOb/K2tBcNmwaMUggGvXh4UKvqPSW
X-Gm-Gg: AeBDieuI6eexaZdPQRaisCedSyj/8r123GbS+JDJAGyOhrMj3yrtuFiwSklW5HNuX1a
	aahQEN1OoDdtHEO+7eWcEWg0/KLhT2ZFPywx3o7nh3FYgYum9RlH+qVMVc3lwss7C774wltFvuP
	wYDwZhvIxJYALZScHB8To5H2ZVBQfC5tbMfWjRDzlefYpWG57ryOz7f2Tvo0qYqGuF93BILzEZ1
	kO5QY746JR0ykqn1Y0QgHIK+zDnhzAN126WWSEwYW9i2pDZiyHFfEDYYbn7JSmqPjvaN8nayNDB
	DjMl11QgPlgl/Fh3spxXTiu+5cg7YdJblNqTHIYieGWgs+1Q2fiaC7s0Gz14g6SZ/6t0cROQuTY
	LThxHQ831aXWfRWD4/Hd2gff9LTOhbRCm9SSp9IUNP4avm5forcwVcLz6tmnL1Jwz2LPsB1nu/f
	am7X6F6eZiZrU9SSVAEcjGdvR/3wldh4De5q6cSdvYC7UFaC0LbSkpMl0FfveXdbplRA==
X-Received: by 2002:a05:600c:8b42:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-48a76f74fe7mr4833345e9.15.1777311887430;
        Mon, 27 Apr 2026 10:44:47 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a774b6300sm478485e9.16.2026.04.27.10.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:44:47 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: akpm@linux-foundation.org,
	ljs@kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [RFC PATCH 2/2] Documentation: dev-tools: add kconfirm
Date: Mon, 27 Apr 2026 18:44:29 +0100
Message-ID: <20260427174429.779474-3-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427174429.779474-1-julianbraha@gmail.com>
References: <20260427174429.779474-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AFC4F477DF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[arndb.de,linuxfoundation.org,kernel.org,lwn.net,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-12887-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add usage documentation and a brief description for kconfirm to
Documentation/dev-tools/

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 Documentation/dev-tools/index.rst    |   1 +
 Documentation/dev-tools/kconfirm.rst | 147 +++++++++++++++++++++++++++
 2 files changed, 148 insertions(+)
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
index 000000000000..6ad02de15031
--- /dev/null
+++ b/Documentation/dev-tools/kconfirm.rst
@@ -0,0 +1,147 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. Copyright (C) 2026 Julian Braha <julianbraha@gmail.com>
+
+========
+kconfirm
+========
+
+kconfirm is a static analysis tool for the kernel's Kconfig system.  It
+checks the entire tree-wide Kconfig, and reports misusage like
+dead code.  In the case of dead default statements, these can be a
+significant code smell.
+
+kconfirm has an optional check for dead links in the Kconfig help texts.
+Since this has a high potential for false positives (due to websites
+blocking bots) and slows down runtime signficantly, it is disabled by
+default.  However, an example of how to enable it is included below.
+
+kconfirm is written in Rust and lives in ``scripts/kconfirm``.  Other
+than the dead link checks, kconfirm aims for zero false positives.
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
+    make kconfirm
+
+The compiled ``kconfirm-linux`` binary will be available in
+``scripts/kconfirm/target/release/``.
+
+The default checks currently cover dead code analysis.  ``dead_links``
+must be turned on explicitly with ``--enable``; conversely, any default
+check can be turned off with ``--disable``.  Both options accept
+either a comma-separated list or repeated flags, so the following
+two invocations are equivalent::
+
+  kconfirm-linux --linux-path . --enable dead_defaults,dead_links
+  kconfirm-linux --linux-path . --enable dead_defaults --enable dead_links
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
+    The path to the linux source tree to analyze. ``make`` uses this
+    option to pass the current linux tree, but this option can be used
+    when running the tool directly with another source tree.
+    See `Examples`_.
+
+``--enable CHECK[,CHECK...]``
+
+    Enable one or more checks in addition to the default set.  May be
+    given multiple times, or as a single comma-separated list.  See
+    `Available checks`_ below for valid names.
+
+``--disable CHECK[,CHECK...]``
+
+    Disable one or more checks from the default set.  May be given
+    multiple times, or as a single comma-separated list.
+
+``-h, --help``
+
+    Show the help message and exit.
+
+``-V, --version``
+
+    Show version information and exit.
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
+    Reports duplicated ``depends on`` entries on a single Kconfig symbol.
+
+``duplicate_range`` *(default)*
+
+    Reports duplicated ``range`` entries on a single Kconfig symbol.
+
+``duplicate_select`` *(default)*
+
+    Reports duplicated ``select`` entries on a single Kconfig symbol.
+
+``duplicate_default`` *(default)*
+
+    Reports duplicated ``default`` entries on a single Kconfig symbol.
+
+``dead_default`` *(default)*
+
+    Reports ``default`` entries that can never be selected, for example
+    because their condition is unsatisfiable.
+
+``dead_links``
+
+    Reports broken URLs found in Kconfig help text.  Because this
+    performs network requests it can be quite slow, and is disabled by
+    default. May also have false positives.
+
+``style``
+
+    Reports opinionated style issues in Kconfig files.  Disabled by
+    default.
+
+
+Examples
+========
+
+Compile (as needed) and run on the current tree::
+
+    make kconfirm
+
+To additionally enable dead-link checking::
+
+    make kconfirm KCONFIRM_ARGS="--enable dead_links"
+
+To disable a check (here, ``duplicate_dependency``) while keeping the
+rest of the default set::
+
+    make kconfirm KCONFIRM_ARGS="--disable duplicate_dependency"
+
+To run the default checks against a kernel tree separate from the
+current directory, such as ``~/repos/linux``::
+
+    scripts/kconfirm/target/release/kconfirm-linux --linux-path ~/repos/linux
-- 
2.53.0


