Return-Path: <linux-kbuild+bounces-10942-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GB6HLhA3fGmvLQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10942-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 05:44:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC1B7244
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 05:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C36353006138
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 04:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F731239E88;
	Fri, 30 Jan 2026 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Or6DIQIA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053CB25A321
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Jan 2026 04:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769748237; cv=pass; b=ra4IT1zHKDnLfPOGQgyu6Tj8hflrH5RD66Ss2g8VeIoWh+BD6WtfqT5S6gd4ZyDpeG1U0pM7QCit4RF49QMPrzbvRGe1AsdLu/Ypw0Y1EJdR4b/w/RMjPXwOdGdv17cqtoqyInZ3t0gfSyUluGR742AHLRP7XRZnd8FmIMu9b0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769748237; c=relaxed/simple;
	bh=rPHmnBNfSq768nvupCmQ8jy5KslrAnbIxrxFleDwxqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7LaVN3kf/cQBC9atYrAEQz7AF7mSGW47vDN1WM861/HaGM9W/5IHgcGYUbGXUK4C3PTQsbcwsqA5ztQ/IvqBuwsgFnbGe/z+esZvGQ2sDH5/cdEBAN4PmKvduGjsxjYxRDgxVtncbw+Ky1gQJn6cE81Zb8YyzKOfX58LpUq93k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Or6DIQIA; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b79658162dso10322eec.3
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Jan 2026 20:43:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769748235; cv=none;
        d=google.com; s=arc-20240605;
        b=iQtygOr/feet+Zdp5k+qzCAzhLXQksDtQBdLjVw0q3fglNpxjPr5XqAdrh2kpMzqvm
         tFOWvxvxBa5iBpumcnCizAmDxQtJ6HEGhRLcQlbE9KkQ4kHaDuS3pBTFcIAB1L4A/AtU
         BYC54jfQGZMbmlhJS6lDzPSjwAF1UpfIcMk9gO5KvFPJEaaeotIUfhPXSa4qGdfh/lyG
         FRvYiX1XhMnCXKjZIp3a88bWDMU8Pz7vTG4lHwMQz4xAdQiT/715pkoqqmhCavXiQuy5
         2HyC1YGGkx0hUToK6g/AVW8o8sVudH/J0WUYZvtTQEH8pffwHVVqix0MUv6cl1x7mKqG
         7sEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=52/KGhuUUV3SORneydvmYhr8P6s3vPdT0wmx2vU1+PU=;
        fh=QzyJGm8yI1Jjo0xzX1OZnPNoJInYv2VTIWd7UFM9jh0=;
        b=DwugWxtlvdSO42SE9nlNUuPVjAvWHkzDYelyY4hIP4w2cIxRbWKPBk3+Y1u7nEd6Nx
         xwUACPuq8MKNkbz8P9lo/S/mT6Zs59FBI0JZDISMfyDdZr9coaxGIiFHtYwuCKYcdE6/
         0LyxR72nNOWGlrGaaIJiY/2P/KRo2jLyj0QPOFqEorahTXqdvkSs4dNTz5o7wkMz0r91
         9rEujg88kunimzULbfOGfnMRsZjZDLvMi9qVDsEMK/fM11P7P3BTL/7pL095XGevIWaF
         u7DyNzhRBU6UQPlhGwlVIYmss/2wwh19pSbZizGLlSp7Ga6Cy1UNLyHidcHtTee+SOAY
         bOWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769748235; x=1770353035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52/KGhuUUV3SORneydvmYhr8P6s3vPdT0wmx2vU1+PU=;
        b=Or6DIQIAzFogpeZUILauTGI17y2e3k/TX/tRCr966KRnUYQeiypBxR13kfZbs2e2Zc
         9JH0c6LC9SdNWlwEhtGEA2Nxodtmkncqn6e/AgygFIFRJ5/vGwszdt4VK8EAp/ln/6A3
         WF9SfyYcco53fwmDND8qYipI5174fY3+y5oq6PDZ3BtCUj4b/1Nctn5iQsaUDiJv2ZuV
         ChvVC2VPdoIhWK7MZl09EDkf87NyhEpyurnZJiJjII0PKc5wq3Ky4EL6L6RtsE13pFVO
         X7PW4ZZGjQvAEJBJtHnsxE6wCSi7nP3zZMGHcTQjoL0rVsi8w5j3J4MzM0wijJr/RXS/
         GwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769748235; x=1770353035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=52/KGhuUUV3SORneydvmYhr8P6s3vPdT0wmx2vU1+PU=;
        b=QYb1fKbI5vvxuk4uaDHeyquV+tJW41AlTC3JBrJL+R9KN4Az8YcNS3KYl8zm/8BDm8
         w2qhUlZOzPG3X0GQrSx8JLAXClHyr8K0J7vk8WARDJGVcWChJfxpU0DsWPk3vYI4GvO+
         4m6T7MxJ4Sh2vf2bH4oNFcEcI5vL6bFB19uKkv+CMeFkCOZL4nbm53H0I1xMvhzJvd+Z
         gzUijJip2rj97exCMMA4jjhjdoHoDe+1O+XXrQ1KRaiNRG+m9bZakPTO0S17VvGAUPOH
         GkrhyXuhMOeOm0L1AtqsBIkltInS+UFSY/6itX2EPaNv8p5Sgw+kyE3uCDjkCnJ0NHlS
         yvmg==
