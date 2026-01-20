Return-Path: <linux-kbuild+bounces-10756-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOPDNLfub2m+UQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10756-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 22:08:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CE54BF97
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 22:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C2125AAAB56
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 19:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C96947A0B2;
	Tue, 20 Jan 2026 19:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDH3+ugy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBCB47884E;
	Tue, 20 Jan 2026 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937245; cv=none; b=NQvPEODMruMJoMitXKBV1AYrfO7BCB0ZY/HbElObAquH2wyfUCgL3ws4Zl3w3p9GUIWLQK0qnuPz+lbCTGLXu0wL264eqUQ+0a602Ik+vi+2Mk5V3SVd85maFPGd6iDdaV+rc3Rtpf+URrO8hJgKNP+3qmk9SyFUPx+CG7dNTAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937245; c=relaxed/simple;
	bh=if+kL/O8iAI2iqfjwBnNKaWo72op3Za5GKQzP+73q54=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WdIJX0B/8yHSPAcmJ2OfqtHfIuoxi5gX+57urwexL9T8cVMxNNo0g5s0mU6RD9LCk7CKLAv3oMELdOc0Tp6ikIOA/IGF/pgR35i9kYoRzLGE9kh8GgVD0xIZgO1c/PaVKVBmf0e1MztuxrkprUg4klDQDvXdAg3NC6mYkAetbV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDH3+ugy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE6DC16AAE;
	Tue, 20 Jan 2026 19:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768937244;
	bh=if+kL/O8iAI2iqfjwBnNKaWo72op3Za5GKQzP+73q54=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=fDH3+ugylGkTC+KohN4mkzSqEUYzwFr44MhQiH7WuEELSpjxKRYz8TeMOQEjEitgX
	 iFLTkvgY1IY/lHu6aTj3ZjHeUB9gYTiBWQ1ZRG5Z3meRLZPcdagy0vJmanNoEvzWQL
	 m97UZ8KtlCPZ3b+dGmMqNI6c9jagaARoPHSkgkqVK9m8e434iAVla4TppCrQgkWm9Q
	 8wtynev74zYcDfVsAdnPOSagvoWvAjqJcYoGwehzpCJGNdiR8YHCZ8gkC/oBFANEt1
	 iAXu87WznuKvJ/WLnqHprro8rDb6JrtOZHFGGe8gAAAxEOrUB4usGSUQ6LLnZKfnVY
	 PhEhglsMdKtHA==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 20:27:19 +0100
Message-Id: <DFTNX1DYBXWJ.24E4YYMAJSH9N@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] rust: reduce duplicate information
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
In-Reply-To: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-10756-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lossin@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,msgid.link:url]
X-Rspamd-Queue-Id: 37CE54BF97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Jan 20, 2026 at 5:10 PM CET, Tamir Duberstein wrote:
> This series reuses `rust/Makefile`'s knowledge of `pin_init` and
> `pin_init_internal`'s `cfg`s in `scripts/generate_rust_analzyer.py` and
> reduces the ceremony needed to use that knowledge in the script.

This is a cool idea, I don't maintain the makefile code, so this doesn't
mean much, but it's on my radar :)

Acked-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
> Changes in v2:
> - Split into two patches. (Miguel Ojeda)
> - CC kbuild. (Miguel Ojeda)
> - Link to v1: https://patch.msgid.link/20260116-rust-analyzer-pin-init-du=
plication-v1-1-5e85c5824a02@kernel.org
>
> ---
> Tamir Duberstein (2):
>       rust: kbuild: extract configs for reuse
>       scripts: generate_rust_analyzer.py: reduce cfg plumbing
>
>  rust/Makefile                     | 32 +++++++++++++++++++++++---------
>  scripts/generate_rust_analyzer.py | 13 +++++--------
>  2 files changed, 28 insertions(+), 17 deletions(-)
> ---
> base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> change-id: 20260116-rust-analyzer-pin-init-duplication-a22d05221771
>
> Best regards,
> -- =20
> Tamir Duberstein <tamird@kernel.org>


