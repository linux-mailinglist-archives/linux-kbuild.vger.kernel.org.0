Return-Path: <linux-kbuild+bounces-2124-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA49086E2
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 11:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 460CB1C21EFC
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 09:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225F41922C6;
	Fri, 14 Jun 2024 09:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A+7+Mxo2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720F2191496
	for <linux-kbuild@vger.kernel.org>; Fri, 14 Jun 2024 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718355619; cv=none; b=rqqhezFcu12YrkMj0HYkvxkF6OQ0kHKANo2aQ1sws/6nkgds4l9hNnabV5KWvDAprq+uw8XjRIgSjusIFIs4HBqezzgWTxoFIQQxtfq4JMdPSHlX4AMasBjL+LGVC/IR9p5YfRn1daXeBIdySD2wnbWMiLl+S+2gpFGUkNUNG8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718355619; c=relaxed/simple;
	bh=vuue96tIfWgsHiuEfmQb0PzqCqBFJ6nsE7tv6QKBDGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myj5u5a1MQAE1rZIoSg+lpe6MIiCu8h//0UNur7tVnIG90CPyHnXk5VhUHVR5EGWPUhJX70wPN88QBh2Bz/tSqsJL5s/y6f4sib1gBivXIkPRKGg9bxTeq22BxcwC/c2PTKouzsX1UKeE2pkJBxI9Sfo9eZeg4GHbth953mt3vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A+7+Mxo2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35dc1d8867eso1684679f8f.0
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Jun 2024 02:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718355616; x=1718960416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkjEfE5W3OSfNWGJdTHQ8Hm/JHwwsjW4jrKA6Avs2YU=;
        b=A+7+Mxo2p92MjY95gtY/ZscTo6hbEHslQFT5vSyph0Rj/vYOZf5gifSIafewF0Ig5/
         TaxtxwMjiDT9wbHHXzwTxK/w/GEMnt1rojNWcPR8j3LTTW6v0EuViLB6sYz/C04PIF6Q
         o0me77UR1cSGTaxHF1pgjPKKAqFBJcs6I28Ca7GGhNRjK1Akz7ALvi/FeFNYst4KJHhO
         DDE8a249ZIFyWxIpJPfAwm33l9xLNkzglqoSejvHQlYqX7L8tWK78Ib8KR8TqGELIN7r
         ucW+CqAU7iQ2iB2McAyBFReNdKpOvouH8UubSHFD40s8yiSvx5sQtzbMu/jyfC87hBkc
         MC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718355616; x=1718960416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkjEfE5W3OSfNWGJdTHQ8Hm/JHwwsjW4jrKA6Avs2YU=;
        b=Jyl4qaIKcVDZzUN/pR8mE+T9WxIL3smgPtz0I5nWf5SMDtV68n57RSeTWlhzVv+XT0
         HvWUYwtYyqS/nBpquPAxhK0tqOBvEZ3qKjVdNoKbtiFfTstF6+jMPnj3NVhzuUCv0MSc
         SN0pHdwgVQPCKdTH76magSQT46+aSJosbcB+ZV4L1at/p75cNLg7QUhRDD4mMchmvZp+
         EQnoVRvEuIQKE5JQ0qnuFA+y+1Irlttx3WOTtovLv/ONCke7JfYyqV/fcPRzy8p96vk7
         kEi3l1t5kR2DuL+kJxUsJnT7zuZKzJm3t83qowmCubKnwZVaqhvwsmpmNCg2F/r1UaKf
         v3sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWXzwxt/iRdt7NMcUYDO3Z2kosrw6QA9XeXI/hZPctDk/FSuBn0cSaAXJzcM5Du8C7sv3BV4x7nVvpw/myDOSmwH0hvAcfxpnCJKJN
X-Gm-Message-State: AOJu0Yy3nSmPt20J7pQIM5SiC+27yzcg1Qss6vxHACOGZb4EJWaGwI7R
	hxDSjj1sL7sbEVEvOIyHdsEapPC40pZAqkLTx8VwO5sbJepGzYtYjUrF53QAHaCiCjmzWIR1sym
	bC+jiX/czCNKIn0B4Jk6nh/OdVSto5XNjPKpo
X-Google-Smtp-Source: AGHT+IHIvcZm6t6jTk4ahi6buXLdxcxdUQK9Bj+Nnu9A3LPhEL1/OTB+NBQWXFB5IKzAaEAjsBkW3l+oszXwGLcZ8vw=
X-Received: by 2002:adf:ce10:0:b0:360:7284:969 with SMTP id
 ffacd0b85a97d-3607a76be82mr1562172f8f.42.1718355615440; Fri, 14 Jun 2024
 02:00:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240601004856.206682-1-jhubbard@nvidia.com>
In-Reply-To: <20240601004856.206682-1-jhubbard@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 14 Jun 2024 11:00:02 +0200
Message-ID: <CAH5fLgiJd3j3siCWteK-bBsnKvVrpS88vyWVV-k37SZyu2Nj8Q@mail.gmail.com>
Subject: Re: [PATCH] Makefile: rust-analyzer target: better error handling and comments
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 1, 2024 at 2:49=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> 1) Provide a more self-explanatory error message for the "Rust not
> available" case. Without this patch, if Rust is not set up properly
> (which happens a lot, seeing as how one must routinely run "rustup
> override ..." with each new kernel release), the "make rust-analyzer"
> invocation generates a somewhat confusing message:
>
>     "No rule to make target 'rust-analyzer"
>
> This is confusing at first, because there is, in fact, a rust-analyzer
> build target. It's just not set up to handle errors gracefully.
>
> Instead of inflicting that on the developer, just print that Rust is
> not available, with a blank line above and below, so it doesn't get lost
> in the noise. Now the error case looks like this:
>
>     $ make rust-analyzer
>
>     Rust is not available
>
>     make[1]: *** [/kernel_work/linux-github/Makefile:1975: rust-analyzer]=
 Error 1
>     make: *** [Makefile:240: __sub-make] Error 2
>
> 2) As long as I'm there, also add some documentation about what
> rust-analyzer provides.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>

