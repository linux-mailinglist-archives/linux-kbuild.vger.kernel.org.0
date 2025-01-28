Return-Path: <linux-kbuild+bounces-5563-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 578D9A20525
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jan 2025 08:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94857166383
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jan 2025 07:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42DA1A2C27;
	Tue, 28 Jan 2025 07:46:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3581F2AD2D;
	Tue, 28 Jan 2025 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738050415; cv=none; b=dl3e/pHnaXnSrjF8QzPbMOnzlPizCWe4V2p8XOH4quGtou1F+oZcoM50qLURJIY/JQRg7+LmHhekRyGKRTfWei5XQUwokFAn/ZL9JdtgO11ufxx86jv0UUnV+O3RDPcrjFXePbR8a0+BkA7lxzgQpiAmkSzPKK7c4nzbwcgxf14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738050415; c=relaxed/simple;
	bh=HoFnfKNIxlQFIpRI6i6Nga0bkUmYF+rmpL7IrlCQpfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQjziK6SXFHT54L+1I4ekPQEdmkNzR19IItJncjX64B1PtJxkazcm0rr7vORYzM4HkYkmZKx8cfWt7CA83ENHjBgHf502HJEBTgPFverJExn/pljBnDV+fpaj/tZ5A+sS1vKD1GgSvQmuVRTYQWb3yxG+uCeYdW1h2SDOLUoO64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51619b06a1cso3203862e0c.3;
        Mon, 27 Jan 2025 23:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738050412; x=1738655212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgNHrZqOh5I+Nq0sLYkdt+xY+8gHWM07xUx8EPjp/r4=;
        b=Zh2Ey1KV4qa8lN35lJYQh9WW+T20ffuP+RwmUSFfni1Rtu/o8c7CE7cNvPBLT5eb5a
         mhNLv+VD0JuDIq/hqLwtI5JiRLbFpGq5LkU/I4ZYdORvsjS76F5YTV6XN6HfEk/Wiy2P
         n2MGL5En0QAMD3gQce0qG/MuKvezqp2P6qaIHiraovu5nS7JF4gyfEEFqR9zlroq7VlU
         xKyZf85KFLuG5P69DpGgqS/SUfSDk9H9S3eg92ACuEJI5+C+/qE19i+cHdbq7xTkW0rg
         0udwoza+nTK1mLpcilBrk6OqWRZ9sfNDe/NHW0lLUIG2X4qCxedxMLyPSZTEjO8o/U8t
         o2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCW4iExdH2xbAtrLVvll0apRappTeYTAjUdb32RbAVTgMJN0p3t8lVinKEeTnYHDekwuU7aTOSiiKFxGdigN@vger.kernel.org, AJvYcCWBdXqmj+BAAM0uGNdmZMnQrdPn6+RjSGy+V2LKAaf1fY29WNvXPxFkkTPwjM5LC+rtnxVx6nPerOsQ0tdK@vger.kernel.org, AJvYcCXv0ENenWcgAzeNftipbulTrkkJAVOStZ/LHn857xJErV8LP8wPfXuX8i5mX4jN3nsvyHSBi1jDfkWNNtIx3Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFjc/qisYufWs7DOZvdHhF0mmDui/eX9XzGnSnFWWpRUrbkOez
	CGXEjh2WlUz/J4i3rEVwMtdyzOhgVr9aJ/YT2rldqSG3oNF1+ilskLy4o1hv8Tk=
X-Gm-Gg: ASbGncsZU0goIdjFWZ5rYPWRVGq0ayCIhn94YOuz+chaYoJV9uzlrIjhTAMaKYUiDv8
	I6aQMHfucqCNOUPi5ruHm3tjpYaxiUEWCM6hUc4of7v3M7rLJz5UJXxF7hvmryyLIqsBSzeQoo0
	kPB6lh2LeV36rMmbr8rCotjJJKEy2/kzid3DUCgXZuYBua5dPG0bL8KejcUsEfBilPHbsunqWOA
	vH+lOd4IThdjDFLj44MphpG5Y6ZFkNuW87eWa4mN7a8q88wuQRRqy/wSClGyrFZsN0F7I8/0/Ql
	lkf+xE7+dImfSj8zYdA1JrJFkxdZPiuZhGt2I41jj8ZerJyU5d8MEw==
