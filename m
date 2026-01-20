Return-Path: <linux-kbuild+bounces-10742-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEGGNQfNb2mgMQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10742-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 19:44:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F0549B77
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 19:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C409F96BD81
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 16:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 324AC44E032;
	Tue, 20 Jan 2026 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXQWIyip"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06396312808;
	Tue, 20 Jan 2026 16:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925423; cv=none; b=qRC7JqX5qSGGnnRX/7cSbGchItIPGkSuroXoMcaADv+Ji3Rdc8rfZyH2SWAtONU0j4Fyv2wTeq3ynDs3i6mf4bwtU4Xgqcwx+UmbcyHUyRjLEUGP45wBf1hEc5+SD+q6CMa+6LyxSi/j4tPqpczGmCU3dBg02Z3xjv9WzVlkgzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925423; c=relaxed/simple;
	bh=YUl+LhnCdonRpYGTMZ92bm3y+7z3+HXBMWV6TQ5ziSo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kn4gsf4+LIZUQEakCNSLvZMbWz/6r7SBj0/xhsO46h4WkO+zZ8LdJVAeSOchQvfN11+g1VQTuWZI3er0rhQIGokjbWoRzqVsGudAB5bABxXxf8BFITyHSPSIRESdEy+Zdbi2GlncEfSue3BfFXXCsnKtMv3A+jCf6iKxeU00N8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXQWIyip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4495FC19422;
	Tue, 20 Jan 2026 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925421;
	bh=YUl+LhnCdonRpYGTMZ92bm3y+7z3+HXBMWV6TQ5ziSo=;
	h=From:Subject:Date:To:Cc:From;
	b=pXQWIyipA5MW+2t2f/1VFbvHKqq1c2rW9JSPlgesNHHGnr/WZMjXqs38PYxr8xnVQ
	 E8YGDU5zJER1bt6wr7Lb4/aVxhlxXkbeT10AFNo4b6rLJc5jXJGY2vFIzMcGdZXVU1
	 nVkS83g0A8Hg8upRou7fwRaS2rRLzITq/nawVVU5ya9m57GqAj2ks2FRa3nhprTvlx
	 u8AdIOpAnne3Syl7cm+zssxqMdkPU2V8XK8+bNlcnjDY4NQzW4YPQWkH5Ph6gGBCLd
	 EZgO1n7GyD4rUWBVLB983nzCMR1V7jBIVurgX1FXZj/kL194BSR53anfOgDPM7gNqx
	 22OEIazqsw3sg==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v2 0/2] rust: reduce duplicate information
Date: Tue, 20 Jan 2026 11:10:09 -0500
Message-Id: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WPTQ6CQAyFr0JmbQ3TyE9ceQ/DYoQKVTJgZyAi4
 e4O4AVcfsnr+15n5UiYnDpHsxIa2XFnA+AhUmVjbE3AVWCFMaax1inI4DwYa9rpQwI9W2DLHqq
 hb7k0PpyDQaziBFFnmVahqBe683uTXIud3XB7UOnX5jXRsPOdTNuKUa+5v4SjBg0J5UmZ5HgyM
 V6eJJbaYye1KpZdKfQawnv+t2NZvuNb/Av8AAAA
X-Change-ID: 20260116-rust-analyzer-pin-init-duplication-a22d05221771
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1768925419; l=979;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=YUl+LhnCdonRpYGTMZ92bm3y+7z3+HXBMWV6TQ5ziSo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QI1Ye+BSFkCY13+1/3wETPj/YKCMAD9lTdwd7uWuOC+j2NhFtcyxYI4mZ9wwnbW2kYgiKOcBlM/
 YAt39LelotAI=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10742-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 37F0549B77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series reuses `rust/Makefile`'s knowledge of `pin_init` and
`pin_init_internal`'s `cfg`s in `scripts/generate_rust_analzyer.py` and
reduces the ceremony needed to use that knowledge in the script.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Changes in v2:
- Split into two patches. (Miguel Ojeda)
- CC kbuild. (Miguel Ojeda)
- Link to v1: https://patch.msgid.link/20260116-rust-analyzer-pin-init-duplication-v1-1-5e85c5824a02@kernel.org

---
Tamir Duberstein (2):
      rust: kbuild: extract configs for reuse
      scripts: generate_rust_analyzer.py: reduce cfg plumbing

 rust/Makefile                     | 32 +++++++++++++++++++++++---------
 scripts/generate_rust_analyzer.py | 13 +++++--------
 2 files changed, 28 insertions(+), 17 deletions(-)
---
base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
change-id: 20260116-rust-analyzer-pin-init-duplication-a22d05221771

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>


