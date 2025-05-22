Return-Path: <linux-kbuild+bounces-7220-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB7AC06DA
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 10:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BE6E9E1161
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 08:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3E1264610;
	Thu, 22 May 2025 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oSIzVgg/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE8225486F
	for <linux-kbuild@vger.kernel.org>; Thu, 22 May 2025 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901948; cv=none; b=I6yWB2MeL94GG70Qu8vX8c8cJQUO4J+8m79TLtzWJQ21D4Hv/tpRAO6XeoC6Fj2IiOv2elmxvBja85K5AVb8FNLMj+GcmsDZloE15ra6L9HqUxmu/u3LylyeXIvqsjzu/cruY70ptNwTaDWEktKd/ZIR4L2sVpe/lDbADsvg0Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901948; c=relaxed/simple;
	bh=oJTN6hV71jQUNgSy1LNPLAIveMnFUYRGpDK+06PX/VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1hYj5YSgdxXJFD78dMqajro/Qtk+kAZj8qRKcF3Rs4+csrjBMd9SxtBsb3ZNGEBz9m3R55ZVHZj4CufKGFwHZi01/GUeKxeRKAegN57Lj8+8V6KM9QFjMgE/MPZI3U7qxyJrhAHIoy/gUz4sckZrA8Lok/G6I4Xkb2ARqFExwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oSIzVgg/; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ecf99dd567so87336816d6.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 May 2025 01:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747901944; x=1748506744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJTN6hV71jQUNgSy1LNPLAIveMnFUYRGpDK+06PX/VA=;
        b=oSIzVgg/OAQc77oUvdk8kfvShMVQEcK+MCm7W3W4aSaYk3Jhvzbx7jxEUBHVy9/bkL
         G16juiM/mexl75JYymtdq346MA7Up0t21Pn4M4Pfzz7p3HIA8QQfoOuWDFluZQrxByMV
         wQtL4AZLn5jcqsWV8MrgaLVkBC2b/P6wKE0iAtMr39dOmymTdlCRIBn6NR1YxfvV2Fx6
         LwY+0VlUnmCF8G3eFhlDYZGfF9EIEqe8s5NMc345F6jcJZLYadbwZMTA7BqUZNrCdAVB
         YVazQb2/0wS0lFx8pBcBH4/ILuFqucMhk3Ng5GaVyCLUonsolX7iGB/mgH4vMaQeXzcB
         JHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747901944; x=1748506744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJTN6hV71jQUNgSy1LNPLAIveMnFUYRGpDK+06PX/VA=;
        b=TXXdU/EqJkScvUaoXCqUgjtxc8zo3V3VqqpUPuCl6t6Z5W7stF5K55v69Z6P44sWF8
         vZeGYzzroc2aDMvft/iHa97VwO+5LwowkziyVqPhWQKvg8UW06bIkY8n/24coEUnsgQV
         9a09r0Y/yrEN0BtZuLP4q9a9Y1WHVBcA3KYX5V3cJtYlJ9uXrdZTQm/SiOrtOPChP3/f
         0PIdA4PNoxaB2RzIrIdwEwNlSmJEW3V5YFnyPpdS1nkjsHokmUjAyZ2pkmw2XkUTEqI6
         1Mzz6qg7H3Wi1P4gmW6RBOC5j6QokCuAwx9VQ6y8EMEoponKjhJqdEQZ023/uSpHXPBj
         0KNw==
X-Forwarded-Encrypted: i=1; AJvYcCVs13oFjuvxZaXyldkoqSg+36GVyLgs+rQ/3enXaMoSKvcEFb3Pe+PZBqLURhpRoZcaQRVaCF/POgbI+T0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt114hX6TftNiCOadEIS9IRewd2k6EN77L+CD7H1gsG/WCvEvC
	qkip2aTX+ORCq3ksGItbVs1MzznEhHTzED9tSN/eGi4fQR+GHGAltIoSMFFgqyAyAQOF/QfKk8U
	rsUIMGAB7kxya8ZJq9ishyRvaGG2v6j9Y+BEEtRvA