X-Forwarded-Encrypted: i=1; AJvYcCVYId18zlV5EAggbA7P2oRvOZu/bx9wYT6meVsl/OGuvoju5uqw+1oXt2XVDMyxqZisPqDCeu5yLMHX3IQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8xYXedFSqSCxkAgRd9kwbW73XjynIyo0pbuwmS7BLPwk1OtJk
	cxjMLyUa1MAonUGKtLicZujhrIq0Hhtx5WsVqC1XMwXxJDwjb9Jsts11NnvTEYBjBSR8t3vdZ1p
	5nP/Lp9sgF6yamrcYkqRQqdQyrzDsrCQ=
X-Gm-Gg: AZuq6aK/VKNdSbraL+3lCg6bhCzlwHM4GPLOAxA/a49kQohHwGB/SU6NM6D2HlvUnBH
	PCiNYxN3HzJUTL1KJKaD73Ou+200J3NiFF7rMBxilsD67eVh2kUNh1fQWI6/dj5mwQkXAC0OFN6
	jXtTSy7Q8RB02b0dzCMkPlfAlBrLs6H02wHJpvvTqWuGrRd/H49uhgey72JCZ2ARolik/ueVjIO
	lP6ABaGOVTgRsgm0UdPoaGqaR+pKs1TWPAetnimh4NnqYhiL1Q6IbB9Wu+VKIsNLc2nMcliCdrs
	Q4eAlh/fhtz5OWBcFuklvlKulI7YMOFaEBWTzo6XmLEm0Rb9roLkk92RssMR3wdNnGu1qvOQW0a
	DDeAk+vkq9nF+
X-Received: by 2002:a05:7300:8b15:b0:2b7:b6ee:b3c6 with SMTP id
 5a478bee46e88-2b7c8934170mr412675eec.7.1769748234988; Thu, 29 Jan 2026
 20:43:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
 <20260127-rust-analyzer-pin-init-duplication-v3-1-118c48c35e88@kernel.org>
In-Reply-To: <20260127-rust-analyzer-pin-init-duplication-v3-1-118c48c35e88@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 30 Jan 2026 05:43:41 +0100
X-Gm-Features: AZwV_QgkyklxREXPqiOOTu1nERsXziJ7gDmEXSfISYKn5XmyIr1pQK7Hvniypys
Message-ID: <CANiq72knqZ7-xXjuSdv4rAuxpY5u8xF8DvGyKVqWnZfGyRf2rQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kbuild: extract configs for reuse
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10942-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5FDC1B7244
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 2:55=E2=80=AFPM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> Extract `pin_init{,_internal}-{cfgs,flags}` to reduce duplication.
>
> Acked-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Applied to `rust-next` -- thanks everyone!

I rebased and things changed a fair bit since now we have a few
`--extern`s more -- Tamir, please double-check that things will still
work with your future rust-analyzer patch on top!

    [ The new variables will be used later on to easily pass them to
      the `scripts/generate_rust_analyzer.py` script. - Miguel ]

    [ Rebased. Moved new variables above. Reworded title. - Miguel ]

Cheers,
Miguel

