Return-Path: <linux-kbuild+bounces-4006-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4815C996BA8
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 15:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0FD3283929
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 13:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7EC192D80;
	Wed,  9 Oct 2024 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYQ8V9tv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2444A189B98;
	Wed,  9 Oct 2024 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479927; cv=none; b=cfoLGHYhh4ywQ7oSdd0qtjJEknHCQ74LYUHLOZa+9wqixETPgeEJ67sHOHcL6h2GFzgqLcQzzG9a8LgWpl8nGlTa+dchvimq56V0WNcv+aeFwkOvipybLCgjM0ltpL0ebW/8kUApLiajjr8MQwOSftJTCJJwT1V2I1/hfn4tEqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479927; c=relaxed/simple;
	bh=gf4uinudsi3EhhYPe557c3TVX78vkpj0/JnAktTLxWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2Z3HMES79MF35Vh4u9txFEuIk9CP3HCW7HINutCy6c3x44Zo1F0i4E1LLjzxkJP1GOq67g9DYFIvxaeXqetBDfrSshjkYgu9wxajvbaFbtGe1KKuzcAjzoLf/xyhNcnfhrDdLF6rhocM8orz5N/p0QFSbfXIWVKtIj2q/5RRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYQ8V9tv; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fad100dd9fso99989281fa.3;
        Wed, 09 Oct 2024 06:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728479924; x=1729084724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf4uinudsi3EhhYPe557c3TVX78vkpj0/JnAktTLxWg=;
        b=ZYQ8V9tvUb5vHif/56XLSZepDvW6XCLxp+GqEiTqY2tey2WtlMHLv5MAJcXprFJjYv
         I97wexE4eHqPTCpV5/O0ZpTp9x//0X3JHLkiIZ0HtXpWLiMvpucMxarsLNIh7vwjruNu
         rWif4mRUlwTMH0iZiBtZLFD7rydWlFlpB1sr1ThmxvkGyfO085uJnIE9DnnRBt1pyjpi
         H0YwBKBj4JY8B8CsOxNBWqQUnTb2gHNuuruvYkGqPOYek0rF3YV+SoxbJGbSEBvCZTmk
         cKhr4GmsgF10k4PYPvfJNs2R6mCu6SoLcw52pEYhpBQ7rjVZAs8N8jX60C53G1AMYqUT
         MPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728479924; x=1729084724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gf4uinudsi3EhhYPe557c3TVX78vkpj0/JnAktTLxWg=;
        b=KJUA6d9KjqvpoylzSywVx5qAOg9nfB+1mPmcEKiheVjUaeOlQ/Xjjk+y8hgG5nSjM2
         CNGATR0G2iwZh47FdMpTcqZL2O0jdn6u5Y04EnmC0v2XeQ32WG0UsSN3tOJ4/0iPE5gU
         OEI/EJQi+Yjd+NhhxuBYz9qkgJ5R4lDO//qrszvqDkmjhSmV4OAuW19nGXDPpkzqvSuh
         1qe60J3sTWYzIXkTxqklQiMV96wpbTgAkYcDt6WaPvyW06QstlUILmD5MCxX7WaotUey
         bXLwc4zdeYyAxEq2fZ0ZLwkfzaVO6fbf4qXAugHp9hkuUbOIVPCdFLLw1TH9bvampCc3
         MXCw==
X-Forwarded-Encrypted: i=1; AJvYcCWSdD8Gp43/eKO9d3+8kbO5Nd9H19N1rLz6cFSxXR/nruCGyb0TU/sazneoIerMMn5S+VyLdH/NSpaTZxnj@vger.kernel.org, AJvYcCX5qETc0DKUEh5ZOwynld2X0tBiHWt5NKVBUvK7f4GwIkwMGbpmMNSeN6FnCjXrGhcbgSOaMCEcrYOs56c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8w4K+vvDXqtQ8fu2NOY9jt3Hrm+cEcrX+cTd9B4/QCK+X4fRm
	6bVWn3ATO5PMhUy/IoMngnjEqTxG0FOnf+gaCkDrwyd4vY7CYgPASB5a1DWrfpQtsonMVJuUees
	BEKXXrkmvhBB+/zYUfrW8vzVu+P4=
X-Google-Smtp-Source: AGHT+IFyLliKwHPJ9zxnU2SNYwwOW51gKG7j4dWAjY9vwpTFifZsh5HvI2n8XCOM847rNz2nbPQsWUtjJmU1Tyd7FV0=
X-Received: by 2002:a05:651c:2110:b0:2fa:d75b:2ef5 with SMTP id
 38308e7fff4ca-2fb187c9afbmr23773891fa.32.1728479924193; Wed, 09 Oct 2024
 06:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com> <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
In-Reply-To: <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 9 Oct 2024 09:18:08 -0400
Message-ID: <CAJ-ks9neMso9pL_LPOeOwLGZG7Wy9RxV-ixKsDv=Wfzy7yKVBA@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Fiona Behrens <me@kloenk.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"David S. Miller" <davem@davemloft.net>, Kris Van Hees <kris.van.hees@oracle.com>, 
	=?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Vegard Nossum <vegard.nossum@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 9:13=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Oct 9, 2024 at 2:57=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > What would you have me link to? With this patch applied and using
>
> I was thinking perhaps the series from Daniel, if that is the latest
> discussion (?), i.e. I would like to understand what is the policy
> around changes like this, what happens if it breaks, etc.

Ah, I see. The relevant discussion took place on zulip[0]. As for policy: I=
'm
guessing there isn't one, and the whole endeavor is best-effort.

Daniel's other patches weren't necessary for the kernel config I'm using.

> > https://github.com/bee-headers/homebrew-bee-headers I was able to build=
 a kernel
> > on my apple silicon mac. Relevant config:
>
> That is great.
>
> Thanks!
>
> Cheers,
> Miguel

Thanks Miguel! As this is my first patch, please let me know if further act=
ion
is required.

Cheers.
Tamir

[0] https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topi=
c/macOS.20build

