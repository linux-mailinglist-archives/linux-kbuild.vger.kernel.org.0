Return-Path: <linux-kbuild+bounces-5102-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ED49EFEEE
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 23:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ABD1165B72
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 22:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9121DD0FF;
	Thu, 12 Dec 2024 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TDKoOuQ0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0931D88DB
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Dec 2024 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734041014; cv=none; b=fYdudlYOmrJsJNmxxc344IQqwAhmc0HxxWNXYW3cq/Oep6iOxlzXdCaaWCiQI2JAI8oJWrxUUvzaH7jDRQAa27JZqmiye6UEFI6Lr+R0X9QL5bOrq0BaTzERkgLn7JtFky41N5+7ul62e0PO3oDqZlv1aMltNRVdI2O8qTzSz2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734041014; c=relaxed/simple;
	bh=CRwmUv4IRr1Zsl2l5O8iNo6qgyCr1gO6u+tuGewt/rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGoE7YFpUb4z3mGAffaMJ1Q05OyFSH5Ga168z3gPOqvkaaN+8ShYs1cwR5clfVkCx05TNzPY2XS15XHrYwgtXPZapBFfhHAeFEm4HMdYnJ5pLEXB2ci1mCoQOTdz9KPhxOY5PaKIRIDzkU2Hz7e52Hjk+49fek08NHrI2qtqS54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TDKoOuQ0; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4679b5c66d0so15871cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Dec 2024 14:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734041012; x=1734645812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UolAYRSfthqXCSLPGGN4mTa1qltoMW6sppP83v6THCY=;
        b=TDKoOuQ0Z4SzapnjN5WCQvwUsVau5P9ESW6FRbX3uCWJIVa/eonsfM4lTLdWbgPZzq
         L/ysN87H74/gGPp+XQxEZVygkMdEcZ4eMuxeNgjKyhFT/qScosoAXT7pjey5Nl9etX5r
         ZM6GvXLsPL1OiJ+jxUDTZoAwZYJr+YrgKjh8pP2gGOlswTW0YG7ORk54Jh/3ZsSMRJ+H
         2EiKycHxPQ8aKfBPDJ0XFXhDr35R6i6kAefYWzWWzri+68Lw1/p2PLeioFQHhMI5OTHc
         J8cRLyOFFgA3UCxz4uzlRpX/7+yzxc+1WDFi9T7hFBOsXfGfIEcyLkg5eNgtXNe0M3Lt
         xZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734041012; x=1734645812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UolAYRSfthqXCSLPGGN4mTa1qltoMW6sppP83v6THCY=;
        b=uaGz0iuMR9yPpspl2dmK6nNEEGgY/glpO8tlERZgmmgX36ndgUGVCnAq2IYjLLYCx9
         OvEy4/YjcaPtDJvbyqbNxlxI4WG1ajWsycQJLms5HkLoeL9SWMJSrQ6HVU9oDuoBo9ie
         AEYyOJso8en8TSqhcR55h4g/gwdksdFHGYNrBZc/c7GecHz5E3HZuC/2XAXfbtLDeNHJ
         /NM6lOV2Y4GmHJM/QoBeJgpH/GjkGpsDf5YmlecmgkcmBb9aTNQuHab/UjqcGwaJgl5G
         sXU1qbq8mfhApp8U08ILDe5rSwiGyeY4K/aMtMoufGHXd91H1KKSKF8WwkP7m4a60NCa
         Pluw==
X-Forwarded-Encrypted: i=1; AJvYcCUQzjzS/9GWnyzPjhphgSEY8jsxGrmy1eOcNOGSVE7LjjqVaDm+u2+3nI6auiVmlam10dNgstmlyUoguHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYH8YZGV8CdcuuITEdRE/GxQhE/KPhlv93ni0i/dml5N0koApx
	7nxV3iihsUNeJAxAUJ14KBkm5+V/EHR3NxR+QjGF7aQgFJLy3bzKQixUf7C5GtJyvVMf7iKZM3l
	VkZUqra2heRBfCNqAFSBeBNnqzEg0ijBcIcAD
X-Gm-Gg: ASbGnct7jETthEIRrIYq6PN04rficSda/bASAm0UbJ5faoh4UzHO8+IaQCni9b/S85t
	Us4Nb5VYSRLNvWLZ6zpld47YdgLzHgXq6/BNI78IPtYkFxfTV7X6HZVyqrpRk37uFBRTRCZ0=
X-Google-Smtp-Source: AGHT+IEtTXrfsemev1bQXjp2ru2C3SgTe0WM6v4TuwBypYZLXlJpqMqyNYgXDGfoZdfwkwvY0DZhia4IV4zRNCi3yYE=
X-Received: by 2002:a05:622a:5a86:b0:466:861a:f633 with SMTP id
 d75a77b69052e-467a588583cmr208881cf.5.1734041011301; Thu, 12 Dec 2024
 14:03:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241102175115.1769468-1-xur@google.com> <20241102175115.1769468-8-xur@google.com>
 <c0a6ae91-c925-40d6-8f95-59a9144d203b@linux.dev> <20241212213448.GA865755@thelio-3990X>
