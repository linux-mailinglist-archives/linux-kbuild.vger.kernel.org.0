Return-Path: <linux-kbuild+bounces-11400-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMjjOA1ynWmAQAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11400-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 10:40:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC4184C9C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 10:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1EA3430EBAE2
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 09:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC0336EA86;
	Tue, 24 Feb 2026 09:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uYXwL/MP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F8836D51E
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925928; cv=none; b=OhH6VkRKXJv7celIC2PtaXXHjSzAvFn6uj7Ydv8MDMOreC0pqBhYbKHDKvmReP8fT11T0cJPWNDIs3t+QoheGTGSxMA/ypOnR9fSOFwCcxSWnolxwXAfFBNSJzQ1cTQGDXs7tvmlt3igSvfyatJuqe1b6YUKIULy7fFJ6GJBmCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925928; c=relaxed/simple;
	bh=Xk1lDWd9IQaBWIMxmn2RwMmtIq2UAwQ7MWxTqEsVdBE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m/lz27PhjRC1nT4LMg/IT31VE37C7DTg6fd8MOoQWg6zFauih0ZESLU17VCeNbRxspfhhwC+xCQIRdkOc+jkVLm9w4rMTwMNz9Ebkrv/h0Vpkv5e85DSIKD/tv44Jh5l9i04OhbpBZ09W034B7In6LOKIMDDxo4CATe/8AlAwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uYXwL/MP; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836cc0b38eso6728385e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 01:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771925925; x=1772530725; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8m9A/BV1y8Vavv6XG6dMjjtiowo5GrqxiUU8his8Dn8=;
        b=uYXwL/MPX+wVumXSgP5T10yeSG7cafH6N7HaPYBVMsqkWhKiKrEtbrIAdpc6moJEry
         EKt3BGX/W4BHY86HxRUFgkZwyknfakWneP/PYenLlGb5RKQkijJ/3cHrgZmkRSRFChkl
         T1SpKu5zewdHv4sYkV8lZIOW60hmQpVSDece40y41HUVjXfoREVrlAo1jfnlGXVP7/a0
         dzCHLawOLhezXlBpZnOAp6fDMucMvEpzvg/q5E68otH4EOC+Q2Jk60vmfOjLrWPj4CKy
         +ghEF4pkAxk4O3D/mnEGCnioL5XDqByyyH2hzLIu8V6Aa7WF2+mo2bsdFShe2pLh/5dF
         MAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925925; x=1772530725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8m9A/BV1y8Vavv6XG6dMjjtiowo5GrqxiUU8his8Dn8=;
        b=dBFOlCbJAC+I0FVaBr3uxbwVhxGIx0bDtKteyHXoEzTfGGuZyCy/7lsoAZ84yUHgkW
         xFSAmASf8W3KM5WU8/YcaT25+3gPeLuSqx+2SE0wLDE2l9d1Wn7e983LHgSZkzFyZ/Sa
         R6G8C8LPRQ3nBzgn+BOQEzU4OBmIzd/w/N/8u2+uT17f+eHaGNR0Lst1f/++T+3IOcP3
         BsZVTr+lDB/i1SJiSCf1i4S+Qr9KkInXbAAIj/ttSn3fOHOyJCoiC6oWkUwTy9CKQxs0
         5DbJIY12bQR3QM387cqYbBRx0YiGFK+Bdtvm/PsJJTHw5atvz+Uvf24bkwGPZ+N06hsI
         K+dg==
X-Forwarded-Encrypted: i=1; AJvYcCW0y+v9TjfmM12bCwusT+V8oHiCBXuYofAETR8Yjq0VQWPD0UPZ7ShDx3gI+smJhaZ9ErXIiBAOchJw/jQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLFzQJBwS1vqBPEvFeB2lqSi8NA8Di5zi9Fo100GtcuS4sl/fD
	2I1yREdoDpQuzzsSaZkRn/Qn/bJY7AcpnozwwIV+yjOfuM9FHSlf0loUvwaEe9O6wohxFHQTeut
	1C3Dp3mInOhYOnwdAFg==
X-Received: from wmcn19.prod.google.com ([2002:a05:600c:c0d3:b0:483:6ff0:11a0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d19:b0:477:abea:9028 with SMTP id 5b1f17b1804b1-483a95a9d86mr190052735e9.6.1771925925179;
 Tue, 24 Feb 2026 01:38:45 -0800 (PST)
Date: Tue, 24 Feb 2026 09:38:35 +0000
In-Reply-To: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Xk1lDWd9IQaBWIMxmn2RwMmtIq2UAwQ7MWxTqEsVdBE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnXGgT/q485BYjVEC7DcdrjqoPaon4Mtheaj2e
 ttnkPM05+2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZ1xoAAKCRAEWL7uWMY5
 RiqDEACnMUi2b4SBivjWw1SCmDjUa1u/aDm2uVSHI6BawvC57Z9WNQwuzy/RdcBTdPLsBzzjBuR
 PS8jLpIbAnPcjnccRfzV6xd9zf4CsziPjhkdFcxDKfo+l68IRV8Ikim//IQLtYBa4QwdmYMrvcF
 /2irISdDfqugsEuOryJcEohlouYmumtaH39VoXvBvEgt+PSKJEa8EpxzQepb/DyIhoXpFatgrju
 /z+PNyGNHjySE9FPNP0VEJoa7J3+Q4xrX8UB/gHwk8Ze5kaiZncleM2T0qwk59tKHdaQGJj3qMt
 BGhHkI2lpVAgM+hpFJCbSKjEK/lkwM5Zqrnpk/ECBPeWuzH5L2Cfa/txdDAJlV7tFFlUEK5jb/a
 5EBdgHUr2hR4jZEUcPqjFpPhjZ/cIoExfuRkZnyLZ0ob3spRgOxhZ3933qA/YXRymeGujZom4d5
 L/Xs3219iSVZx472EBx9Upnol8KCIsoxft2F+j1YoLj82HopVfY6kxL7eOAZAp1CsurJsklFAjJ
 DNyBlRthXnF8orEQafEJRSK0kjWeFjCvvP2WSq+9oakah4THzAdR/fsuhhHSRpE0GUxHAhhFptj
 MAWQux3YtlyJ1M3T+Bfyx507HjjFLtMfxFA7pDcQe9w0Y/HINt/+j3VVoUJ8jJeY/RvfVeZQvAL LLz0jrN9cZwSSbQ==
X-Mailer: b4 0.14.3
Message-ID: <20260224-binder-crate-name-v1-2-7dfc1289abbd@google.com>
Subject: [PATCH 2/2] rust_binder: override crate name to rust_binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11400-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74EC4184C9C
X-Rspamd-Action: no action

The Rust Binder object file is called rust_binder_main.o because the
name rust_binder.o is used for the result of linking together
rust_binder_main.o with rust_binderfs.o and a few others.

However, the crate name is supposed to be rust_binder without a _main
suffix. Thus, override the crate name accordingly.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/android/binder/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/android/binder/Makefile b/drivers/android/binder/Makefile
index 09eabb527fa0..a28d737d27f4 100644
--- a/drivers/android/binder/Makefile
+++ b/drivers/android/binder/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 ccflags-y += -I$(src)	# needed for trace events
 
+RUST_CRATENAME_rust_binder_main.o := rust_binder
 obj-$(CONFIG_ANDROID_BINDER_IPC_RUST) += rust_binder.o
 rust_binder-y := \
 	rust_binder_main.o	\

-- 
2.53.0.371.g1d285c8824-goog


