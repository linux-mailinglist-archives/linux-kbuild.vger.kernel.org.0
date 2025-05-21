Return-Path: <linux-kbuild+bounces-7200-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20424ABF0AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 12:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A6A81BA0493
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 10:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792F125A65C;
	Wed, 21 May 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GY4SR1Zy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A723496F
	for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821773; cv=none; b=cBDolCKC8U8qHFtMzzC6N/BL+LmIUI7gUZJvYXIIx4X9eF5n5r58CmL6SO7lZVtjxzIiMKNqYCYIo21nZ4yUgRMHNrd25T1zDGvideATQOOYhrTsIYjWmQVq+nYyxejF5xCekw8rVZr9gGxRwbqFufGxwdoi9ry03LZ9lu1jQkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821773; c=relaxed/simple;
	bh=hGVCzMZOE97pm/+7xdNe3qSpEf0+u5dNQxNicc26ENo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ExheNRV27aLn+4uC5LPG60YB7z2wGKwNOkKjHrwcjrEISRUYksZfZN8zRE5j4RMykZTUPdjeiXdWlNdpvj+pDra2F81q8lqYEJzhwP5LgOg/J1BUlPK1BUcVtwy/ZODNus0UJeWxCM+QioDZVH9LuZoDQcDYFEyHgkdjRf9jNf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GY4SR1Zy; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f8b0fdd5ffso64944126d6.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747821771; x=1748426571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGVCzMZOE97pm/+7xdNe3qSpEf0+u5dNQxNicc26ENo=;
        b=GY4SR1Zym8jWawgdz/Zh3Zty9cOr63LjffdNBMwajWn2u30g0cvg0lZOPdRDI63Xf0
         A5tDEFYcgZG/aGhkyAY9w/UKoeocOuoxZuupms18NbCCNpDv+Ad1Myy9fMTJ5kXzt1FV
         5oXfWRrbVB8xU1OG09IbgNDu0oQyqZou56GUJLhjOpjhrCo2viFGDRxj3WNNt+hntbM3
         GdR/Va/qE/f0/IBUKS2s8U+/fxINs1vbun3OkaqwpUgP5NA0GHBh1RVo3lSVjW52Ru2P
         M30OmLOq2dRiEvNYK8HPcFckoOoSJYuULKtGgQ9SKbTyzUbCMLllGoY8WO7q13pSqLpm
         dPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821771; x=1748426571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGVCzMZOE97pm/+7xdNe3qSpEf0+u5dNQxNicc26ENo=;
        b=ePu6Bov3sAim8pc8lRCrLi+gTwfCDrCsDh37enKCGi9pwbU2mdov+VPcFFhvV7k/1/
         BD+1GqiGu6+zkS3qk2cOmEjbW/gxmzUAmPHtisX8/edKaonCox1LNuuRqaLlPXwln+wj
         XTx7bqSBWwvOuPlZYa+Vtsjw9mMtQM2w45YuOhUTcCysubUYHS7bsEra4uot00+WnAyV
         kOw4IJqMerQd17yyXGyyddFrURIaQwe6NH4SnDM4UyRCZ4Z31UxHzE96OitNjTPHqeOA
         0OySxc9VVVnCpKygPy2gxfKlodVNFbH97Gt/Ck8Si899iZAVmgUuym8DuT3g4zxLVEDT
         4zeA==
X-Forwarded-Encrypted: i=1; AJvYcCW/2dfvC2SGYVCBRoTysKFRCbVbvTXnwfkWJc/NkiiqjpNWD6QcsWJz80SSnLvCn7PhIe/icJsVAKo86gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZLHvIFe513515wLp98TM3T9fZT8PjKDycAKnkVbY+qctoxyW
	N5nnwykxbc1nDA2tgDkZm4Akn3A+WpaHWSAbunjKt1LisTfFpNu1ERVDYFb2GELaKvEQGS2VXgz
	HBJtns2OrvLNdl0mdOsNaf6ZFWsTzEqypylKjYRgZ
X-Gm-Gg: ASbGnctDkgZMMqzjRUJx+gPdsuEW9+YBrguHnS13W0xp54KhybDWSUo3Y3lfyQnnRlW
	9ICnK64UEkWp+ZMGRwboWGI4aadbIn0AP/LVLNFrT02ez+S+2dW3XE67W7OiSfYDTcxcYYnl/7K
	oAdOSw74fZvBFj50x1YYAXmV5YjtKFybOfwt9hLAqLPnPmxYaLA7vNwLMlF5X+P6UyVz+4wVx9
X-Google-Smtp-Source: AGHT+IEm4BKFb5X1q0agtW63FdYJCI40qvC1DEbS34ledOoHRbdXdLG/0r4eGJo+uqR/WgsmzZYCGMgXB6A4yApRqfk=
X-Received: by 2002:a05:6214:40b:b0:6df:97a3:5e5a with SMTP id
 6a1803df08f44-6f8b08ceb3amr357793746d6.28.1747821770566; Wed, 21 May 2025
 03:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507133043.61905-1-lukas.bulwahn@redhat.com>
 <20250508164425.GD834338@ax162> <CACT4Y+a=FLk--rrN0TQiKcQ+NjND_vnSRnwrrg1XzAYaUmKxhw@mail.gmail.com>
In-Reply-To: <CACT4Y+a=FLk--rrN0TQiKcQ+NjND_vnSRnwrrg1XzAYaUmKxhw@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 21 May 2025 12:02:14 +0200
X-Gm-Features: AX0GCFubuxvb81f_x5em7Iy6MU7avDIHjdMdNZqeGYpj71-tqlOCNdY-AOhiHCU
Message-ID: <CAG_fn=XTLcqa8jBTQONNDEWFMJaMTKYO+rxjoWMHESWaYVYbgA@mail.gmail.com>
Subject: Re: [PATCH] Makefile.kcov: apply needed compiler option
 unconditionally in CFLAGS_KCOV
To: Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, 
	kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 4:57=E2=80=AFPM 'Dmitry Vyukov' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Thu, 8 May 2025 at 18:44, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, May 07, 2025 at 03:30:43PM +0200, Lukas Bulwahn wrote:
> > > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > >
> > > Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") removes=
 the
> > > config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include the
> > > compiler option '-fsanitize-coverage=3Dtrace-pc' by now.
> > >
> > > The commit however misses the important use of this config option in
> > > Makefile.kcov to add '-fsanitize-coverage=3Dtrace-pc' to CFLAGS_KCOV.
> > > Include the compiler option '-fsanitize-coverage=3Dtrace-pc' uncondit=
ionally
> > > to CFLAGS_KCOV, as all compilers provide that option now.
> > >
> > > Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Good catch.
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>
> Thanks for fixing this!

@akpm, could you please take this patch at your convenience?