In-Reply-To: <20241212213448.GA865755@thelio-3990X>
From: Rong Xu <xur@google.com>
Date: Thu, 12 Dec 2024 14:03:19 -0800
Message-ID: <CAF1bQ=R9MTbCeRJi4eNMSW4s5OFVPXUhM3RPyUKr4xMn+Y1YwQ@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] Add Propeller configuration for kernel build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Li <davidxl@google.com>, Han Shen <shenhan@google.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Peter Jung <ptr1337@cachyos.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We will take a look at this issue and get back to you. Thanks for
reporting this.

Best Regards,

-Rong

On Thu, Dec 12, 2024 at 1:34=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Thu, Dec 12, 2024 at 01:20:46PM -0800, Yonghong Song wrote:
> ...
> > > +5) Use the create_llvm_prof tool (https://github.com/google/autofdo)=
 to
> > > +   generate Propeller profile. ::
> > > +
> > > +      $ create_llvm_prof --binary=3D<vmlinux> --profile=3D<perf_file=
>
> > > +                         --format=3Dpropeller --propeller_output_mod=
ule_name
> > > +                         --out=3D<propeller_profile_prefix>_cc_profi=
le.txt
> > > +                         --propeller_symorder=3D<propeller_profile_p=
refix>_ld_profile.txt
> >
> > Prevously I am using perf-6.8.5-0.hs1.hsx.el9.x86_64 and it works fine.
> > Now in my system, the perf is upgraded to 6.12.gadc218676eef
> >
> > [root@twshared7248.15.atn5 ~]# perf --version
> > perf version 6.12.gadc218676eef
> >
> > and create_llvm_prof does not work any more.
> >
> > The command to collect sampling data:
> >
> > # perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c 500009 -- str=
ess --cpu 36 --io 36 --vm 36 --vm-bytes 128M --timeout 300s
> > stress: info: [536354] dispatching hogs: 36 cpu, 36 io, 36 vm, 0 hdd
> > stress: info: [536354] successful run completed in 300s
> > [ perf record: Woken up 2210 times to write data ]
> > [ perf record: Captured and wrote 562.529 MB perf.data (701971 samples)=
 ]
> > # uname -r
> > 6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39
> >
> > The kernel is a 6.11 lto kernel.
> >
> > I then run the following command:
> > $ cat ../run.sh
> > # perf record -e BR_INST_RETIRED.NEAR_TAKEN:k -a -N -b -c 500009 \
> > #       -- stress --cpu 36 --io 36 --vm 36 --vm-bytes 128M --timeout 30=
0s
> > # good: perf-6.8.5-0.hs1.hsx.el9.x86_64
> >
> > # <propeller_profile_prefix>: /tmp/propeller
> > ./create_llvm_prof --binary=3Dvmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572d=
fac1b39 \
> >          --profile=3Dperf.data \
> >          --format=3Dpropeller --propeller_output_module_name \
> >          --out=3D/tmp/propeller_cc_profile.txt \
> >          --propeller_symorder=3D/tmp/propeller_ld_profile.txt
> >
> > $ ./run.sh
> > WARNING: Logging before InitGoogleLogging() is written to STDERR
> > I20241212 13:12:18.401772 463318 llvm_propeller_binary_content.cc:376] =
'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39' is PIE: 0
> > I20241212 13:12:18.403692 463318 llvm_propeller_binary_content.cc:380] =
'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39' is relocatable: 0
> > I20241212 13:12:18.404873 463318 llvm_propeller_binary_content.cc:388] =
Build Id found in 'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39': eaacd=
5a14abc48cf832b3ad0fa6c64635ab569a8
> > I20241212 13:12:18.521499 463318 llvm_propeller_binary_content.cc:376] =
'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39' is PIE: 0
> > I20241212 13:12:18.521530 463318 llvm_propeller_binary_content.cc:380] =
'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39' is relocatable: 0
> > I20241212 13:12:18.521553 463318 llvm_propeller_binary_content.cc:388] =
Build Id found in 'vmlinux-6.11.1-0_fbk0_lto_rc19_612_gb572dfac1b39': eaacd=
5a14abc48cf832b3ad0fa6c64635ab569a8
> > I20241212 13:12:18.521611 463318 llvm_propeller_perf_lbr_aggregator.cc:=
51] Parsing [1/1] perf.data ...
> > [ERROR:/home/runner/work/autofdo/autofdo/third_party/perf_data_converte=
r/src/quipper/perf_reader.cc:1386] Event size 132 after uint64_t alignment =
of the filename length is greater than event size 128 reported by perf for =
the buildid event of type 0
> > W20241212 13:12:18.521708 463318 llvm_propeller_perf_lbr_aggregator.cc:=
55] Skipped profile [1/1] perf.data: FAILED_PRECONDITION: Failed to read pe=
rf data file: [1/1] perf.data
> > W20241212 13:12:18.521718 463318 llvm_propeller_perf_lbr_aggregator.cc:=
67] Too few branch records in perf data.
> > E20241212 13:12:18.554437 463318 create_llvm_prof.cc:238] FAILED_PRECON=
DITION: No perf file is parsed, cannot proceed.
> >
> >
> > Could you help take a look why perf 12 does not work with create_llvm_p=
rof?
> > The create_llvm_prof is downloaded from https://github.com/google/autof=
do/releases/tag/v0.30.1.
>
> I think Peter may have reported the same issue on GitHub?
>
> https://github.com/google/autofdo/issues/233
>
> I wonder if this is a kernel side or perf tool regression?
>
> Cheers,
> Nathan

