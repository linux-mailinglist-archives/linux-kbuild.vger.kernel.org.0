Return-Path: <linux-kbuild+bounces-5905-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DEA43E81
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 12:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C591F16565E
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 11:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89340268FCA;
	Tue, 25 Feb 2025 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARHTNXcX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043C9266F0B;
	Tue, 25 Feb 2025 11:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740484505; cv=none; b=e0825pIAj/6zbyeeRDsBTAoJV9Qy5/BuYtGGdaOXk3bVA0+8C3ndRARMkNLC1NCIr1Hgy9066lF7+89QnPC5PxJ4hxom4tLl5zoeQVSNJ1yhZo+LlAR8r1cmZiSt7lCvm4cVuBCYOGWnFHdaO3hVcNU39xo9dqkpN6RqcpemU5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740484505; c=relaxed/simple;
	bh=r5JN9Vpy+k9kBOTQAeA4M6aHP/JfjZFJb0kvjJVQzTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fvk3kLSEOMrWU8X7NXtW3BP0a+AYJ8jfp0FRe9nfRa8bMjACVF3yjLXD7Uidm2AGFEnYa+Gq2+XQ2gfRxC6/F7rmTuRC8Yi3ESoKcvLSAJqdv7b8wgujOQrZvdWQ+wwb0r7/Ntut3w+DsSVQkqNZ+KhC/hn0PtbtHAHW525s7eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARHTNXcX; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fe5d75ff8cso319557a91.3;
        Tue, 25 Feb 2025 03:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740484503; x=1741089303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbVTvGgXxhFelIHlamzHjkhHuV2P21Bf5xkdpR0z7yo=;
        b=ARHTNXcXY7vKmZ5bVX90BxdvwGOnNvZBDu+Y8VHtyCzs8uRLNyINbo5toraJVTjkrn
         vgLdXyC+EKrMpyvUEf9xgvDsluvpzNY2QC8+s0KKOnb/nhTJ17KlaI/HLpPGIZA4bHFU
         5jg2YEGGob7PGRIFlXCNM/7+v/wqDc0xdLQmDuzHJkXtM9+hpe2fUOLoooUAv5aTOGrX
         n+kz6xH2OzZPceWHWN45tm5N1D+N1lcBum1CtFfSQ0msb+5KZyDJ5M3+MgLcFYJKPVSy
         G+kadLWWtnB7KafZcrNRTjqA3QX7pwWS4WH9bArPx7bddJAb4pf1DiWLwQ1etBDahAh2
         KyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740484503; x=1741089303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbVTvGgXxhFelIHlamzHjkhHuV2P21Bf5xkdpR0z7yo=;
        b=KAYBfncGY3FbNWJP8yArEf+BT6TVBrDq7NphVQ7szgIjMQifhqr9ku83TP4tEVQZ+I
         Sb93u0G4e6pbN29GM7/afIedKtlnv3DQX8FY+eyN0aQmG40fJpp7evFuvWPVZvVElXhQ
         SrWrbLwchAF4u/yA2NMQZJdBAch0PTEiK5NvgKFPjASk5mAUdxSzbOkMf5CcxZzuOmSS
         8sl+qnFKHVY7esTXEqSM7T4R2i3e82tkGSakuGjTMLuCGjVROiE3jQz1Rm/vth8v4v4i
         3hJ2IQkOp35JTMk4ZU5IqvGBW9sPnSoJVOoW2toc2zqEramGy47VngvzkToTze4nSNeW
         eWQw==
X-Forwarded-Encrypted: i=1; AJvYcCUivvYGwC4aLMQw+OJU9Z77AXdgYIl7HYKwL6aZ1mS++498neHShPbI5Ggtvxm5ehpVHIF85goB6ejnY65Y@vger.kernel.org, AJvYcCUrACeWgIDtnj4rIkM6xxQ5DqI7w5txKKybd1/3XhVbR2hy8OdAF7OhEFfDMVa3+9dKGob6eF1arS17jos=@vger.kernel.org, AJvYcCW/KfMFAb6ODG29NcwH54dJbFpmNxQn9ItCfLv3K0AV37wdvqXjDq5JmUMiMcvzwQT66gSvhmQI+GSWmsqP3Q==@vger.kernel.org, AJvYcCXmQvxg9UIDky87nw1XuwchKI2LUDgrV2KfS3JnGJIRG3rBHF6MEMaRQWNj3QWx5O9rIkOjiWdeBYUPWgT5Um8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS39p2oN50T0PzMdWN/ZKT8nWELuKkJEN0O64TF6Y8/BesssSY
	HbYzC4OTpCZGZRitRLUVR5uBqTLPZGXY4e/9Ir4K+T4qM2lkwOW2gCVQ4ylB5vqQBUmz4sRJ1Vk
	EBYSlbQHLS8loJGtVAGNQwwj1oEo=
