Return-Path: <linux-kbuild+bounces-1667-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD68AE1E0
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 12:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C51DF281502
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 10:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE515FDB5;
	Tue, 23 Apr 2024 10:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1dmxcZ4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEEC54BF7
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 10:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713867280; cv=none; b=HGVvkwMjH2TKagGUxFp+sU4Xd/cfdCzOSnSIJ0w+Wog6now49eS4tUroz08LLAa9D3gxVFS99jig21zbO23Z7A3JiX2y2vcpczoUYGlTOcpaONLp1oJuE0A0BFPhAixphwGTIvM5MMvziQ9s67PYLlFHk87C3PU0CI94ZOuIodA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713867280; c=relaxed/simple;
	bh=9oTkPIZwjck344oiw7dBa4T4RJ56uPJf+FXMs7GpLhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikdyALyLRsTXjU6iBvW6vN3Iqaa4O9g6zioLBXBdY2ZKsUJSOQRVOR8kHme4+AmOxHzd6UQBXJG9aW6Nt1ae+GqG7WAjf2PZ+xh3SszgdcHNTTEqqtlyInJzUWeIQDTCuVWk+tf2jC5mUCYR1b9GIwF3OXGnd6246dahmCvDNtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1dmxcZ4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747FDC116B1
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713867279;
	bh=9oTkPIZwjck344oiw7dBa4T4RJ56uPJf+FXMs7GpLhI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h1dmxcZ4LR9r3IBJDLOMr/t6MSqQ/jWSx8ahpj+30geXejLAkAMILNXwfh8WYanPb
	 z6uKRmoDH81NyLXyMcmVgTjrWux6VcBKLkjr/PNpn8yO3c0qoazsKe4GbioIBvGekT
	 6yozye/E96+wXTkn+oVHzWL8y0PzzcNPEBzb1n+frq38dfXuUl7ttQCwLUKYr0NfaM
	 OBYebCuruSlg8tqMvd5OfyQCpxLFxVT7a6wU2b+Zlj/NtrGaPnCzK9oWTbmbaAOff8
	 Z6tdHuVqKmrBKqt/h0sKIMnN9k6/pxyPJPVQpeG8i0U2pQjlnBOzu6cNIDVhDaZyFT
	 QPHFnoOux684w==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516d264d0e4so5774736e87.0
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 03:14:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqfbBn1Mmy82hY1h//8trX8CNKKb/bj2C8cGsatj0R9hR6iXjjeqB3/IoI8L73ZpZW3b9BZ6aVHqq+ZuYORmaAHTF2UWpuSAkGvOBZ
X-Gm-Message-State: AOJu0YyBcd2wdcC04JKbeLnsNvu75BGLHtvjwDeo1NlOPa+DstI51w2p
	aUTFX3yT0wRDmF8zVX93iKtql5foLjzlA1Gg8f7D8F65jFlb2tYqsEZhfxOXLIBcTh++ubqMo/x
	5SBQNam7ACkcqIHNxU/fQ257TdN4=
X-Google-Smtp-Source: AGHT+IEd8pym937CDzlNwPyYFBoJqK4ujznW0X9lDe5ok98eTWFzKs5fomV3x+0Y6lFvYO//jH12TGozLn2nyBhT/yw=
X-Received: by 2002:a19:6908:0:b0:513:ec32:aa88 with SMTP id
 e8-20020a196908000000b00513ec32aa88mr733961lfc.8.1713867278192; Tue, 23 Apr
 2024 03:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202404231102.r0G0StUJ-lkp@intel.com> <CAMj1kXH+i1mEFsgZnXokbJ5srDbZY50QGGJcf7yr0w2BowJB8g@mail.gmail.com>
In-Reply-To: <CAMj1kXH+i1mEFsgZnXokbJ5srDbZY50QGGJcf7yr0w2BowJB8g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 23 Apr 2024 19:14:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT03evAPYQ0yuWLv+ne4_d6XvhOesFUMA+S_5SLH0hdUg@mail.gmail.com>
Message-ID: <CAK7LNAT03evAPYQ0yuWLv+ne4_d6XvhOesFUMA+S_5SLH0hdUg@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 5/7] kernel/kallsyms.c:181:56: warning:
 array subscript is outside array bounds
To: Ard Biesheuvel <ardb@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 3:57=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Tue, 23 Apr 2024 at 05:50, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux=
-kbuild.git kbuild
> > head:   8246a1e9b922c0e797ec28d8a602de1384ff8140
> > commit: 0bdad28369fc5e93de39b5046228ed78e982fc71 [5/7] kallsyms: Avoid =
weak references for kallsyms symbols
> > config: i386-randconfig-001-20240423 (https://download.01.org/0day-ci/a=
rchive/20240423/202404231102.r0G0StUJ-lkp@intel.com/config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240423/202404231102.r0G0StUJ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202404231102.r0G0StUJ-l=
kp@intel.com/
> >
> > Note: it may well be a FALSE warning. FWIW you are at least aware of it=
 now.
> >
> > All warnings (new ones prefixed by >>):
> >
> >    kernel/kallsyms.c: In function 'get_symbol_pos':
> > >> kernel/kallsyms.c:181:56: warning: array subscript is outside array =
bounds [-Warray-bounds]
> >       return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
> >
>
> OK, so weak definitions result in compiler warnings. I don't know
> whether C requires weak definitions of array types are always the same
> size.
>
> We could work around this by
> a) emitting the weak definitions into a separate object file, although
> this may still violate C, and does not hide the issue from LTO
> b) go back to using PROVIDE() in the linker scripts
>
> @Masahiro: any preference?


Then, I am fine with b (i.e. v4) for now.

Maybe, I may want to kill PROVIDE() when I have time.




--=20
Best Regards
Masahiro Yamada

