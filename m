Return-Path: <linux-kbuild+bounces-12841-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILxAFXTh5Gn7bQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12841-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 16:06:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF41424496
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 16:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4554E3006234
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 14:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F2C37E2EF;
	Sun, 19 Apr 2026 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtAa0/vq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB5437C118
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2026 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607568; cv=none; b=lZ/7Tx5sUgV93B789hKdu30sTmb28S6FREqNTyD01/kXwT1TofX1xSKw/lOh6SXmsg33FYihAEVR3luvcA7geeV6H9EXYLtG0edh1YdtfGT0U/pfYR046UmdZTFVFU8Ut6s6RaCREa7uivXxmAdbsuQZeNpgReSTOUibFlOkIsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607568; c=relaxed/simple;
	bh=RkV2A4r75HXuxD8QxkqtPSd3I5Hi+PWFKHt1H+BH2rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvlalkQH/GOBc5p+WaTsbBOHgSDf4duCTW+AoOYLPg+Evzy20QG5cetRDbeA6/bJk+f9vzBmloznYVNJC/qVBQb8oJiH0aN4K63yXwptJhlC6dO4T8b+OVNsmRSOB4qEiznCW+R1xguxWibvdGCJ8jGC9M77svtcYHHYYHzQJnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtAa0/vq; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f69a286dbso1721215b3a.2
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2026 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607566; x=1777212366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaRy4aad6uNSW8d1fddO1COP7MLdRx4c3DXic/8Oog0=;
        b=dtAa0/vqDi4chnbjopfSXz2pJxhk8domfh9vOveJBNkS3oi6RXkZCrWQdwXXfiKFWZ
         flIG8IIM9vfBfvkcNybv5Z0aPBA7oNNn2ClqOAaSPKgZtoCt7ieo7wk38xGf3U8PM5CJ
         i4E4TZNvfo8AdzM3kdBfpAVe5LsXSVJYtxGlgBd4FIoOzIt/GBp2g9wBM3iR7hhHdavt
         so5Fd1HmJEKM+/LBKwnwBWRkshjbwXx95SbCKtPMun3WBDx/5UkrNgNu7zKcgGx+9WJp
         R306PtYv/NdswMP++sDL8mHcimmIw+13kZwC6m6dsASI02sYVlKoLgENFgiRj08/PNwc
         y1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607566; x=1777212366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaRy4aad6uNSW8d1fddO1COP7MLdRx4c3DXic/8Oog0=;
        b=N5AuSLRdCIr/1G5DqN9A82dfuKekMuItMmb0FEUDFGWZJzwWweCOicWbPcVgZluzeU
         1T4CawPtTz0tiTIFd7q2ZrXiqN5Dm8qrjVNDSUZliBCe7vgjLezw2u5fEiidIDRTNpBN
         LVWLBBlUnK0u8RYDpnyaP/7VkNNJuyPZ0I1q/+Swqy7546hESlmfY6r/cb2LwSwY27RX
         cZAmu77HSpR+4SliKp2saiQYv+Y3lsRtokAX+RO2kGFGYNfcJdTh4dQDayIZjGgDVaI3
         /VS//ak/Z1xhQlabKiH+I86hPbKGsXzMBUTnf6mG4Jo4TLz+oigQSquJnjmAUk+Mm7kt
         VhPg==
X-Forwarded-Encrypted: i=1; AFNElJ8F5Qgb0hemKytPunQ8jIb5cMO8ZyqyLCsFDnwXRerOaoqyp9xaSANnVgBj+FDPKkqOurZACyLWAwZeAPY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7LUPv5WKmzK3q0RwgL2eDEXppLq7jwHYnwVfuJ1HxgfbsyF+5
	T1q6hlYRSL4jRgF2NEWcQDJ5eNBo9YNkIVFS3mKYSTgMMu1ijnXfWE8a
