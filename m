Return-Path: <linux-kbuild+bounces-12152-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN3mOOIXwWmbQgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12152-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 11:37:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FAC2F04B2
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 11:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 229C8301C6DF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 10:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B269B38CFF6;
	Mon, 23 Mar 2026 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EDcqG5V0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E44538CFE1
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262010; cv=none; b=LWIp1BjaNOAUxRytGPdr4NQVvl8u7PZ0eqMI2OccKAo85/GZWATg7SSEqAsx7AbN5EPpIoqBrATcuq4Z3UBvJDbIHAy+pUfteTRX8//7UtVpKO/ERcVSp+oZBzlEiwvEEgKPe5otZlnGD1WfD5dBQd6JQmgpVhF5UWiumPTlr/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262010; c=relaxed/simple;
	bh=53rUKYZ6Ev6StBRMrNphYlidUiGFVuGCcOTfKB9ZX5s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iHtJsemoXJSARi4WdfP5dsPCrl1rSOieEzDscVBpk48cWW3zqtW4FW0pMmzjyy0UDKqHNOkDgYsi3kBaTcFsVBhpzX54aS0yV1YrCBnt7N6J7avU0JcwR5ot2NAcShAim+4HCarobEGVvk1s16NfPvDVEW84a/h1+gq3h+yZryE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EDcqG5V0; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4852ccff333so43937425e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 03:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774262005; x=1774866805; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4G8piVx0+ODaQGQapo4OA/PUeohca+HQnwKs+7o+GXQ=;
        b=EDcqG5V0hi4BU8TCrbT63HFTtOG1klSGUwBIk1E99XXosP5WYMUf0PaU7sa/nWQ73r
         P4lZA3/ImKxYxNwXvcMWFNY6w0OudhZ8mJKYaBpqPCtjeEjGrR3S2Oeu9EpX6B+vczYR
         w0x0+VYbd0BHj5PKjo/lLdPGcQ1i4hTAcWa+JUfyfzmfaaTjsaStjpoZyR/71KfsGIzG
         q1LlsTxz9QqVdm+izakVX95jZ/rgfJpjHB+JGqci4Zta9P6VSPksvg1FPQno5DGdiC9U
         x8aLvxuUMsZ2e39unhaiL+LkvDjoVUvqWpDFsogxFiE+44yWEcEyeHOXx9hmDwPE2YLq
         kK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262005; x=1774866805;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4G8piVx0+ODaQGQapo4OA/PUeohca+HQnwKs+7o+GXQ=;
        b=Wi4wWQXzeC6RutbpmUDxKqs3g/8XkhKbJhQRL6ZcHpukK8paxW9jsmQt+rlMDrkz0e
         6P/bvB6IZYx55VoZ8MXcJXShaO1Re6d8oKy3/e0DAFJdQfRJ/mhHdABIPo+keiJqS6L9
         roS++GqiThk1P/I0WZQYIBgwWZz9AmiZxBDlq8C4CXhhsfvSymfRhRufER1tcEu2AP9T
         PUp0zzR3qGxvltnfVmhtsBggZQrHd3MLbHhABGGDNlV2hflUeLbOdO0e2XwBBnP21hn5
         63oJgc0lpn9wz0nV7KKPhervFTXMmuT+633TyRwonJ+4GFLCXjnNg/AjOEI8P9blNuFv
         60uA==
X-Forwarded-Encrypted: i=1; AJvYcCWNyRvOueGhZdsdcB4kgct2di/3p8iHyIFC2Q0DcLNCOStyO9ICEO+bgrp1XbQW4ntsAyb3waUQFwV0lVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjrm30uvTvJ1xbXAHbEHv/HJuyiaHf3+W3kk2ERRqRzHco1vV3
	beD/IZ41xDj1azdaHetu/n0IWoDceYMT53D6DaIV/n1W7vpOur+/+NWTxYtqRBHF/DlekeZ+exe
	fsIpTiv0Gr0IghKIENw==
X-Received: from wrbfx11.prod.google.com ([2002:a05:6000:2d0b:b0:43b:4fd0:dd43])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a43:b0:485:40ed:2d1 with SMTP id 5b1f17b1804b1-486fee0fa3dmr154883905e9.17.1774262005542;
 Mon, 23 Mar 2026 03:33:25 -0700 (PDT)
