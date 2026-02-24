Return-Path: <linux-kbuild+bounces-11398-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNLNBtNxnWmAQAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11398-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 10:39:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A72F9184C51
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 10:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEF3C30B5036
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 09:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40DAC26E6E1;
	Tue, 24 Feb 2026 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mV+6Pf3n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F117219B5B1
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 09:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925924; cv=none; b=F/2nAsUrQfhfFZ6T9M3af8mfvrdSnqAcgCPfequ6gtkoQwwmlBB3RZS3sEG7j11Jhi1X3x2ZkKpMZhDPkLTQm7ahGO9uubY68Nan0lahkQJljMqbF+I2ocZtxLfxPyNxzHAgFRMlEn8nMrtarHDi29+GpGc3h0qD4FDXbVJTHd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925924; c=relaxed/simple;
	bh=/Pd5qdMoC8dai1US2WNMLW9PKQDRgsuslw1OCghlh8E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SxPoRSE3jOTsWbAvebGNVN3+Nbz2SOA1jWt7eu5Fvl4Z+z42zlzmBeFkeD+PcDydB5DubQkRiLOoR34czse5Y01K+bkKLrWWFGdP9YOUfkRSXakZi7wEJHj9zJ2aqKPOALrZ5LtR9AcFVB3HSCgOr5T4wK1fOKP7zVqPhfSmE7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mV+6Pf3n; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-65b93ec5a43so4056866a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 01:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771925921; x=1772530721; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2nBTYgewDD+k/FZqoLYv40zZF4/giLnf5sajOtxAWog=;
        b=mV+6Pf3nUBSJoLykIGfS4Ium4wRs62Q7H4Hl9z0aE+xCXv+yQuC1xjuiKBPFd7EWUd
         m5a5WRdHoBkZMARC82KAy3J/MYKfdHtl0iLMfm8E81tALkYf4lNB+KSM0aQpd2IQVWy3
         3IGcGyoxGY7bvVUgDASzYy8/Smh9lMSbW3vi6v6WMhA2oKbq+OI2YUMlyi4Q7iV/ClyH
         RR1hYU69RyxZg6iM5sfySzo4cEOi1vscxeH+h6WM/fmt1lqWsfVSYAcYTKY0n2S2u1su
         I4phzdjnl/XI5A0HyQBixa7XVbyclaRrZ1okKgdv7Nfrbwc1KZgABfLUm4+HeWe9+W4s
         XCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925921; x=1772530721;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2nBTYgewDD+k/FZqoLYv40zZF4/giLnf5sajOtxAWog=;
        b=QU9DHe+9QG+cbrZnWfEcect7rwpTdEQEAaFxJHTePRnnCtTejnaO4CmlLn9Q37KFfw
         Xwi+ibRvCcU/GhT/0sVWP/hWtUQtya68att30yBaHUgsE/yeC07pdlPQgiEI0a7GKTlN
         tfAe/L1FBkTjgSWlQVd3uy5vkaiwEuz2bu0ceEIwew+b9xn8pIaRQtTfBxl0LH9GL/+e
         3XiqGT4IBYWTCgTShwtEG3wche+rRQGJz60nx+z7hOsDY67HkQ4e/1h1Oc9NZO5FHruG
         dANIkR6rpEkVgt9k5ld2b5f5VzZnY+IFhwJLE6o4SMH0jIvOn9N3K1pA8OEAuDKR/v2v
         dkpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwPedoSyIy2eAenXYGUWlewvl/zq+65+rmNg4xnXOiwSpSn7XiBIldFXRwPzNssD6ouKy39ZQ8/FeGLrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoq61To95laI83JcUnWlEP5nYqumR1bB9+N6BFUYBsvlVySNwz
	YyhI6aePepAhyB/BT6wEoKo0kIl9VX4Ih9hqv3n9qesJq4hI/WW0MO8euSsgeuxwxAHMTwa6rRE
	Luy5kTtY9hdAgC0V/OA==
