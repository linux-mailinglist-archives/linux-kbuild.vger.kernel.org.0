Return-Path: <linux-kbuild+bounces-4845-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F229D828B
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 10:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB6E7163BCF
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 09:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C05C194A43;
	Mon, 25 Nov 2024 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LC1WsC7v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3497C1AA7A2
	for <linux-kbuild@vger.kernel.org>; Mon, 25 Nov 2024 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732527311; cv=none; b=eFqdp0dlLv9b5q9nrnAyEvxBU/jOiy+eaIEVXHTrzGnTAU5Y1gqvnIpeaBfvlUDRQ+843FirYME/69JWI/s0SObwD4e//j7Szxaj3YCZ2HtzoZoGWX5Os2EARJfLCLCd1HcfSl06dtN6TY4pp/OXd/Jl22n/6GCdoI5hCwaibBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732527311; c=relaxed/simple;
	bh=jaT2gMZATI1cr2w+kBtCP6nseVsxavYfNusYFbNNQeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+eFCzRyZ+xLGSv2IO6Ejqfam79UfhpItol8Mas7oUcJJlhVV3EotCYIFmkghT3TWW8GuTOGCwnOjtEg8IgKu5aeXQiBHUN+o758MUszKjMr6h2b0VMnnwtZx3bLyWZ66H92fdKCMiAPKksWbLo872XrBa9Rox4uFqEhALwqF3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LC1WsC7v; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so8383a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Nov 2024 01:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732527307; x=1733132107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaT2gMZATI1cr2w+kBtCP6nseVsxavYfNusYFbNNQeg=;
        b=LC1WsC7vumtgFuP6Cv9Yu8t1TMXoT6wbw7rxEaaVq1teHsOm9l3az9HUMRmSSAdcec
         yGGQYM9bs7ELHgZjkSenvYVkcgsujwFxZaAaQgSG9lBayHhlLlNeppF2JGZt4cejK3nG
         Jw5aCvZlATCCXiBaxqR6b5PgzxAvesl8zL1hFKrlb6Fo6Ct7D02KGPLvdRxF8lgbRpDo
         C8/JN1PSpOH/1DnolDcNNCiGqYWJ1hsYWQ/nF7AvTTeTfsMfQmB/Uc6ijDsKuzoHD0HI
         YdWH2XAvRWL7n7nA0mqzMwvL1F9/Al2BL10ifZC4zoJZlSSavarFEB1prweZYn16pu3u
         gcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732527307; x=1733132107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaT2gMZATI1cr2w+kBtCP6nseVsxavYfNusYFbNNQeg=;
        b=m2zP7mwdxpLjT/U5++XOEtu6i1ltQ4Xw14bhcRJ2bZ8a7PYTIo3bmjzxj8unPC2LQJ
         cOg1TWdMf+liR/nicdnsbZm0SmpBB2KeGHo0eY9uYIL7z7OrLRutEaBxItAei/h30+Af
         XFFP7ens6icqZ7LpdEhSuVjh79i9xSdzoyK+dulWoj5NsboIDQEkPgSq2kZ5vgHC17ud
         cv09ZUMbz9DDjzMdRaB7/amNidQPc3ZUCU0k+chhhWuvDeDSRcJmz0fQHp/JAOpflpPI
         ght+tqzU7iY3puXPj+fTTyAnt9KpVDKbmno8kZkvbhqnD9YkI8RLJ2KW5dfM3VOu6SRv
         LvTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJsTAHjd2GkJEPbcN9GuwRr0rbLkdxkCVRLZRMef1cr9/5i8ybdaeklwtm5Wh3GQmDTQojWRHoR/vh98I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJxDoO+EV2D4etocDepOIrTCLzrB4DzKh01ECh7wL9tuXQKQUc
	q4CivPyfLag3JjOgl/DBoYO4Dzce8H/QYxlDbJeZCm5QhsUapSRBs6/lBdKgiFCPcVJx7bRU8xn
	Si0y6RKeyGZn97w6EQR2Ljv9Ur1JMCNoDMBip
X-Gm-Gg: ASbGncvB6hQ60gWTFX4IgpIzT6ECeeSkC//HxMkK3z+oWYjOd8QQLs3YRk6ECtc5MIt
	pdhtYfLu9NZjpUWGs8TkHYNLYHsIsqlhA
X-Google-Smtp-Source: AGHT+IGTmrlfZpaacQIL7m1sVBbpke3zA30uDeHjmOTDx5UHOJssl129/RankrUjb/fulgjiVDxdQ2FhiBHkvVnjtVM=
X-Received: by 2002:aa7:ce09:0:b0:5d0:3ddd:c773 with SMTP id
 4fb4d7f45d1cf-5d03dddc84bmr69002a12.4.1732527307223; Mon, 25 Nov 2024
 01:35:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com> <CA+icZUWSKygQJNiODzdauNiHz2Di-2eSGGmd-fgBrFpdyh_HgA@mail.gmail.com>
In-Reply-To: <CA+icZUWSKygQJNiODzdauNiHz2Di-2eSGGmd-fgBrFpdyh_HgA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 25 Nov 2024 11:34:30 +0200
Message-ID: <CABCJKudwpKX1_j46Tp6=eAJ0JU2zWE15+c8OFq9LMAnSqwesOw@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 23, 2024 at 1:23=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> > BTW, I am testing with the latest kmod-git and pahole-git.
> >
> > I will give this a try when Linux v6.12.1 is released.
> >
>
> I have a prolonged build-time of +22,75 per cent.
> Compared gendwarfksyms-v5 + Linux-v6.12.0 VS. gendwarfksyms-v6 + Linux-v6=
.12.1
>
> Is this a known issue?

In my tests, compared to a genksyms defconfig build with debugging
information, v5 was slightly faster, and v6 was 5.6% slower. This is
because the expansion limits were dropped in this version to ensure
version stability when exports are removed. See the explanation here:

https://lore.kernel.org/linux-modules/20241120215454.GA3512979@google.com/

I did profile this quickly and most of the time seems to be spent in
libdw looking up attributes. We might be able to speed this up by
limiting the number of attributes we look up depending on the DIE
type, but I haven't had time to look into it yet. I'll take a closer
look when I'm back from my vacation in about three weeks.

Sami

