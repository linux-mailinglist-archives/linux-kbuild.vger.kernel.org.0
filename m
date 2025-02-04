Return-Path: <linux-kbuild+bounces-5613-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7F8A26AE8
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 05:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B7BA3A54F6
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 04:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEB686324;
	Tue,  4 Feb 2025 04:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LL/kvNOz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3661E86E;
	Tue,  4 Feb 2025 04:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738641904; cv=none; b=l/RwZfXniqkNzpCXng8H2tqM0Ptavhq/Lft0ElNO2OZbpGtnLyD/J4XHvGiDO9RjVK7pRnim3Z8aVR2S0svJbz5z83K4D5AMTd4CVLSxIhrn/IR9scPlViaXEcOMgobeW0aoePnOHzwpvi51BGTAqMS1dIh0LekyZ7oad7nL8yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738641904; c=relaxed/simple;
	bh=6bVtRp4ma/3XAfRXklDX3ZGjq6cu/lwIqmyVbEim+a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rFOBFTTkU8uygI/kla4wvAnmVvAE45QpFszqy1akJOKAS4XB0MTjVcmxZNoMxtWeLRRgQ0T7uAnAB/iwESZgSqWZCyxyDzUMSjyTlTyI8wJzg3BlDokDhbGhF+GhGNL5Y1hWlX6BH8G4pt2YT/Q0mybKbANHvq4UUzXm4kp7dbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LL/kvNOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC440C4CEE6;
	Tue,  4 Feb 2025 04:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738641904;
	bh=6bVtRp4ma/3XAfRXklDX3ZGjq6cu/lwIqmyVbEim+a4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LL/kvNOzeYAa/09O+Hjo402TKZ5/EOoN8TQcbFeJ911ltmyFXd9uSsg9c1Crf1uMv
	 9Va09mav8/4G2XhKoi2pO+RMYCZIuw4st8hi/vl54060dNYGZ5tos7EAsZhWvPlHJz
	 m1zW4WTWSNXxZUcIchHZo/u+myk8tRt1OiJcEj4wQfVodpxmC0AOlHd40JU03kWCZm
	 vHwXc6tE2wn238eZ8n+LB8t6fiERAfmQrNksmA/DsewRw3T9YdGcsGJt2edfOuWQIk
	 X1G9PKA7trUAKdlpoUTEge2+x7BWuSzJ1SYCNJwKXsavtHkVKuyXpmzkwNLn4a0GeA
	 fYVpum82ee8zw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54024ecc33dso5278350e87.0;
        Mon, 03 Feb 2025 20:05:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUduYE375kq/sIQjW3F7vkRr6RIYXvz0zpEh8t8iwSkMzWF5g60uOUOloPXTKW90ur9nS1r+WJQmrPsMD7Q@vger.kernel.org, AJvYcCWFt3oLW7hXq5zEVlkeTu3Y/8MSNuxP2YMLHZ1vtPSa795eHmR3HFr1NTmqv3+OPw7Mo03AKVDvPxNVU3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjup+hIxL4jTbcJOAwB7edFB/wzPLMhnShZHEPBl79QkkOLVtt
	7kIemVvOeEJzEvXbSM+o73CcHSF4SywVkr3MpED40AYkeX/Q2pcubLqJ4zym/UacjMbjjPMvD5f
	Nz7iugkDVqyLOBhi3WYoPElZ6V/g=
X-Google-Smtp-Source: AGHT+IHlMZJiSIPfje5V6EpLCF9/1THBrDnaoiSmFMYZV1yxrts0ySZYzq9KhzqWKZMHD2nbIaJyN+BNN661NZ4Ddn0=
X-Received: by 2002:a05:6512:3e18:b0:540:3561:666f with SMTP id
 2adb3069b0e04-543e4beac7cmr7820687e87.20.1738641902557; Mon, 03 Feb 2025
 20:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162> <Z5xzkwwZAWRRLCdj@ghost> <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
 <Z51BpVEkmVCg7gTX@ghost>
