Return-Path: <linux-kbuild+bounces-9786-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF46DC7E839
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 23:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DC9E3A180D
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 22:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C7621D3F2;
	Sun, 23 Nov 2025 22:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muqonko/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF76225775
	for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 22:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763938018; cv=none; b=aAImh1cywDsrJxktrO0U4cmdnXjrVaBCdL5rslvbG8GDgRtxWyjNFNyTqU/y0/4RkIfz4p9nYB4CcWxOvInFSfJLcJHEpkoKsfBitPC1fC89L+2w/0pbERxB0oqp27Ge/ACE9+3wdwF9qbSB6iPzUKAWhYBcZ6Y8TD5YiBHq6AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763938018; c=relaxed/simple;
	bh=e0hceDboA05xFP5/VRqZHg1h4iO4L8U3n4dUraP6p84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fL8OCsF4dQ5xeuVO1PsaXFl/GX8N4DmowXmAVH8hlUr2D9a7pK6M2tokNjsGmBIPER7Ms7wIdJDaHypdgKYAKRJWGbr3He3ygClS6eqZtijrm/bKw1x/lE9J+IV5/5OrxNHFE8z4RPvoMhe/e9vChDexzo3IMyW29K/QilOFgYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muqonko/; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-43479d86958so18269805ab.0
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 14:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763938016; x=1764542816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0hceDboA05xFP5/VRqZHg1h4iO4L8U3n4dUraP6p84=;
        b=muqonko/UEIQMeLnO3fS5C41/T75yCG89dJ/Uvhmlocl+b/yvUAOX+2rYOEpWQic7/
         SyS6oN9zsvDVyJxB2FSpZoa7XzHZ46w0QKvrz/3WDfLFESjOoYge7Q/zb5KzovtTx7TR
         ow+i8crP6q8mJkKmre7JLDUHeOvrwx7Zd4GIhNwpX05XRaRgwCUoyju+S+TNKFY8GvKD
         Smwr7H0P5V0J+uUjMaIUGdk2KRc85AU2kJqyCY3X3WZb1cYqTQm3jKJInl+xtShTe7+8
         k2FpY86ZY9JHYZpupYfuLgRJOhZv/akruY2iwTZ1CIDY7YjlX3ssstgnQlslVG2hkt8c
         v1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763938016; x=1764542816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0hceDboA05xFP5/VRqZHg1h4iO4L8U3n4dUraP6p84=;
        b=t0bn1N0WynQLTcxRW3gFsnN+HGZFzSn0zzo0vBh6UC438YZS0Tp5ja0odbTJk4cgDv
         EM8kOlqlQ09ui59Z7+sgttun5ZilK+wgizJdrV8R69OHL7PnB9BblVvhReiD8rVia2mY
         c8jNmrPnT641QXpETDPGLUG0BnlEwL9gJmEfr1yAFmA3Z0ssfXUyUQ2KmbbamDUyjnVL
         LqjQAYd4tHXvQMX58SUR7ZmxWbxd/42WkutjTVJ/v0PFUf6OZUEpHouQiqG42TpLZ8bc
         q1liy8IeFTpa4SFNfRxiKa3WSkyGispVSpfQGYFL6L99FvpXcl9U9QIsGfvmSiE5V6uK
         jEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN/6dhXXlvEFglt/BbxXhTcicquawAWP1GGipOfBOoJ3B86xgt/bmxL7J5KOG7Bz+zggj+TeNdZrxs0Mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPQ9OALRQkdD3mzg2y5shShaLeNnI86VBtDUnzKtRg5UH0xFRr
	DoxiY4lbr/h0XS8RyNUGIVoz18KATWA7MgDV5jObKKXqjQJ8vB48Ny3/IUesx947N3Tri8mMZjR
	W1h6OObX+1fQpT7ZytjRhlk5Uv9jyl8g=
X-Gm-Gg: ASbGncsKIJWBbr4cOyV1IpaYlaNSMzc4SvZONUKZG7cA2NUkIIV6OI/+kIcVeHi6rTk
	oR5TR+WGJ4F9fH2oidcjcun45pfNqa4e+ASUJ+TDGXpNs3pqzXTAuRdLbxN9q9wM9tsv10XPVPN
	O/HJpkFg8Tuwu13aHWUy5d8fQbPRnPdyT6+jEUH/Qhoe/j6ajBrznsxO2iSfi4I9skpdJcA1fgm
	s/0snHGM/ULeiHJYRgcH7OdbLAVHBgawo75JJTm8BUZW5qG+j9n+nTvyqohW/W0CFqo+FOCd9lm
	tvrdSUlO8T8L
X-Google-Smtp-Source: AGHT+IEL6wOTWEIzN+6uRLqQQTohjNaYVb+umwdBrXzCY3X3aIAhRgkHGXdTXdnHIwE08xwvTjQQuTm0WFDj2WHSS0M=
X-Received: by 2002:a05:6e02:2190:b0:433:5b75:64cf with SMTP id
 e9e14a558f8ab-435b8e5cbb2mr79300195ab.21.1763938016377; Sun, 23 Nov 2025
 14:46:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121043750.298843-1-y.j3ms.n@gmail.com> <20251121053633.1594703-1-ojeda@kernel.org>
 <CA+tqQ4LX2ihwY11VJk3LNNE-STsONJWF0rdDa0Pq09oA7YRXEw@mail.gmail.com> <CANiq72=Yo6-yLzQ6f047vXk1e-mm8=EH5t3dZRpLaZN1iuRNMg@mail.gmail.com>
In-Reply-To: <CANiq72=Yo6-yLzQ6f047vXk1e-mm8=EH5t3dZRpLaZN1iuRNMg@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 24 Nov 2025 07:46:45 +0900
X-Gm-Features: AWmQ_bmOB06MctdBZgf6VDX6e1eE8DqG-67ueFQMRQg_sxxFTTkFLalse0DNJMQ
Message-ID: <CA+tqQ4Leg_VZWe92zXkygrp-gwRNPwyysYMWLwupX2bTt2R-+Q@mail.gmail.com>
Subject: Re: [PATCH 00/18] `syn` support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, nathan@kernel.org, 
	nicolas@fjasle.eu, patches@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 9:51=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Great and thanks for testing! Do you mind if I add a:
>
> Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
>
> ?

I'd be happy for you to! Thanks for asking.

Best Regards,
Jesung

