Return-Path: <linux-kbuild+bounces-10894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHxEOxHHeGmltAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10894-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 15:09:21 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 05951955CF
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 15:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF2BA3007A74
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 13:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E583587DA;
	Tue, 27 Jan 2026 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/wPAgie"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E7F2D8393;
	Tue, 27 Jan 2026 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522157; cv=none; b=soMt8h0x+WkYozVEqYvEldtIIFE19HM8ad7P3nLF0W2UdbbLxGoDhH/roj8td/Dn1Ooquq4Xm3v+ztnek3o6KGYZZtXweot9WV51ddTVEg43z9gOWRLdaIdnaFJdyg9Oi7EW31HUww80PZaXOLOx9gkoYd2h19yN+MC/RtRDwgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522157; c=relaxed/simple;
	bh=XnOApCJZsxjXKWDNhsWwSIo3IZmq3H7RXh6rX3oPpE4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HrXZagJ3+kVo1S/56FeDBS7azhkz6sGsmTw/4qRWw/mGmze1sqKHOucMD+ky6ndAZcafkQsiQWXNR4TmUv2IY6xam54XepaUrEhoC6/iDzUlPgSn3h0hN47Ta8MXKqfYQLu+O+wK78pkqaSXouJY8DIVMkxCwwufebIb7ERSkqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/wPAgie; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA94C116C6;
	Tue, 27 Jan 2026 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769522156;
	bh=XnOApCJZsxjXKWDNhsWwSIo3IZmq3H7RXh6rX3oPpE4=;
	h=From:Subject:Date:To:Cc:From;
	b=a/wPAgieIx6OrNxKLl+F2cZJJsLmZU4rO5Pg7ZnEdOS8Y8oHWlbk4uW7kqkOKf1ze
	 Jpr/bqIY+Wc93uM/8CZpKQwi+ocjkUg2COwX+FQ+yv4Slo0Oz6NbCOKHVWjmSe3WNM
	 kMlV6QN5XsZC13VYYS9UpYbIi8c9Fsc86LHF3w1nSrzOvqh7tQcR0PqHxn3EjUdDL7
	 ZolXZJw4cRovYYnRTQghd+ssj59W9tL7obWBMQfOumVCf3BQAjZ0Jto747MUwJO6Yj
	 a82VFtsG75GS95nNpZ99nfMU+hIgIOkjgOAqA/s1O/Xy/kk4uZBFDjKVbzwXulSU3w
	 ZiF/X3SLTA6ig==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v3 0/2] rust: reduce duplicate information
Date: Tue, 27 Jan 2026 08:55:49 -0500
Message-Id: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WQvQ7CMAyEXwVlxigxtEVMvAdiCKkLhiotTlrxo
 747KTDABuNJ5+98d1eBhCmo1eSuhHoO3Pgk5tOJcgfr9wRcJq1QY66NyUG6EMF6W19vJNCyB/Y
 coezamp2N6RwsYqkzRFMURiVQK1Tx5Rmy2b506HZHcnEkj44Dh9jI9flFb0bfX4G9AQMZLTOXL
 XFhNa5PJJ7qWSN7NSb2+MFE/RMTQYM1rsgrXc53VH0xh1cNoXOXJovvbsPwAFFIQ+5QAQAA
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1769522154; l=1171;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=XnOApCJZsxjXKWDNhsWwSIo3IZmq3H7RXh6rX3oPpE4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDJaQ09PMpuaop6UfUEGJzfXz/x+yh33pBJHCF5/dLyABuDUwUZQsRLbeq/Cgh8evCrGCVrDL+j
 zaMfpbVDHvAk=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10894-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05951955CF
X-Rspamd-Action: no action

This series reuses `rust/Makefile`'s knowledge of `pin_init` and
`pin_init_internal`'s `cfg`s in `scripts/generate_rust_analzyer.py` and
reduces the ceremony needed to use that knowledge in the script.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Changes in v3:
- Move flag passing from patch 1 to patch 2. (Miguel Ojeda)
- Link to v2: https://patch.msgid.link/20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org

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
base-commit: 74a862d251ad5f57b58738cfe0192d807b1a0313
change-id: 20260116-rust-analyzer-pin-init-duplication-a22d05221771

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>