In-Reply-To: <Z51BpVEkmVCg7gTX@ghost>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 4 Feb 2025 13:04:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>
X-Gm-Features: AWEUYZmxhfJiLTgBSx_fCApybyr2Ad9PFplUqS9irvMW6M3bhQaX-hsT1E7z8vE
Message-ID: <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 1, 2025 at 6:33=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> On Sat, Feb 01, 2025 at 12:10:02AM +0900, Masahiro Yamada wrote:
> > On Fri, Jan 31, 2025 at 3:54=E2=80=AFPM Charlie Jenkins <charlie@rivosi=
nc.com> wrote:
> > >
> > > On Thu, Jan 30, 2025 at 08:52:45PM -0700, Nathan Chancellor wrote:
> > > > On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
> > > > > On riscv, kernel modules end up with a significant number of loca=
l
> > > > > symbols. This becomes apparent when compiling modules with debug =
symbols
> > > > > enabled. Using amdgpu.ko as an example of a large module, on risc=
v the
> > > > > size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> > > > > (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21=
MB
> > > > > (--strip-debug), and 20MB (--strip-unneeded).
> > > > >
> > > > > Use --strip-unneeded instead of --strip-debug to strip modules so
> > > > > decrease the size of the resulting modules. This is particularly
> > > > > relevant for riscv, but also marginally aids other architectures.
> > > > >
> > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > >
> > > > Is there any sort of regression risk with this patch? If so, anothe=
r
> > > > option may be to give another level to INSTALL_MOD_STRIP like 2 so =
that
> > > > INSTALL_MOD_STRIP=3D1 continues to behave as before but people can =
easily
> > > > opt into this option. No strong opinion because I am not sure but w=
as
> > > > not sure if it was considered.
> > >
> > > I do not believe this would cause regressions. The description on gnu
> > > strip is:
> > >
> > > "Remove all symbols that are not needed for relocation processing in
> > > addition to debugging symbols and sections stripped by --strip-debug.=
"
> > >
> > > The description on llvm-strip is:
> > >
> > > "Remove from the output all local or undefined symbols that are not
> > > required by relocations. Also remove all debug sections."
> > >
> > > gnu strip --strip-unneeded strips slightly more aggressively but it d=
oes
> > > not appear this causes any issues.
> > >
> > > >
> > > > Regardless:
> > > >
> > > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > Thanks!
> > >
> >
> >
> > It is true --strip-unneeded drops a lot of compiler-generated symbols, =
but
> > it also drops real symbols that originate in the source code.
> >
> > So, this would give user-visible changes for kallsyms at least.
>
> Adding INSTALL_MOD_STRIP=3D"--strip-unneeded" would be sufficient for
> riscv. However, this has the downside that riscv will require different
> flags than other architectures to get reasonably sized modules.

You can use INSTALL_MOD_STRIP=3D--strip-unneeded for all architecture if yo=
u like.

I assume this is a riscv issue. Specifically, riscv gcc.
With LLVM=3D1, I see much smaller riscv modules using INSTALL_MOD_STRIP=3D1=
.

--strip-unneeded is needlessly aggressive for other architectures,
and I do not see a good reason to change the default.









>
> I believe these symbols are only useful for debugging, is there a
> usecase for them to be available when the user has modules compiled with
> INSTALL_MOD_STRIP=3D1?
>
> - Charlie
>
> >
> >
> > $ riscv64-linux-gnu-nm  -n
> > /tmp/strip-unneeded/lib/modules/6.13.0-09760-g69e858e0b8b2/kernel/drive=
rs/gpu/drm/amd/amdgpu/amdgpu.ko
> >  > /tmp/symbol-with-strip-unneeded
> > $ riscv64-linux-gnu-nm  -n
> > /tmp/strip-debug/lib/modules/6.13.0-09760-g69e858e0b8b2/kernel/drivers/=
gpu/drm/amd/amdgpu/amdgpu.ko
> >  > /tmp/symbol-with-strip-debug
> >
> > $  diff -u /tmp/symbol-with-strip-debug  /tmp/symbol-with-strip-unneede=
d
> >  [ snip ]
> >  00000000001676cc t uvd_v6_0_ring_test_ring
> >  0000000000167802 t uvd_v6_0_ring_emit_pipeline_sync
> >  0000000000167a02 t uvd_v6_0_ring_emit_fence
> > -0000000000167b58 r CSWTCH.2
> > -0000000000167b68 r abm_settings
> > -0000000000167b80 r abm_config
> > -0000000000167b90 r min_reduction_table_v_2_2
> > -0000000000167ba0 r max_reduction_table_v_2_2
> > -0000000000167bb0 r min_reduction_table
> > -0000000000167bc0 r max_reduction_table
> > -0000000000167bd0 r custom_backlight_curve0
> >  0000000000167c38 r abm_settings_config2
> >  0000000000167c70 r abm_settings_config1
> >  0000000000167ca8 r abm_settings_config0
> >
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--
Best Regards
Masahiro Yamada

