Return-Path: <linux-kbuild+bounces-11397-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CJ/JQRWnWk2OgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11397-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 08:40:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D95E18327A
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 08:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F65A30488DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 07:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D3C364E8D;
	Tue, 24 Feb 2026 07:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="Iz5HTNIs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A443364055;
	Tue, 24 Feb 2026 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918833; cv=none; b=IIFqFwb7TqgPSiXJAwt+uloAm/jwzHYVQnEVlbfPGMz9ATinbXgEutAQ1aC+ROAnbt0BO9RQTDt6et29pIFsbFWkEmLYJVHNJm/6O4SDEKtUb6fb+FJfoaPSd5szCGToVXtW2hFcVsdjWOBFA9FwEhlcxsqx8FZGttOiGbUqYdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918833; c=relaxed/simple;
	bh=B54aS2h4Gbh0Sjql2JuO9E2TlHWn5g2oy3nq3oOxxPw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Weo5axM9Y4kCxmYCyr1PVASUk2ZE7aAzoud9nz+otoEDM6mDLcC2cVFVkuLyJZKiZQqBK7TZ7V5bsAoONCYVPySrb03ILmbENZY7s7FSRt2bVKxNvaokUMxi8w2S/vnBdN4jXLZkQLgR0EpTpF4jEnDp0PgHBo7+4g7zrWULk+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=Iz5HTNIs; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:27a5:0:640:93ca:0])
	by forward501d.mail.yandex.net (Yandex) with ESMTPS id 0410A81A24;
	Tue, 24 Feb 2026 10:33:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id YXaYV7YGl8c0-NkAdRRC8;
	Tue, 24 Feb 2026 10:33:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1771918417;
	bh=d9U0QGJloAUl6Pctz/Vi8BIKTRD/NlRzH3hZdz/7PMM=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=Iz5HTNIsYzw03mTxFWhk7Y5lkQIELAmYPS5/R4VvcL1eEuQSZx/4256gxJ5xQeBEg
	 3pmRWcmkidC/6RTvVdLvy4xKHL8E0IuUOdReL5MSCjgN8wzPkS5deEr0qt9Yh1ivwQ
	 onHqjRzOb0FTI0Jc44g4zJC9sHvjH/OxqQa2/6ow=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 24 Feb 2026 10:33:32 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: kbuild: emit dep-info into $(depfile) directly
Message-ID: <20260224103332.6be95dca@nimda>
In-Reply-To: <20260224072957.214979-1-gary@garyguo.net>
References: <20260224072957.214979-1-gary@garyguo.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[onurozkan.dev,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[onurozkan.dev:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11397-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[onurozkan.dev:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[work@onurozkan.dev,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zulipchat.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,onurozkan.dev:email,onurozkan.dev:dkim,garyguo.net:email]
X-Rspamd-Queue-Id: 1D95E18327A
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 15:29:56 +0800
Gary Guo <gary@garyguo.net> wrote:

> After commit 295d8398c67e ("kbuild: specify output names separately
> for each emission type from rustc"), the preferred pattern is to ask
> rustc to emit depedency information into $(depfile) directly, and
> after commit 2185242faddd ("kbuild: remove sed commands after rustc
> rules"), the post-processing to remove comments is no longer
> necessary as fixdep can handle comments directly. Thus, emit dep-ifno
> into $(depfile) directly and remove the mv and sed invocation.
>=20
> This fixes the issue where a non-ignored .d file is emitted during
> compilation and removed shortly afterwards.
>=20
> Reported-by: Onur =C3=96zkan <work@onurozkan.dev>
> Closes:
> https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic=
/syn.20artifact.20being.20tracked.20by.20git/with/575467879
> Fixes: 7dbe46c0b11d ("rust: kbuild: add proc macro library support")
> Signed-off-by: Gary Guo <gary@garyguo.net> ---
>  rust/Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/rust/Makefile b/rust/Makefile
> index 629b3bdd2b20..1500993d7ecc 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -526,11 +526,9 @@ quiet_cmd_rustc_procmacrolibrary =3D
> $(RUSTC_OR_CLIPPY_QUIET) PL $@ cmd_rustc_procmacrolibrary =3D \
>  	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
>  		$(filter-out $(skip_flags),$(rust_common_flags)
> $(rustc_target_flags)) \
> -		--emit=3Ddep-info,link --crate-type rlib -O \
> +		--emit=3Ddep-info=3D$(depfile) --emit=3Dlink=3D$@
> --crate-type rlib -O \ --out-dir $(objtree)/$(obj)
> -L$(objtree)/$(obj) \
> -		--crate-name $(patsubst lib%.rlib,%,$(notdir $@))
> $<; \
> -	mv $(objtree)/$(obj)/$(patsubst lib%.rlib,%,$(notdir $@)).d
> $(depfile); \
> -	sed -i '/^\#/d' $(depfile)
> +		--crate-name $(patsubst lib%.rlib,%,$(notdir $@)) $<
> =20
>  $(obj)/libproc_macro2.rlib: private skip_clippy =3D 1
>  $(obj)/libproc_macro2.rlib: private rustc_target_flags =3D
> $(proc_macro2-flags)

Tested-by: Onur =C3=96zkan <work@onurozkan.dev>

