Return-Path: <linux-kbuild+bounces-4073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B39BB99B57C
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 16:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC0251C21A59
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 14:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DA219580A;
	Sat, 12 Oct 2024 14:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTjrmj5A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3286A195811;
	Sat, 12 Oct 2024 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728743161; cv=none; b=iAWWJjOdAXuEZCaAbjda+wwknNGDYOMfybZb1rycmlqE+nSjiF5uQUR23i59MMaqvVzHaXdHtumxq5qcToCk8rK1OxLcM+GFBcTrubJ0v8AmjgmfpjaKkaUppH8U+wb9vQTFywy9zCiUZR0LkALLaVXZKjfveHMgGI2oEEZdd4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728743161; c=relaxed/simple;
	bh=g19ZF4NfxaZkMR50deDEpuIYJHiJELegRWTzAoKqkek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpozoRNJE9z1DV3H2Dw44T3Ra6flOY+gC112xjQEXwCgAyxPbSDIYvzwLJOzW7ZAcvYwizyrLiVWt9rjxT0pmTRyIinFKTcS4Y1oAWbg9YBgApgvJIIDNJYTYRqT+iLYhiK6qLCZ5MVS67k6fjRucI4WIiHDGSmcvebr0/QzJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTjrmj5A; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so333361fa.1;
        Sat, 12 Oct 2024 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728743158; x=1729347958; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g19ZF4NfxaZkMR50deDEpuIYJHiJELegRWTzAoKqkek=;
        b=PTjrmj5Aw+5CKLBUMO7JwHQuZdnyigkH6nYT2YTu+PBtkpXSKEcZj3wPEGsKPBfMAJ
         rWvoOqzay/Uz++uK96RRDNmanX4RTfIj90e/mTZvd3X0muaG9Un1RcFcp798NGy36UFB
         PkpnWbl9+X2usEmsPvPOMRczOUPUV4JxyPYp6kVr5g9LTxrg076jAToEhMbrHc0op+Ev
         8y1iroihARPJN9AKywrjYaVy2pKgbfObX4uqNUChKJLtGGMLdk2ipngBXvawxQS9iKOu
         eAw+DdZu3J0t0ISD8etwM8Ls++H6r5GIBvCtqUpkPYWAd6z8AhQqbWRj0/C4MbGkcLyM
         9HWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728743158; x=1729347958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g19ZF4NfxaZkMR50deDEpuIYJHiJELegRWTzAoKqkek=;
        b=l360ru/JOaguK34aXwpaSF4pS4V+aFX3X7g3Wcz5ylDilSPGcGWZITxn+gI/MYItEZ
         btHce06LXR8btM33YnmBCerhozcpTICnIWaT8wjYvmPz+2+Ut4Kgu2q12NrLP/7MUFaA
         GTbt2IXz5l1nXwDfMYuBWXwac0CCUYe7heuUGwppSu3HGqkLGmvu5TubgHaG9Fw6+c2O
         q9aAJV0SIBhE+E0C7/TyEzqBHkg9H8RdTo8YcH5R2RibS4jT2hSR+Q5qg77omHOcZPHB
         pdoPsuzY3hMw+FZBJQqr/4v6MLUNP3h33NEIqlUWWztUB7uWJ6WeQQ1LktLPc+EzdcMD
         ELsA==
X-Forwarded-Encrypted: i=1; AJvYcCVBtlKAUR8EsJibDLlziEVE6m+AaQw5jttyRDikZ4NnIxEWeCZ+bd4zuqP/NZ5tfsAizTxo/eIWxo85tevU@vger.kernel.org, AJvYcCVchVZ6uhEL6cuZ/HETahMQiUvcAsGZm/HNQRWBwRHPJfuHTdwgJZmRI3i2zV0y4cefb6d9FmMz+lbX45gf3Nc=@vger.kernel.org, AJvYcCXchJgi/4o5Iug/BOPdtqtpP7RvU77elhU2+IoHj5mIKTwYm4QwC9/y1QLDucIqCTIqkgwCzZAmsJTig/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMCf/TJTq9w1w+3dy64l9lr2Rdvouyps73Tm9Cf3fZjVt58eQh
	tP7Xbto7vIRD2HrkQrHH2ZYQR081aP1ik6x4zFE4+TVcj2wgEv8rq33fW6c+4XqJ7O5DusKlemF
	2n0lC4XfVsB1AUjzvU+tjHEnwiBs=
X-Google-Smtp-Source: AGHT+IFLoGSwV7ic4etZ3B32N24F1Bh08Bry9PDbJ3YCptlzJ5QtwiU1BB6lm9FUoBOU4G+Sy7VYGfLYi1On4LVMMxM=
X-Received: by 2002:a05:651c:1992:b0:2fa:e52f:4460 with SMTP id
 38308e7fff4ca-2fb207ad4ecmr35362501fa.1.1728743157957; Sat, 12 Oct 2024
 07:25:57 -0700 (PDT)
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
In-Reply-To: <CANiq72n+mWOP3xNUU4Mep-n5QtJ8zQiwP9JZ-KX68+fOC0GMmw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 12 Oct 2024 10:25:22 -0400
Message-ID: <CAJ-ks9mrY0eWjagq7hnHzY9jMRzV_4NS1cBfg4ad0v9Q3aV38A@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Gomez <da.gomez@samsung.com>, rust-for-linux@vger.kernel.org, 
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

On Sat, Oct 12, 2024, 09:41 Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> In other words, it sounds to me like the solution here is to simply
> provide a variable with the current name as the default, and let
> out-of-tree override that if they need, rather than query `rustc`.

In order for this to be reasonably maintainable we'd want the variable
to be something like DYLIB_SUFFIX so that we don't have to revisit this
if macros are ever provided by more than one crate (or worse, have to
provide N variables).

If this is the preferred path, I can rework this patch in that direction.

Tamir

