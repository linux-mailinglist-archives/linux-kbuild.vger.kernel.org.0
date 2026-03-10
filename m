Return-Path: <linux-kbuild+bounces-11780-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAGYKiM8sGmohQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11780-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 16:43:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8E7253D13
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 16:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23D0B3133B1C
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 14:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC9F2F12CE;
	Tue, 10 Mar 2026 14:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aO0pe2HM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA433033E0
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154435; cv=none; b=Ke8tVqgxyQL9+DkytyJnZtAhehnNsVH3+AtomNMuc1CxdB2IKtq6kMB2DqOo4L/QnEqh9xuqkOglk+fo9Km+ulxzzc9Qo/BnT8EtEhry1mECaRrU+7sdfy8Z30hrcLvAnVshl0lWOKnW7CVuB3o3/VmnBYf4QAWeEAUAip55hkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154435; c=relaxed/simple;
	bh=o43fn1ouimE6mF7fFJExzH1ZAIFH5SPKWzvmwJePCi0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MjbvyLtOEUunhujYuwiywiUw/0VZKnIq412mj7xqV8TmTBmQU61PFF1DH0LK25DcTq/rpLopiqZMnuX1C0NCPS4V30kjTq5K6LhHVUAlUfBLiPYkpbxo4s1iYibvv2CRL84ein47TRTMlsiD+wYHSTSU53UBq7Iy5PVvn/WCuO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aO0pe2HM; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-662aa4b4000so1545398a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773154429; x=1773759229; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=umUx7EdRQjvOw+Q69mYvYZUiAUsBvG4iofWGqoVTOxw=;
        b=aO0pe2HMGX0i50vy0O1zp7fzwW20RzVIghG913xepVrMO5MkdjWv2AtXuYoezaIZq1
         9HuPyQKQoSYTcv/fWbgF5uAJA2pelvhFT1lUjS85HVHGSq00UGBchx6M9F+9WNGnGr7o
         xbPE9YzfLQzutuXRDY9GcLYGtOYV2lTFIKrcCabACrg5/pFrUisHUJv5pvGOPnXqNwuR
         cTTxGw/uovqFAJs4F0WHaNBMurTB0qiTpn5+LLZKDsg6HYym0pVj/0k1Y+rimovybC5R
         1VjUf0AAWfv+muFtNUUfDqVyqZCNXRBnjFcDollOAfhKDh2wbmXvv4afZ7dHCIBErxP8
         luig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154429; x=1773759229;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umUx7EdRQjvOw+Q69mYvYZUiAUsBvG4iofWGqoVTOxw=;
        b=VCVL5dafsvBRh2HttwYU57KRlXhDnCUJIN9n1ekXEFeEF/jh2+exlVTxHWydRuSVPG
         W+O/1MBXOLiLACprk7d6UhHZG8gXs1+a2nll/YUdJgkOiiZ1PKkpvVSew8fcaVAPVAK3
         kGG5XfbhgP8mURTJQ9qgHjUpVchP3SEIPaOjf4es6TJ/2B/D47aH+khmlF9dE1Dbtyko
         ABQf3GZQEHuS/3eSQ89hm9YougoIBk5isd2XBg02asC/DAJr5pjsHnvJ8pvzAFmF1bSm
         Wb/cq1NbmtGJd2DjxqLEtYYFkYcbQkgjwZc9AwEab71cuZ+u7K6s4H/Egl8ARH9P8G2I
         AUsw==
X-Forwarded-Encrypted: i=1; AJvYcCXNHCKM9Iftj7pYv6FMa5ld1bOApwnaIagnsL1pK++8irFhCfGvOjRhzKy9Z+7jlXAwR+lCp7hhsXuPDRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY5sUkUIX1iCkK7X7sNhi/EK7S+CoIiK3BNRfTXoTYgZQR+g9v
	G5f3f/VolfH34C8uRSWfHzBSm0a7shXFMQxVL9Tm8Sm3rayxZyP4GRauAldJKplmbccqNkuzjXJ
	ti6J3tR2YjKHJt3cA1g==
