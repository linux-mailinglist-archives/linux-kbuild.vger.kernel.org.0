Return-Path: <linux-kbuild+bounces-5401-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF5A05D18
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 14:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 277FF1882CDF
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 13:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DDC1FBE89;
	Wed,  8 Jan 2025 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMFyzzZd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EEA1FCCE2;
	Wed,  8 Jan 2025 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343826; cv=none; b=QXzyzlYrKZ5W9yqlYsHAFyRPNPZkQGr6mc9mqHPhyj61PKgpA1HvHNusEN5QGau224izzpJbXKEeLuznucRMi6w+UcpUiWTcnoW0MBUAbh/amNdLSyv/IuwhpzxR3PytXdH5UuewpmSWP/6dlMRV6c64Z6LjfFXtgdgjMYufJRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343826; c=relaxed/simple;
	bh=iqhdiQgTSiDzizYdUIJBjiuqtzBDTizyoM7+/pcjwRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGoYcKm6Qlv5Is9ujGkJyaeXaVjW1QzMG4YDaajDqdw7mZ6vfdCNyAFenz/eqcLwG0jHYd+V4ZhmVhT4PrvbxqVvzOwpJSO4mz1oBNwe6Wv0qwgtXyH63G5dNc96ZXfCb6f+tcd939w3LZla1YTG+T+PWtQ/R1qvca5vjJ0u4p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMFyzzZd; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ef05d0ef18so3605531a91.0;
        Wed, 08 Jan 2025 05:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736343824; x=1736948624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqhdiQgTSiDzizYdUIJBjiuqtzBDTizyoM7+/pcjwRw=;
        b=eMFyzzZd0bTavj65cTDXdbmwVXh4EVHIMXbOwROp4pG5wPYib6iJ9TTZ6uNEejGiR6
         DYK3zvLgecJfCjqG+HuMolsVANbTyJ3wkmPo6AodPmojFUOJpEbndyEpTz1f5wii2mpd
         ijalbmawTPflPPTvH7aaWN0n/gYXQ/51pvRxTdhXMl3EJlnTbP14/aBw1DraG+mEUkKj
         kzEAl2VlN8QT0W7s++8EiceIGHUtpKK+LuzvZZbg6AUeOkucf+o0g9Vlgah/E5zMK5mF
         Fpi5++qxh1wIxadojatfl0g7a7fHa1+2Yxpdtr4/xihJeHkRPTbQIzkoT5GdbTLpl6dE
         wQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736343824; x=1736948624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqhdiQgTSiDzizYdUIJBjiuqtzBDTizyoM7+/pcjwRw=;
        b=gpyapDBvBf9fn9wiW7De26A4uIJo+CpFnZW/5x9ogYP+GILI8bVhKkSYVfxbMxML91
         zGmamZCCuhm2jJXiEk+IDMIOZL07vbktqr1nkAsJziidVX/NRumijEFdgXEzT9v19B7A
         qFtI50LX3pBXVKQTop1/INifbpiQwdwp8yQXJGU8osUaZXHv7FbemRkEmUp/a5A18Z31
         EyuZkhUXulmrW3TxxI4R328hmV+yzg37IU0LHFtUPgIyjWEY/kJ315k8smiWMfAL0xzo
         ewC7GcccwMkMeC0o0/FXQZ5r4q5qUakTKGSwRPYivb0O6n1he6VpCGdM2rXjSHkdBKCV
         h3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWl1AMCjUJQbq0S9aDDTva93XtPxOH8lZoNWxE5zg0pnou9gAKanei0wl7KLmWuSPKcUBCtbJPdnHTPl0A=@vger.kernel.org, AJvYcCX+qLRPorUgtv8jtN/VZH49kt8/6BhJUNRkFOYmIlR0MUP1LedKoQlodSlwOpx8xSq6eQ/+yaur/el9HIPmVOY=@vger.kernel.org, AJvYcCXfOc1Bcq55zZJMiEthhNQSsW/SJqrsCUGMmMg4kD0nFj1XqeIDtMEpeKXuv0Mwuh+qwhmydINzYeKSoUPd@vger.kernel.org
