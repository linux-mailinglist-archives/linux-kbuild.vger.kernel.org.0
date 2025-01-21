Return-Path: <linux-kbuild+bounces-5520-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33977A18300
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 18:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C2D01887B62
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 17:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8758A1F5424;
	Tue, 21 Jan 2025 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F/Vhel2a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37131F540F
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Jan 2025 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737480980; cv=none; b=Zo3Vva2SbxScb17STiuvTpdeoVYvQEqyDcjy/6ufV4egLFcAFk7cx+tOiq9/KYZw0HXA6He2khrnVJRZwZ18E8nxmqFQ6bQxXiZzUnGMT5FDJfykQvwKV6AE/ny/9PuvsXHxUbfD3NfH1934c8Xbnyj/WT0vWrTb/WlK7ym4F5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737480980; c=relaxed/simple;
	bh=kaibDFjXomFyHzSXXuoRTyzvHOyGuhRdxpJB+5UfQyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wb6EePhHoUSP/Ay7e1hUaem3y4YkTRY775G1H0q+vUcskbUCjPAREVRziABHUTXcz08FnKb2D9vy17QpUY1bswZTi3cyq741ZxLRwR4cMjVbjshJQjgleUkOEs4Lr/F9RlLqyjQSF4sN2XBjgxQ5SaTagACwVYjmnopm3iTBODo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F/Vhel2a; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4679b5c66d0so833441cf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jan 2025 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737480977; x=1738085777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYocvZzKFXOf1dOmFr+W1pL8HyxuFiKuumlmBUt/QYE=;
        b=F/Vhel2a4JdCp5+3jQZ5LDRl3f7qUJmoJMlduvi05UuTxncIR2J6W3Wk3GX7X2Iq+M
         pBSgDTFN5AprxEmuJJAizaASJfwfj0Wy0/LRlys1UKFDX+RSvb7X3wPDL3F9NWv7jung
         IkKu7PCm9d4sBWDx298iMWfU/kdAPgkeDjBg6IFF3ZvX+3RsrLP0IHhwkuzDznCO4GQM
         VBwjCoD+Ipk+IjHc6MnUOf44gNZBkE1f7aSlcXlBP9Yk9lqKP4vYMV5iScOaNUN2ChmH
         myBml8tWnS0I65WfWQIFCU0FkrsTiQd/tw9ggGKtZAO2vqaOAo85vwPnTAPt58w4uEnN
         nSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737480977; x=1738085777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYocvZzKFXOf1dOmFr+W1pL8HyxuFiKuumlmBUt/QYE=;
        b=lwPEXSsC3p7gMOw2rld4YKG09v9C9q7Ay5ZMba9Ds56FF+aMj5+BIiDSq3AJmLVr5o
         kiGgGMeI50HEj6ZCkF6/7JNt0i5E4jJyDD8lOfKAFXyUb9fMoK5SJoMVBPR3PVS4GHKm
         jOWQ0/ZbxjrFJn8H32cS7qqqFEEWlnhZsIQyB1lFyEwut02/m0E0P42zPq/ZBoacd5SY
         RSxvvdTYfEoJJF4aQw1OWCD4xtnolXBWD1A5/rCNTP4BATnqbpRqpAJbSeT3LJaeP2lz
         qyfXljuocxekoTngP73kkQybzewxeLIErwz6lc0OUlRZMJqVQ2yM7ONFrnVBboeBVBEu
         L7WA==
X-Forwarded-Encrypted: i=1; AJvYcCXgV9B7CS48NKqCGBuzZCUzvaSjNoIbRcATHGKES9QB3+uAyNPh4TQiMx+KT7sIA+INJIMteULjUqlKHDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjxaQ/WIR0z2ab/8wC+4Nj8o3YJQACexxHufx7E46yTdunywob
	qOm5stS4eM0xvntY4cdToIiwkItoFr4U/gMcPt1Nq7vfMg1ngSYJq21V7ct7c8sPTEVd8Ox1gEj
	FyoeVxqSnu6HmhdR99/IRGXUmOIdI46RePJCx
X-Gm-Gg: ASbGnctMxQ7+I8mNPZuO2p9KLHbBtqbK0r//cTVzT00ugIiZ34j0njbLRfwT8Y0r1f7
	LF9iRst2zaTopJb+QhnKJ08awBGVkhKLFsL9Pl/TuVhDs7MSU0XSBM91A9bUp3hH2sqNhS4Fts6
	YhHhQyCw==
X-Google-Smtp-Source: AGHT+IFIrZRx7xQrWDRLQ69FuUYdW0SvjjzhrnjhSnOksbO+ngHVevTnFyfppx3QzIQZhDwNLsCaUtTO2x0P8LdfKLw=
X-Received: by 2002:a05:622a:1e10:b0:466:7926:c69 with SMTP id
 d75a77b69052e-46e1fc28582mr12795651cf.20.1737480977190; Tue, 21 Jan 2025
 09:36:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120212839.1675696-1-arnd@kernel.org> <CAK7LNASo+wGhpCVhBi+ew1mOtLbSXgx3AiQ6D7RtXO5P=R0EfQ@mail.gmail.com>
 <fef7c633-5577-4cdf-803a-a1fe10787186@app.fastmail.com>
In-Reply-To: <fef7c633-5577-4cdf-803a-a1fe10787186@app.fastmail.com>
From: Rong Xu <xur@google.com>
Date: Tue, 21 Jan 2025 09:36:04 -0800
X-Gm-Features: AWEUYZnEsgcuCWBwvZBjbUeXp_Ck0mg61w9DJwmvH6xjwQ8ss7VEyk3ZAuur6X4
Message-ID: <CAF1bQ=Qk7pRWUxAcZNPjFquukHpXgi=34NmMbuRBAwv5+KcWtQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC, DO NOT APPLY] vmlinux.lds: revert link speed regression
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jann Horn <jannh@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Linux-Arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 11:42=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Tue, Jan 21, 2025, at 01:19, Masahiro Yamada wrote:
> > On Tue, Jan 21, 2025 at 6:29=E2=80=AFAM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> >>
> >>                 linux-6.12      linux-6.13
> >> ld.lld v20      1.2s            1.2s
> >> ld.bfd v2.36    3.2s            5.2s
> >> ld.bfd v2.39    59s             388s
> >>
> >
> > Is this problem specific to the BFD linker from binutils?
>
> I only tried the bfd and lld linkers, but I assume it's limited
> to the bfd one.
>
> > Did you observe a link speed regression with LLVM=3D1 build?
>
> No, the ld.lld line above is what I see with LLVM=3D1, it's
> very fast (1.2s) both before and after the change. New
> ld.bfd versions were much slower before the regression
> for this particular config and got even slower (seven minutes
> for each of the three vmlinux link stages).
>

Can you send me the instructions to reproduce?
I'm seeing a significant performance drop (18.5x slow down) with
ld.bfd v2.39 when
linking linux-6.12 (i.e without this change)

I will take a look at ld.bfd. It looks like an ld.bfd issue.

-Rong

>       Arnd