X-Received: from edqx3.prod.google.com ([2002:aa7:d383:0:b0:661:5b68:9ca7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2550:b0:660:ce49:f6d7 with SMTP id 4fb4d7f45d1cf-6619d54104emr8439961a12.32.1773154429060;
 Tue, 10 Mar 2026 07:53:49 -0700 (PDT)
Date: Tue, 10 Mar 2026 14:53:39 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHMwsGkC/32NSw7CMAwFr1J5jVETwnfFPVAX+TitJZogp6pAV
 e9O6AFYzkhv3gKFhKnArVlAaObCOVXQuwb8YFNPyKEy6FafWq0NOk6BBL3YiTDZkVAdozKkDiZ 6C3X3Eor83pqPrvLAZcry2S5m9bP/arPCFs8heqUvV+tcuPc590/a+zxCt67rFxKQca6zAAAA
X-Change-Id: 20260224-binder-crate-name-15f14e134fca
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=o43fn1ouimE6mF7fFJExzH1ZAIFH5SPKWzvmwJePCi0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpsDB3li4s4TWFx1ynTkM4Csg1XBDsWC7do+pzT
 znZCU2T85eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCabAwdwAKCRAEWL7uWMY5
 RhrrEACNZtRiBmEQwxDvpLcogFCd0JRRF3IUQ9TZ+5BbVjQnFthkvHlw4R8ZyFKxHrwy2UEahLu
 yiJJcImTyx7Lt2jkUEidrLs0t2k3Dz2XYtWJ4c4er15WykXd+2vgfSMIq5Ar5bn51NTt1UG4lLW
 umDlsA5Hu5Rn1NkQoKkUXjiCR95wtUIhJ2WhXwQesjmfp1FoaFSNprhXm6EZn1dOE1UWGbJBVp2
 EdgzxqP7qJo3/8dCtwnpVqPb7EfiKOC65i+xgMzlL6uwXyLW/i+P7vrDLBXj8eZrTZ8xtBcfyNV
 duNABUgMRrfHpc7j5QfyMW5l0G6iZikB7rvCq3FxGAUVExSd3bNhwE2UNpMNcmhLylCbOG+geyx
 Lc5Dn0VPmVemOUqfzZl/+7nlhmWH0ZZrkVWGABv4Vw8P0c4MTAwUARURXab+THrORl33hfaFwGf
 IGIqzJX6qZBd2nW4foDo8x15coMUsLbrFyM0oWy15Opfq/MuE15eTfkOKN9D5cjyqiqhFvoSCir
 mylUx2e7TVYOv/HkAwuvQ7X90t4NYhfc5dblDWBkcTbJ+/4cjtqcTmoCy0ls3toXPrMF4vz5RZS
 WS2KYlI2AX/f0x37k1jjnBQW3sMthuXttDq3aWzsaUX/OyA/QGKbmXXiBYjnJLJy+rEvD+K4i4h G8fuRWhILCsujWQ==
X-Mailer: b4 0.14.3
Message-ID: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
Subject: [PATCH v2 0/2] Change Rust Binder crate name to rust_binder
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
X-Rspamd-Queue-Id: 5E8E7253D13
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11780-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Currently the crate name of the Rust Binder driver is rust_binder_main,
but I'd like it to be called rust_binder instead, matching the .ko file.
This affects e.g. symbol names in stack traces.

Thus, allow use of the #![crate_name] annotation, and set it for Rust
Binder.

I tried just using RUSTFLAGS_stem.o and RUSTFLAGS_REMOVE_stem.o, but
RUSTFLAGS_REMOVE_ is incapable of removing the --crate-name argument.
(Even after changing --crate-name to be passed with = instead of space
as the separator to the name.)

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Do not pass --crate-name and specify crate name using annotation
  inside .rs file.
- Link to v1: https://lore.kernel.org/r/20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com

---
Alice Ryhl (2):
      rust: support overriding crate_name
      rust_binder: override crate name to rust_binder

 drivers/android/binder/rust_binder_main.rs | 2 ++
 scripts/Makefile.build                     | 1 -
 scripts/generate_rust_analyzer.py          | 8 +++++++-
 3 files changed, 9 insertions(+), 2 deletions(-)
---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260224-binder-crate-name-15f14e134fca

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


