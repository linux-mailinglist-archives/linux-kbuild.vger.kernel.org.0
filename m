Return-Path: <linux-kbuild+bounces-4124-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E23A299F0A3
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 17:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2D9228288B
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 15:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3DE1CBA06;
	Tue, 15 Oct 2024 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeJ/bPa1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DA61CB9E5;
	Tue, 15 Oct 2024 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729004781; cv=none; b=HWYO6ELMcNYp/p53c4jOUy2kUYNND40dEb8cF88zdPsOrdFtWmRKYQwxYG935H0KXaRE5p34zl3hOlBgGnszYE3fNMFOkrYfecMJsO2j28+3Rgues1uAHNSxsyZETOXmZhO5Cv+9UepwYoW8OwjpqVTrRTNN0Z3JEMjebykP5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729004781; c=relaxed/simple;
	bh=XvBsOmthnKBPrNadqnGm1o00dVUQIb/e1aIhuZtK1yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEgsa353ukLgGy3rMnJcc2aJxMnQQcxQ9RBMSM3Fa9jRarB0zRokRV4dapn+vRUP/PdSUxCiC5MXVU9aRJqTAyUUbH4CLIruWqQtKJlTSqLS/homhu1U5xEeeKOA/mLeSTU1XM05L9n1us9yygDHylUIxqeAMoYr0Ie3EyVGGIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeJ/bPa1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e59dadebso4057395e87.0;
        Tue, 15 Oct 2024 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729004777; x=1729609577; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XvBsOmthnKBPrNadqnGm1o00dVUQIb/e1aIhuZtK1yw=;
        b=YeJ/bPa1ajV8sWfdfXZl4GNruUi28XLWjSB9Bs2G3n0T5hirNAhjknX0TTDNKVIX+4
         irSzym/MXkl/LQ6ZWLehgtgqWw9NnaOY9x8u8dDebnN0xO7KnEaBkEJzjOc4BNFilZbE
         M528iyG3SnJGZ2lqYJsT9mUmem95P2mgFPRdnqClh0bqWhdMvn81btqTfJ8HGRSZz8VD
         hscL0oe45pvPFyivKfv6MZj0maqlyjrvJr64h9EkjvvmbVD2SjoG4rLP+8wnWNHLj5Uw
         X+2AKaVyftTwZY4CywqS9zVQGtfFn1iqMaHwUjFR9XezmjiF33LpIFrQ4rz17CloTLQF
         P6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729004777; x=1729609577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvBsOmthnKBPrNadqnGm1o00dVUQIb/e1aIhuZtK1yw=;
        b=aC0K2z50sgV2rW++Njn/hG4pI/8A2bwMAP96O5BXmzf79BfNMNgHkewypuUksciuKi
         c1CEQEZe8x7ldagpepQLWVToK8ZzqRq4SyVpzPoTeWrbZwMEhZra/BJSdcxVNvL2cqbS
         etqB3WAhpCjv051Cith0U8VlsV98qgim+ZlQOo4DAizzJfZcLGGKRXNHFYbjgxhpRB0p
         TLvMOTNS/aiQ+rneVjRzqNNiBEKBhnJui2y6AKR8xaYRWu/gd1kaJ5ekwaMCJt5wZDUB
         sWmN+Sxit/idLZBYXKDpFj62/by57eEc4KnhcJ7YiaSAPFZmcTqhPxQdJjyDPjft9m56
         9zwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYyIqbZ68OaUXHhTfpjoqIJBHlLg28kZoWSBkYHYp79QHw2VyLACeWrBAPjc7T/yrvHMODceQlCzQm677Yc1I=@vger.kernel.org, AJvYcCV9oS/XdMKm2KsTrEmXC7G9e8Pj3TSM4SpeC3Fx3sZQMaW/ckI02ij+drKrmyKoadYji2GMF88WLWG2Y5w=@vger.kernel.org, AJvYcCWc5ghOWdqsHYeQoIyWVDoFLzG1crHofHpOsl9Yejtiiifk/+THMIK5EwbhR2hbAXyxFRar9qGAXGf8JwYU@vger.kernel.org
X-Gm-Message-State: AOJu0YzMYOluvEH4wqqZsZuPKo9X8UJy9Ud8VqB1R0iZRfGRSIgOsUeA
	imHEGOkBdwnygf/aKZkxG4DYHee5ZRUzCwYeQ2jYE0da6wFfz81mN3rCdvgu0SKGqgcHVGGMz7O
	QlEgWifTrDVADc2ntaRnPYLuOgn8=
X-Google-Smtp-Source: AGHT+IHQoOP8jo18+oRF/qa4tf8/HVzJKKvXRnn2v7lQpYy+Htgtl6nj/cR8piEY4H9/JgOwIt16LeZEf+7rlgJ0VM8=
X-Received: by 2002:a2e:a544:0:b0:2f7:7d69:cb5d with SMTP id
 38308e7fff4ca-2fb61aa16b5mr7296111fa.0.1729004776352; Tue, 15 Oct 2024
 08:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
 <CGME20241010083123eucas1p2432a0bbbf37e85599b477d92965d9514@eucas1p2.samsung.com>
 <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
 <D4RZIDTJFVX5.16Z4XSB5IW6D1@samsung.com> <CANiq72n+mWOP3xNUU4Mep-n5QtJ8zQiwP9JZ-KX68+fOC0GMmw@mail.gmail.com>
 <CAJ-ks9mrY0eWjagq7hnHzY9jMRzV_4NS1cBfg4ad0v9Q3aV38A@mail.gmail.com>
 <CANiq72kzEdyQYhsw10h7qVaT2d=0z1qKsOUo-NzZw5xYrn1nuw@mail.gmail.com>
 <CAJ-ks9myRR1PgER6UtkFBE_mmgA7YGFjU11+JZXbjKVcra-sfg@mail.gmail.com>
 <CAK7LNARg=ZvD14ARKw40uk0XNfE5qgWqsrM6H4jBJu0m5XYCWQ@mail.gmail.com>
 <CANiq72n6zkCZdUJ0A8enLW3BgmA_=eJKgDKwNCfs-q3dfeR2BA@mail.gmail.com>
 <CAJ-ks9==6mi7SF5rTR=YouwC6RwktJftqXHqhsBcHNTWxdbfig@mail.gmail.com> <CANiq72nBYswZs_m9Ky3KKNz_WmHrsSoRDJqcuHGt2WpvUogtqw@mail.gmail.com>
In-Reply-To: <CANiq72nBYswZs_m9Ky3KKNz_WmHrsSoRDJqcuHGt2WpvUogtqw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 15 Oct 2024 11:05:38 -0400
Message-ID: <CAJ-ks9khX7Ha4iGWOkbHeXzJLPisE9r=+q54Z9HMQkojR=-a8Q@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Daniel Gomez <da.gomez@samsung.com>, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>, 
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

I did more digging and I don't think this is going to be readily
fixable upstream:
see https://github.com/rust-lang/rust/issues/131720#issuecomment-2414179941.

A symlink fixes the problem if we *never* specify a path to
libmacros.so, is that how we want to proceed? Note that currently we do
specify it in one place in rust/Makefile and again in
generate_rust_analyzer.py, so those would need updates.

Tamir

