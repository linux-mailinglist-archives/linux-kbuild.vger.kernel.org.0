Return-Path: <linux-kbuild+bounces-2809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2E0947004
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 19:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A326B280E10
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 17:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2BF6026A;
	Sun,  4 Aug 2024 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/whfBWG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0036AE0
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Aug 2024 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722791833; cv=none; b=LnBYh/YB3hktVUB8Q9ly9m1f98p0XClDPdf+CD9/ItDBAeTPowr4eIzMKx8y06v3Khtib7VFwrzEG4/TTZU+9b7xGcFtCkXD/Jsv34HHG+qU12lqHZAyI4nmOIbXX0Acug6yMU2sxFG6knnjy7B4U+EU9Hyw2g2CdENQWeRmofw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722791833; c=relaxed/simple;
	bh=qoexMkfD53TBEjIGBpLEnHYzmJyC7hCI9xXLADGcabM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uq3SRfD/KI3ohOhXODnnJtntau1CuWqjrHw6BCNL8WARPCN3/Z1GVN66O8xconL9AIMh0ZdRDCHxiaNv9APMbuwuGTlhvwcp0DLAYaptkQX5kxlofsCxLIH+K8263XoiZiWVb8UBZxU+ZOoECADU5Ctc/o66DNipQwuFLDJvPX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/whfBWG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC12C4AF11
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Aug 2024 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722791833;
	bh=qoexMkfD53TBEjIGBpLEnHYzmJyC7hCI9xXLADGcabM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e/whfBWGFNJfKxMf6bAuZsQmWSln5VD3bkDvQHdpGqu0vPmoCkEpwQQ93/pTwP4jc
	 uSEs9RZEhjaDDvbXo48siogi0dFsECKA4/j+LobTIhRwPlEQJaO1WnT9yHMQ5/YZil
	 KFqMeG1ZSuOcInCfixMjCuq0EG0d1w/UmeY7zl2mtXbTuUqVtv4Yi0KU28Mk7GVGCQ
	 4VDn6GnAPYAk98VD//pisLlFogrHYZFGrtj/zbA6cV9iGPb3rGCNTF25aJ9QtdqWTI
	 QZhM46b1xPInJCVHiGfq5uC1lYpkLgBlpcoqVvCAsl3Khy+YOlLyeIJXDuzWeuH68V
	 EP60fq0DHtKBQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efba36802so15717504e87.2
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Aug 2024 10:17:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6D6x+3s60QPm0g0HodZKi3PcJJ0dzOs7+cnfZrfvUNmiSI08OEwmEYBdGPOScsOCuwq4hckywnQ62q76bMJ2fFSWxvsceL0s1XU1+
X-Gm-Message-State: AOJu0Yx/s1Q3t2g38KuheX5KG+BFAteopwC6JSx40TVyl/4mhhCXV12Y
	ZT1ETYMEmiizujO3ztPLQ9JOCzItQh72elHPMMgZ08WckYiMh3N9jPkY1FzICPcUI1yeoQzmETl
	7FNP1EAIfr0/OfqgQ8mpwQ/cs5dQ=
X-Google-Smtp-Source: AGHT+IF4rMtP6Lbqgnl5veIhHKyse4M1aa5S7/Zp9f1+lpHf1XREEdRLqZ+42Gxm7VFMFPJ28/BNYa/G1Z4dU8kVKhI=
X-Received: by 2002:a05:6512:220c:b0:52c:dfe6:6352 with SMTP id
 2adb3069b0e04-530bb3a2b76mr6349788e87.48.1722791831542; Sun, 04 Aug 2024
 10:17:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+icZUWUL956KOKGLG+h1VA9TTXaUc7MS12soUi62q2gj-+tqg@mail.gmail.com>
 <CA+icZUX-vannYgAHt3O00kwWXLX_cFpr6JJadX==bpZcUzh_7w@mail.gmail.com>
 <CA+icZUU-ktXDwQPA9cbXPM_A9pKoOzUCJ821Z2U1vzFkujMErA@mail.gmail.com>
 <CACvgo52-KbJHUde8kP5-=HdHoCFEcAt=mmy1i=MR7Er7xZz67w@mail.gmail.com>
 <CA+icZUVBqNjqO7LPydyYH0FxeiaX6NG6Hoq4WAOi_1cpAs5k0g@mail.gmail.com>
 <CACvgo52F2b2MiK4FcqMBTSP_pYjoGVZqnB86omXiEUv-FFNODg@mail.gmail.com> <CA+icZUU56KwRta_5MvmUiShZ_Yh72z8VmX-JaRjS7pkG_wYZjg@mail.gmail.com>
