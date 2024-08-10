Return-Path: <linux-kbuild+bounces-2933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BB294DD50
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 16:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53674B2138D
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 14:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3EF15854D;
	Sat, 10 Aug 2024 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH6r/Qc2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBA82F5E;
	Sat, 10 Aug 2024 14:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723301127; cv=none; b=cpLaxmgFvURZ5aSaZNWrFpsb+a0O07QwjpOh/FMlcom33nMlNbJ75Fto8FjA3535+CN4EYrAdHgvV+9AW5c/oYuYa0EhkrmkgeSaJr6e+lfCoMWZ8x+SDFE72kTxIr0RJF+XE0nGzWgxKw7BkDTrEqCQQ8Y/WsJnlms+Q8lDyNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723301127; c=relaxed/simple;
	bh=9S4F9A6PaX/W1YdIFNWkFn30l1Nc6GZXCt3lt+ixrQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lotz1FcirqiPGOjO62OnC0TbUgcICIZxCVA+ZWCqgRZQBXdWmJIWjIMyFRrXmV/iiKPI4z70JB4t0to7xCdGe5Ll9RC+NV6mc/DpfAte3E/bzVtyfNjB2rjCoLAz/jy7DDJ125cu1HN64uIcld5XIZDomGzBxxU4SmMpGUQYuX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH6r/Qc2; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb7cd6f5f2so2374544a91.2;
        Sat, 10 Aug 2024 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723301125; x=1723905925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S4F9A6PaX/W1YdIFNWkFn30l1Nc6GZXCt3lt+ixrQg=;
        b=SH6r/Qc2ICsgr1XZjk8lKTUPW3wROz2xmKxrV6t+kImhopgSphIg6+z0HHerEXFnNK
         ldEw1OiRaR2D6BUNC03fwtDK63Kz+wDhwHyxj5g0A5DWRhDLpdjfHgJjg8D1XMGO1vbS
         N96GD29nZcREz/lnAcBaIqsEjKPpA3Vdnbx5ypYeIZfva3W6GAiNgy+Yb7i5IYdYBfq2
         d/96OOPLF9QW4604JSowF1KH36ccs2OGMa/PZa7VHhLCN3QT6vK0uUvZmCKqC/tqKWC3
         GP9HnC2Fdw9Ns8tltZVC8w2ibDPgPBoXK7m48OHLJIbSgycjF6UI1gaML0ZntrsyWBz+
         m+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723301125; x=1723905925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9S4F9A6PaX/W1YdIFNWkFn30l1Nc6GZXCt3lt+ixrQg=;
        b=Z++K3pbvYlzBeljxIZ4ClZ2LXsIYzff+mbdf0Wc4p/BdHswsTH1LFBrXHeK16hFK5X
         6l33B6bYG7TXsP8XqLzTZ02DqX2zf3HksVumzXUWTUnycFhsA5xBoGTuef1oZFJvWMDh
         fWLTtrovEa5Ij3qheRescSFmMFPJN48wRuaacf1MmML6d6ERa8OL+QGSaFXbMdw8KlJs
         rUtLhdEdyV7UhoOsjpUtuShQIQnAIuDDCwkLuBZvQAKrDcc3bb3IpP7uTC+2J3x8I7uc
         loPOU60W7ak2qHKOiee4sfKN8dXLjylrXSDeKo4yQrF/xj9wqsg7CblBFkEh/FFF+0mZ
         o19w==
X-Forwarded-Encrypted: i=1; AJvYcCXo0nHlwjV2wl72SljqquQeGs7iG27NMk5/ESqKyTM5n4yuTNIlGsuTX0Zi8zdckWdJIxFDQ6kdosPExI2SC/pW72Rqf2jfbY230qCsJE+FH+R08wiDP/cFUBZa16tUDpY6vJ6nfH0gWn0LX1mhFR55ZXUgIrTiOfiTHtqwA0LbNuf7aTzqOBqBAA4=
X-Gm-Message-State: AOJu0YwEJc0nsyzsYRsxRnguTcAfLYTtWwiovNX4utMxgZnW3GJHrnYR
	jWKt99iLS4yZoL6tsNRT2oB1mSnSL+eN+BOtRWjDhHIpK42T9NYQVp4Ig1LjtV7zuv2ZknDxsZ+
	ddI3hS84RR+3FCpzwfCyv29J1JVaWtRxm
X-Google-Smtp-Source: AGHT+IGfAWSZ5LwbG80gDM0OaU5dKBmBaQzIewIaSEbnuIWbzBzupl1sGtdFp/rRW2syqJvIsKdkY1uR23zTPg1Hxbc=
X-Received: by 2002:a17:90b:1b0d:b0:2d2:453:12cb with SMTP id
 98e67ed59e1d1-2d204531848mr1563929a91.2.1723301124946; Sat, 10 Aug 2024
 07:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <20240808221138.873750-3-ojeda@kernel.org>
 <652ElsLaWV50vwbKOQc-kTFLeaf8wUGPKNhc8B8tS6EqgqzSj5k_tHgqCTUcxfSZkYvB1xC_N2pmNIA-oq2q9irSPp2XNaaiv67pZojm_9I=@protonmail.com>
In-Reply-To: <652ElsLaWV50vwbKOQc-kTFLeaf8wUGPKNhc8B8tS6EqgqzSj5k_tHgqCTUcxfSZkYvB1xC_N2pmNIA-oq2q9irSPp2XNaaiv67pZojm_9I=@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 10 Aug 2024 16:45:11 +0200
Message-ID: <CANiq72kXNCww6oHKNiPr-mGq3gQsH-kUbK-C9B_3bY-ozkiznA@mail.gmail.com>
Subject: Re: [PATCH 2/6] kbuild: rust: make command for `RUSTC_VERSION_TEXT`
 closer to the `CC` one
To: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2024 at 3:44=E2=80=AFPM Bj=C3=B6rn Roy Baron
<bjorn3_gh@protonmail.com> wrote:
>
> Cargo depends on the rustc version string not getting localized. Or to be=
 precise it depends on the version string being fixed for a given rustc ver=
sion, which would not be the case if the value of LC_ALL could change the v=
ersion string. If the version string changes, cargo will rebuild everything=
 from scratch. There is also not really anything to localize in the non-ver=
bose version string. I guess setting LC_ALL doesn't hurt either though.

Thanks Bj=C3=B6rn -- yeah, I agree it works either way (also for `head` as
Masahiro mentioned).

I made this commit to make it as close as possible to the C one, since
in the next patch it gets moved to another place where both commands
go together.

It is reasonable to argue that it makes it more complex and slower, so
I am happy dropping it.

Cheers,
Miguel

