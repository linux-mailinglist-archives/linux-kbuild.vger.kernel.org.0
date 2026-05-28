Return-Path: <linux-kbuild+bounces-13385-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFiiHuQsGGqwfAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13385-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 13:54:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D945F19FE
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 13:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2C823026496
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 11:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A543E6385;
	Thu, 28 May 2026 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+Sdiz2N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7623B960B
	for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969244; cv=pass; b=Q55xVjkbRiXnvjDNgGHK/iBOoAOr5D8fwJr1lcOfCkd6Rx3yG2sOxrz/99cd2yI5UZJt7shk80XUk2faZnggo6MOp/gj/aBaYgaI9jZdfM7jtf1X2cf0i2kN3ReiqCuwwFVhO5UlxffbnvXSSOJY8EiJx6IbJbrMHs5Sgr7Vp5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969244; c=relaxed/simple;
	bh=+i+7WT6hQq2y9ySvwKVLfO/vDchNz67s/vijWeP69DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtWudAhfiirzjO/EOn/aL8vX0jwaxVUv4CstP6NWn/zp4g6UmWjp61elgvyYjcaiK56TQJFmLiL/uvFm1vCHYbbgRL1+wEVCamhbUWjGuJCFMn4az88thnnXmFYrWKzG123BEj4p9XvZn1BQGzRF4Z0G3mGIWYkFsz8k6KqUluo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+Sdiz2N; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304d2c56402so37232eec.0
        for <linux-kbuild@vger.kernel.org>; Thu, 28 May 2026 04:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779969240; cv=none;
        d=google.com; s=arc-20240605;
        b=LhORrXojZiZJUtzPrUL+ITwmCaJ0JhUAapRrUr/gq+2Gh6Y38h09yINmfnLGT7OU7P
         hLNrUsCme/VmAwg8XT1H7vgfi1JZtZQJtrppXSA5wczVex0IxpSS/ZD6+UqlWGyIqcgY
         1/VqTXvKBVoftVxmKS2GL/T5YEGowD3enZeSJoUd3z0mogoeRk9B5L48z7Xgw7ABsAzN
         +nAVuBDtYSgDZL0JTYkXSucwzVD5gXJ7ZQ6ArengHDei8S6gJgZY/bBStVD4vvjLVLgE
         ik0xTNbZQkeW6vc+nXEtdWOS/5p+X2eu0lzrHk8wtsJgse6dYXKIyPohcczQQcKcq0Mt
         VonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9YWbdpeB3kBUHbSUawXWFsvVyi180Z90CSLxa8M6it8=;
        fh=RFS5L4rEJa2Q21+BdF/P3Rzh+nOFtEOe/DAO4xtXcFA=;
        b=XHXPuyByj2vAwbdMfm4ZJXmbE/B9NPfxfEKB+vBP8ls1Npa1LizQSC3FuM6kVsMsaE
         rqSiXwU/UuWowhV2o283ziYf+Q3QErpclCcsLYI8OBrfRDHzbCYAebrmdrHUOn+Jxmgz
         UoeCqiPja2821/z7LLRowGHTsfJmN2H0L0pd2VvHvUni87OkjZu/tYphGrbixsXp5ZKq
         z6UsSgQXBOR+mNKlhGsvBGMo53tFLGbBeNraa8vQiZOrqb1SZ5awf2o9CC3+skVhUWFk
         GN8OMegnh+CTcIkcAXod2MD4nH08DPIdKNx70KlfKlBfC2gFKChQCSq7b/lninbV3wFh
         394w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779969240; x=1780574040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YWbdpeB3kBUHbSUawXWFsvVyi180Z90CSLxa8M6it8=;
        b=U+Sdiz2NUoVAJzUntwkPEpwHIIgHYD+YgYQh5DCl8MP7oYZpyEPx3mnujvEurJvX4o
         yW59WOTWKLMwz+zLAKSrAR2CU4fuADaSh/dB6nHrxLWaDJrjY5kYz96W20PKGnKynMPp
         VVnmLk7gYScBH4kgumbFqzjVHhn6Sy/anmUfQDNxB1+49niRFXUOlojGL5/XbNP2BBii
         UbPd2yFZfZOrqZ/lVZPTHyzfqV1aC4MPINp/MD2A6nRo5+SAE0zRIsW89oyG00sE1Vjc
         fROVa28zUcgRXHPY0UR0waObqsOSLHAPvYabAxmo7buyK8HlFr0tiaVcHRYw6wWHxyJc
         Vf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779969240; x=1780574040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9YWbdpeB3kBUHbSUawXWFsvVyi180Z90CSLxa8M6it8=;
        b=UlnWypDUxKqSiqo1ALTwLQtN/KU9IgD3qmWNP00lDSb60FHxKEfZyrNwpdzS73zKK8
         fk+45qwk+lAC8x6l3+24UjlxlKtc7hNYetYOSIrn9UhEqBVK0pKT/hzLSuDyBwpvFlvM
         NkUuXtDa6UZqHiZJaYDtZCMV1HB30xXTh8M6HdOoFXm3v5Gcc0gbf6graj8eSzAb46rp
         z8HWe+tm7Fc5ItriSlj1J2We3m4EwWz8jgQ6jBKuLcCSiOvb6Ic1dyuyhjW6+/4SIbvm
         nTES10rUQL1XxFQ+eQOL8kaDEuUOBLmh0CrvBNGRWIqsJOb/ph6QI+EE7GxjjpDdcL5/
         fHTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lNiY9U4N59Pdf3AW7SYPE2mTOXCCP0Y1NIpGHq/5BRp8uUlMu4eGNHVau5Mf6Gm1wLCkk0QTiemxidz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF2LA2bl5faEVOx4givs6If1liorcIc/D7I7OrvvHTSJgLEuVF
	PqT5SGJO16Tigvnxt+QndiNy6NkYu/EgVwQ/W0HVW2pHwUH1r2PpUoMtaED271XndLObTCBieYb
	HRKEmMWyCeoMqdYxfm4DfLJ5roOji+88=
