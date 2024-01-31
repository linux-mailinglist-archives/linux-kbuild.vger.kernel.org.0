Return-Path: <linux-kbuild+bounces-735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 361368436F0
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jan 2024 07:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A7681C22744
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jan 2024 06:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDAF3229;
	Wed, 31 Jan 2024 06:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ne+/Yhzx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91F4D584
	for <linux-kbuild@vger.kernel.org>; Wed, 31 Jan 2024 06:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706683340; cv=none; b=qn8Z1ka/Z4hw6hbubMXdckNqlueUt+MaENZSXZmZ5BHYWzndqZ8JBv2yQSMSw5AzNtH8do3RyGQuLoZWhDcphbecT/sxENvfbaR4Aqyhp5XzWHWvhRsoRL0Ln40rY+4ZY0EsNMULPDmKxZphglir0yRC8FC2m/U6jcdEUuAPnk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706683340; c=relaxed/simple;
	bh=ECdvo0S8N/5yOc2o8lP1oxnmO6/ebc99S2WE+tWbPHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+GEmBBMJ72pTRO8+/79ukSyartcYi8hvLZTsfD1M/5TU0DsNTgMkzb98PkGzrdoq3g9XzrIexwmjI633oIsXpBs2WPO4CyOwZ/NGCSpsI6Z2osxXTShAjWgKoy03nTRKZfko07wmUXTvP9fiCDLOeWs4VWnWKZPIJi0+itn31U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ne+/Yhzx; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-429fc7a1eacso48328091cf.2
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 22:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706683338; x=1707288138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o34aWoAlOmhKXA5GbuG42EK+jobpqYmSkbfKcbistEs=;
        b=ne+/Yhzx7fvFR+dSDY2PcyBTAwSSIy+v2CIr7eLNBLB4UdaYB/WvBPB3Soch2IDWzv
         L0gTuapXu19dnt5msX2mAX2Iigcgb1+0zeY6KMX/xMkSIgG5aofHuk4fWEnuB5U8EJNB
         PYR83z/TIuOKNhfhws+udbY7A1R9lz0trT5oAhqG4uMgInhQtefBjG1tcnHPuRonAmNH
         /y79jPY9b1lhc2OFWTO0NASOp/C4I3gQPx+Q7caOcGHUPBJWjPZ8sT/6auujPnZeAVok
         6TY4f6oeq1WiSKOVOg1vRGBM50n/EN9SZ4hId5PWlh8PWm4lrQI0I/zpz1pz2Jxo9MoL
         3yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706683338; x=1707288138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o34aWoAlOmhKXA5GbuG42EK+jobpqYmSkbfKcbistEs=;
        b=QaPjjzbbYRSWmj5nfQuhdRmeFtFm0p1y8iHpSX8aXOF8ZMv4HmNR66YH0XPpV+PHL9
         XCCckBQwOsTSJ5/2Fcamo0hnRCGblY72xY3ZWTFkVWuqwjxG+bru8D6k5PmiO0MeDx2X
         FFeSDrnV7/spwWxUSpnYipmyRzqEkojjUVnvxZ5oRexK7o0+fnnrfjxwF+MkYB/nB99Q
         dQ/uW2nC1kNld8B2vRpgVdmt3NwsFKQ1S8otwGFwLVj0NWWzAppKPOpXpOtQ2p+PbTxv
         g51pVtaWaFkBXc5YBl9IfqpGVr8x/0Kzldyw/A3vdhavEqpwO1POxtRi/Yn+P0VHcYNA
         kK4Q==
X-Gm-Message-State: AOJu0YzQz8ZAETfFiehcs8kFt4ecZQxFTAyaxdMVvt3GKhjSmbZqjSrD
	sjkN5ht3EBzlOjdNGFAfLwu16q7rDCAODs4YWgnxbf/cmj8KdBGWX4SMi34uFPm4BWlN/n/XE+E
	FoSEppO7X4oUSCV07Ni7dcW9z8DM=