In-Reply-To: <CA+icZUU56KwRta_5MvmUiShZ_Yh72z8VmX-JaRjS7pkG_wYZjg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 5 Aug 2024 02:16:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS3_pMT7cnELDx5QJ4Z=O1n7=drd9OOFaD71H54ANm1hw@mail.gmail.com>
Message-ID: <CAK7LNAS3_pMT7cnELDx5QJ4Z=O1n7=drd9OOFaD71H54ANm1hw@mail.gmail.com>
Subject: Re: ZSTD compression-level when CONFIG_MODULE_COMPRESS_ZSTD=y
To: sedat.dilek@gmail.com
Cc: Emil Velikov <emil.l.velikov@gmail.com>, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, 
	q66 <q66@chimera-linux.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Torge Matthies <openglfreak@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 4, 2024 at 4:02=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com> =
wrote:
>
> On Tue, Jul 30, 2024 at 6:44=E2=80=AFPM Emil Velikov <emil.l.velikov@gmai=
l.com> wrote:
> >
> > On Tue, 30 Jul 2024 at 01:51, Sedat Dilek <sedat.dilek@gmail.com> wrote=
:
> > >
> > > On Sat, Jul 27, 2024 at 12:18=E2=80=AFAM Emil Velikov <emil.l.velikov=
@gmail.com> wrote:
> > > >
> > > > Hi Sedat, all,
> > > >
> > > > The mixed quoting is confusing me a bit, hopefully not to the point
> > > > where I miss some questions.
> > > >
> > > > On Thu, 25 Jul 2024 at 21:00, Sedat Dilek <sedat.dilek@gmail.com> w=
rote:
> > > > >
> > > > > On Thu, Jul 25, 2024 at 9:23=E2=80=AFPM Sedat Dilek <sedat.dilek@=
gmail.com> wrote:
> > > > > >
> > > > > > dileks@iniza:~/src/linux/git$ git grep zstd scripts/ | egrep '\=
-(19|22|T0)'
> > > > > > scripts/Makefile.lib:      cmd_zstd =3D cat $(real-prereqs) | $=
(ZSTD) -19 > $@
> > > > > > scripts/Makefile.lib:      cmd_zstd22 =3D cat $(real-prereqs) |=
 $(ZSTD)
