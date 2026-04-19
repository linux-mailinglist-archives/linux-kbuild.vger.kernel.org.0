Return-Path: <linux-kbuild+bounces-12844-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEFuFNrh5Gn7bQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12844-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 16:08:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D61AD4244DF
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 16:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AAAD302E0DC
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 14:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C6937C10F;
	Sun, 19 Apr 2026 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCVgnu3j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF637B40E
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607586; cv=none; b=GTWWKQSBtv8MAfesySEo5w8tPNBPVKYgiqIGqqbPU21ZeKPOdnel+GDRvtn9clckBeU07xJkUn5NW6NwKbRZM/HNH/YZQX75yrDzOWrvY1KxO1VnzgvWgzTcIWXlQaUeaZmvLqGI37JSp7xeHhOADOwYwBsX5KRuaW7M3P1AD9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607586; c=relaxed/simple;
	bh=RkV2A4r75HXuxD8QxkqtPSd3I5Hi+PWFKHt1H+BH2rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mq/PBB3oco57OGihtYKwOB87W9iJiAAi3LlyWbr4nwraYm/tnT7KK7HEerVuG9b/s2sXaVncn++5RF9TjbljU8t4bHSzEgbi1DRxVjCrrAwC0HqWjLXyAWKSoLciQ3FyMO5hwca4WYEvKc8t8xubu8Mi6Vc2gzkNhEJVXsJB24M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCVgnu3j; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so1794482a91.0
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2026 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607584; x=1777212384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaRy4aad6uNSW8d1fddO1COP7MLdRx4c3DXic/8Oog0=;
        b=UCVgnu3jrZxAzO8r5CgxU+MCpVETYbYsTfl8lqLhkZEy+/g0TECLv5hd/qy3Feh356
         0VrALkSjdxhK/HK+xy4T9zy10OQC6BP+VpI/t+vifXdPTREznk/Bh5EKmdhN/POyIQXU
         3r40Xs04Xs8/q6Y5bnT3eCiwRtsDbGiSBztcJ0ZhtxuRFpRmc//MT4NMPRKxAx/9Q2xg
         1RPJTMRR15hjtI44KvV6W8ngbODj9sfCxYs4PTLb+JDyiO1woxEExYyFB4pde657SSo7
         tMNAjb6477vHQeqgN4RDZoAf9YpgfR0adN6N0jG6uvP1SrFghvuNpnQCCt6P96z9/4jx
         fy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607584; x=1777212384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaRy4aad6uNSW8d1fddO1COP7MLdRx4c3DXic/8Oog0=;
        b=BQ+kbjvJneZpO6u7n/z4EmkNmGznfiGfa4srVFHTeS8WsEFRAHLCo5h1QZRwHdMCPi
         QYkKYB+7RVxLzSCocEjZnDOouyBpu6BepLigbcFXRVRzA/Fy3d8ffd28u6qRj8uoQ5dF
         BCGGKYb9sXXC7dI0iU7UECclPRq3ISuW/JSqRDoqS27rZ+SeUIPZ8Jq/s3SzNlBi5MVh
         bSvOTLVaWB57bH7VWe93v98BW8+IhWuVLoZpx3Bu8B6e9pJPl5NbzdyaAwAgs4VmhF+8
         JIGXZWKIPAHHE3R7+Z/if8WDhShkRsffrYnbfcamh48HAvCn4A+TEN3DorUDG95ZyPcv
         kO5Q==
X-Forwarded-Encrypted: i=1; AFNElJ95xomdi3jpErluRAMsRJqT8Pc2D5kYDpsH3HR6otGi7xK6gbqSrl/jA+OXhmrnR31wgmirlgX/HCISh1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztbg9FEl11Y17fHAzrxvfodbc6u68oTRplEJNTPInFvxuu4PDn
	kRQIAHSXFDw4xiyalgqbBQ7LTr3uBu+3aF4L94RV1a2zam8Diijj9GEx
X-Gm-Gg: AeBDiesIkrmv3pvZCI966/U74Ew3clvCxz/S6Nle5cTXOgA1ebphZxwMP/5xbu0zYGP
	VEIhSY8+EXoKIfEZcp9J40bztfVBE9szD1qG6d/WI6eNzZ6qvMQ2bbyMbEPT894aSl8S9ZOg7gC
	igQCvjBMThOoSwXOuNUAmeCFexyk1HXD6zVFRUtg0OgtlPDS92xuvNnCnV3qCdB9d9G8qEXSDrr
	gKyJbPYaPdkGRsJLQ+b10lv9UTdgMbpUSUKODwFaT7jaccUrvvJIUCzYt5uFckF1YsMOmGr6m/i
	cyPXDF4/F5ABBhvRLfRds/+kdY6NNdjBgb0qAQRz+7TecUFjIYGUW4kfEJ941j296BN42o2U5q9
	q/b0oFKyDL/f1McjxzTUm5TCmC5H7V+zWfKv9BjTXmIdQGB38/i44sb50yb7u3MCeo/PCkGqxLc
	42ZXjmWLbtyJbeIuh0cJsu3YBG0A==
X-Received: by 2002:a17:90b:4c52:b0:35c:30a8:31f with SMTP id 98e67ed59e1d1-361403bdd28mr11318429a91.2.1776607584360;
        Sun, 19 Apr 2026 07:06:24 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141898ebasm7718121a91.7.2026.04.19.07.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:06:24 -0700 (PDT)
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
Date: Sun, 19 Apr 2026 23:06:13 +0900
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,gmail.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-12844-lists,linux-kbuild=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: D61AD4244DF
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