X-Gm-Message-State: AOJu0YwPpe/3ApsEDgKNgsWLyTCY58gDYjhguYAVZyuN8Mo7HMxHK6yV
	tEa2yB51iAlrzZ8bKyf1WetdidLMGEV2hrVsHHcbM+whMNtD3eMadJIm7lZI4+qW97DInM7ZvHo
	kk8F36k3abT1CW8wqvXYODMD1bLsqi9H2
X-Gm-Gg: ASbGncsK8SpOiktvFbQIznHswdR4DZrF0FN3IfWAzUAOLxIKTFJp4Up2xNUTO+SZFDx
	akwrW1N1RzC06WadGLn3nmEfG657q2lDr48twgQ==
X-Google-Smtp-Source: AGHT+IHlBOMStfp+zDCgjsiRIILWoAXtC9KGObHDr7q5oWUtQY4LVtLO7Xcp/DYCLB+wGMJ+B/Fy4C9MoVcT7FB2Cm4=
X-Received: by 2002:a17:90a:da83:b0:2ef:93:154e with SMTP id
 98e67ed59e1d1-2f5490ac7d8mr1627816a91.5.1736343824274; Wed, 08 Jan 2025
 05:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
 <20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org> <pw5PzA4YGsu7j6ET_-OYE2oq9l7ixtTTGhHtxMxmMP5ggHxLrjzMkNMvcMVjGPhu7FpBb2duDD3bRbtMJZZHIw==@protonmail.internalid>
 <CANiq72kb2ocNuE6n32vr4xCkZhZN0uPuCN3SFA1+Q5L+Ma4ByQ@mail.gmail.com>
 <87y10jd8o0.fsf@kernel.org> <Tq7yfG7Ag6jqd_ns9qvfEn2KFLl_oJxBm6YwKDey8kbCE9-rDnkN84aW29C4_w1T6FkhDhzPsLeH0XYKe2WSSQ==@protonmail.internalid>
 <CANiq72nBpVy911cVhNFM6teQ0EaE-xs0SB2Qx95O4=nKBdRDuQ@mail.gmail.com> <87tta9bhjz.fsf@kernel.org>
In-Reply-To: <87tta9bhjz.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jan 2025 14:43:31 +0100
X-Gm-Features: AbW1kvaPC6xTSjdhXQfFhTZC6_gBs4iWcQIJO0wFFN_39Jfsyp3C1gs7awRtaa4
Message-ID: <CANiq72=XW1RtXuP4JRVEZzwBKtXOOkJCp3WBW-oEFWHQOf_kpg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: add parameter support to the `module!` macro
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 1:45=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> I don't think we ever discussed this?

I don't think so -- we discussed other things related to 2025H1 the
last meeting. Perhaps you/we can bring it up in the next one?

> Version 3 of this patch enabled the unstable feature `sync_unsafe_cell` [=
1] to
> avoid `static mut` variables as suggested by Trevor Tross and Benno Lossi=
n [2].
>
> As we are moving closer to a new edition, it is now clear that `static mu=
t` is
> not being deprecated in the 2024 edition as first anticipated [3].
>
> Still, `SyncUnsafeCell` allows us to use safe code when referring to the
> parameter value:

> What do you think?

The justification seems fairly weak... Unless we are fairly confident
the API will be stable (even if not stabilized right now), I am not
sure why we would want to do this right now.

Can we provide our own `SyncUnsafeCell` instead in the meantime, if
you want to keep the advantages?

> Returning an error and `pr_warn!` is doable. As far as I can tell, we do
> not have `WARN_ON_ONCE` yet?

Please see https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v=
4-0-410b8ca9643e@tuta.io/
in case it helps.

> It turns out we can!

That is what I expected :)

Thanks!

Cheers,
Miguel

