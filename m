Return-Path: <linux-kbuild+bounces-12840-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J4QO1vh5Gn7bQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12840-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 16:06:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB9424486
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 16:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D317930089A2
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Apr 2026 14:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CAA437E2FE;
	Sun, 19 Apr 2026 14:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6igzAJp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C7D37E2E8
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2026 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776607565; cv=none; b=Y6snR9p5zap6Mix6b0Xe83RLd7kpPMD3FKifLqAV5gmhLAciHf4SVrv/mK/RhYUrZt/ox6PaYzUhXj7BwnzeuOBvx93xcvTvDQrkfN/Fx3Jgq8Gh0C44Gd+9rUoZcgctR8cXm8CCI2uuS1qh04bbX/brjLP2jKFv7iPWuDJ/L8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776607565; c=relaxed/simple;
	bh=3WWp9rUozTrqD9jYJJIxf3iZIrIrmP3btVTinVMXXjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=II0346l0OQYKqjtjWRHp18cRi7ldpGHjASR4j/iRSShWOw3e7v2yIeDeR7Bnc3SzSRm+MjerpT83WRrkcUz+lrrekm5HNN1XnPwt3lMRyW00j6tqPS+LLXv3ZU0LOMS0BfRScH3214gKSw4SaY83BH3C7kYh8k6GFx5n1CAlyFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6igzAJp; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f8893bff3so974156b3a.2
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Apr 2026 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776607563; x=1777212363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=au3wY7wHMTJZKx13iEN8EAIoe19OdnlK/RWrodbzRlg=;
        b=e6igzAJp8bKEpr2lr3+2LP6ZSnvTPdMrBjnszXlyd4gXd9jWisN+TDU762mpX1l3Fd
         94jLIvepvcKfd+/LfTqD2+M+UKmtYMCtiuWBRUUWWgty681OV5FvszUHmrWZchBdrB0e
         OR873LrxxNo5Znmukn/8VjJLjqD9rQyx0lr3syFa/TWWDPAcJFlxO12oenX3qZOGSxD3
         fMwfdYoH2t9REkP4y03gJGF5W6+Ekv6cWrXCxeGul3TIuo9cATFc0srD2WcO+w/ic61o
         gsGjlgg/JYpUMAkqGsLeQVngkiR5QFBsXXAa3haGKr1nNdqytKabNp1ib5Sd3JfKGhVR
         whPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776607563; x=1777212363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=au3wY7wHMTJZKx13iEN8EAIoe19OdnlK/RWrodbzRlg=;
        b=IpmGFmUlKu6V4/831OFaDJIKN+ofT++0veVY9OCgiM8I3ImZ9fw0vipkb2ikYBnbjs
         rcmnvNbFk/jrd6Q8x3ZTYX2rN+JoCyQ1IErx14yRq1wwjOMoagngUIypRmouraLzN4fn
         rI2tdpV3dZ5N501Cb0BHKCXzsgoLj4Y22fFr4dXWpX3WaL+IROX17t82mqGp2xB/hS+b
         ljEktpP5IA/mDntBd4wL415Tp3uAUWrwQXwr7KMZRSEX8tUbv6iOHDVeO5a2xWHjlQ8Y
         Hkw39f0tHm7W4Op0FIb/Kyxn4AzLZowzoT6NJy8t0gnnCdQXSdTXtVEALLo/yhQVsHnP
         pg8g==
X-Forwarded-Encrypted: i=1; AFNElJ/Phxd6OwfSJcZyyJjeCw3LeDh7TK/gQ/YWigycwoP+3JKbHbPnJYMxRV08e76u/Ex6TpQxmejOPxHUSYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjulkHbG0K0XQBTvH6GZfEpilr+AHn0M+FqyNean+unRk8r0Sm
	oL6Oj2jSX7vVXcXLC9ythp2yo68k/bpS6cF2968DjnnHhC8wvGVMZ8Xg
X-Gm-Gg: AeBDieu06L5o5UPRaG7BrqF7onybcT+4ERF6c7l3ocXzRqhdVqWScdHu2YCYKc00dU7
	XbZD8Xxx8N15zmoll8kuNcPJMcDnVX/bd9MzhJMEPH8t/FjX1syzRxJGaUSyWD8jrmh5olm4DEw
	GoGXtENLJgKz5lnMr8V+DmCqJlZUB+FKm9HrU7Gn3WtKkr9GbvbvBv6jDQDs6qhw2XiLw3CLlqL
	p+h55qLHRI1v8J3CwZ2o0Vmq+mi2ucw5hMdEQrXwd+2TCCKogIgqApEa9uKDF2+WCJraGsC7jAe
	kTb7G38P24yIw6ErcyhAJrEN9dpxKq6C5KOO+cO+LwIt5JuzjRVA19dnTNT0+uemHb+UfKi26sa
	w4Fbl+mlo0nBw3qNYNZFLnYRcyIpgjpyMOyoWmauLWa4lnKGUb2e7p9knK/dC8c+YqwoTSUSJ3/
	Zj78bmzmTDrCB07pM8PDVfbLlmqA==
X-Received: by 2002:a05:6a00:6de7:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-82f8c8893abmr9989689b3a.18.1776607562984;
        Sun, 19 Apr 2026 07:06:02 -0700 (PDT)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe6642sm9667974b3a.45.2026.04.19.07.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 07:06:02 -0700 (PDT)
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
Subject: [PATCH v6 1/2] kbuild: add rustc-lt-version macro
Date: Sun, 19 Apr 2026 23:05:53 +0900
Message-ID: <498f49f1c0b34535309f9dedf87ac4de8e7c132b.1776607331.git.mlksvender@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,gmail.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-12840-lists,linux-kbuild=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A8DB9424486
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add `rustc-lt-version` macro to `scripts/Makefile.compiler` for version
upper bound checks, mirroring the existing `rustc-min-version`.

Use a non-inclusive (less-than) comparison so that callers can express
clean version boundaries such as `109000` (Rust 1.90.0) rather than
`108999`, which is also easier to remove once the toolchain minimum
version is bumped past the bound.

This will be used to bound workarounds to specific compiler version
ranges.

Originally posted as `rustc-max-version` in v5 [1]; renamed to
`rustc-lt-version` on this respin per Miguel's direction to simplify
the delta and avoid the `99` form [2].

[1] https://lore.kernel.org/rust-for-linux/20260205131522.2942928-1-mlksvender@gmail.com/
[2] https://lore.kernel.org/rust-for-linux/CANiq72n-z0v_deUVPWeg1h0c6KQ+r6xfNDf72o29_0yy6KbqGA@mail.gmail.com/

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com/
Acked-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
 scripts/Makefile.compiler | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index ef91910de265..fd039e228800 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -71,6 +71,10 @@ clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
 # Usage: rustc-$(call rustc-min-version, 108500) += -Cfoo
 rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
 
+# rustc-lt-version
+# Usage: rustc-$(call rustc-lt-version, 109000) += -Cfoo
+rustc-lt-version = $(if $(call rustc-min-version,$1),,y)
+
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
-- 
2.52.0