> > > > > > -22 --ultra > $@
> > > > > > scripts/Makefile.lib:      cmd_zstd22_with_size =3D { cat
> > > > > > $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
> > > > > > scripts/Makefile.modinst:      cmd_zstd =3D $(ZSTD) -T0 --rm -f=
 -q $<
> > > > > >
> > > > > > -sed@-
> > > > > >
> > > > > > On Thu, Jul 25, 2024 at 9:09=E2=80=AFPM Sedat Dilek <sedat.dile=
k@gmail.com> wrote:
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > I am a big fan of ZSTD - here version 1.5.6 on Debian/unstabl=
e AMD64.
> > > > > > >
> > > > > > > When playing with CONFIG_MODULE_COMPRESS_ZSTD=3Dy I observed =
a 35MiB
> > > > > > > greater linux-image Debian file.
> > > > > > >
> > > > > > > Debian: ~100MiB <--- CONFIG_MODULE_COMPRESS_XZ=3Dy
> > > > > > > Selfmade: ~135MiB <--- CONFIG_MODULE_COMPRESS_ZSTD=3Dy
> > > > > > >
> > > > > > > So, I checked the used compression-level of ZSTD in the build=
-process:
> > > > > > >
> > > > > > > [ vmlinux.bin.zst ]
> > > > > > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep =
vmlinux.bin.zst
> > > > > > >  { cat arch/x86/boot/compressed/vmlinux.bin
> > > > > > > arch/x86/boot/compressed/vmlinux.relocs | zstd -22 --ultra; p=
rintf
> > > > > > > \370\040\157\003; } > arch/x86/boot/compressed/vmlinux.
> > > > > > > bin.zst
> > > > > > >
> > > > > > > [ amdgpu.ko.zst ]
> > > > > > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep =
'\-T0' |
> > > > > > > grep amdgpu
> > > > > > >  zstd -T0 --rm -f -q
> > > > > > > debian/linux-image-6.10.1-1-amd64-clang18-kcfi/lib/modules/6.=
10.1-1-amd64-clang18-kcfi/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> > > > > > >
> > > > > > > Here some numbers:
> > > > > > >
> > > > > > > [ Values in KiB ]
> > > > > > > $ du -k amdgpu.ko*
> > > > > > > 29264   amdgpu.ko
> > > > > > > 5672    amdgpu.ko.zst <--- XXX: -T0
> > > > > > > 4264    amdgpu.ko.zst_T0-19 <--- XXX:  -T0 -19
> > > > > > > 4260    amdgpu.ko.zst_T0-22
> > > > > > > 4308    amdgpu.ko.zst_T0-22-ultra
> > > > > > >
> > > > > > > $ time zstd -T0 -v amdgpu.ko
> > > > > > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > > > > > Note: 2 physical core(s) detected
> > > > > > > zstd: amdgpu.ko.zst already exists; overwrite (y/n) ? y
> > > > > > > amdgpu.ko            : 19.38%   (  28.6 MiB =3D>   5.54 MiB, =
amdgpu.ko.zst)
> > > > > > >
> > > > > > > real    0m2,496s
> > > > > > > user    0m0,448s
> > > > > > > sys     0m0,064s
> > > > > > >
> > > > > > > $ time zstd -T0 -19 -v amdgpu.ko
> > > > > > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > > > > > Note: 2 physical core(s) detected
> > > > > > > amdgpu.ko            : 14.56%   (  28.6 MiB =3D>   4.16 MiB, =
amdgpu.ko.zst)
> > > > > > >
> > > > > > > real    0m22,821s
> > > > > > > user    0m22,759s
> > > > > > > sys     0m0,080s
> > > > > > >
> > > > > > > My wish is to use the zstd-option "-T0" (see vmlinux.bin.zst)=
 everywhere.
> > > > > > >
> > > > > > > For CONFIG_MODULE_COMPRESS_ZSTD=3Dy: Add compress-level =3D -=
19
> > > > > > >
> > > > > > > NOTE: -22 w/ or w/o ultra has no big effect here and increase=
s even
> > > > > > > more build-time.
> > > > > > >
> > > > > > > What do you think?
> > > > > > >
> > > > > > > Thanks.
> > > > > > >
> > > > > > > Best regards,
> > > > > > > -Sedat-
> > > > >
> > > > > [ Adding some more folks - kmod / authors of commit c3d7ef377eb2
> > > > > ("kbuild: add support for zstd compressed modules") ]
> > > > >
> > > > > Debian/unstable AMD54 ships kmod version 32+20240611-1.
> > > > >
> > > > > To use better/higher ZSTD compression-level for
> > > > > CONFIG_MODULE_COMPRESS_ZSTD=3Dy - do we need a newer KMOD version=
?
> > > > >
> > > > > DIFF for Linux-6.10.1:
> > > > >
> > > > > $ git diff scripts/Makefile.modinst
> > > > > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > > > > index 0afd75472679..2a8b37c80cbf 100644
> > > > > --- a/scripts/Makefile.modinst
> > > > > +++ b/scripts/Makefile.modinst
> > > > > @@ -146,7 +146,7 @@ quiet_cmd_gzip =3D GZIP    $@
> > > > > quiet_cmd_xz =3D XZ      $@
> > > > >       cmd_xz =3D $(XZ) --check=3Dcrc32 --lzma2=3Ddict=3D1MiB -f $=
<
> > > > > quiet_cmd_zstd =3D ZSTD    $@
> > > > > -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> > > > > +      cmd_zstd =3D $(ZSTD) -T0 -19 --rm -f -q $<
> > > > >
> > > > > $(dst)/%.ko.gz: $(dst)/%.ko FORCE
> > > > >        $(call cmd,gzip)
> > > > >
> > > >
> > > > The compression tools (zstd, xz, etc) are used predominantly for tw=
o
> > > > separate topics - kernel image and kernel module compression.
> > > >
> > > > Off the top of my head: in the former case, reasonable compression =
is
> > > > used by all tools. Be that zstd, lzo, lzma, you name it.
> > > > Honestly I don't know why and what's the merit behind the levels ch=
osen.
> > > >
> > > > In the modules case, things are also consistent where the default
> > > > compression level is used throughout.
> > > > Here it makes sense to keep the default since you can consider that
> > > > the decompression can be done by either kernel or user-space. Where
> > > > each comes with it's limitations:
> > > >
> > > > The in-kernel one does not support ultra levels for zstd (or it use=
d
> > > > to at some point) IIRC. The kmod tools themselves rely on the zstd
> > > > library liked in, although if one is using busybox then zstd
> > > > compressed modules were not supported last time I checked (a year o=
r
> > > > so ago).
> > > >
> > > > So for example: you can have zstd --22 modules, if the kernel + kmo=
d
> > > > are new enough (have in-kernel decompression) things will fail. If
> > > > they're not, things will work just fine.
> > > >
> > > > Which is why, I think it's up-to your distro/builder to choose the
> > > > policy. Here is what we've been using In Arch `ZSTD_CLEVEL=3D19 mak=
e ...
> > > > modules_install`.
> > > >
> > > > Tl:Dr: You'd want to use `ZSTD_CLEVEL` (or equivalent if using xz)
> > > > during make modules_install **depending** on the components used an=
d
> > > > their version.
> > > >
> > > > HTH
> > > > Emil
> > >
> > > Hi Emil,
> > >
> > > Thanks for the explanations and infos.
> > >
> > > Sorry, for not being consistent with avoiding "top-posting".
> > >
> > > I took my LATEST selfmade 6.10.1 LLVM/Clang kernel and re-compressed =
via:
> > >
> > > root# zstd -T0 -19 -v *.ko
> > >
> > > [ SIZES ]
> > >
> > > 576     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/net/mac80211/=
mac80211.ko.zst
> > > 752     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/net/mac80211/=
mac80211.ko.zst.orig
> > >
> > > 244     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/w=
ireless/intel/iwlwifi/iwlwifi.ko.zst
> > > 316     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/w=
ireless/intel/iwlwifi/iwlwifi.ko.zst.orig
> > >
> > > 144     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/w=
ireless/intel/iwlwifi/dvm/iwldvm.ko.zst
> > > 184     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/w=
ireless/intel/iwlwifi/dvm/iwldvm.ko.zst.orig
> > >
> >
> > If you use the `ZSTD_CLEVEL=3D19 make modules_install ...` (somewhere i=
n
> > your Debian recipe) as mention earlier the extra re-compression should
> > not be needed.
> >
>
> Hi Emil,
>
> Is ZSTD_CLEVEL an Arch Linux specific variable?
>
> git grep shows the usage of ... in the Linux-kernel source:
>
> include/linux/zstd_lib.h:#  define ZSTD_CLEVEL_DEFAULT 3
>
> I tried Linux v6.10.3 with my "[PATCH] kbuild: Use better
> compress-level for zstd compressed modules"
>
> Result: 25MiB smaller linux-image Debian package and same size
> reduction in /lib/modules/.
>
> Link: https://lore.kernel.org/all/CA+icZUUQadYjAXiCNx7PmKDV20WctvnzkXC3R2=
F7FM4Gzcm39Q@mail.gmail.com/
>
> > > [ INSTRUCTIONS ]
> > >
> > > I stopped NetworkManager.service + networking.service + removed iwldv=
m
> > > kernel-module (modprobe -r -v iwldvm).
> > >
> > > Compressed 3 kernel-modules (see above).
> > >
> > > Reloaded modified iwldvm (modprobe -v iwldvm) + started
> > > networking.service + NetworkManager.service
> > >
> > > WIFI OK - Logs (dmesg) OK.
> > >
> > > So user-space works with kernel-space here on Debian/unstable AMD64.
> > >
> >
> > Nice, so it's working as expected.
> >
> > Using level 19 level is safe assuming you don't use busybox initrd,
> > with zstd compressed modules. Although you can use even higher level,
> > if using kmod before commit 09c9f8c5df0475d2627d9498e26250592dbfebd6 -
> > kmod v30 it seems.
> >
> > Since I'm not everyone is a Debian person, it'll be great to
> > explicitly list the versions used ... for the future.
> >
> > If you have particular question/concern, let me know.
> >
>
> I can NOT say if some new KConfigs make sense here to check for
> pre-requisites of specific versions of kmod/zstd/etc.
> Introducing CONFIG_MODULE_COMPRESS_ZSTD_CLEVEL?
>
> Thanks for your feedback.



I am not suggesting that CONFIG option.

I just mentioned that I saw such a patch:

https://lore.kernel.org/all/20240530210342.1540045-1-maximilian@mbosch.me/







--=20
Best Regards
Masahiro Yamada

