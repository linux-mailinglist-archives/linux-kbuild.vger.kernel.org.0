Return-Path: <linux-kbuild+bounces-9436-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FC7C3CF75
	for <lists+linux-kbuild@lfdr.de>; Thu, 06 Nov 2025 18:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7DB184E0346
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Nov 2025 17:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1703346A1C;
	Thu,  6 Nov 2025 17:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UicaYoie"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D7924EAB1
	for <linux-kbuild@vger.kernel.org>; Thu,  6 Nov 2025 17:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762451683; cv=none; b=D4x0+64C9dmG0vSRP3tBLkDtlvnMoMyQF/84F4nRkEgL4I9aAFmIXKzIA+vwUd9XtNfKwochqrucXs3XnRhvJddoQscSL8sqK3MHD9jRu3Cy4dNjSPOEk8+rVUp5qnW4Nq/RlMaNt9Kfm1mDB8OdSP6jfNA+uORoc5MrwbaMWfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762451683; c=relaxed/simple;
	bh=Ksw1O2ILTa6nbNkzQ8ESg5jM935Th6BDveZ1S58oGbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ek0P7LWIQOWT8IPIM25pNQwgNxHVmgVrL64RxbIVQipF9+9gcpCUCe1gshRC2FyEo5kEFzzhrFGJpvxGoMlH2qxPfj/63JxAeMqk36Z9AzpSXtOnuMszx0uyRiX10pM5TS6J9j9avaBQNOhnHzAidf8jimK7qEggSu/xW8zoemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UicaYoie; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2952d120da1so651685ad.3
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Nov 2025 09:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762451682; x=1763056482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Okn7qpZREP/wLijgmlrP2ZX+9ZeLo6Ylcde08Z9eoeg=;
        b=UicaYoieNEAJldATNlWe0ilE0H5q6doUqvzQRLUzKckS8/tstHYz4ZtbolnwwnxLFZ
         o6L8yrQN5rO4Q2sGf1NjnqfedRQmNqLSiSGto0ZHXDv1bWTgoRKn1IV/HO1SdSGMJehi
         LdH4NZm/LHGR687OVH5Bo+WAgafDuVf7suWEoohtBdMZPy/qehl7ogLH5zAg9e6Ktn6L
         sAxm1gw5yw/HlB3obsATOCC5/Fh9cCm/CPKIdpN4Bc/mVolsaTeRxANPNYM7FJmtbofO
         r1kHPbCCxGSGd9zPj2HEU2i3h+a0cxHEsIc6RZNBYjKDvAWcA7Hf9U1OSiy3Ee8Ww9zd
         Ng8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762451682; x=1763056482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Okn7qpZREP/wLijgmlrP2ZX+9ZeLo6Ylcde08Z9eoeg=;
        b=MNYdkT5HIpVHomABr9FLFgU0TMjz8OJ3t5bkM0yV3oC3tmwRU0s9mdKlabXv5nD7lj
         BAFyk6Un8Vwuz43/JW5v+b8iD8psECmrHHxT/pjio6L6W303JRuZ1gV0MucdSFHTRW5x
         iDX9HoeSbWXwLvU2w8KsIx+eZJCYGovT76nj85NTjINpyqN7SS37h+WZ/T+vw2/eesNU
         MYqGX+OzkoxVFCr0BhwJt4PXRJEhDVTx7aOiGVLLBFXP3kxDD0fbJg2D1LgzH3jiWJBC
         8LYTytARG3dhZrTIWqmyk4wllanaTXQGv998De2EiS0oQi2NzrPeaHLXQV0XUIGsf1nh
         ugew==
X-Forwarded-Encrypted: i=1; AJvYcCUi+FBDq00gdjaawn3NaiDng2d23FClY7cmNiUmtbNDG9P50tivDWp10uYw52yvqDhoNGLkpfayczLWwF4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4r1fhXlqXQL9ZyceLE4kYGG/7FXAi0VgMZ3LcQLxRW+/1XjBb
	1NVUXO68Kwx0Hv0JTXC4lGjFymwVXisTNJ1RJ1/4MUub9vBPxKZl2TkwqqvNVKxkgAxJnFxGd4S
	pzS6+qWOLLPvJjnZ3xSpa1irV6W6+LnQ=
X-Gm-Gg: ASbGncsEM5RfZfNRvs1osiJ8Ry0qaNPr9TVJ08BAjD5sHY63hiou5btHkZNKJEwaokp
	ymdkm4lpDHTX6cRBt71Kx7LT05c/or1rNQQLgprJzGHpjnPgfoPhw5FlSmLXsVYcbb24CjS1W4J
	1n7UAR2lY6oMqgoPKR31Qn7qLlV53AWCOvWE9k+5gT3LnbKgENPS8I8MvhpWOKzpSX66ydY3BUG
	o9jQyrpBl4moYYxUNVDHdytIKjHkJJLaTco9VX01HRL7PGVgxNWaoQCuFEAV6QnJxtI0z84J2N5
	ggp404FcZlYcK2S8pb0ydYdeee8rt9lcjLFtrsyrNkB0QQIpmWRE8dB2L1iSXx0VENYEu0NFDVK
	+dbk=
X-Google-Smtp-Source: AGHT+IEQFZLchjDduH4qWmZhyYV0o5WLbi5+ttwHSqi4gQaN3BU7nanFdl/mHX5HfcqMUadxoGA3i7/M5nE2rROJQ8c=
X-Received: by 2002:a17:903:1cd:b0:296:4e0c:8013 with SMTP id
 d9443c01a7336-297c045d1ecmr2192335ad.6.1762451681522; Thu, 06 Nov 2025
 09:54:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
In-Reply-To: <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Nov 2025 18:54:28 +0100
X-Gm-Features: AWmQ_bnB7dF3A5p5iTsNbh6uHhgvWv73d0_f2Do54xO3WHnB4_rI1cr-bP8T2Fw
Message-ID: <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 6, 2025 at 5:07=E2=80=AFPM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> I can reproduce the issue. With rustc 1.90, rust/bindings.o has
> debugging information, but with 1.91, it no longer does:
>
> $ dwarfdump rust/bindings.o
> No DWARF information present in rust/bindings.o

Same, reproduced as well.

Bisecting nightlies, it seemed to happen between:

    rustc 1.91.0-nightly (12eb345e5 2025-09-07)
    rustc 1.91.0-nightly (9c27f27ea 2025-09-08)

Cheers,
Miguel

