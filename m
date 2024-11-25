Return-Path: <linux-kbuild+bounces-4843-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2759D821C
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 10:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89B4C28189E
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 09:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F45319005F;
	Mon, 25 Nov 2024 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L/QApVvC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AE5188907
	for <linux-kbuild@vger.kernel.org>; Mon, 25 Nov 2024 09:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526527; cv=none; b=Xu/yyOIIwKL0B6DW4AUA1AoF7JGuCU4nEkghGShaYPSz6Q/QkCz04XD9AwpBWRznQjc4jRT9iLTRJD01wvmZL9SI+1h7mWQMr0g05gLBWUV1/YfIPIpVLez7mM2EbQMi/vCjUMC7jgGQsi0Qf8FroZuzQIkOFS9esFr3bC2l8ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526527; c=relaxed/simple;
	bh=FCYlpekwLX29y1babPtkl5hhwfzqAWLF9A3oe2+5id0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlZlykeWxF14QFBIRpqoePFimmE0i6gNBEhuANHwuMGF10v7Bxb2VAUVktxfg0+GA50YmxSzWJQNtuzLk0tDwffNJXVEYP9M4atr8GWAsCu9IDrRXKdWvNR5S9woIEipYi+rH4HUyONY6lnSGEsJ4kGNHX/Sh42Xc/kkLR0n9Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L/QApVvC; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so8215a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Nov 2024 01:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732526524; x=1733131324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCYlpekwLX29y1babPtkl5hhwfzqAWLF9A3oe2+5id0=;
        b=L/QApVvCl2TEfZGYYEfTC3A1hQNfZH2vjBTq86eD/zjHUJ54iRzh51xj3aYuIKBuUv
         YHUejdIuGeK4KTPZ4p4MVGpV9KX1wfCemqd0ciGNreYL8at1hJVYiDvamxYmz96qz0GL
         sDXHtdhWoEK/iGnani5i3vzGP+qpSQVXE6HxYedijsvrLlstYYhLxPxNPvUlaFkPfqmt
         zEhRnIwbUXq43jiXU2o+hdZBEAueRG1pjOSQoLf3R5bNjJVU4MGLhUzse2juThQKgsiC
         mkXMThFP1UqRsiIJmzr8IvZFvEYXtfvSqLgPWNGY/dclfQbUKAf/SBjZlglyKAYLSE4c
         wdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732526524; x=1733131324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCYlpekwLX29y1babPtkl5hhwfzqAWLF9A3oe2+5id0=;
        b=IHBuVgwNpsPJtxPYwQ1ZCBXEJcDG3iXWPtmPU7haSb8VFgy5o6T/zxM5I1WmFOL10Q
         +WqaqsgczFVzjBGa3MfwDX1jRT0Rg5Q9bmF4IPvhr6jsscizWnPC4aeIdT9dlLY0asgI
         dyKWF0fTwSGsF7GBqspwnP8t/NgRdvJ8tDlHqC9BOrmH4sElXndCNBebCzsOleyTWsfE
         dtcYVl/u7WEMeRbpmlW44Qlm/lqRjq5gp/BrQcKkrWPY/g0n2U3uhwq/qp4ZJbzSC8kw
         B4Zjxccajtd6Ugs+Kj7lj65/zLKxltrABnVtdf6yi5M8K20pfcI2t2A7eRuwFfgyJMLO
         hkxA==
X-Forwarded-Encrypted: i=1; AJvYcCUKHk4CfUoXokVZZikDH0DuYRqh5jVUJEFYmCE4pwvqD3kZl2QaKm8aM5cHSxotlbxngpYNpX1YRPp9dNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQyTPAe/UDvoHRRop9eNx4970y7uEDrtcHAEhOUzo09SZQf7Nu
	TpczXzHk2P0JI5O5NI65/bs1n+n4IPNfpKsC8ApqMe1Ksd4VF3mvUjNvUaZpsbUDDcZ+gqzEzMC
	r6JeC1LZs8FNMv1e4EgXO1HrIfRHM8yu7yvfc
X-Gm-Gg: ASbGncu08oDJoHmc8Dv/YAAz1GWoXPLUcDdb3zmTCF6z8TWjIgqcdRLopKuYjsDFEtX
	OGHbTOwTUYDwtCff7oY+tPIBHNOKtsUpJ
X-Google-Smtp-Source: AGHT+IEyjVc+w4xYMWK45ReBVdh5zSSYk8/svaq/gH5CeUai6F225gz3gVyn1zbIlnkBPYmtw02u4vkN3IF6RImReBs=
X-Received: by 2002:a05:6402:1ca2:b0:5d0:3807:bcbd with SMTP id
 4fb4d7f45d1cf-5d03807bf0amr89021a12.6.1732526523672; Mon, 25 Nov 2024
 01:22:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com> <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com>
In-Reply-To: <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 25 Nov 2024 11:21:26 +0200
Message-ID: <CABCJKufb7SLY3j7EqRwFkNbrp22moJ51rDJm8madpUQdOhV9kQ@mail.gmail.com>
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

Hi Sedat,

On Fri, Nov 22, 2024 at 3:51=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> Thanks for the update, Sami.
>
> What are your plans to get this upstream?

Once everything has been reviewed, I'm suspect it would be up to
Masahiro to decide if he wants to pick this up.

> Is Linux 6.13 the new development base?
>
> Personally, I would like to see a Linux v6.12 LTS version offered.

This version is based on linux-kbuild/for-next, which at the time was
based on 6.12-rc6, I think. It should apply cleanly to 6.12.

> LTO is not supported - might be worth mentioning this in the
> documentation patch with some explanations?

Sure, it's probably worthwhile to add a note.

Sami

