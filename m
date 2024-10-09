Return-Path: <linux-kbuild+bounces-4008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1E5996D7F
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 16:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9373F2819EE
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 14:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DA6199FDD;
	Wed,  9 Oct 2024 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYDX+zuQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D718BBAE;
	Wed,  9 Oct 2024 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728483622; cv=none; b=lq2XXjgzEz90+LO4DGZfW9yuj/4EKoilwXjNNGzIYmfwEdEELhjsTzD/ySbzVZ5lhmbVT8DpnFaa5uZkx86fJqN4oZiXs3yR87pONZOj/tE/uBCLoUSk1WxRIf4TUgpstHnipAQ1UEB00Vfm0X9Rt4WL+y3mXh+bo9/dNJG5euI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728483622; c=relaxed/simple;
	bh=bKKXMmQmaf7GGYOtU0e4Qv+HIDp/1oD8p4RS/t5X6u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjKqo9SxXsylwUhex+PVySMAfJ5/hMlnvZ1KZG2ldI+9GqQnZa4jEqFtgUxT7JdibnKye/vvX3cbXkjuYkW6DT80DMa81EHwJEtvCT64u4zBV7LlCiYqs20A3dpsTp6AWbVlq2di6alUEIXV+kbv4iqs/rq6q9oTwDgsNNxaM0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYDX+zuQ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71defa23174so710115b3a.3;
        Wed, 09 Oct 2024 07:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728483621; x=1729088421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKKXMmQmaf7GGYOtU0e4Qv+HIDp/1oD8p4RS/t5X6u8=;
        b=WYDX+zuQavlymIIx++F1J53x3YrGcAsWOMmG29RCzXsjK6M7NkVE2pZqRJ/lw5gDCT
         HG8tboDPy/hDUVikLq0R50R7ZUzDLyHUBPt8LDlPutabgAIutPDMkxwUK9KM7E+hzJ2C
         7wKs6ZXEFvbAwhb7Nws1IptysZFbV6+rWItXzUznmuTwyydDCj9u/LpJsEd3LVG9YfZR
         6Efn5SQzQJSlqWJgR1W1v0oyD40M5OAuf8MCKAhxt5hSORAy2Sp5lhcuxmWt2CPolcwa
         1kwatwj1T/s63KX3xEbLOc2W0P/FescRpZfsNqJ3twuLXeOj6UtjyI0fO3mICSUipgVX
         6+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728483621; x=1729088421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKKXMmQmaf7GGYOtU0e4Qv+HIDp/1oD8p4RS/t5X6u8=;
        b=fUWTlgWZZxLdIVXxRJPu5inul0jl1tHZFA7/Y7FP4VMgPNPM9t0SeqUKBHn7XNWDIk
         lEnSNCFqZoLl03Ho8O+/DvfAqEwQJvYnpmhaM2YFWoivDdKQlXma3czoVzoLMn/6KKnv
         cAc2v08+RSOIX0KX2m78EAPpIjeVvKAYPf8h63Khyr7zbRsl2pSZPeJGBBXiUpy9OpVk
         lSqgQomKZDQa6x6KfDSsGg2FJiNjFKIjMPOMauCpGxtiR02kWiqbG3u1So+WxGTX6AkG
         +UaxnX/tb4VvZbvJ0ZCytTW9GSZtQrkqyKZ8biH6imbvHVJwPyUvpRYsv9r5ks5bEC00
         4lUw==
X-Forwarded-Encrypted: i=1; AJvYcCU6KfeSugF4ybQGF+qjRAIPkIrNpNI52pPL3BqHRQMQA+w8piE3ONGmwT/lmP3x1xN+XVjiFox087xBiYYE@vger.kernel.org, AJvYcCVWC87T0sZMJh0pXsNSMhjFCEs7Sbn5lBQwvwmbiiNAydnN9/7KP/2c3kRbNl6ztTdGKF9uPVUnvOkJYOw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp/RymzKlhv/9IxSY1zWUIEmLycBz8o29iZ0q9FzMfQNqLIioT
	wflPN24Hez8vAhDui8DAllHIrB80KLy0TXcfWvmE3MH8VbM5+pUdBDDiKB1Enp9+7OQZfwZUGyg
	KAUVmy0Eo+elCD8dK/SWAFM2HY8s=
X-Google-Smtp-Source: AGHT+IFJIy1JcqWZKBdetQ0z6XFsiA2zhkz9GFkpCG4IzO26gNqT2J2wR3KGibzYrOTODXW89t8/dVGp1tdzbMYhWY8=
X-Received: by 2002:a05:6a21:788d:b0:1cf:2be2:668b with SMTP id
 adf61e73a8af0-1d8a3c53471mr1569790637.11.1728483620293; Wed, 09 Oct 2024
 07:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com> <CAJ-ks9neMso9pL_LPOeOwLGZG7Wy9RxV-ixKsDv=Wfzy7yKVBA@mail.gmail.com>
In-Reply-To: <CAJ-ks9neMso9pL_LPOeOwLGZG7Wy9RxV-ixKsDv=Wfzy7yKVBA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 16:20:06 +0200
Message-ID: <CANiq72kM+29COB6vPQPotXqT3acdbrEgdjU2K6FG8gZC0EEhNg@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Tamir Duberstein <tamird@gmail.com>
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

On Wed, Oct 9, 2024 at 3:18=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Ah, I see. The relevant discussion took place on zulip[0]. As for policy:=
 I'm
> guessing there isn't one, and the whole endeavor is best-effort.

I am aware of that discussion (it is in our Zulip), but I was
referring to the kernel-wide macOS support, because I had read
Daniel's summary and v2 of that series, and it is not clear to me what
is the latest status on supporting macOS.

In particular, there were some patches NAK'd with arguments that may
apply here (e.g. extra process spawns).

Moreover, how will it get tested going forward? (e.g. currently I
can't, but I could look into setting something up if the kernel wants
to support this). If it breaks, is it considered a bug? etc.

> Thanks Miguel! As this is my first patch, please let me know if further a=
ction
> is required.

You're welcome! Yes, a new version would be needed with the proper
tags/authorship, but first we should probably wait to hear what Kbuild
(or the kernel) thinks.

Cheers,
Miguel

