Return-Path: <linux-kbuild+bounces-3697-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5E983F99
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 09:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19D5DB228BF
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 07:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2558811CBD;
	Tue, 24 Sep 2024 07:45:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050371803A;
	Tue, 24 Sep 2024 07:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727163953; cv=none; b=ZZ8FRZUzkHdjifrpoEr5QLcakyO2EgtIkiSD7BTtS6LiX06mGEbVliiiGJD7spprWzwoVWGs2R+rfX+9sg4eHaFGgPaVsTb7+qbMJDtbcYvImaG88dM2Z+pcFU22lNxlj45hBvSWXbNzgh5Qzr+SlY7PjttDEimsUPBApx7suuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727163953; c=relaxed/simple;
	bh=2c9qY0zOKSHy6fPePBLlrhvns/MQJha4cFe8EOydcRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NI1UeUQk4hpbVudWOrFhMkS/90vqpYDniQOSEWiYuo0hrMSKxAUP/qZ3eFLOwWvjTjGGh0UoQTr5Qp7J2ppqL54MBbVZKiHmDc3KY4t1iJzeQiPihkDbMCc+0Mjk3F3MpDVkTiQuNWbmzNJtYTGiW5bCSSpypB2j94AvNyR+p9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1d4368ad91so4792976276.0;
        Tue, 24 Sep 2024 00:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727163948; x=1727768748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HF4eApvG4Dr17TRVbWAn/oqbrhes5tsWNdoiUFvIyHk=;
        b=QDggGpWBR1npF8lxRv8uupebeDZgjdND7cKthQoFl3Z4OI7cx1qjKSc8vyAM8m7KRs
         rnmtiIaoyNVSLj21CswZXP5Y68B/m6P8EW30BJeKdBaBLzpM7KhbjzF2n0/vKoShjFUA
         qZdh1kUwXgCEnxsZ8EmEN9L8pjuelJtnqwcFp4nLK9j37x0oiT3QR52Tak/y9VwHHsHK
         q8iwvEyLHY3Lf0Z7OYXZRS6C/VVeAEVhHpxu9LZ9JW2Q8pFtWx173C8K1CmFetlInEug
         uKUjyJz04uNqrIVG/Rhtncnm1hV/NquFLvBc9BBs4IsGnG3LUiMOsKLHjsAFRsMzs7dB
         0Rww==
X-Forwarded-Encrypted: i=1; AJvYcCWsq5l9sQf9my9GBXbwRyV+TW6UhpIN2eHpDKvf6a7RnU/ISTp5UsZrAQ553EV810U1yZEQjze967FrzUXb@vger.kernel.org, AJvYcCXV8XrvXJMHWTclm22UTVWsWIHh6vOsoWZOWX5apz3WpTXSWQb6LpMgkXxzUjV3Jp6/XE2P9itgB+3gYQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPoH94xBS2rT6E47n6AlWUdnDEmOVOy0moYLszCULZjIaqCfdY
	7Cbgsugu5yr4YzfmbwxxDB8AiYjpFBNuPdecLLVbpdfBZH5xoacRmK1FgS6P
X-Google-Smtp-Source: AGHT+IGYTXkx4veSbuiLQWrePPtz4BomdwGszxruZmZrd0xO1U8j5vRoq4WsevDexee0JbIjGnZLiw==
X-Received: by 2002:a05:6902:2e89:b0:e1a:b0a1:3406 with SMTP id 3f1490d57ef6-e24978657b8mr1721415276.4.1727163948309;
        Tue, 24 Sep 2024 00:45:48 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2499c77eb2sm167923276.60.2024.09.24.00.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 00:45:47 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ddca648c26so42056527b3.1;
        Tue, 24 Sep 2024 00:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVBZoooPeqCfQTYfId+D55/gjjVikypsquz1x4SdtW9PddfdqewLh2T8ACAdlAj+K8CEv3OhI6WsO9ZmfE=@vger.kernel.org, AJvYcCXvIs2aiZcy+etDMTJWe7eRGfUV6WlSNpuilPTiyPqVyNifRqe8bd4Q4mDJ+9t/KoNRmtTKGhsG7P9N/7p+@vger.kernel.org
