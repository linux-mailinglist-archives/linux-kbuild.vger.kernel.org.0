Return-Path: <linux-kbuild+bounces-2758-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2570A941A89
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 18:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C83B22818EE
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 16:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB121A6169;
	Tue, 30 Jul 2024 16:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dfa79Saa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F9154C18
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722357893; cv=none; b=O8RuitGbuIClYM/kv4c8oKU3DPRJX0HdWg31c+sHZ4fj9UyRkEo+JNl6aBzoJXNIv46xFqySQxMUVnwr0cXaIkiYZ0KfJs+c4NAX0TUGUQZIzUklwmmSmeNYKGlS4wdM8OQdwk4SWE8gEj/8tGdj1vVEhJvFCnvJ99ItCUzoCaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722357893; c=relaxed/simple;
	bh=V0T0MEfjJboxdF+d+A8mCOsR9AGvvBay4FQP1Xtd4m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcFDPdHainUFW26AmV45wbE2/rl/CgQY/TtPmx83/CMJqNamNAKPAI9zA/KEt7F6v/cV086S71Rt+byWp08mK5o0WkTahumXa8oGuzpplCR4zwCtiUrVoGNRCiIesjNhUjN4WEcbc4bT2L8A7sou1aXLi37bxcB+s2Gtu99enBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dfa79Saa; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f035ae0ff1so409311fa.0
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 09:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722357890; x=1722962690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPamsnck0OkjKjXWBGzs3z0+30IP1fNdsHWZOEKRqyY=;
        b=Dfa79Saajp5ap5ihOtSD8spxzEMvbhb9ZZOkR8NHXhhk4cG8vI+uVAoIxsxJuFei/E
         UvZKZ9ZSluMP3pSQz8rNagPiIig1vD1OThI65qFy4A/4KAe1yOrqG/biXigGdODuhudv
         CVKyiGNFIsV3Bhi9UeGrWALBL34AMyYdZrCbxV8zbGhYq7HjZi5i/kjV8+eunsdGqh5t
         ei1baN8ltbJAZZLCVx31tuKq5Lww6nU9A8NJShQaRL/KaSpDgvFdudPMqmSVMZaGFkn2
         tXg2JzuHhPa53e4+sa8l0r5iUnsBMsIgBlV5FBCjT8OjkhmYeiUnsxhW68Shbxzalr4O
         Pmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722357890; x=1722962690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPamsnck0OkjKjXWBGzs3z0+30IP1fNdsHWZOEKRqyY=;
        b=NzOGgWs0nRSCl/IIa1Lzjorh9T7fHLtX2MdLLzKG1yhuowEx/QpTPEmBZC7OWZXHn3
         6AhMlbIHO4lCVlXXWSybpKMIBS9eUw6rQayt4Ee8dy05ZjrzJGGM4MSEry1HBU+Cu3PD
         wg+eQWI/ZELesCXXMuSTcsuLvmNC7sn0G5v9t+W7lLV7IlaGrapT+jCDpMwqlxkSSQ/B
         zQLKv6MMdFsQXpvZRQBlSAZTLkVWZG6yf/qzNanv+un7cCklu9PZTOfJO6RdwfsIiFXj
         qU6/RTOLF2lBnV5DQp0GcFK4KH7v6KC+b6i5XwzIOHLUeUa1wfZfvEIiSVLzUPZeHHTh
         KUFA==
X-Forwarded-Encrypted: i=1; AJvYcCVim57qHjCdfpyGsrmtvPoI1wdwQ5uN8a6Yw4XLEljlWGo79AR+uNgpmihUeDjGVjRXlPDJ+Bnhj2lMCFRJjVsrIi6X2zERZzKEbzTJ
X-Gm-Message-State: AOJu0YxSZVjAfEgIacQaHpKWrg5/9KumCQyKkwra/4cDjg8qlyUiRBuL
	3FXVmO8+87TvEFA6vmm7guHMJe4OHIqpP2Oa8aRaFlIJ3+r9HqkYdz5m+JMEuJA34vnlCXglWx+
	AK7DpOxrKZid2ih3ro/PnyHOxtQQ=
X-Google-Smtp-Source: AGHT+IFJ8AxYdeDq9/2CICPH5xin32Ga9w52yav+FB3vfTgrFfEZgwVcKroFTes+nfPo6Em6GDhL+8fgeCYb/u+bq84=
X-Received: by 2002:a2e:a58c:0:b0:2ef:2883:2747 with SMTP id
 38308e7fff4ca-2f1478f010dmr8620501fa.13.1722357889461; Tue, 30 Jul 2024
 09:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+icZUWUL956KOKGLG+h1VA9TTXaUc7MS12soUi62q2gj-+tqg@mail.gmail.com>
 <CA+icZUX-vannYgAHt3O00kwWXLX_cFpr6JJadX==bpZcUzh_7w@mail.gmail.com>
 <CA+icZUU-ktXDwQPA9cbXPM_A9pKoOzUCJ821Z2U1vzFkujMErA@mail.gmail.com>
 <CACvgo52-KbJHUde8kP5-=HdHoCFEcAt=mmy1i=MR7Er7xZz67w@mail.gmail.com> <CA+icZUVBqNjqO7LPydyYH0FxeiaX6NG6Hoq4WAOi_1cpAs5k0g@mail.gmail.com>