X-Gm-Gg: Acq92OF7VTlu+SPAnuGQT7LciVyMEAO4N3ELAUDHtQ1Sq6n7YavAR+W/2pQ+Ga0hzj/
	KiFXI8otqbE0wfvg6vnmSmbjjh/wlESZIPz80yLvBjuJH/ppXYN8jpG3FvcmmHvIe83EMl4Sb88
	bHXt/UGZjPUg4ifrmAEyIbP0LhuBb8b95noJrTN/eV5iqPNc6RjtNG9prYUyyNL8J89PR0iQHoV
	1zhyafeQRmizVOubR9tEkbIaWef6bX0JmPJTYbZDuQ/hHRyjTUaW0eNNJ9rYetQaszAgXCldjm4
	6B99V4O6v+YcfWiJd6Q2fiV5Ubhwvs4RxeX2+nMUub0w8ynv68Iei3WpPTOqEHU+8sf/ptvi6QU
	unNvZJZNV3xu8QcuHxl7jchwOYH06/8sYww==
X-Received: by 2002:a05:7301:6793:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-304d2ab127dmr475529eec.2.1779969240385; Thu, 28 May 2026
 04:54:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
In-Reply-To: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 13:53:46 +0200
X-Gm-Features: AVHnY4IpyYWsCqgASiWCHSdBWaUHYsVId58mzWvg96RYZDoZpq6E4eRyhNYy59w
Message-ID: <CANiq72=cKXdmxEacuGET8fuz_v5eFGB50vnOnKZZJd6iEeAAFA@mail.gmail.com>
Subject: Re: [PATCH] .gitignore: ignore rustc long type txt files
To: Manos Pitsidianakis <manos@pitsidianak.is>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13385-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,pitsidianak.is:email]
X-Rspamd-Queue-Id: 20D945F19FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 12:29=E2=80=AFPM Manos Pitsidianakis
<manos@pitsidianak.is> wrote:
>
> When rustc prints an error containing a long type that doesn't fit in a
> line, it will write the whole thing in a .txt file and print messages
> like:
>
>   note: the full type name has been written to
>   'path/to/subsystem/module_name.long-type-11621316855315349594.txt
>
> Long types like core::result::Result<core::pin::Pin<Box<_, Kmalloc,
> kernel::error::Error>: pin_init::PinInit<Box<_, Kmalloc>, _> are common
> during development, so add a gitignore entry.
>
> Signed-off-by: Manos Pitsidianakis <manos@pitsidianak.is>

Cc'ing Nathan, Nicolas and Kbuild -- I considered whether deleting
these in e.g. `distclean`. They are only error artifacts, i.e. the
build system doesn't create these intentionally -- they come from the
Rust compiler in a minority of error cases (where type names are
long).

So end users shouldn't see them anyway, so I am not sure what the policy is=
.

In any case, putting these in `.gitignore` shouldn't hurt, and they
are definitely not intended to be committed, so it makes sense
regardless of the cleaning. Thus I will commit it with these notes
unless someone shouts:

    [ Depending on the compiler version and the kind of error, there are
      two possible spellings -- copying them here for reference:

          =3D note: the full name for the type has been written to
'...long-type-...txt'
          =3D note: the full type name has been written to '...long-type-..=
.txt'

        - Miguel ]

    [ Moved the lines closer to the existing rust-analyzer one. - Miguel ]

I also wondered about `--verbose` (which probably we don't want to
enable unconditionally) and `-Zwrite-long-types-to-disk=3Dno` (which
could be possible as a nice middle ground if kernel developers prefer
to avoid the files unconditionally -- I asked upstream out of
curiosity if that or something similar is intended to be stable at
some point).

Thanks!

Cheers,
Miguel