Date: Mon, 23 Mar 2026 10:33:09 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOUWwWkC/33NQQrCMBCF4auUrB1JJrW1rryHuEiTSRvQRJISl
 NK7m3Yjgrj8H8w3M0sUHSV2qmYWKbvkgi8hdxXTo/IDgTOlGXJsOGINvfOGIuioJgKv7gTiYEV
 NQtZWK1buHpGse27m5Vp6dGkK8bW9yGJd/2lZAIfWWC3w2Km+N+chhOFGex3ubOUyfggp+C8CC 8Ftq7u249zI5otYluUNbsuASfYAAAA=
X-Change-Id: 20260224-binder-crate-name-15f14e134fca
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=53rUKYZ6Ev6StBRMrNphYlidUiGFVuGCcOTfKB9ZX5s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpwRbqkpL6hyDjJEZe2aS7ULUBHGN4H/W2qkXPv
 0E09SyI+hWJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacEW6gAKCRAEWL7uWMY5
 RqYGEACQB8BIiSe9SiaaNdyItKCKiqSiWZuXiT1YHbEPh3NQw+Y/51voTI1vLLL2g7m10puzm5M
 FYRNld5ehsOqEhZPPhNoaO3PJTMY0EeGpFm83oGxwBM/V/AedWAsdFEQGv6I1Yu3LBfne2cWaIL
 AItsWzUDKJnXX+PcdZ7NCATQk+rnjrdOVnFOVJQCJxW03ww+KBNjKVektgcbs+uLF4QpNHGFNF6
 KeA3kIW/zYSSdccmptVxT8uMHlXNGh6cTc90B12JJba2zIffx4a0htWKdzzRWHFpOkUkdUIbCko
 9neWraW4LULnWhjpPZS/YYYoQ8NcyXp+c9KUAoL1F685/ZUF//Mxitkr1pXxfJovj1oXIZFf9jP
 ZEls72F3dyfpVcaR11sks832zeYO1SmERjy8m6ZgQRHhLw4YCYMwy6UbIKnIWItWNABh2wMsnS9
 jtO8K8O4IgTZ/IBTWnAztPuP8IOJJQsdMWFdl6Yivuo7bjmZgLPRGLl9/1mWeRnw77IuQW6DeWL
 Cat+ayEzTwFKi4B5ez3mAn+424CEa/+lIWhRr2tep+PaVtNCMXPwzNc+ryOYHbq1OW/qLFh4pR2
 UfujbnV28sO6rjEaRviRb5UaqD6j5zrwrpiPHl1pj2ZOjK6NhoObg8f1AlzykSc1NYClT1YNFbH gqWRi1g5J3LxbXw==
X-Mailer: b4 0.14.3
Message-ID: <20260323-binder-crate-name-v3-0-c6e00f239fb1@google.com>
Subject: [PATCH v3 0/2] Change Rust Binder crate name to rust_binder
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12152-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 66FAC2F04B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the crate name of the Rust Binder driver is rust_binder_main,
but I'd like it to be called rust_binder instead, matching the .ko file.
This affects e.g. symbol names in stack traces.

Thus, allow use of the #![crate_name] annotation, and set it for Rust
Binder.

I tried just using RUSTFLAGS_stem.o and RUSTFLAGS_REMOVE_stem.o, but
RUSTFLAGS_REMOVE_ is incapable of removing the --crate-name argument.
(Even after changing --crate-name to be passed with = instead of space
as the separator to the name.)

This cross-subsystem series is intended to be merged via rust-next.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Move #![crate_name = "rust_binder] a few lines down.
- Expand on file names not changing in commit message.
- Make rust analyzer python script a bit cleaner.
- Link to v2: https://lore.kernel.org/r/20260310-binder-crate-name-v2-0-0f7c97900d36@google.com

Changes in v2:
- Do not pass --crate-name and specify crate name using annotation
  inside .rs file.
- Link to v1: https://lore.kernel.org/r/20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com

---
Alice Ryhl (2):
      rust: support overriding crate_name
      rust_binder: override crate name to rust_binder

 drivers/android/binder/rust_binder_main.rs |  2 ++
 scripts/Makefile.build                     |  1 -
 scripts/generate_rust_analyzer.py          | 28 +++++++++++++++++++---------
 3 files changed, 21 insertions(+), 10 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260224-binder-crate-name-15f14e134fca

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