X-Google-Smtp-Source: AGHT+IFlMgTK305AA+mJOGmz2SaV2n+ixER8aVdaEwMzLL7wI+G9hCR05Kcu4DmYNSsrRKQNdsbrc5ZYyboabHJ9Jdg=
X-Received: by 2002:a05:622a:1a03:b0:42a:33fa:4365 with SMTP id
 f3-20020a05622a1a0300b0042a33fa4365mr889755qtb.28.1706683338213; Tue, 30 Jan
 2024 22:42:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLshjakU3pXu_odd1-et2KfOUrhTruRcRBP=T-dhnYRVzg@mail.gmail.com>
 <CAK7LNAQ6ZrcX6XqxcjgrnHiV9BHFOvTchccxzQE4JGq7W0FqWw@mail.gmail.com>
In-Reply-To: <CAK7LNAQ6ZrcX6XqxcjgrnHiV9BHFOvTchccxzQE4JGq7W0FqWw@mail.gmail.com>
From: "David F." <df7729@gmail.com>
Date: Tue, 30 Jan 2024 22:42:07 -0800
Message-ID: <CAGRSmLs9M+XAk6q=7s_aGMfjAHkTVEtYszsTsoBkSdwPoeTd9g@mail.gmail.com>
Subject: Re: Changes to kbuild in 6.x causing cpp build issues.
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, I use .cpp rather than .cc, would I be better off using
.cc?     Or, how do I create the .cmd file when building the .o file?

On Tue, Jan 30, 2024 at 12:37=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Tue, Jan 30, 2024 at 3:32=E2=80=AFPM David F. <df7729@gmail.com> wrote=
:
> >
> > Hello,
> >
> > resending this because it doesn't show that it made it to the archives.
> >
> > I've been building an out-of-tree linux kernel module that has a .cpp
> > module (plus a library that is built) for well over a decade using the
> > basic method outlined at https://github.com/veltzer/kcpp.   There was
> > a patch needed (provided here) in the 5.x version to be able to link
> > to the .a file generated.  That patch I've been able to modify as
> > slight changes occured, but now in 6.6.14 things have changed a lot,
> > I'm not sure if I'll need something like it to get to the final link
> > but I don't think I'm at that point yet.
> >
> > My main issue now is this:
> >
> > LD [M]  /media/sf_SRC_DRIVE/mymodule/l
> > inux/driver/6.6.14-686-mine/mymodule.o
> >   ld -m elf_i386 -z noexecstack   -r -o
> > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymodule.o
> > @/media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/mymodule.mod
> > # cmd_modules_order
> > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.order
> >   {   echo /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/my=
module.o;
> > :; } > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/module=
s.order
> > sh ./scripts/modules-check.sh
> > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.order
> > make -f ./scripts/Makefile.modpost
> > # MODPOST /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/Mod=
ule.symvers
> >    scripts/mod/modpost -M -m       -o
> > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/Module.symver=
s
> > -T /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/modules.or=
der
> > -i Module.symvers -e
> > /media/sf_SRC_DRIVE/mymodule/linux/driver/6.6.14-686-mine/.mymodulelind=
rivercpp.o.cmd:
> > No such file or directory
> >
> > It has never built a *.o.cmd file for the .cpp module and still
> > doesn't, but the new system is looking for it.    Could someone
> > familiar with kbuild tell me what I can patch / do to allow the system
> > to complete the build like it used to?
> >
> > Thank You.
> >
>
>
> Presumably, the relevant commit is
> f292d875d0dc700b3af0bef04c5abc1dc7b3b62c
>
>
> modpost requires .*.cmd files, when CONFIG_MODVERSIONS=3Dy.
>
>
> This project does not produce .*.cmd file
> when building *.o from *.cc
>
> https://github.com/veltzer/kcpp/blob/177ea052f3c52c9f85bb091235061a0e620f=
51bd/Makefile#L68
>
>
>
>
> --
> Best Regards
> Masahiro Yamada

