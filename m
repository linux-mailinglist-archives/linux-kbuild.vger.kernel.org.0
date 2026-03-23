Return-Path: <linux-kbuild+bounces-12154-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNeQA1EYwWn5QQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12154-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 11:39:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6626E2F053A
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 11:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E86330AB63B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 10:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B66339705;
	Mon, 23 Mar 2026 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ww32O2nZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAB538D003
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262014; cv=none; b=SoZXLBcn8KWEWMz2BDjhOgAKeTtuCVO+lWSp7xUcNypMzSFJ36r/pJDUTG9hR6tiSu5jE5n3Zmv5VmIqAh8PP5YxKtDsn9DjllcoJrVAo/psK/t9W45zkw/3D/0tb3tE/uvn1bgKaGleVsK9Xa3r6NQ9xL0n8/PQZZE/Na/YP0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262014; c=relaxed/simple;
	bh=L2u5gburzZY/7XO93yvgYkoOg3uqIzJkAQvetRwQOjw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UvHsG/hG1qA0Fj5s2iHN7vnHkZ/YyHUtOvijDx0ub2yl72cUrQhP2UPZimkYC6OeJvi+5uRSlJHatrU4Uc3g+mn6mMRFpijuMAsmJHEa52OO8H7tjV7jZcNcwM7ZVb8stY1cZTJwOoGC/Mj6+5//5/uCZy/hDMaBYWOt+GPSgUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ww32O2nZ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43b4454b459so1550571f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 03:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774262010; x=1774866810; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OIbXTO0shpG3u/cmn8VuXGF0aXIzJdvmOalLNPz41+g=;
        b=Ww32O2nZ6POJc9pMr4/r48kmSGIEF1Lk4oK9bELLTtsTe51veufRqvY6kxGhNaVUt9
         RJrCvPMYU+Nb41f5zii8miTFji6sahFOnqTmDI7GDcKGLEeoezE+nrV1I1Ymp4XrLDIh
         I14g7CIxumuH7P0XDAtfiDrE7lkS/0e8fCF7jHANPrr4dV3qJza4/c1rH3rDEf0AxTXV
         dQIiFT0dqRBJPkB6hyz6dhYoGFPUC6jRO12u/m00cjbe15bu2PasjMahYkJ5p1fF8vaa
         Wrtu3tjEJiLMhvaMooxC0Uh7+qm7ueWawBVxZmsnBFu8573tHYig+2VIjONXBt08qB90
         mRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262010; x=1774866810;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIbXTO0shpG3u/cmn8VuXGF0aXIzJdvmOalLNPz41+g=;
        b=inuNtKYvw5fhNin5/JseYI3dJ3CVZMC5NGgcqAzJks5vgizHGEd+G5RsESmDWJho5A
         vm8SLKM4BnHSRr4e+LkbnVPRdCKH12aVG0ppg62gnPckBsXKyFsQcq+tXKXkuPk3dqUv
         pQAPlhdcYwWQfJwywHE92soWjNPPRAfm36JS12gfxcPB1Y+otTxs2fex7lf+n/Ug042i
         8pVs4Ff1DhzQI3DKiGQU3dguCvtmu91ixX0tdW2XAKz1SZjgI7ppclU70/3nUabf/Ts6
         3l2mQFxVp13XMYoD8xCFPH0/SNheOUSH9aF8RBsWI5kiuAF/guCtMz9rZXLHeG5puhnT
         Gt6g==
X-Forwarded-Encrypted: i=1; AJvYcCVg2552lPnX/FFhd1+GVtuQoBlnjzB7uDn4EChOg/RA/oBLduYCEbhd/TKbc4uNQLApJNkvWhOoOIVf8XM=@vger.kernel.org
X-Gm-Message-State: AOJu0YydtMhjH18jHpA83ULefVP5+823frUcmpt8ZZNHec+tRIegD2er
	x8Tp3RAFo4Xqol28t6BDkX/3U1be6+Xe9KqyvqbC/Q+tfjgJGe2s10xuSackQEZtZ+xxvTtKP0j
	05XDsza1SzMMN5QLF8g==
X-Received: from wrtv12.prod.google.com ([2002:a5d:610c:0:b0:439:b9cf:8ba9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400f:b0:439:ca9b:1f61 with SMTP id ffacd0b85a97d-43b6424e57cmr17070305f8f.17.1774262009888;
 Mon, 23 Mar 2026 03:33:29 -0700 (PDT)
Date: Mon, 23 Mar 2026 10:33:11 +0000
In-Reply-To: <20260323-binder-crate-name-v3-0-c6e00f239fb1@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260323-binder-crate-name-v3-0-c6e00f239fb1@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=L2u5gburzZY/7XO93yvgYkoOg3uqIzJkAQvetRwQOjw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpwRbzSh1309KzlcORas5hUZWUsSo+KqrrwcZnp
 AAdWKM+8TuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacEW8wAKCRAEWL7uWMY5
 RpqQD/9aIOA1tRdRk+GQ3y55vhqBamOVZsc3BxxDzBg+61yjANF0itwsVUg+xYw4qJMi7JvtQ0y
 Kdt1S837XiwNA496ehxrQxv3oghE5twceuz33R6au5MO7Ss8POR9Tti5RQn/LizUvdw8D45S6ZG
 14FnUE00ukRzl3CLONODMz+qsRG+zDj4zS2Jyjr7ggjiBLs1SmKOp+TeYHsY7TYhj8U3evo14WW
 7ws6CELqlbtj+qcpQaKN49vahtoSemCkBrE55tpYSrgOtWlz9xl+zEGLz14bftoPUfcKyzGyKAU
 8rIhFZRiAPyhF+9SPZ+fCvpoZI+CvuYSBC5fV2It8U5CODJMBuTEVIuIRBDlC5rUQ1unxoyfE3e
 +WabokTqYBDPBrX7tHuw0MV1NPedtuTIkAzL1rFrH45LzMwEsF6uTdMfPwY0xTywZ6qalgG6YED
 ycvwiXGCCP20RP02XvZsXaurZXr+TXNBUCmtbofiPipxkP12sjabZ1s6Ysz9O+MtjU2OizzW7c7
 XlxDnYyK6xGJNtzOm5RSGmbSf9Xp9gRzHxVMk54qW65HbghruA7BvxBQKx2rw0KNIBg/Z24RB8f
 2ujd4CSGSYnpkMmtEp9s22IDNIGb3Mti9m1UCQUImu13JzkYWBWSH7t31okTfHOUnxZKZSTBiks ydU+D0EGiiUDRqQ==
X-Mailer: b4 0.14.3
Message-ID: <20260323-binder-crate-name-v3-2-c6e00f239fb1@google.com>
Subject: [PATCH v3 2/2] rust_binder: override crate name to rust_binder
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
	TAGGED_FROM(0.00)[bounces-12154-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 6626E2F053A
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
2.53.0.959.g497ff81fa9-goog


