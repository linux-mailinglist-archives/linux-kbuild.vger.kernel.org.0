Return-Path: <linux-kbuild+bounces-13759-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nER3ECNCMWpffgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13759-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 14:31:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CF80368F588
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 14:31:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=TqHuPx4o;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13759-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13759-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C165A3035CC8
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 12:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE32367B8B;
	Tue, 16 Jun 2026 12:30:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B8364E92
	for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 12:30:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781613053; cv=none; b=a+g2rptV0aZU44D6ecyTOZt+ZlMPyrqIvnEe7mZdnZWIlEvslQk+le34TxSmAtdxGRY5sLFv8Q/FHOS9c+giqqtvW1iIXaNwX9u0y1y9kPmrt2/p54FjEhCuf9PwEdTPgxDHfcAoXJv9v8FayVjXb8PpwU7KGF9IYKJDwWv5VbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781613053; c=relaxed/simple;
	bh=u01briDAvKMUw8TivlKgvuC8V59Jv57qkAmI27kzRfs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=YDMKWBbYsgCNo6m4MgdvldUfOy0yzPL3M7cRW2feU+WsCeZ8aN2X4ElUa7/ftwgScv1LI0LSMP6e4OXctnsIhRCOGdLFFDrwBNtutIegWKeqibIg0Bebfa26iwriQ00DtIG3DUqRBt0zVlZyGAvWH217/pG4xVDZSsvM6p0rs6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TqHuPx4o; arc=none smtp.client-ip=209.85.128.74
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490b9318944so28847545e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781613049; x=1782217849; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VQ+0+1VF0hgHTpAGgN4m5G21xwrV9nF9JpvOI7R2qy4=;
        b=TqHuPx4oooyEMii9ZC3TDfUWwuUMaOwzj7Xnpz7+4+N1VvGrezJ1MKWDtbIR3VyBYl
         pKdgHuNhv1Fxwm500QnM9Ey4Yp4dYyIUK9CaSjabhkIAfJfubsXibsRefOfjoR9u4G/R
         1+2oQ7qKkYcVQwTKoUGmrhP87ztWpVwor2kv1DgYD151Py9GEVRAGyNTkELSPjqoNakT
         MNC+nfUux1DHMFxJjXT/AIOHKczM8SGMXp7a/T7LYxOM8k+3byhQplOi0BnMizFn4eKi
         gpqT8DP92Kp6O4mwSejsDtRmeRslz0+gk4Po9Q3yEO3Hc267noPVPwn6S5D8DQwcqlbR
         JinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781613049; x=1782217849;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VQ+0+1VF0hgHTpAGgN4m5G21xwrV9nF9JpvOI7R2qy4=;
        b=XAnGW037ayOGHC4WvsK+OtH41w0pbN7ehq6f8QVhFzLMuGqy86BnV5LO0VLpVsw/Ho
         RwdYN6ihzDOya7Oq0gE6ALH45lrJRcJDbVzUx48CFnzLZjYLQWr+F8lTB7T0Zv35HUs9
         j8nZUzytOBnbcHsgUiAXfjpwKuBs5WZZbXpZpiUH6pTsvw+NAsED+mpWNtn1RvPtjVDh
         VlZ5AevfxDbip+MbTEQNz7aAUPpXlJX9stUe/LeZD/nzaexCvvGu+YzHt+vIT5edxwbz
         iTgYNR6tUo7ksXUtMzFrhprwdfvNMU05r6pAaey/zVfIBc1MqPxwa3ZOsj5jigQnNwuu
         AvMg==
X-Forwarded-Encrypted: i=1; AFNElJ+SifuYQdE8euXroOXo9b19gG4efqhlW0hLLh9GMPm07j/9HEsG1ra9NuXDJ8gLl4ahUUhanyhFGnuHFkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEYGPnqmcys4faP2kGltIeJjbBNTm2Dz/XV+5Yvm3EPzY7gEAJ
	T46cya/7AYRoHRWCTXhaFwP0p31ZFDXq0F4C9nf3iZC7+vrwLVRZQFMbrkfXDtc+JetnGGdqbD+
	EABWSuzaVywjtZNRr3Q==