In-Reply-To: <CA+icZUVBqNjqO7LPydyYH0FxeiaX6NG6Hoq4WAOi_1cpAs5k0g@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 30 Jul 2024 17:44:37 +0100
Message-ID: <CACvgo52F2b2MiK4FcqMBTSP_pYjoGVZqnB86omXiEUv-FFNODg@mail.gmail.com>
Subject: Re: ZSTD compression-level when CONFIG_MODULE_COMPRESS_ZSTD=y
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, 
	q66 <q66@chimera-linux.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Torge Matthies <openglfreak@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Jul 2024 at 01:51, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sat, Jul 27, 2024 at 12:18=E2=80=AFAM Emil Velikov <emil.l.velikov@gma=
il.com> wrote:
> >
> > Hi Sedat, all,
> >
> > The mixed quoting is confusing me a bit, hopefully not to the point
> > where I miss some questions.
> >
> > On Thu, 25 Jul 2024 at 21:00, Sedat Dilek <sedat.dilek@gmail.com> wrote=
:
> > >
> > > On Thu, Jul 25, 2024 at 9:23=E2=80=AFPM Sedat Dilek <sedat.dilek@gmai=
l.com> wrote:
> > > >
> > > > dileks@iniza:~/src/linux/git$ git grep zstd scripts/ | egrep '\-(19=
|22|T0)'
> > > > scripts/Makefile.lib:      cmd_zstd =3D cat $(real-prereqs) | $(ZST=
D) -19 > $@
> > > > scripts/Makefile.lib:      cmd_zstd22 =3D cat $(real-prereqs) | $(Z=
STD)
> > > > -22 --ultra > $@
> > > > scripts/Makefile.lib:      cmd_zstd22_with_size =3D { cat
> > > > $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
> > > > scripts/Makefile.modinst:      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q =
$<
> > > >
> > > > -sed@-
> > > >
> > > > On Thu, Jul 25, 2024 at 9:09=E2=80=AFPM Sedat Dilek <sedat.dilek@gm=
ail.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > I am a big fan of ZSTD - here version 1.5.6 on Debian/unstable AM=
D64.
> > > > >
> > > > > When playing with CONFIG_MODULE_COMPRESS_ZSTD=3Dy I observed a 35=
MiB
> > > > > greater linux-image Debian file.
> > > > >
> > > > > Debian: ~100MiB <--- CONFIG_MODULE_COMPRESS_XZ=3Dy
> > > > > Selfmade: ~135MiB <--- CONFIG_MODULE_COMPRESS_ZSTD=3Dy
> > > > >
> > > > > So, I checked the used compression-level of ZSTD in the build-pro=
cess:
> > > > >
> > > > > [ vmlinux.bin.zst ]
> > > > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep vmli=
nux.bin.zst
> > > > >  { cat arch/x86/boot/compressed/vmlinux.bin
> > > > > arch/x86/boot/compressed/vmlinux.relocs | zstd -22 --ultra; print=
f
> > > > > \370\040\157\003; } > arch/x86/boot/compressed/vmlinux.
> > > > > bin.zst
> > > > >
> > > > > [ amdgpu.ko.zst ]
> > > > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep '\-T=
0' |
> > > > > grep amdgpu
> > > > >  zstd -T0 --rm -f -q
> > > > > debian/linux-image-6.10.1-1-amd64-clang18-kcfi/lib/modules/6.10.1=
-1-amd64-clang18-kcfi/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> > > > >
> > > > > Here some numbers:
> > > > >
> > > > > [ Values in KiB ]
> > > > > $ du -k amdgpu.ko*
> > > > > 29264   amdgpu.ko
> > > > > 5672    amdgpu.ko.zst <--- XXX: -T0
> > > > > 4264    amdgpu.ko.zst_T0-19 <--- XXX:  -T0 -19
> > > > > 4260    amdgpu.ko.zst_T0-22
> > > > > 4308    amdgpu.ko.zst_T0-22-ultra
> > > > >
> > > > > $ time zstd -T0 -v amdgpu.ko
> > > > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > > > Note: 2 physical core(s) detected
> > > > > zstd: amdgpu.ko.zst already exists; overwrite (y/n) ? y
> > > > > amdgpu.ko            : 19.38%   (  28.6 MiB =3D>   5.54 MiB, amdg=
pu.ko.zst)
> > > > >
> > > > > real    0m2,496s
> > > > > user    0m0,448s
> > > > > sys     0m0,064s
> > > > >
> > > > > $ time zstd -T0 -19 -v amdgpu.ko
> > > > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > > > Note: 2 physical core(s) detected
> > > > > amdgpu.ko            : 14.56%   (  28.6 MiB =3D>   4.16 MiB, amdg=
pu.ko.zst)
> > > > >
> > > > > real    0m22,821s
> > > > > user    0m22,759s
> > > > > sys     0m0,080s
> > > > >
> > > > > My wish is to use the zstd-option "-T0" (see vmlinux.bin.zst) eve=
rywhere.
> > > > >
> > > > > For CONFIG_MODULE_COMPRESS_ZSTD=3Dy: Add compress-level =3D -19
> > > > >
> > > > > NOTE: -22 w/ or w/o ultra has no big effect here and increases ev=
en
> > > > > more build-time.
> > > > >
> > > > > What do you think?
> > > > >
> > > > > Thanks.
> > > > >
> > > > > Best regards,
> > > > > -Sedat-
> > >
> > > [ Adding some more folks - kmod / authors of commit c3d7ef377eb2
> > > ("kbuild: add support for zstd compressed modules") ]
> > >
> > > Debian/unstable AMD54 ships kmod version 32+20240611-1.
> > >
> > > To use better/higher ZSTD compression-level for
> > > CONFIG_MODULE_COMPRESS_ZSTD=3Dy - do we need a newer KMOD version?
> > >
> > > DIFF for Linux-6.10.1:
> > >
> > > $ git diff scripts/Makefile.modinst
> > > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > > index 0afd75472679..2a8b37c80cbf 100644
> > > --- a/scripts/Makefile.modinst
> > > +++ b/scripts/Makefile.modinst
> > > @@ -146,7 +146,7 @@ quiet_cmd_gzip =3D GZIP    $@
> > > quiet_cmd_xz =3D XZ      $@
> > >       cmd_xz =3D $(XZ) --check=3Dcrc32 --lzma2=3Ddict=3D1MiB -f $<
> > > quiet_cmd_zstd =3D ZSTD    $@
> > > -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> > > +      cmd_zstd =3D $(ZSTD) -T0 -19 --rm -f -q $<
> > >
> > > $(dst)/%.ko.gz: $(dst)/%.ko FORCE
> > >        $(call cmd,gzip)
> > >
> >
> > The compression tools (zstd, xz, etc) are used predominantly for two
> > separate topics - kernel image and kernel module compression.
> >
> > Off the top of my head: in the former case, reasonable compression is
> > used by all tools. Be that zstd, lzo, lzma, you name it.
> > Honestly I don't know why and what's the merit behind the levels chosen=
.
> >
> > In the modules case, things are also consistent where the default
> > compression level is used throughout.
> > Here it makes sense to keep the default since you can consider that
> > the decompression can be done by either kernel or user-space. Where
> > each comes with it's limitations:
> >
> > The in-kernel one does not support ultra levels for zstd (or it used
> > to at some point) IIRC. The kmod tools themselves rely on the zstd
> > library liked in, although if one is using busybox then zstd
> > compressed modules were not supported last time I checked (a year or
> > so ago).
> >
> > So for example: you can have zstd --22 modules, if the kernel + kmod
> > are new enough (have in-kernel decompression) things will fail. If
> > they're not, things will work just fine.
> >
> > Which is why, I think it's up-to your distro/builder to choose the
> > policy. Here is what we've been using In Arch `ZSTD_CLEVEL=3D19 make ..=
.
> > modules_install`.
> >
> > Tl:Dr: You'd want to use `ZSTD_CLEVEL` (or equivalent if using xz)
> > during make modules_install **depending** on the components used and
> > their version.
> >
> > HTH
> > Emil
>
> Hi Emil,
>
> Thanks for the explanations and infos.
>
> Sorry, for not being consistent with avoiding "top-posting".
>
> I took my LATEST selfmade 6.10.1 LLVM/Clang kernel and re-compressed via:
>
> root# zstd -T0 -19 -v *.ko
>
> [ SIZES ]
>
> 576     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/net/mac80211/mac8=
0211.ko.zst
> 752     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/net/mac80211/mac8=
0211.ko.zst.orig
>
> 244     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wirel=
ess/intel/iwlwifi/iwlwifi.ko.zst
> 316     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wirel=
ess/intel/iwlwifi/iwlwifi.ko.zst.orig
>
> 144     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wirel=
ess/intel/iwlwifi/dvm/iwldvm.ko.zst
> 184     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wirel=
ess/intel/iwlwifi/dvm/iwldvm.ko.zst.orig
>

If you use the `ZSTD_CLEVEL=3D19 make modules_install ...` (somewhere in
your Debian recipe) as mention earlier the extra re-compression should
not be needed.

> [ INSTRUCTIONS ]
>
> I stopped NetworkManager.service + networking.service + removed iwldvm
> kernel-module (modprobe -r -v iwldvm).
>
> Compressed 3 kernel-modules (see above).
>
> Reloaded modified iwldvm (modprobe -v iwldvm) + started
> networking.service + NetworkManager.service
>
> WIFI OK - Logs (dmesg) OK.
>
> So user-space works with kernel-space here on Debian/unstable AMD64.
>

Nice, so it's working as expected.

Using level 19 level is safe assuming you don't use busybox initrd,
with zstd compressed modules. Although you can use even higher level,
if using kmod before commit 09c9f8c5df0475d2627d9498e26250592dbfebd6 -
kmod v30 it seems.

Since I'm not everyone is a Debian person, it'll be great to
explicitly list the versions used ... for the future.

If you have particular question/concern, let me know.

HTH
Emil