X-Google-Smtp-Source: AGHT+IHoUv7vmI2nYtiYctgecoOHTN3dDCuOvSldZdFZ/HDVtrOeWvGk4AAeXk2B14QJ3lgKNDxs6Q==
X-Received: by 2002:a05:6122:3c90:b0:516:1ab2:9955 with SMTP id 71dfb90a1353d-51d5b2fd549mr38724027e0c.6.1738050411701;
        Mon, 27 Jan 2025 23:46:51 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51e4ebea379sm1678870e0c.42.2025.01.27.23.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 23:46:51 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85bad7be09dso3064327241.0;
        Mon, 27 Jan 2025 23:46:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVq0P68CDA462QJj/ppD44PUOGTdR2hxOlN5xjPklMct2G9CrnBFpKvFnFtcNnEvKsRYetqfcFM4CeakJF7IyY=@vger.kernel.org, AJvYcCVsNVWDs+JBVpOy3Qjwl0WmvGjdt3mnVIE2YZfxQbqGplXOUcaU2pSz5us2zcL+UUvsG5T/leqtqNvlQWon@vger.kernel.org, AJvYcCWaqKDUh+AJoVVvykdizIdo3G6EnkNgWLZCzXF4rkVKr7wqIgfsAba/g72SxLEPiGcLnbaapebpNoP78f0d@vger.kernel.org
X-Received: by 2002:a05:6102:f97:b0:4b4:27dc:ffe3 with SMTP id
 ada2fe7eead31-4b69099e6f9mr42788280137.0.1738050411311; Mon, 27 Jan 2025
 23:46:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127190636.it.745-kees@kernel.org> <20250127191031.245214-2-kees@kernel.org>
In-Reply-To: <20250127191031.245214-2-kees@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jan 2025 08:46:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvcKOc6v5o3-9-SqP_4oh5-GZQjZZb=-krhY=mVRED_Q@mail.gmail.com>
X-Gm-Features: AWEUYZlRJyqtu46GFLPmK_2UxNTy_ZZ3I5OahfBQNH_UNqTJSeeHUl0QUknH2n0
Message-ID: <CAMuHMdWvcKOc6v5o3-9-SqP_4oh5-GZQjZZb=-krhY=mVRED_Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] stackinit: Add union initialization to selftests
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jakub Jelinek <jakub@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kees,

On Mon, 27 Jan 2025 at 20:11, Kees Cook <kees@kernel.org> wrote:
> The stack initialization selftests were checking scalars, strings,
> and structs, but not unions. Add union tests (which are mostly identical
> setup to structs). This catches the recent union initialization behavioral
> changes seen in GCC 15. Before GCC 15, this new test passes:
>
>     ok 18 test_small_start_old_zero
>
> With GCC 15, it fails:
>
>     not ok 18 test_small_start_old_zero
>
> Specifically, a union with a larger member where a smaller member is
> initialized with the older "= { 0 }" syntax:
>
> union test_small_start {
>      char one:1;
>      char two;
>      short three;
>      unsigned long four;
>      struct big_struct {
>              unsigned long array[8];
>      } big;
> };
>
> This is a regression in compiler behavior that Linux has depended on.
> GCC does not seem likely to fix it, instead suggesting that affected
> projects start using -fzero-init-padding-bits=unions:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118403
>
> Signed-off-by: Kees Cook <kees@kernel.org>

Thanks for your patch!

> --- a/lib/stackinit_kunit.c
> +++ b/lib/stackinit_kunit.c

> @@ -295,6 +330,33 @@ struct test_user {
>         unsigned long four;
>  };
>
> +/* No padding: all members are the same size. */
> +union test_same_sizes {
> +       unsigned long one;
> +       unsigned long two;
> +       unsigned long three;
> +       unsigned long four;
> +};
> +
> +/* Mismatched sizes, with one and two being small */
> +union test_small_start {
> +       char one:1;
> +       char two;
> +       short three;
> +       unsigned long four;
> +       struct big_struct {
> +               unsigned long array[8];
> +       } big;
> +};
> +
> +/* Mismatched sizes, with one and two being small */

three and four

> +union test_small_end {
> +       short one;
> +       unsigned long two;
> +       char three:1;
> +       char four;
> +};
> +
>  #define ALWAYS_PASS    WANT_SUCCESS
>  #define ALWAYS_FAIL    XFAIL
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

