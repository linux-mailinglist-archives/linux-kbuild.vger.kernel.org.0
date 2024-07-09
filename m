Return-Path: <linux-kbuild+bounces-2433-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D06AA92B1B0
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 10:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85B7E1F22EB4
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 08:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0B613C8EA;
	Tue,  9 Jul 2024 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeeDMRcg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28C11D556;
	Tue,  9 Jul 2024 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720512020; cv=none; b=ESxG4HIjnwe+PZ+gV5maoqFV52JQoo3kPgA5CJNtEYvBKNUsBOunVZJPKVsVc6iGoooCaNJoSt6MF6vFowvEos99RjiU7jdQiPkWz8nAbIclT1IXmrb9CKQShQwMCY59qRyhdO1TO0GDoAZDk+DSQ8e+ngwCMvbg89x962eEjMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720512020; c=relaxed/simple;
	bh=2Z9frzwd0NBvTHBORtTb5ApRHghWV79ysmsb1TaQVJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJ6Yu7q2pH6Dwjd4lHV2+kVPr7bRihYiSl/cu/yU7RDoSmHAM6fBXPiWmWGZfmndDSWCQCyDO23qvzUnPCJwZP1z3UtKmWSfmxDU/EpjGElu5d2YZRuvbOu4dM1yzUksLTayviZfmPhYkaH4UOGJ+djO383fWrETVRgfz4LMs9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeeDMRcg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c961b5f215so2763325a91.0;
        Tue, 09 Jul 2024 01:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720512019; x=1721116819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHr6GCIr04Zg+ukzGcMwjVGN5QUCU4bpuoKoDkmBEnY=;
        b=aeeDMRcgSCcvohZSbDN8q1opB8XKhTOTe20B5fTNBgTnrzS8h/2fCK1vK1WR+E0TL/
         iBTR5dpe4pNE29x2zG2Clvhm2b+NWzHdAV19zVWoEhxIWX2l3j1QvtMA9qC0SGuOkSJ1
         zq7h76q/sD9NKb0krx/pKNGLee0LdOqkQB3c5dZNHM2TKt6PFNaKYjm3CNwuOjC3da/X
         DsDGqAhIZrP2J6KayjdRkEKMdWz0t7cq64WhuqIuNvm5OpP5eP9SCnU5TYyEvZu2dpvp
         cBmPSmUeoYNXDn82heb4d6kDSPzabn3uMK9n2TQzyTxfp9IlXbt1fnFCv4wRGsVXff3d
         fiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720512019; x=1721116819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHr6GCIr04Zg+ukzGcMwjVGN5QUCU4bpuoKoDkmBEnY=;
        b=Z4FKZbrMVIj/kMpNEX4MIbSwIbhi6rZgkOwwNplel98uBIgNipOmvPycjroT/ChEUe
         BNVU8gELeGIUf/ltnwHM0Gm0BfSPbPNaxXv0lhVyvlzmuyDt19YfFdbdnV5EjaFzYw6Q
         VI8YJni2ZNO0j7E4Fpgm0VaQgEFGnsr72oYmneG01fOMHiZ8+bREN0tMQRfyxML4dV3l
         RoY7WPMzMrXnr6BjUEK7Fm/k6qIttBfRQ1J81/jTLuGIm3xV/LPWG3vCO+oME3YUSdNx
         JVbvinjBovAFiNW6BbSbm0lQwDKkplqGxYL2hJGeOCTmQ8C37dqKSw9Z7YDXROGCCdPc
         4+PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcQe/+JWsw+IntosrnJ+Tj0IOJbDLuAG5giJ6JZxmhs9jAFbOSNEqT+HWNpjJFHVu+7xui3eqPQrfSvItws6yAryyAra1rbioFxmPYPpthBd1zq6tr2Zd3AlqpxkizvOr3sTvj/rmcLnDs+TFqXNRAYp6x3djopa//iUHEYUKBPYueldy0uvM5eJs=
X-Gm-Message-State: AOJu0YzjwrRkIr27vqFbfM4/InYdy/gotj3b9VXk/dyVXfpEs/jOSY7y
	q3KwjSq3H330eScBNEGeFiXcx0aDFYiMleebOftWdiHoSfcA6nMCbJlY2rpWaypiG4oxsSpIVFj
	nykA+yjr9DeaZSUF4voWAWn8329k=
X-Google-Smtp-Source: AGHT+IHPXDx5t+AzSiO3uMf1vO7103wf/cZhQX6ucziXqlj811yqZ+a9d4SMo+EC8Zj65vZ5J9pEAWuHXCw7V74ZRn0=
X-Received: by 2002:a17:90a:c387:b0:2c9:784b:4a49 with SMTP id
 98e67ed59e1d1-2ca35d3db04mr1489354a91.38.1720512019034; Tue, 09 Jul 2024
 01:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628004356.1384486-1-jhubbard@nvidia.com>
In-Reply-To: <20240628004356.1384486-1-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jul 2024 10:00:06 +0200
Message-ID: <CANiq72kEBCx=6Wab=0dSVkXeoYsR-=pYv7CA=8wJgVOxqwkiDQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Makefile: rust-analyzer better error handling, documentation
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Finn Behrens <me@kloenk.dev>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 2:44=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Changes since v2:
>
> 1) Used wording suggested by Miguel Ojeda (thanks!) for the
>    documentation patch.
>
> 2) Added review, testing, ack tags.
>
> Finn Behrens, thanks for your reviews, and please note that out of an
> excess of caution, I've only applied your reviewed-by tag to patch 2/2.
> For patch 1/2, the wording changed a lot after you reviewed it, so I
> couldn't quite convince myself that the review was still fair to claim.

Applied to `rust-next` -- thanks!

[ Reworded title. - Miguel ]

Cheers,
Miguel

