Return-Path: <linux-kbuild+bounces-13549-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rb1+Lj2EIGpc4gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13549-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 21:45:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3997F63AF46
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 21:45:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WsqSg2q+;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13549-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13549-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83CB8301E3ED
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 19:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EF748BD34;
	Wed,  3 Jun 2026 19:42:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4B837DE9B;
	Wed,  3 Jun 2026 19:42:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780515761; cv=none; b=S08nO/yFEecuQm4ET6s/VIvepkAsBCUGmhdhKp5jmZgZnd32DGEo8gjuZ1Elpu5yBf++WLe6jnVAoFFkDCmjtPBUgP5vXygFo/zgXkGyL75p0j4TFWZrZkJBtfX0O6U3I/wqWlfHwA1EU/qzFArwYHMOCn2W4WrqzPQVOafeulk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780515761; c=relaxed/simple;
	bh=JNlsqKLdrIcTMFBoamg7t9mZskl+z9MfIZvpIVk3V3g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=KIOX0vaCmrHnfbX7UG9+tC4eWnfMhgjldG5RjGKxS0eg09i11D3yQEtBpoeCi0bedm/iigIzEHWfQ5WSV7N0ecD3ctKWWwyYcw5fDC9EWunApjKNkeK41o0FvKoHVqVaBUEMU1z+OiyUno3IzGkUFYjox2s1HQboEnzKKiyRZpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsqSg2q+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19AA1F00893;
	Wed,  3 Jun 2026 19:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780515760;
	bh=CifWvCVyyEyHu+woCitPVm2tfBsBoA1T/8oKOSP/2fM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=WsqSg2q+P1++iR/nYDxIMYGMzGxXLi2NgquwZC0iyGVTAINns74K2//qO0TAbaRpw
	 0q+sKzcAqb3ZEl4noiykBzOonw6/pgpKaT5/j7ZRG6ChuMwdc55X2uBu27yBYzUc6/
	 FTxRTsSFkE10Q9UPq6qPE+L2zBfZteKqflOkbW6WwPSe05Y2urxYcJQnPNCgy0zVb+
	 l9sj77iuiOIBVdVQzqB26ESpdIy/8x3uphunr6njIoxVNTT6HWstgtnd6X9A6J8NID
	 sH6BATJUfFH6OBfJQxfPkj/rX60IosbMVEWcjivsk1TaZgr2/zLusnnp+wvbyzmyBo
	 zdkqZxplGcY9Q==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 21:42:36 +0200
Message-Id: <DIZO5QCPO6DQ.E8A39CGKVPPW@kernel.org>
Subject: Re: [PATCH 18/18] gpu: nova-core: firmware: parse
 `FalconUCodeDescV2` via `zerocopy`
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nsc@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Joshua Liebow-Feeser" <joshlf@google.com>,
 "Jack Wrenn" <jswrenn@amazon.com>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-19-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-19-ojeda@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13549-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,m:ojeda@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3997F63AF46

On Tue Jun 2, 2026 at 7:29 PM CEST, Miguel Ojeda wrote:
> Now that we have `zerocopy` support, we can avoid some `unsafe` code.
>
> For instance, for `FalconUCodeDescV2`, we can replace the `unsafe impl
> FromBytes` by safely deriving `zerocopy`'s `FromBytes` and then calling
> `read_from_prefix`.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  drivers/gpu/nova-core/firmware.rs | 5 +----
>  drivers/gpu/nova-core/vbios.rs    | 4 ++--
>  2 files changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 6c2ab69cb605..d97da0c0856d 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -48,7 +48,7 @@ fn request_firmware(
> =20
>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>  #[repr(C)]
> -#[derive(Debug, Clone)]
> +#[derive(Debug, Clone, zerocopy_derive::FromBytes)]

As discussed, it would be nice to re-export this to avoid the zerocopy_deri=
ve.

>  pub(crate) struct FalconUCodeDescV2 {
>      /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in Op=
enRM.
>      hdr: u32,
> @@ -84,9 +84,6 @@ pub(crate) struct FalconUCodeDescV2 {
>      pub(crate) alt_dmem_load_size: u32,
>  }
> =20
> -// SAFETY: all bit patterns are valid for this type, and it doesn't use =
interior mutability.
> -unsafe impl FromBytes for FalconUCodeDescV2 {}
> -
>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>  #[repr(C)]
>  #[derive(Debug, Clone)]
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index ebda28e596c5..3f8adfc2e4cf 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -1011,8 +1011,8 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDe=
sc> {
>          let data =3D self.base.data.get(falcon_ucode_offset..).ok_or(EIN=
VAL)?;
>          match ver {
>              2 =3D> {
> -                let v2 =3D FalconUCodeDescV2::from_bytes_copy_prefix(dat=
a)
> -                    .ok_or(EINVAL)?
> +                let v2 =3D <FalconUCodeDescV2 as zerocopy::FromBytes>::r=
ead_from_prefix(data)

If we import this as

	use zerocopy::FromBytes as _;

we can avoid the qualified syntax and just keep it

	let v2 =3D FalconUCodeDescV2::read_from_prefix(data)


> +                    .map_err(|_| EINVAL)?
>                      .0;
>                  Ok(FalconUCodeDesc::V2(v2))
>              }
> --=20
> 2.54.0


