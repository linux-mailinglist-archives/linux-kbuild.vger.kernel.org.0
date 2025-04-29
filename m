Return-Path: <linux-kbuild+bounces-6793-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE7BAA0D3E
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 15:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD5E0189A2DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 13:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693142C2AD2;
	Tue, 29 Apr 2025 13:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gb6Xbg6o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2888BEE;
	Tue, 29 Apr 2025 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932318; cv=none; b=iHuagFis7/4LOAgvosc4MWedEB0PjAFsAwqN5gAQaDlrS361EK0/SVJ0MgLEQwcMNon2aQ1fVkIF5DMPT53U/UlB+SZGpB/X0BZjjj38zX6PgdjVIzbtWF+3rrdWfSioEkXqpf0PQSr+vQZYNaWJNkK+c1xXis5JCbEb74qrxH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932318; c=relaxed/simple;
	bh=W0nWnrPzLDrG8cZECSn+fC2yohEG2rWvuQPpI5s95bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D7pVcvrCO6NSodNtp+1F+eByJpOnmFpoEAaYxFxtybN2XpMnYM4x4r2y58U4de48Kv422OTHNJrf9nQ6ttZivr37qrUi5KhpvYTJveNkRt01k6R4bMK2Q+cRwos/JajvQbEMpJ0rxl1Nngj/7hDMMKfxbf/zbSi0RuHfLgR20kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gb6Xbg6o; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso613827a91.1;
        Tue, 29 Apr 2025 06:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745932316; x=1746537116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umQgHyre2tiOiZl8qW8J0femlvihd42d02KPN7CGp1E=;
        b=Gb6Xbg6oL5Ck9/UvVkktgRWBugPcvT4830mtILZwjbjWQnCHDxD+mAwRTQwaxIt5Co
         5652ejlZgSskJ/eguSU9CR9DAUEgdflpnT9YwmHR7B5mAFdTwc9GMulwOFBD0sEvq/hL
         ivJHP6rplShA8P3jACZtJLZOY2ZKBbxNZ/ZF0WtBooUHir0sY/xh5bhbYbb9WM+Qyob/
         4RmWVXhcWa/FpeKi1T7H8oFWV912DQwCHN3eXB6n4ls/GlliGo95dIcUuHc1K14w+05w
         7TA5z9USuuQX2+UHMuxER1/Z6YLMIiOIfJK39+ad4J7nj2EvTh9mJXt+G/om/vzgQyrN
         C4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932316; x=1746537116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umQgHyre2tiOiZl8qW8J0femlvihd42d02KPN7CGp1E=;
        b=Wsb52JLBaQ3a+2xPKjZvReHyK1VxWm6zbwNDDawI4t0uqgsx/3ObwYlrm0aqeAsokx
         aDOv03dZdWu23IYUx/9HLmuEf+iuRvTNK4u3fLvY13my1XtukkXCJy/SmllufoHK5kir
         RGoG2ROKuPqcbsedV0pjHqfdJ8QEZZPPLjOJJLLfqeAugYLfeekRxS+xP5MpNVNYp1W8
         kuClh72UN8D86OLREYpno2tMep387pOmwNE4x1ZGFoDhbwaEqmj0xJ7xbl1zoMeAaqvT
         BbMtgra85ThkqG0mQrzL5TQ3KSdHOJqs0hwPQZi/iO5kqe/v/Rf19krXq/eWGosA7yDt
         Su6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUICkUWij+uVXGly4SGL+tp91fT4nP9hYJufYNhn4o5N5L71ALSvGtiSRBoaVE4rIkgxKpUHfnUNvl5+0oDtjQ=@vger.kernel.org, AJvYcCVbiI9W1wb9IvpOrhdYrT7M6pFWqsPH0xMNt+i2LUyR7yyj0iNkxS/se0OX8jSEzBo0fq+8bKupegPO7HRb@vger.kernel.org, AJvYcCW5TlQSVeu5GSMaOpE+S1Sy3ZfUnp9lczM29bDXThbLhxKv9QHlUGckoZ7bbklL+/drDGR8VX4FtwGXv5nNlDg=@vger.kernel.org, AJvYcCW9UbcE6lYmhFPHNo3FCfRnMQfuRk97214geVi/uho2/+uKuU93yKM6HqdIbEdjA3t8JQfyr0GpOYi11kFW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvzq9VAQQyoC8sI+cVpztGn7Xft0U0oOl292LPMNEUFCzOeRp4
	HCTG8ZmQ+6/9jH9eCk4KslBEW1IUqxgcukobLAPkF6A8lRZKUsgcw0anbo5+9LKHIMC7IO8gMfG
	6dlPgExbSnlOzuYiWQkIW/w94yc0=
X-Gm-Gg: ASbGnctissz95ftZMhJ0LtyR1iw/kJOWytnEpxh5SqXUsXD1KljQ3MclIXhCmFYIHTM
	cTRDGiAYufyd976tJVXnzxoaDQr7rEXEr5gUHnfzbB1oT+ldVX137Td3Ajq6oEgQZ/aWmiGMkFq
	5ldKYnCBczCvAl3/RAx0rnyXhybD/ngAY4
X-Google-Smtp-Source: AGHT+IFvNh6FYW0Q6QQ2aHh2nvJkzrPHR2X/BnAtoaKgSyWdJLiF6HNVtbUTddRoJR2HgdrhRcU1oXuddB3KnCzYJyM=
X-Received: by 2002:a17:90b:38c9:b0:2ff:4be6:c5bd with SMTP id
 98e67ed59e1d1-309f7ec76f5mr8492166a91.8.1745932315976; Tue, 29 Apr 2025
 06:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-rebuild-on-randstruct-seed-changes-v1-1-16a74fe65538@avm.de>
In-Reply-To: <20250429-rebuild-on-randstruct-seed-changes-v1-1-16a74fe65538@avm.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 15:11:43 +0200
X-Gm-Features: ATxdqUFAsiIlFf1IXb2fAukN7QwlMmMJqoiiI4yhCrjomEu6uiKCMCJAawHA7GY
Message-ID: <CANiq72mwYbg_L8u9NEfRD0Fp9E_zhCi=t=U2jyjsZe_Ls306hw@mail.gmail.com>
Subject: Re: [PATCH] randstruct: Rebuild completely if randstruct.seed changes
To: Nicolas Schier <n.schier@avm.de>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 2:59=E2=80=AFPM Nicolas Schier <n.schier@avm.de> wr=
ote:
>
> As I have no rust experience at all, yet: Do we have to consider
> something for rust?

It cannot be enabled yet together with Rust, so no worries, but I need
to remember to update this patch:

    https://lore.kernel.org/rust-for-linux/20241119185747.862544-1-ojeda@ke=
rnel.org/

So I will reply there with a backlink to this.

I guess since we need to rebuild even `core`, I may need to add
something like the `fixdep` workaround we have to rebuild on
`RUSTC_VERSION_TEXT` changes.

Thanks!

Cheers,
Miguel

