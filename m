Return-Path: <linux-kbuild+bounces-2224-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB5190FED9
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 10:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8B1D1F2254B
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 08:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902911581FB;
	Thu, 20 Jun 2024 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyYTlwGF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3675FEDB;
	Thu, 20 Jun 2024 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718872328; cv=none; b=mHH8grbCtPm1OrAe6BD+8ZTp3BBOlh2PA4IVNHnnq8hm+HoaZ3SEXfn0lZFCtbkF9HdW8fM00GhEeYKG/wvxy17dqK2nMQBYL6D2rbqENCT4o175u13vqMV+m+kifx4hU39UQA+5N+ZrKAB8Br8eGsCJEG7G/QGX3BTOF+m2IAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718872328; c=relaxed/simple;
	bh=YWsA2phAgUUjPGZaztk9I/TT/+G7BhuRV9evuqqJKOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRZatpA+WstF3GBCp9OUJrOs7luQrGZCeDk8gzLXNSr60dgL67PDVZzp56URW+D1CtHIT8yGkDJ97IcajJRlCTyrO5MZxj+EU961lGLIFhHWCAPJUtguOMorH2K76jpidC2NMtTt81kBLtSmKLO+ECKEl1lRGEYaAsy3BbXvbUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyYTlwGF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2c327a0d4c9so1247596a91.1;
        Thu, 20 Jun 2024 01:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718872326; x=1719477126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pr8Ujvslsv5sAsWX/9nOEEKoUg3IW2eQ+NTKLQgKvLk=;
        b=XyYTlwGFE+XqXZD+/5EhQ7af+76ERXTgSOSvPMKZLSnvfG0vR0Flt6UUhJ9f3AJSex
         amp3LRPPW9nJWlj3F5IMu/aMtx6HdnsWxlUHmQ9xC2wcZjxDYZi34cHPDg+2USqbXtcR
         aBdwqmSRQU9WMTKVOxzKEw0nFO2pHtMrkcz1jBSnIGi0WpwTJbfz/iow2TQ0u7FgmMs4
         eZNbia1lhMNEZvQiMwfr9VGfnmSbJ8F6+2YFE0NYhyH5kFLLypTA0Jbuvo3W3cAn0Yuf
         jCML4eY21JBgyrzcgTcnmJeC+8LRqby8tIlThmIv+hyspG7gwX3QpItUvybg6I8KbkQZ
         RMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718872326; x=1719477126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pr8Ujvslsv5sAsWX/9nOEEKoUg3IW2eQ+NTKLQgKvLk=;
        b=HEhvHqlsMfodRV35b9SYL5rQ5W56Bn4/RBkpcO4V3gkjwQ1+OEMiWsO8GwWDj9yRgu
         tw2pUQr1X6oseCAoeaF+PiO/fZljTRBHEG94th/yl7P0FbedTQFzWqh1i16GGSVKa2/z
         43jlWzZKF0WZUvT0WxhWduFce7xFvz9TD5MSfTlUupjeauNW5AOOHGciqKCDsCt/F6Vu
         PO+u4d+gGocRN2sy//pfGqqSCozb4pd4xwl/zsTr4y0WI1rr7qIDZLC4ogh6Ej+DZ4gF
         jsLtxUCx1EUUi4rTqIxLvZ+XW1TeY/6DkimpW5gC/+N9INZdkNvQ2PaUfcNB/cEC571u
         m4TA==
X-Forwarded-Encrypted: i=1; AJvYcCX02cIJgMHW3cZRRCNXOiyuok5e0aOHGcaDY9zm28tEMXm5uFFdspysmlnRMg21OJAu8/BdnkoJUkvCxp1Iyht6LVWGxr6HqXHgfYEiTA8EUWCJO8g6voTI7KBCXUgiXPlSOcBUXcLtsQ+vaybavWRVPl3ze+eoLU0RREw+vLmptuHNjkgaDezuN8s=
X-Gm-Message-State: AOJu0YxliLNmbs1HjeKS+l5wpW3pDGlV7WbejYOsjesAV8/UfaxkIBgx
	OqnUeR2wVj3F3YyR5aMToVHuIW5HUNNZffNev9Dl/0zYw74yGJmSZ4XXqTCn3l6ujApV+Zl0VWS
	qUFvKqNjje+ldBtZ9K717boFZ+j8=
X-Google-Smtp-Source: AGHT+IESD4smgPwpXrdb7RRqONV6KXkwjtJhArdlSbDbSHSmsOz692YJj5kuyxsawEY7HSmisNZpcQXukL8qtXcbC6Y=
X-Received: by 2002:a17:90a:f281:b0:2c4:f32c:6b with SMTP id
 98e67ed59e1d1-2c7b3ba85abmr7285513a91.19.1718872326480; Thu, 20 Jun 2024
 01:32:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240601004856.206682-1-jhubbard@nvidia.com> <CANiq72m46gN4GkfeXgykEar6OVa56ck9FmWQComd+iuf61FVSw@mail.gmail.com>
 <4262dee7-b6fb-449c-9de8-7d6404912338@nvidia.com>
In-Reply-To: <4262dee7-b6fb-449c-9de8-7d6404912338@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 20 Jun 2024 10:31:53 +0200
Message-ID: <CANiq72n=mFF5+MxAmOwNS+ZOGo=H199MX_5nPiZTKchFK+Gn6g@mail.gmail.com>
Subject: Re: [PATCH] Makefile: rust-analyzer target: better error handling and comments
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 8:13=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> What exactly did you have in mind for how that should look? The
> "make rustavailable" target has some leading *** and some bare
> statements, so I'm not quite sure exactly how to lay it out:

I was thinking something like:

    ***
    *** Rust is not available.
    ***

(the `***` prefix is used also in other similar scripts and by Make itself)=
.

However, thinking about it a bit more, we should perhaps just let
`rust_is_available.sh` tell the user why it fails, since it is likely
the next step the user would do anyway:

    $ make LLVM=3D1 rust-analyzer
    ***
    *** Rust compiler 'rustc' is too old.
    ***   Your version:    1.62.0
    ***   Minimum version: 1.78.0
    ***
    ***
    *** Please see Documentation/rust/quick-start.rst for details
    *** on how to set up the Rust support.
    ***
    make[1]: *** [linux/Makefile:1973: rust-analyzer] Error 1
    make: *** [Makefile:240: __sub-make] Error 2

What do you think? Then there is no need for extra output here and the
patch becomes simpler too.

The bare statement we have there for the successful case was mainly so
that the explicit `make rustavailable` did not look empty if there was
no issue, i.e. we don't print anything extra when there is an error
(and if we wanted to print something for the failure case, then we
should probably do it in the script, rather than here).

Cheers,
Miguel

