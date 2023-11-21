Return-Path: <linux-kbuild+bounces-102-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAB27F3852
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 22:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB329281287
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 21:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE55584DB;
	Tue, 21 Nov 2023 21:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xb0FA/oF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168C01BB
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 13:30:48 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-548c6efc020so4548a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 13:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700602246; x=1701207046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXRXOHrIRmnNFfmvROVe8lKDFwRW7hSZ8Iy3oG731k4=;
        b=xb0FA/oFXLl0fObHs2uSbLZBLLuKviwN+4DhjwkpEhM/jFYxSwnXYudySJUHkbOb8f
         6jKIO8fT4iVADL0p99BzvqvOcMv1uHhG0T92n7bMnMofnt5zW/tT+Sd5jqj8puddXdZB
         3IleEXKtd6LhDv2VRdrq8D3LjKJ0r0ImAkvx2oP+vLZaXumXlB7tyh8rnrZMoFLqSkfu
         BgvRH8xhzVK92fNHO75AQDDza2oJLDb1uOSz+DOn9b8HjV3/svPnI+xRshoqFSYTVCN6
         Z24PRnNGQcKCK8yejhYmvpNoYtAu9IL3xoFDM8X5cOe2+6eQbgIEHv4wULviuNUxG/uo
         I2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700602246; x=1701207046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXRXOHrIRmnNFfmvROVe8lKDFwRW7hSZ8Iy3oG731k4=;
        b=WNcTp9rVWdwo3nBGV1vz9ytSL7rxPUJGmndFEkyNxe1frzc9gtCrYYaW7YBJ3/1hSF
         BAk367+hOIjrlP7qFWnWBCwrFKRrgL5CTSFCtVpUUQwlq3l48j2r17A1H/5hfxU38FNd
         e6iY5TY33Nx2DYKvapl9eR3InVdBA8QSjHJIapgc5litbArKrivnd2+hhEZk2XGjhBJB
         x1VQjAc4GoAdH8U7LfD55N3zg05hQ/eMt308oOpLbJu1WNmsHfpLSyMg6wF/jyT8/0oN
         vmVWtlPXhkbt0J2juhSZH3RQ8kIi+yMFVYDMwsFfJ9qHhwWiiox6SdPG0dVkFaq6Ur+R
         BM4Q==
X-Gm-Message-State: AOJu0Ywt+OlSn0bo82ppjW8Tg/gFC5Oeu+6WAzcHjnLvdasVzqqjDt3R
	Ymd0dCWTgegcjUEJKhgsO+3X+KgO3eZa49HI/miR
X-Google-Smtp-Source: AGHT+IHOtAA86g7jwkpaavoDBRqXKPir59yYYqgAnqkDI3hxqIE8E0l3kuP8HHpkUDJfRxjrgyK41yk/p5NeVcpEmRU=
X-Received: by 2002:a05:6402:27cd:b0:547:e5b:6e17 with SMTP id
 c13-20020a05640227cd00b005470e5b6e17mr56442ede.2.1700602246100; Tue, 21 Nov
 2023 13:30:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117-maintainers-v1-1-85f2a7422ed9@google.com> <CA+icZUXFGp-yoWUHhbowz6YJyoULCgtjSZ-fTpRg8YvVD9V5gg@mail.gmail.com>
In-Reply-To: <CA+icZUXFGp-yoWUHhbowz6YJyoULCgtjSZ-fTpRg8YvVD9V5gg@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Tue, 21 Nov 2023 13:30:27 -0800
Message-ID: <CAGG=3QUTLTiD=4aj62YXUvLy0jCufMY_-+G-dYrtqN8i=tcqmA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: refresh LLVM support
To: sedat.dilek@gmail.com
Cc: ndesaulniers@google.com, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 2:58=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> On Fri, Nov 17, 2023 at 8:24=E2=80=AFPM <ndesaulniers@google.com> wrote:
> >
> > As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux P=
lumbers
> > Conf '23), I'll be taking a step back from kernel work to focus on my g=
rowing
> > family and helping Google figure out its libc story. So I think it's ti=
me to
> > formally hand over the reigns to my co-maintainer Nathan.
> >
>
> Hi Nick,
>
> WoW (C)lang(B)uilt(L)inux baby coming soon - your best patch well done!
> (  "Catherine Beatrix Luana" might be a good first-name (my
> Suggested-by when it's female) ).
>
I vote for Ada Grace or Emmy Sophia, in honor of some amazing women
mathematicians. (I'm trying to get my friends' children to become
mathematicians!)

-bw