X-Gm-Gg: AeBDiesUrsuBhn5KLyozYi1N58OtwW+S1KEhLpcpeJcoST2jgfmeC9d4PzKPCMcBct8
	58S7xFshVSH/0Xi0MuRO8kECln+8qQlNyE02/75hT4Z/tYQPhogsj8QYqC/yDF0d6VK94peVnxA
	QDDzWNhO+JUEXdmAjnDgvy3EqU5pG1IMr+kQsguUpe/MhtaUdxI2grhTKMTG9323OfQqzeou3xn
	qkpcKUJGLCs3MWLldki+v1Divi7ifzytD4SYLsNgkNcxPM4lSYlHYVoOr291F7z9OMHwI3qAMwY
	cdX4gsLJUNYH089To6qXIdeNlZrSrXE6g89bntzXq2B/JWrF/rOcd1PerwkO+ERNs+n9CYGs7oZ
	sKaHTbEzrM/IvqDtQjZdnzCNvRXZHHeFU4mMTpcS7Cdd+g2z0p6bZfSy+p4c4VB+Wpme5P3QQM+
	/aI8TwvdLis1grUZWP7wRBxKAnajTJbT0/RMBO
X-Received: by 2002:a05:6a00:1995:b0:82a:6ef8:cb43 with SMTP id d2e1a72fcca58-82f8c84b34emr10387529b3a.19.1776607566240;
        Sun, 19 Apr 2026 07:06:06 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6642sm9667974b3a.45.2026.04.19.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:06:05 -0700 (PDT)
From: HeeSu Kim <mlksvender@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	charmitro@posteo.net,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	mlksvender@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v6 2/2] rust: Makefile: bound rustdoc workaround to affected versions
Date: Sun, 19 Apr 2026 23:05:54 +0900
Message-ID: <e43a36ea08eba20b9b6c675cfcb5856201994c94.1776607331.git.mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776607331.git.mlksvender@gmail.com>
References: <cover.1776607331.git.mlksvender@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,gmail.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-12841-lists,linux-kbuild=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mlksvender@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4CF41424496
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround was added to
handle a rustdoc bug where target modifiers were not properly saved [1].
An analogous workaround for doctests was added later [2]; since Rust
1.91.0 the `sanitizer` modifier is also appended.

The rustdoc bug is fixed in Rust 1.90.0 [3] and the doctests one is
fixed in Rust 1.92.0, so restrict each workaround to the compiler
versions that are actually affected, letting ABI compatibility checks
run again on newer compilers.

Split the cases into explicit version ranges using
`rustc-min-version` + `rustc-lt-version` combined inline: the rustdoc
workaround applies to 1.88.x and 1.89.x, the doctests workaround to
1.88.x through 1.91.x, and the `sanitizer` modifier is only added
from 1.91.x onwards (when rustc started recognizing it). This layout
makes it easy to drop each entry as the minimum toolchain version is
bumped past the affected range.

[1] https://github.com/rust-lang/rust/issues/144521
[2] https://github.com/rust-lang/rust/issues/146465
[3] https://github.com/rust-lang/rust/pull/144523

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72nnuKJaKrxrut6+noR13PUiSoWWyyp-pGx-fe_2O6ayFA@mail.gmail.com/
Cc: stable@vger.kernel.org # Useful in 6.18.y and later.
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
 rust/Makefile | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5c0155b83454..14acc9c57c60 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -134,12 +134,18 @@ pin_init-flags := \
     --extern macros \
     $(call cfgs-to-flags,$(pin_init-cfgs))
 
-# `rustdoc` did not save the target modifiers, thus workaround for
-# the time being (https://github.com/rust-lang/rust/issues/144521).
-rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
-
-# Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
-doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
+# `rustdoc` did not save the target modifiers
+# (https://github.com/rust-lang/rust/issues/144521, fixed in Rust 1.90.0).
+# Similarly, for doctests
+# (https://github.com/rust-lang/rust/issues/146465, fixed in Rust 1.92.0).
+ifeq ($(and $(call rustc-min-version,108800),$(call rustc-lt-version,109000)),y)
+rustdoc_modifiers_workaround := -Cunsafe-allow-abi-mismatch=fixed-x18
+doctests_modifiers_workaround := -Cunsafe-allow-abi-mismatch=fixed-x18
+else ifeq ($(and $(call rustc-min-version,109000),$(call rustc-lt-version,109100)),y)
+doctests_modifiers_workaround := -Cunsafe-allow-abi-mismatch=fixed-x18
+else ifeq ($(and $(call rustc-min-version,109100),$(call rustc-lt-version,109200)),y)
+doctests_modifiers_workaround := -Cunsafe-allow-abi-mismatch=fixed-x18,sanitizer
+endif
 
 # `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` only
 # since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds since Rust
-- 
2.52.0


