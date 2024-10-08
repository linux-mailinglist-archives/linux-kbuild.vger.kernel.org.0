Return-Path: <linux-kbuild+bounces-3984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE889958C5
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 22:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE6901C21B8E
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8CC215013;
	Tue,  8 Oct 2024 20:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQPn/oBW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1058D212644;
	Tue,  8 Oct 2024 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728420783; cv=none; b=T3b9DdUescQV99Y7LbM3BRLcC3P3qPRWJ8iahtmxLC6iEpYJ4mrzZyhyDf+JJxE3LGh0HYf4O1RBKjUrRfuG5l5LsqBrpKprq30DXFsAIMX0B5D0ktPuTr/7U2D8EYcrZ6Y/kiY9/W5pW77S3YWng1B8C/tgd2uL3MeeqbVQjEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728420783; c=relaxed/simple;
	bh=qoDFY39Yyo/23s4wjTsODjx32A9RuizNdpXFDDoj7mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZk1iXufpIoeCcRCHqHIdymnHOmyg0SKBRiNDyKrqkBFvxq0sUAKcb+jTSK9xmPaS9CL9+LGcfwphw2KGawL5jh/YqjSoGoJLHBM0HQqwIhhF1solQ0sQi0i33G43bd2vS3ww+gCcNGwZKmb53Ltj4E/t/0qqW9jkOWl6xOAze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQPn/oBW; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7c3d415f85eso726391a12.0;
        Tue, 08 Oct 2024 13:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728420781; x=1729025581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+X96Vu5u5CslzJ5SzDEiXxBrSZfOveYD82APE7DPJg=;
        b=MQPn/oBWcTG4tcqnW/flCd1xmjlfwFmjGHELaUoNaqbWfUO0dpSqO7Bvm0OlGRHr2S
         uPV6tIF/RGpqr+UJGf8tGFay62ZssVvL0sLadl87iADUeWmDp27hgw80wx1D9758SXam
         QZX4BOGlrGtCE1oSq6qC/zaT/M8zaf1OJr43uq2wGndF3IjfML9/yMBwJfBYF0+Fspa7
         wEM21Oa8raVmk7JJnVLyltiSFix24BuCW1eYVHUuWJhasFhdtHWbOuv+3NAFgjXjUULg
         19QW0kognAoG0Wkv0dRTeTTOnWnPP5Bii3EGjYh2sw5LyN5fqYN9YE8msvbnlYDet5ea
         k95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728420781; x=1729025581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+X96Vu5u5CslzJ5SzDEiXxBrSZfOveYD82APE7DPJg=;
        b=phQ7CjpBw1OdG8flvb5bHJrevYYT3ETu61ONj1QIGJt3B5KeHYRCaWWg2OhsSCWKFS
         W95qvkCyV8Rc7HSvoj0YouyrNTUrVDAHDcjpb/aQu7K2IMipUWVxbZck3fdwznVFDSE2
         15BwF33WzlqYAZLo7jIaBwm4q7IrCq2VkM+sGQPLS9GweowqoPPmp7FX5Muo5o/F7tan
         mgrt7+q7jAxj1V9AVLVJ7COPD08lR0sjGO4HQi0T3ElyaDvC2xqLFkoitmX6yOK9H62V
         wkOfbaJqk1GDZVCAHrq+QAkD9ZFnFI9YgApvkcHlJW/U1i1bw8zAhV6Mt36cyK3Thfnt
         eMYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQxW9TcVHuHlfa7RCjztyffvT/EIJMi8RnMpDVUbZhMkYmji/vXySN5ANjFjSvdeAN61c9ZrYW/+ebtiuiWSk=@vger.kernel.org, AJvYcCVXQ0KO3/7i5oRQqh5Vp4G36WpkzrkD6E9YQRiITENjAlmKqDaOBrGlGXywt3mDiys9m3lYaCnLiLUIyxVH@vger.kernel.org, AJvYcCX44pfbMmMrk3COGmB8FSwYW9jjVNe5x66PVx5mCJH8z9lcI5E3+nlUTmZUXztVMtD0r2tTm/cw4iCnnB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YykqvLJfpORzMKQ4KSHMR+mq0GqAvQRT5+1Ukpb1XXf6LIkE+7G
	NhLwSMZ8blJQYP7jqk47jICHy6GsFKDMlbzBCxBFYkDmLDTRVc7HBkdXSKc1h2WL3fqKOt93zaa
	2LB3A1r2jVvLQq6vgU429RKj9jS0=
X-Google-Smtp-Source: AGHT+IGFOpJJDGBMPcPAxE/O2Kh3js9cIBkGMfsYaFB9gW3+QZbnPHROFFn6ndmkn+BkyPf6DpOkejXSPbR3ARZTsxM=
X-Received: by 2002:a05:6a20:7488:b0:1cf:52f5:f5 with SMTP id
 adf61e73a8af0-1d8a3be6957mr155561637.2.1728420781377; Tue, 08 Oct 2024
 13:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAGSQo02oVWxazut2nyh-9K9gK+937zKCfYMBkT4EQE2CddvZtg@mail.gmail.com>
 <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com>
 <CANiq72=40bsTubsXMqn_Jjx8TdfuuE9Z+eQNFvYrVXnX9S1-zg@mail.gmail.com> <CAGSQo03_GZCJrnp9WPxo2T3GJz8TCtucHNx6_rAr7xfJ6ybukA@mail.gmail.com>
In-Reply-To: <CAGSQo03_GZCJrnp9WPxo2T3GJz8TCtucHNx6_rAr7xfJ6ybukA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Oct 2024 22:52:48 +0200
Message-ID: <CANiq72kN-LiTcCjGXp6Gg=51SP+mp12CjAunt2qk4J2ngdussg@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Matthew Maurer <mmaurer@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 10:23=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> In that case we should omit `-o $$TMP`, because `rustc` is emitting a
> warning that it's ignoring `--out-dir` because `-o` is set.

Yes, we need to omit `-o` or we could use `--out-dir` together with
one of the `--emit=3DX=3D...` types to be more explicit and avoid building
the `.rlib`, which is what I did in the GitHub issue.

IIRC I used `obj` to run most of the compiler stages just in case that
mattered, but perhaps an even simpler one is good enough, e.g.
`metadata`.

I think just `--out-dir` should be fine and is simpler for this use
case. However, apparently outputting to stdout works too, so we could
do:

    --emit=3Dobj=3D- - >/dev/null

and avoid the output file altogether. We still most likely need the
`--out-dir` in case temporaries are created.

Cheers,
Miguel