X-Gm-Gg: ASbGncuCmCWEFgaWqrPhUZtEXkvkG+8pmz9jZ3/0yK8JxteiHnk5KH1uu9xwkqm/GGX
	GeXaTjx2KwcROxbRWOyLJf9MNMQbOKjBypn8PLM8q5KwN06z/U8azWh61v6DHecWbwpczB2B4wS
	aMA/Ttajs=
X-Google-Smtp-Source: AGHT+IHEGGS2hZODF1j2LQFT/BO+tJNXwtLqVVcttKdrdibUSLC7XukpDcWfSsRTIz2LPeVWqzcA/ddQe+FUevK6qJs=
X-Received: by 2002:a17:90b:390e:b0:2fc:25b3:6a91 with SMTP id
 98e67ed59e1d1-2fce7b014b9mr11568427a91.5.1740484503189; Tue, 25 Feb 2025
 03:55:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <JKqjFnoTeEbURcTQ5PpmUZWDS2VMEt0eZl68dWkgk3e8ROFpb2eTWH2mStKkkXJw__Ql5DdYvIR9I7qYks-lag==@protonmail.internalid>
 <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org> <87ldtv1t1c.fsf@kernel.org>
 <0d9e596a-5316-4e00-862b-fd77552ae4b5@suse.com>
In-Reply-To: <0d9e596a-5316-4e00-862b-fd77552ae4b5@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Feb 2025 12:54:50 +0100
X-Gm-Features: AQ5f1JoDLXuN07QEu3NdVPUgz3gtpTCAJ68Ip0LupLzn-yJQ2Gg6MLSBFUJM3h0
Message-ID: <CANiq72nBK=HZ=ZL9bYhB8Z+U5QK3xmsQesO9axf_Fz0_1mWREA@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] rust: extend `module!` macro with integer
 parameter support
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Adam Bratschi-Kaye <ark.email@gmail.com>, 
	linux-kbuild@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-modules@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 11:22=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> w=
rote:
>
> I'd say the easiest is for the entire series to go through the Rust
> tree. I'd also propose that any updates go primarily through that tree
> as well.
>
> Makes sense, I think it is useful for all changes to this code to be
> looked at by both Rust and modules people. To that effect, we could add
> the following under the MODULES SUPPORT entry:
> F:      rust/kernel/module_param.rs
> F:      rust/macros/module.rs
>
> My slight worry is that this might suggest the entirety of maintenance
> is on the modules folks. Fortunately, adding the above and running
> get_maintainer.pl on rust/kernel/module_param.rs gives me a list of
> people for both Rust and modules, so this could be ok?

Up to you, of course -- a couple days ago (in the context of the
hrtimer thread) I wrote a summary of the usual discussion we have
around this (copy-pasting here for convenience):

    So far, what we have been doing is ask maintainers, first, if they
    would be willing take the patches themselves -- they are the experts
    of the subsystem, know what changes are incoming, etc. Some subsystems
    have done this (e.g. KUnit). That is ideal, because the goal is to
    scale and allows maintainers to be in full control.

    Of course, sometimes maintainers are not fully comfortable doing that,
    since they may not have the bandwidth, or the setup, or the Rust
    knowledge. In those cases, we typically ask if they would be willing
    to have a co-maintainer (i.e. in their entry, e.g. like locking did),
    or a sub-maintainer (i.e. in a new entry, e.g. like block did), that
    would take care of the bulk of the work from them.

    I think that is a nice middle-ground -- the advantage of doing it like
    that is that you get the benefits of knowing best what is going on
    without too much work (hopefully), and it may allow you to get more
    and more involved over time and confident on what is going on with the
    Rust callers, typical issues that appear, etc. Plus the sub-maintainer
    gets to learn more about the subsystem, its timelines, procedures,
    etc., which you may welcome (if you are looking for new people to get
    involved).

    I think that would be a nice middle-ground. As far as I understand,
    Andreas would be happy to commit to maintain the Rust side as a
    sub-maintainer (for instance). He would also need to make sure the
    tree builds properly with Rust enabled and so on. He already does
    something similar for Jens. Would that work for you?

    You could take the patches directly with his RoBs or Acked-bys, for
    instance. Or perhaps it makes more sense to take PRs from him (on the
    Rust code only, of course), to save you more work. Andreas does not
    send PRs to anyone yet, but I think it would be a good time for him to
    start learning how to apply patches himself etc.

    If not, then the last fallback would be putting it in the Rust tree as
    a sub-entry or similar.

    I hope that clarifies (and thanks whatever you decide!).

    https://lore.kernel.org/rust-for-linux/CANiq72mpYoig2Ro76K0E-sUtP31fW+0=
403zYWd6MumCgFKfTDQ@mail.gmail.com/

Would any of those other options work for you?

Thanks!

Cheers,
Miguel