X-Received: from wmbgz11.prod.google.com ([2002:a05:600c:888b:b0:490:c5d1:64bb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a44:b0:490:e18f:d108 with SMTP id 5b1f17b1804b1-4922ffaf123mr50220475e9.19.1781613048245;
 Tue, 16 Jun 2026 05:30:48 -0700 (PDT)
Date: Tue, 16 Jun 2026 12:30:38 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO1BMWoC/x2MywqAIBAAfyX23IKPMOhXooPYWnvIZI0IpH9PO
 s7ATIVCwlRg6ioI3Vz4TA1030HYfdoIeW0MRhmnnHYYxR+E+RKM/KAOdrQ22jC6AVqThZr+f/P yvh90RG/gXwAAAA==
X-Change-Id: 20260616-frame-ptr-fix-1c3733f3c764
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=u01briDAvKMUw8TivlKgvuC8V59Jv57qkAmI27kzRfs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqMUHybmE2Dd+mSNTjDirdx1pwtxCHN6jYdDZcE
 Bnf2ARtTOyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCajFB8gAKCRAEWL7uWMY5
 Rq0mD/9KWjAIESxGIflch1FpuvtpfCTx2LyT5cOF9tT6phtavw0gbI2paCTYZ46YpF00i25V1YE
 RfIaBEuyes86FVxhrcBNB2RxvaW16bTif1evuTX9oM4+tcSB+mDtVALgQLmdqCXu2s9p/WDyodn
 5+f/mUHRCbRwPz0Ny5xaE4mAwuWs0N8YRtPq+6MRiKSzoAM5SL2+UFq+bkaVtr/NweGnkIb2XN+
 yfSNEHa9Arbqem0n1tf9Uhco4AcoWZgukvscRlTlBNdnDwAJmCBxe2nu4hLD9NiXAkASSHMP67C
 pQir4p6JFiMjuO4H3asQp96g8W8t+M0cHHqs7nI+LBcH9hCHJ8xV+tPa2ezjk6rMiC4ljeE0YRs
 NnLv/MO6Kof7ocLnEgByTIPYtL2xk7TtMRNw1KcQMsHxXvYGWvVdmMrO0kCjrrJJdELHElQADVU
 ggEKAdhbJhZAcM+LLDz2lG4EaxSko2luYkq1q7i5v0U4CNRIJy9cLi1VQQRS/M/vgX5yzPmjidy
 eDWillyxQ4wcrSxqKteGdTob4QkOWz+PKI8dUYlL0Z7mhp0SQ+OcBa1Vy5HQPp6vKQyS8ELo8mo
 ohie5fPKciySgfnb8oCCiZYgf/iw6S7P1t4DSVagN2Fx4GJ5W+xJBpaLzBohbU1XlE1Eo+sEy+7 3QOwc9At2IzLwaA==
X-Mailer: b4 0.14.3
Message-ID: <20260616-frame-ptr-fix-v1-1-dc6b29a631d9@google.com>
Subject: [PATCH] rust: Kbuild: set frame-pointer llvm module flag for CONFIG_FRAME_POINTER
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Douglas Su <d0u9.su@outlook.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Fiona Behrens <me@kloenk.dev>, Sven Van Asbroeck <thesven73@gmail.com>, Kees Cook <kees@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13759-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:d0u9.su@outlook.com,m:alex.gaynor@gmail.com,m:me@kloenk.dev,m:thesven73@gmail.com,m:kees@kernel.org,m:wedsonaf@google.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:llvm@lists.linux.dev,m:stable@kernel.org,m:aliceryhl@google.com,m:nickdesaulniers@gmail.com,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,gmail.com,google.com,outlook.com,kloenk.dev,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF80368F588

Due to a rustc bug, the -Cforce-frame-pointers=y flag only emits the
frame-pointer annotation for functions, but not for the module. This
means that functions generated by the LLVM backend such as
'asan.module_ctor' do not receive the frame-pointer annotation.

This is likely to lead to broken backtraces and may also cause issues
with ftrace if these features are used with functions generated by the
LLVM backend.

Thus, use -Zllvm_module_flag to work around this rustc bug if using a
rustc without the fix.

Cc: stable@kernel.org
Fixes: 2f7ab1267dc9 ("Kbuild: add Rust support")
Link: https://github.com/rust-lang/rust/pull/156980
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5e73bba74da3..4bfa87e2562a 100644
--- a/Makefile
+++ b/Makefile
@@ -966,6 +966,7 @@ KBUILD_CFLAGS += $(stackp-flags-y)
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
 KBUILD_RUSTFLAGS += -Cforce-frame-pointers=y
+KBUILD_RUSTFLAGS += $(if $(call rustc-min-version,109800),,-Zllvm_module_flag=frame-pointer:u32:2:max)
 else
 # Some targets (ARM with Thumb2, for example), can't be built with frame
 # pointers.  For those, we don't have FUNCTION_TRACER automatically

---
base-commit: 0e0611827f3349d0a2ac121c023a6d3260dcecdb
change-id: 20260616-frame-ptr-fix-1c3733f3c764

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


