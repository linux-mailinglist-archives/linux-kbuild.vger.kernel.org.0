Return-Path: <linux-kbuild+bounces-11782-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA3oKxs4sGkKhQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11782-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 16:26:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E3253585
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 16:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CDEC33EA08B
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 14:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BD5303A01;
	Tue, 10 Mar 2026 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZG3zkdFT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24D0302CD5
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 14:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154436; cv=none; b=qhFmzPY0Dt04xvw2b+DUFQaAwvN8OsIWNGwgsn0SMoqvr3dC+7pYrD8HnPMfG9HKmxz8/13B+xYBqns8ito4co5EJltU4izOj6q0+8lzsAtMPjYskLW2my+FUr58QKZ4112nDcVKMpkkh2jyYCUzpx7M3tJ1fHk9mrDrb709vag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154436; c=relaxed/simple;
	bh=cY6DKEz6B6F9rSWVgqrMMhttMqGc5V6Xd0spRFKA5+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I3/DnMAa0otK13ZqnItOWwr8nB/50gWobEXJdrMO79GWDc2Pb4j4cu0rBFyDalhMaCsBwHVhSeCYaSvEyFvmx05lVQJxFRZBRn5oxt7GSHTIfCK6lkf3C6v/aqtKlj4H5LV6SiApSQ2fo1RWWyGK83Ogmt1HRuB7kv1qgxeI5d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZG3zkdFT; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-661827d7a81so4575232a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773154432; x=1773759232; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LXxRsUcVZGooITxYkuZC3aEN++rGhCtcSjN37MU6sY8=;
        b=ZG3zkdFTdLn2A8uGkkKpKvmVvXjkJc9z+lKfHHNsKBjRAkSEQLgII8K8RzarRzlIMh
         hwGp/mxVrxmWL1gICJe4qlZkR0R0WrsPwF7c9OrDCnAcR3OGPJHuWfrG3C3wmJm303oZ
         0XitoHyHNCLX6NlGL/H6UUd0TUvRyGUmVfVT6CHjzvsBR+Dt0vGzrnhzUS8MJH3PCOG2
         etuzwCzk08KL8JPrLgSUidAocl0fR4D6IV36rJBSP9WeSWMCd2xGJyOFt4hQvhO2aS+O
         OBK3jkKFeRFIrjxZ2dP5nEfIyslUrpM6u5HlzyW4gEG06EFaAdV2GVoH7MWuPgOpXrPv
         hVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154432; x=1773759232;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXxRsUcVZGooITxYkuZC3aEN++rGhCtcSjN37MU6sY8=;
        b=UoaP8Q4uhVsgW2SE10P+cJaTBlPo2m/6ppkOBhJ3OJfNEM+Ahthdx+A4bdSePohql3
         NpouSI08tqu7Hyx2n1ufh91H7JxTAUhdjbwSrhlZpYQDOdS6W+XdvPp1/uff71PlepIL
         GbbeOsP/DLN9asbmaUtbomglYFwvZ0k30aMJi85lhdmZgh43w8cjhTSGs0H0hgD6CERK
         hqfXmx/t1WUzhhIPSg0EJ1yOxXNvHzBtBDA7ycS/lfC1ePFwSdDhat/V5Jnd5cDuiZ3w
         JyggfG13vuH1uMpUMrNiuvWLoU2uGTZJuQdNnBLMo6qk8CJKET+/8nSfZI1hIo/d0i5S
         7B3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWs/vVGj/3mf4Eh+DqTb4My4NfF6oYb7rqsfyGbJa1afKvHB/A1sePQZ/YYFtSD2MnxqOq6bIU1kUWR9hI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeiYL198cFFGwlhR6/q7inxXtBM3BOUICJExgmroAPyA9atukk
	Jl5nDLNoPZUhxLcVZTzVtzkw5sJqw2iEHOa7+wFjvYmYSllhC5+OWEHbBwiCkvoO1z9+589tJVE
	Ttt9/m61Y63VFfDBvmA==
X-Received: from edbgy4.prod.google.com ([2002:a05:6402:5bc4:b0:662:d4e3:3c3f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5297:b0:65c:5def:26f2 with SMTP id 4fb4d7f45d1cf-662ba75c08cmr2251051a12.11.1773154431614;
 Tue, 10 Mar 2026 07:53:51 -0700 (PDT)
Date: Tue, 10 Mar 2026 14:53:41 +0000
In-Reply-To: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=cY6DKEz6B6F9rSWVgqrMMhttMqGc5V6Xd0spRFKA5+0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpsDB7jo28XWHraaIbZEs4ZPiy/1gjlkLBiQ/rz
 rz0Yb0G+XyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCabAwewAKCRAEWL7uWMY5
 RmUwEACQk9pcbTkR4VN+emXNH4WS1qlo1JojOLfRikbe8ojkFYZm2BZbxG26HFPzMVV+1FnpndX
 O1unZmK8CcGYNYGk080M41kDzqgpfgW8aoM4yvwmEJbFTvec7I6r8vuXf18aRrQSdPK7CfhVxtc
 BSHYd0aTmhoG1lyvfE3PeW9Aa65hlTpYLPdQWKqcutopqBvEphxDaixoFKme06L4u8Q6vZga23z
 DNMLw+2o/XEIP8J2a6q1Z/0JLi3FY5RJu9vDQliw+6qBCx/27SjZigcTdVz8XCNgz2Cju/QI7GR
 Ju/WLkcjKQaY93xN36FJlaIPZjk0synEAC5bBsWf/cHNMhtsQUfzff5FIojrPSDTdabifRgQ+rY
 2Dp4uUPf+XFhJFCtTePv+rD3M677OR2aMfE7baMLnUBqYxn+dJezj2UNrUvK5j8YU0ROfDeovIZ
 t08DmScIf6s9yvT38uIXQrbLITN4UE6s++Cq1xHuNkHY3FyquLohKUlXSfmeEY9eBcpvU4v97Rj
 kdAIJW2JFVytog4ICUz9J6iQ1OGbVQtG/NXnNUZjVsEIn5xNLB5VVHV5a3NE+f3utJ5SDmHGmLl
 tC6KvoUyWmZEDNLsK5N88GQ180bdz1agD7tFjZb//49fD7UTuGKIPsWLRMtyIZx7Yk7ZS/JPWgc L/PQNYIbYDypoxA==
X-Mailer: b4 0.14.3
Message-ID: <20260310-binder-crate-name-v2-2-0f7c97900d36@google.com>
Subject: [PATCH v2 2/2] rust_binder: override crate name to rust_binder
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
X-Rspamd-Queue-Id: 1B0E3253585
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11782-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

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
index aa5f2a75adb4..14162af0f5a5 100644
--- a/drivers/android/binder/rust_binder_main.rs
+++ b/drivers/android/binder/rust_binder_main.rs
@@ -2,7 +2,9 @@
 
 // Copyright (C) 2025 Google LLC.
 
+#![crate_name = "rust_binder"]
 //! Binder -- the Android IPC mechanism.
+
 #![recursion_limit = "256"]
 #![allow(
     clippy::as_underscore,

-- 
2.53.0.473.g4a7958ca14-goog


