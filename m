Return-Path: <linux-kbuild+bounces-12597-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJTqNpJLzmmjmgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12597-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 12:57:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D134387FF3
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 12:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5720F30692ED
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 10:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA0839F183;
	Thu,  2 Apr 2026 10:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MVKMVAC8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9739139D6C6
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127346; cv=none; b=MJ8k8jawfcmtqmnlA6hMIjE8QyD2SDDbxFQMUtyrG2IzJSV13Znn5FfhXYDC5kFBqwBGT9PUfCy0yMDGSGkCQ7OwkuBWndnjinzcaWsarYkywW6Lw30QxpPCs7rLp3ji9iD3PiL2RZz9BNITelh/6AG1OoS6hmo0X68KSctwlqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127346; c=relaxed/simple;
	bh=bV7baRN/P8ziq+BlF+VlHBEOjJ2R3asSYMrZhFxs0IE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LmfEjvGL6FC/LWTydf1CpzX7dNI2n6srtYpIQ2HZrsR1yrxqluQEaBA9MR7BaHhFaOdMx3/8+cdEJGt9jEjzHg5ckYa2yCgW1R/p6/xSdq/j4glgBhdCBp/5qtU98gVem8rd98AraBwG49xNQbxmiA5Frc3r2008RCN2xsUX0Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MVKMVAC8; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48378df3469so4963715e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 03:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775127343; x=1775732143; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zyGYGjXr8/MxK8x3KQaVB9GfT3jIQgl3+sN3N/vJgmA=;
        b=MVKMVAC8WuAValyVgu85OT0KTQCtK71OZ3e/eD+xmpZbkmjYznAt6iuk2A8wlr/Wlb
         Ax3hMYGTziHTJKFADO/ASsfHTWU49lqADJqwBxZSiK/UolAgHCZcE4YVNVgc8p8f9t9i
         M8l316rUHYRofR7s0Rd8xEOca2GYyrm8xujousBWiZMVmjEpRXkTxVJG04Zesg6C0Lz4
         UwEZNMsaOna0JFajDLXFU37V93d7YC7PwsmP1eCs1QUyQKhzWu0uluLegy3EMyGAf3DL
         Zzx7oNV5gCWOxXYiBLfMvqLZXg1aXnI0wP2tt6EvXWqLjZO3fnDuGhAfW3WyMTudh/At
         Wa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775127343; x=1775732143;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zyGYGjXr8/MxK8x3KQaVB9GfT3jIQgl3+sN3N/vJgmA=;
        b=D115VyLuCnvi8121iuzZVo3EwhMT5lYxJ6I9OF+jAyed1nkFOdlyllOHeIwpm1o6Yd
         up7Xf4uqLgm/MMRznwRAROdctHFL5UBgQMjZt9Ah0mZc+fwODg6d8cww40UPI0m4b0D0
         5Tphgo3nXuemLpvthy4TzYboqqd1sIFx7Dy7PBVK8ZXJ6v9bc0bBLd2AZjtu1YxbPTdb
         NC8Bg8XyeErYCmk39W2U+4FRXDYgSQXLqxhr6H7grEp0MgLb4jN/NvlMw5jHAmn4qUUq
         BlxY7IGQ/X8HWklZUfqKzkjPxusp2IQs7YBqIMDurQVI5Dslj/705bmcQywk9oaw1pjJ
         vXhw==
X-Forwarded-Encrypted: i=1; AJvYcCUhN+krNDhSOH0b3Leuo/wT8xChtpi/tnY96TYXCwtoJIlL7huU1jhl98GgW3h8fqUMpwf5Qy3aI1TBxp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQFIo2nBdJt6VK3DK5n+UtljXWJFLjgvbCBxlmjmdxOd3R8co/
	+53YdyfviASLZU8/AFpIIRlJUyzMvLLon0N/MdN2/G/6tzaRuXzLhm3P/Z1N+KboJAxLuS/WEzk
	nJBJFU9B2ntT+pQcpwg==
X-Received: from wmbz11.prod.google.com ([2002:a05:600c:c08b:b0:488:888b:cf6b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c107:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4888e0b0022mr22992905e9.11.1775127343065;
 Thu, 02 Apr 2026 03:55:43 -0700 (PDT)
Date: Thu, 02 Apr 2026 10:55:34 +0000
In-Reply-To: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=948; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=bV7baRN/P8ziq+BlF+VlHBEOjJ2R3asSYMrZhFxs0IE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpzksriLV4sC5c4iDpl+9c+vvQmGoCtrOAWXznL
 M1X4GbLfaCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCac5LKwAKCRAEWL7uWMY5
 RmB1D/9FDNfuobmJ7/Z0LeRtTQxImRnE1HA5c5knL4XJ8VCg2t8a8M6NIUpxapEqKR6ybygO4Fr
 2LV1HljE8KmsZyn4rCQZa/IsC4afX4oD1uZMoZrNBQzxw5Xewjpxu2XMVgVhyEUU+s28Vob1t+T
 UYzJvaXFZuY/rJ1WwUfNbw2xaoiPxOx9Lu1iIEaMJORoax0ByUPa7ja5iIjXBeJ5SivyqL0lJGv
 u0IMoFh6R3824uVE4kGW+qaB3GR/kTToI5Q31lKDqfpvClz7Bn5oKGjxjqWhO1HhX2amfS0Q0eD
 B3fpiG2iSSC0OWIekCHy2d03u04lElEsQahhMd+qkM04Yex0UMfrJEBv+ZWXDcPSB8DU/4MEMeT
 h3nTox7V5qEUIffgPUXcFrF9t1s+E8KBFsebc9OsmoBDjjRm7/To1cvrgllbwCoPV3EsyOkL7hU
 HjcZQRESvRHlFp8ov13YMwfEsB9d2Adt1xPtqQqnkrtwdIX6376oW+fOH+AYXvTdeO/pUWdQcVM
 w5nYJsO0k/UgsWVlicWEyU+eiTijKX3D2h9dweY66Kdp74s2LwFgcGdJP7J/mWf9PiS9oZlCywO
 iS970oSILj72B6hOS0mPlU7n1eR5aSeEE50pI1WUyQFmQmOptlnHeFEvaD/OfriDKtH3J6YAH+E n5rrRtmzSW6lzRw==
X-Mailer: b4 0.14.3
Message-ID: <20260402-binder-crate-name-v4-2-ec3919b87909@google.com>
Subject: [PATCH v4 2/2] rust_binder: override crate name to rust_binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12597-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D134387FF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Rust Binder object file is called rust_binder_main.o because the
name rust_binder.o is used for the result of linking together
rust_binder_main.o with rust_binderfs.o and a few others.

However, the crate name is supposed to be rust_binder without a _main
suffix. Thus, override the crate name accordingly.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/rust_binder_main.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
index aa5f2a75adb4..85a15dd40bec 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -3,6 +3,8 @@
 // Copyright (C) 2025 Google LLC.
 
 //! Binder -- the Android IPC mechanism.
+
+#![crate_name = "rust_binder"]
 #![recursion_limit = "256"]
 #![allow(
     clippy::as_underscore,

-- 
2.53.0.1185.g05d4b7b318-goog