X-Received: by 2002:a05:690c:94:b0:6dd:ddf6:90aa with SMTP id
 00721157ae682-6e2085653fbmr16769677b3.5.1727163946854; Tue, 24 Sep 2024
 00:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923142533.1197982-1-linux@roeck-us.net> <f15ff981-e725-40f0-8d2f-856b4b6a65b3@redhat.com>
 <4c2cdf84-9794-4722-8417-cf924f890797@roeck-us.net> <203f0d01-d25e-4436-b769-b89edb1b57d9@roeck-us.net>
In-Reply-To: <203f0d01-d25e-4436-b769-b89edb1b57d9@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Sep 2024 09:45:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfsgnCRLhCkvJBn8Prdd4M=HvwtsPT0BeRPtA-nFHzYQ@mail.gmail.com>
Message-ID: <CAMuHMdWfsgnCRLhCkvJBn8Prdd4M=HvwtsPT0BeRPtA-nFHzYQ@mail.gmail.com>
Subject: Re: [PATCH] mm: Make SPLIT_PTE_PTLOCKS depend on the existence of NR_CPUS
To: Guenter Roeck <linux@roeck-us.net>
Cc: David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter,

CC kbuild

I have two comments...

On Tue, Sep 24, 2024 at 1:52=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
> On 9/23/24 15:08, Guenter Roeck wrote:
> > On 9/23/24 08:23, David Hildenbrand wrote:
> >> On 23.09.24 16:25, Guenter Roeck wrote:
> >>> SPLIT_PTE_PTLOCKS already depends on "NR_CPUS >=3D 4", but that evalu=
ates
> >>> to true if there is no NR_CPUS configuration option (such as for m68k=
).
> >>> This results in CONFIG_SPLIT_PTE_PTLOCKS=3Dy for mac_defconfig.
> >>> This in turn causes the m68k "q800" machine to crash in qemu.

Should this be fixed in Kconfig (too)?

> >> Oh, that's why my compile tests still worked ... I even removed the ad=
ditional NR_CPUS check, assuming it's not required ...
> >>
> >> Thanks for debugging and fixing!
> >>
> >> Acked-by: David Hildenbrand <david@redhat.com>
> >>
> >
> > Apparently it wasn't that simple :-(. 0-day reports a build failure
> > with s390 builds.
> >
> > arch/s390/mm/gmap.c:357:16: error: implicit declaration of function 'pm=
d_pgtable_page'.
> >
> > Turns out that
> >      depends on NR_CPUS && NR_CPUS >=3D 4
> >
> > doesn't work and disables SPLIT_PTE_PTLOCKS even if NR_CPUS _is_ define=
d.
> > I have no idea how to declare the dependency correctly.
> > Sorry, I did not expect that.
>
> The only solution I found was to define NR_CPUS for m68k. That seems to b=
e
> the only architecture not defining it, so hopefully that is an acceptable
> solution. I'll send v2 of the patch shortly.

My first thought was to agree, as m68k is indeed the only architecture
that does not define NR_CPUS. Upon closer look, most architectures
have NR_CPUS depend on SMP, hence I assume the issue could happen for
those too (although I didn't manage to create such a config on anything
but m68k)?  So the simple solution would be to add a dependency on
SMP to SPLIT_PTE_PTLOCKS.

BTW, the list of excluded architectures looks fragile to me:

    config SPLIT_PTE_PTLOCKS
            def_bool y
            depends on MMU
            depends on NR_CPUS >=3D 4
            depends on !ARM || CPU_CACHE_VIPT
            depends on !PARISC || PA20
            depends on !SPARC32

If this can't be handled in a generic way, perhaps this should be
changed from opt-out to opt-in (i.e. select gate symbol in arch-specific
Kconfig)?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