X-Gm-Gg: ASbGncsBRVonDbEEKbU1ysqK00/RozdX32kj/oYC/vP/ayqCCjQVooNoKKor2yl8H9R
	qZenLPSJqp7x4CZCE++hUVo+lO7lWFuDsB+Ifbd4IzVaE5Ikj42GsQWreVSZQV1CDFhrwqnWTUz
	ikIyBHJhgk0ok6S9yb0PTU8i/4nJ2qrT9ESlDZIBy2TO1QWxgW6FWBhNwhJUgC4gfsqieyN1ctE
	A==
X-Google-Smtp-Source: AGHT+IHQHS5Z4OfCDsSLJETYOT+4adkEmE5LR6YcwjJSerg+rRFXldUX9SiNeZoXTpvEKIrHUxfsfRBmdUdLiYq7J2c=
X-Received: by 2002:ad4:5f8e:0:b0:6f0:e2d4:5936 with SMTP id
 6a1803df08f44-6f8b0881a22mr402532476d6.22.1747901944252; Thu, 22 May 2025
 01:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507133043.61905-1-lukas.bulwahn@redhat.com>
 <20250508164425.GD834338@ax162> <CACT4Y+a=FLk--rrN0TQiKcQ+NjND_vnSRnwrrg1XzAYaUmKxhw@mail.gmail.com>
 <CAG_fn=XTLcqa8jBTQONNDEWFMJaMTKYO+rxjoWMHESWaYVYbgA@mail.gmail.com> <61db74cd-2d6c-4880-8e80-12baa338a727@app.fastmail.com>
In-Reply-To: <61db74cd-2d6c-4880-8e80-12baa338a727@app.fastmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 22 May 2025 10:18:27 +0200
X-Gm-Features: AX0GCFuwLEa7GMNWl3kzXafes8eikGOYdLyOEbupah07l52RPChxZx4Uvrgxo3o
Message-ID: <CAG_fn=XZ4CrMfPEr8hgsFfkuftRAKp3xLjAUqSjwmn5Q98c27A@mail.gmail.com>
Subject: Re: [PATCH] Makefile.kcov: apply needed compiler option
 unconditionally in CFLAGS_KCOV
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrey Konovalov <andreyknvl@gmail.com>, linux-kbuild@vger.kernel.org, 
	kasan-dev@googlegroups.com, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>, 
	Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 4:11=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Wed, May 21, 2025, at 12:02, Alexander Potapenko wrote:
> > On Tue, May 20, 2025 at 4:57=E2=80=AFPM 'Dmitry Vyukov' via kasan-dev
> > <kasan-dev@googlegroups.com> wrote:
> >>
> >> On Thu, 8 May 2025 at 18:44, Nathan Chancellor <nathan@kernel.org> wro=
te:
> >> >
> >> > On Wed, May 07, 2025 at 03:30:43PM +0200, Lukas Bulwahn wrote:
> >> > > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >> > >
> >> > > Commit 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin") remo=
ves the
> >> > > config CC_HAS_SANCOV_TRACE_PC, as all supported compilers include =
the
> >> > > compiler option '-fsanitize-coverage=3Dtrace-pc' by now.
> >> > >
> >> > > The commit however misses the important use of this config option =
in
> >> > > Makefile.kcov to add '-fsanitize-coverage=3Dtrace-pc' to CFLAGS_KC=
OV.
> >> > > Include the compiler option '-fsanitize-coverage=3Dtrace-pc' uncon=
ditionally
> >> > > to CFLAGS_KCOV, as all compilers provide that option now.
> >> > >
> >> > > Fixes: 852faf805539 ("gcc-plugins: remove SANCOV gcc plugin")
> >> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >> >
> >> > Good catch.
> >> >
> >> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >>
> >> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> >>
> >> Thanks for fixing this!
> >
> > @akpm, could you please take this patch at your convenience?
>
> I have applied it on the asm-generic tree now, as this contains
> the original broken commit. Sorry for missing it earlier.

Thanks!