X-Received: from edub7.prod.google.com ([2002:aa7:dc07:0:b0:65b:a997:6209])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:f25:b0:65b:f5fa:afdd with SMTP id 4fb4d7f45d1cf-65ea4ebf12cmr6015503a12.5.1771925921333;
 Tue, 24 Feb 2026 01:38:41 -0800 (PST)
Date: Tue, 24 Feb 2026 09:38:33 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJlxnWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMT3aTMvJTUIt3kosSSVN28xNxUXUPTNEOTVENjk7TkRCWgvoKi1LT MCrCZ0bG1tQCU8p44YwAAAA==
X-Change-Id: 20260224-binder-crate-name-15f14e134fca
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=/Pd5qdMoC8dai1US2WNMLW9PKQDRgsuslw1OCghlh8E=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnXGcTowwOY0+D/3ZA6Rc6yffPQLTWTkhQohV6
 gsaYY84vLeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZ1xnAAKCRAEWL7uWMY5
 RpbtD/0Vn7ZCfpNguz42ozcDRQybhPFFkFIA9aDElyEshf5R23cijhhaW0YylZK2wE9jbngkWUj
 RiclyGj/LiznMrmT5vmoAjCku3Qs9/dCEq09iOg+W4Dnenhh07dNhiZjGL+G//8hmHTkN+POnHK
 bgfg6zdaDQlQw7ovZ4pnOrn05u5sPWooq7X6HfbMH7OrOU1XfMaETRKFY5+YaGZnXcx3aUxc7UB
 fHcaNrB08Q/1ko318a0Xpseg7pXvmesEIQAMnrZnDquuW4Uq/jzKqDwDdA1K/g3p5hhEuHAfiQ9
 CgHD57m7G/66pVMdiNOmyUKRBkJzuXrzZsGjvkFAazAzAq1JBTwYbRk5Xe0U7a93Bdkacn1mSNa
 NR6v/U8jUDuaVzCA9pmQinelFMjCtk2ozWf6gkiaRw6DyPjPSZftivsulhzME+btUjDD5PqAByp
 cWcNa6tzRfTeJYc8vxoYOLoLNXPkyGSoMIKvcEKXgIStCBu9FcCMMwf8RlNmUjwpxHjCXgcawKz
 hB87aPbA/7oxf2j0EAT2J9NaQPtml7FjshvY+6+3gTKPoP1TKN6SK+AVCx2E2nt3ZDMzWm9nfXu
 ZJuqgKrc7dp8dJRR3xqFMWE97ca3dOyuhg/+dI7JrQbGg6MDfbPc8Ist5BuXXtvUHNuf/puJTMB td/N6cCi7s+EeaQ==
X-Mailer: b4 0.14.3
Message-ID: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
Subject: [PATCH 0/2] Change Rust Binder crate name to rust_binder
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11398-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A72F9184C51
X-Rspamd-Action: no action

Currently the crate name of the Rust Binder driver is rust_binder_main,
but I'd like it to be called rust_binder instead. This affects e.g.
symbol names in stack traces.

Thus, introduce a RUST_CRATENAME_stem.o parameter, and set it for Rust
Binder. I tried just using RUSTFLAGS_stem.o and RUSTFLAGS_REMOVE_stem.o,
but RUSTFLAGS_REMOVE_ is incapable of removing the --crate-name
argument. (Even after changing --crate-name to be passed with = instead
of space as the separator to the name.)

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (2):
      rust: support overriding crate_name
      rust_binder: override crate name to rust_binder

 drivers/android/binder/Makefile   |  1 +
 scripts/Makefile.build            |  4 +++-
 scripts/generate_rust_analyzer.py | 21 ++++++++++++++++++---
 3 files changed, 22 insertions(+), 4 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-binder-crate-name-15f14e134fca

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


