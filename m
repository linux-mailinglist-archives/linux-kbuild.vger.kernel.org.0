Return-Path: <linux-kbuild+bounces-5580-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B201A23F74
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 16:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D21761881CDB
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 15:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48C11C5D74;
	Fri, 31 Jan 2025 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jo4hQjC5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C94D3D66;
	Fri, 31 Jan 2025 15:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738336242; cv=none; b=vGuX1xWSre+ewkN8aJ7gTNhDYVDE13vrf/R0JO0/uHrycN4qJS1hPVvaVFV/rmJGH8kbgWDwY801+OG86LNerk6iiowrAwaeto1/jBLiHXbNIR63KQmgoyoueiFgnljmkb+9+0xnZuXtlh6I+dy7RqoH+xGoxsGMjtcCWfPGF8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738336242; c=relaxed/simple;
	bh=eX0cVA2yp71nvD7An+e7tafzcanp+36FNBsdUymO1Lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohWOtm5q4UazreBtNheqtQKFZuNbj4ikrY2Brg4dlsUZIGZvNf+4EoCYX3ozbTu3yOhhp5LeBU3WHZPaYhQmOVOr6Kyy/UdodAEN3LwLOed8vKR+vu6K964NPV/EjcCnINSkRAk/MzT7ZqON8tMMgiopyMwFahi8KfAG+hYTVk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jo4hQjC5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110CFC4CEE6;
	Fri, 31 Jan 2025 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738336241;
	bh=eX0cVA2yp71nvD7An+e7tafzcanp+36FNBsdUymO1Lg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jo4hQjC5aXakRQngnuNqTei/aintLDideMNfRRMpoHKdagZd5dGCa9ntGDzqkZvxx
	 tjxNoP4rC9xGhTf26llA1C/FXgbksxQUxV0wb6eRKSKviQqTFvceQuWEPQAzG25xpU
	 1DyTLB4R/PyDE5syvJ5JTKw/uWoLqdb2ZVc6Gud0gC94BX9r2hAZh0G0CZeXy4/BDZ
	 P//v8CKaDoI3WzYonswB3dLmuR3R/JOUqn+HmhVi5/O1D4sLcnGI5W1PCtnsfwpi76
	 JQUBaDVdVHiIXwWsFOadepXsQ7rBxIULMsiWOY1MQiG50924Yncf/e4v7Z1RvC2jMd
	 2pi680JBilq0g==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-543cc81ddebso2371210e87.1;
        Fri, 31 Jan 2025 07:10:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPnxAXyhZ0leAi3rulitHw2jwdEKrwGUxs/GS+NfTwF3rQsMBiSNW5OvhLA8f9C8WR9FsupEwaowoo+JY=@vger.kernel.org, AJvYcCWjbF/JD23sq/iNX8Xxh99qiXhWzHXbgrBHx4R38LsbLxZmOt7XzpnJpC7BmuQ1ziMarhZtcaVf8lOgoaG1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2YMO3proVoZLT7FangXp6cpTD4VXnQ0gzjEGywI0/FhQikpTQ
	wLbfpHbW+9cangED9XUOrmHM90GfXBGuRoCZwIkeccsw+zugbUjtttFArc0DGXiRxub7ocyqORE
	K9fb7ElIW5cgx7rVIIoL2SAuLhiY=
X-Google-Smtp-Source: AGHT+IEa5D7ILTAFw/tuud1q0Rc56l9olpgCHLQg0r7/Z2bDIApocb2GXjNIBwm86F2MUJw8DwMA84TcH2H9Zj6R7x4=
X-Received: by 2002:a05:6512:3a8e:b0:542:8d45:cb3e with SMTP id
 2adb3069b0e04-543e4beb1d2mr4122940e87.18.1738336239628; Fri, 31 Jan 2025
 07:10:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162> <Z5xzkwwZAWRRLCdj@ghost>
In-Reply-To: <Z5xzkwwZAWRRLCdj@ghost>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2025 00:10:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
X-Gm-Features: AWEUYZnyZe5mPzh78I__zpHIfZytPX5pJn8z98JOPt3b9lu7WLwCwryXByvCTvU
Message-ID: <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 3:54=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> On Thu, Jan 30, 2025 at 08:52:45PM -0700, Nathan Chancellor wrote:
> > On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
> > > On riscv, kernel modules end up with a significant number of local
> > > symbols. This becomes apparent when compiling modules with debug symb=
ols
> > > enabled. Using amdgpu.ko as an example of a large module, on riscv th=
e
> > > size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> > > (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
> > > (--strip-debug), and 20MB (--strip-unneeded).
> > >
> > > Use --strip-unneeded instead of --strip-debug to strip modules so
> > > decrease the size of the resulting modules. This is particularly
> > > relevant for riscv, but also marginally aids other architectures.
> > >
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> >
> > Is there any sort of regression risk with this patch? If so, another
> > option may be to give another level to INSTALL_MOD_STRIP like 2 so that
> > INSTALL_MOD_STRIP=3D1 continues to behave as before but people can easi=
ly
> > opt into this option. No strong opinion because I am not sure but was
> > not sure if it was considered.
>
> I do not believe this would cause regressions. The description on gnu
> strip is:
>
> "Remove all symbols that are not needed for relocation processing in
> addition to debugging symbols and sections stripped by --strip-debug."
>
> The description on llvm-strip is:
>
> "Remove from the output all local or undefined symbols that are not
> required by relocations. Also remove all debug sections."
>
> gnu strip --strip-unneeded strips slightly more aggressively but it does
> not appear this causes any issues.
>
> >
> > Regardless:
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Thanks!
>


It is true --strip-unneeded drops a lot of compiler-generated symbols, but
it also drops real symbols that originate in the source code.

So, this would give user-visible changes for kallsyms at least.


$ riscv64-linux-gnu-nm  -n
/tmp/strip-unneeded/lib/modules/6.13.0-09760-g69e858e0b8b2/kernel/drivers/g=
pu/drm/amd/amdgpu/amdgpu.ko
 > /tmp/symbol-with-strip-unneeded
$ riscv64-linux-gnu-nm  -n
/tmp/strip-debug/lib/modules/6.13.0-09760-g69e858e0b8b2/kernel/drivers/gpu/=
drm/amd/amdgpu/amdgpu.ko
 > /tmp/symbol-with-strip-debug

$  diff -u /tmp/symbol-with-strip-debug  /tmp/symbol-with-strip-unneeded
 [ snip ]
 00000000001676cc t uvd_v6_0_ring_test_ring
 0000000000167802 t uvd_v6_0_ring_emit_pipeline_sync
 0000000000167a02 t uvd_v6_0_ring_emit_fence
-0000000000167b58 r CSWTCH.2
-0000000000167b68 r abm_settings
-0000000000167b80 r abm_config
-0000000000167b90 r min_reduction_table_v_2_2
-0000000000167ba0 r max_reduction_table_v_2_2
-0000000000167bb0 r min_reduction_table
-0000000000167bc0 r max_reduction_table
-0000000000167bd0 r custom_backlight_curve0
 0000000000167c38 r abm_settings_config2
 0000000000167c70 r abm_settings_config1
 0000000000167ca8 r abm_settings_config0




--
Best Regards
Masahiro Yamada

