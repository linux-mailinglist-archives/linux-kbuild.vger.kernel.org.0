Return-Path: <linux-kbuild+bounces-2735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 422CF9402C0
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 02:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1CBB2827CC
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 00:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC532563;
	Tue, 30 Jul 2024 00:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+HpLXJN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41044A3F
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 00:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722300696; cv=none; b=luS7HqTJfVzrVNqkKJlldQ6vZpYyidrCfyjMYO+1T3BwxmMLMr/rOhfO6dp8FhZQLwpZNgBCeVi3nZx9pJSZI9DphKqoKPl30+OzjtlvZ+HuyKKIph0FxafBRo3PMbLO+aP+N2ssnfP4HoCpVfCcV6MjyAwWZdlOa+msmgCKc/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722300696; c=relaxed/simple;
	bh=ngvUOEXohJhnuzOW4+B4iBwFTHig984gIzVxFUlS7Xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbULiKChd+mtYc2+nKTbtQLery1n/BJJwTzTKeUNDKIxdeGIL5hbsUEYKmZQrmxdBB46O0jP/4bR6qwghfQJDYpngDXTzK2TDAKZvldnwlv/6IfKeZEYx7M8qr2lDZRyKVpaBuzWAFNSxgw7ivp7cU/AtXvlwTlElDviRlLPZhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+HpLXJN; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ef2ed592f6so45555491fa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2024 17:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722300693; x=1722905493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P2vNntlN6xYk+lmr5UHRt3XBqtD/uMsy3RrrYxCMpFY=;
        b=c+HpLXJNkr2lLB1LgefVq73oaXvW2BXeqwIp7oMWyNNjGxgit9DqT2Hoa2ZF2X+AEa
         1kqL08HvfUlRVxJAgmem+m/WclWIxGi7xNVWn53m8Lf+rehxU2F4wWJW4UUTMBrdsoEY
         +RlxTlHirB4Wvb+cdvQ1thoKwfUxqupghwyHkbahz4DBmRTOaONFOSjDza8vhz7g4d9X
         ihHbvlyqdH42lF5XxPNyMdr1jrtbIeaskDo7aaJdX6cwUexNnUX5F/Z9bxLtQSc7gPGH
         NtdMVC8B99hjs7mdhTPW4nUT32YM3XFJaJNeYRZ0vyw9PjiM/danc2g7kyGWsOL8ZVis
         2m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722300693; x=1722905493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2vNntlN6xYk+lmr5UHRt3XBqtD/uMsy3RrrYxCMpFY=;
        b=ckRHTcE8eizseXzCsVAdaiFdnPi+tdeg7FKzZh6t03Xqal86j/iTvpzv+ZbLXacBWy
         JM3o/GkS0/ZUdempf2oh91ydSYH1Swio5gyU0GhLC7fU5Z5iKES25d2c0WaG/TR2ee7c
         +CaGSw71TbsKX23RlNlyIwFnzfVQafIR5IVSp6TNyffeWW+XlkeFVkiBnlWRz6CdbiAW
         Zb7O6xgI5YN3em8x7DCy8lOBp0lZjEkfofpcPNAYSqUNYdio0C7nH6byLWQX0wOTlS20
         H462Q4tt5DUY3WKkJly/BkB2uG6GX7XZ3v09je/h9p6QZfhBwfCd9eCJPZYpAkh+AZin
         8lQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZOS/Cf4XdvZyKVsQcvd5mzOyFxbgppIwn9OVa44aSKemFAps8LeHys+nnhM0wt/CK2WAEwGE5sZzppMPT1r9Vi7fgJnxYZI8bi7YB
X-Gm-Message-State: AOJu0YwHtndNWpz3BPFn35V2TMzOqg7omgPXHKvZduMx2ZEdmYEw/N8B
	Nz5tqxj3p5DImbP46jieYhop7gzGrSPUIMiSwRnl7kEGGsM77jNhe/y8nI4Bupm8x/dcdP8cCiW
	mzqgyZo6c1FkCrbaQYYcfa/rIz9A=
X-Google-Smtp-Source: AGHT+IGMpmktdotTQIw/1RIHmBF49r4Nh/i2a8s1FMjuEu2fFtj9nTR6R9WzXNXI8MxkLmQ00BU/Q5zrNy4voXaPIFM=
X-Received: by 2002:a2e:9151:0:b0:2ef:2b6e:f8c8 with SMTP id
 38308e7fff4ca-2f12ee627damr55952731fa.42.1722300692499; Mon, 29 Jul 2024
 17:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+icZUWUL956KOKGLG+h1VA9TTXaUc7MS12soUi62q2gj-+tqg@mail.gmail.com>
 <CA+icZUX-vannYgAHt3O00kwWXLX_cFpr6JJadX==bpZcUzh_7w@mail.gmail.com>
 <CA+icZUU-ktXDwQPA9cbXPM_A9pKoOzUCJ821Z2U1vzFkujMErA@mail.gmail.com> <CACvgo52-KbJHUde8kP5-=HdHoCFEcAt=mmy1i=MR7Er7xZz67w@mail.gmail.com>
In-Reply-To: <CACvgo52-KbJHUde8kP5-=HdHoCFEcAt=mmy1i=MR7Er7xZz67w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 30 Jul 2024 02:50:55 +0200
Message-ID: <CA+icZUVBqNjqO7LPydyYH0FxeiaX6NG6Hoq4WAOi_1cpAs5k0g@mail.gmail.com>
Subject: Re: ZSTD compression-level when CONFIG_MODULE_COMPRESS_ZSTD=y
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, 
	q66 <q66@chimera-linux.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Torge Matthies <openglfreak@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 27, 2024 at 12:18=E2=80=AFAM Emil Velikov <emil.l.velikov@gmail=
.com> wrote:
>
> Hi Sedat, all,
>
> The mixed quoting is confusing me a bit, hopefully not to the point
> where I miss some questions.
>
> On Thu, 25 Jul 2024 at 21:00, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Thu, Jul 25, 2024 at 9:23=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.=
com> wrote:
> > >
> > > dileks@iniza:~/src/linux/git$ git grep zstd scripts/ | egrep '\-(19|2=
2|T0)'
> > > scripts/Makefile.lib:      cmd_zstd =3D cat $(real-prereqs) | $(ZSTD)=
 -19 > $@
> > > scripts/Makefile.lib:      cmd_zstd22 =3D cat $(real-prereqs) | $(ZST=
D)
> > > -22 --ultra > $@
> > > scripts/Makefile.lib:      cmd_zstd22_with_size =3D { cat
> > > $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
> > > scripts/Makefile.modinst:      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> > >
> > > -sed@-
> > >
> > > On Thu, Jul 25, 2024 at 9:09=E2=80=AFPM Sedat Dilek <sedat.dilek@gmai=
l.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > I am a big fan of ZSTD - here version 1.5.6 on Debian/unstable AMD6=
4.
> > > >
> > > > When playing with CONFIG_MODULE_COMPRESS_ZSTD=3Dy I observed a 35Mi=
B
> > > > greater linux-image Debian file.
> > > >
> > > > Debian: ~100MiB <--- CONFIG_MODULE_COMPRESS_XZ=3Dy
> > > > Selfmade: ~135MiB <--- CONFIG_MODULE_COMPRESS_ZSTD=3Dy
> > > >
> > > > So, I checked the used compression-level of ZSTD in the build-proce=
ss:
> > > >
> > > > [ vmlinux.bin.zst ]
> > > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep vmlinu=
x.bin.zst
> > > >  { cat arch/x86/boot/compressed/vmlinux.bin
> > > > arch/x86/boot/compressed/vmlinux.relocs | zstd -22 --ultra; printf
> > > > \370\040\157\003; } > arch/x86/boot/compressed/vmlinux.
> > > > bin.zst
> > > >
> > > > [ amdgpu.ko.zst ]
> > > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep '\-T0'=
 |
> > > > grep amdgpu
> > > >  zstd -T0 --rm -f -q
> > > > debian/linux-image-6.10.1-1-amd64-clang18-kcfi/lib/modules/6.10.1-1=
-amd64-clang18-kcfi/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> > > >
> > > > Here some numbers:
> > > >
> > > > [ Values in KiB ]
> > > > $ du -k amdgpu.ko*
> > > > 29264   amdgpu.ko
> > > > 5672    amdgpu.ko.zst <--- XXX: -T0
> > > > 4264    amdgpu.ko.zst_T0-19 <--- XXX:  -T0 -19
> > > > 4260    amdgpu.ko.zst_T0-22
> > > > 4308    amdgpu.ko.zst_T0-22-ultra
> > > >
> > > > $ time zstd -T0 -v amdgpu.ko
> > > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > > Note: 2 physical core(s) detected
> > > > zstd: amdgpu.ko.zst already exists; overwrite (y/n) ? y
> > > > amdgpu.ko            : 19.38%   (  28.6 MiB =3D>   5.54 MiB, amdgpu=
.ko.zst)
> > > >
> > > > real    0m2,496s
> > > > user    0m0,448s
> > > > sys     0m0,064s
> > > >
> > > > $ time zstd -T0 -19 -v amdgpu.ko
> > > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > > Note: 2 physical core(s) detected
> > > > amdgpu.ko            : 14.56%   (  28.6 MiB =3D>   4.16 MiB, amdgpu=
.ko.zst)
> > > >
> > > > real    0m22,821s
> > > > user    0m22,759s
> > > > sys     0m0,080s
> > > >
> > > > My wish is to use the zstd-option "-T0" (see vmlinux.bin.zst) every=
where.
> > > >
> > > > For CONFIG_MODULE_COMPRESS_ZSTD=3Dy: Add compress-level =3D -19
> > > >
> > > > NOTE: -22 w/ or w/o ultra has no big effect here and increases even
> > > > more build-time.
> > > >
> > > > What do you think?
> > > >
> > > > Thanks.
> > > >
> > > > Best regards,
> > > > -Sedat-
> >
> > [ Adding some more folks - kmod / authors of commit c3d7ef377eb2
> > ("kbuild: add support for zstd compressed modules") ]
> >
> > Debian/unstable AMD54 ships kmod version 32+20240611-1.
> >
> > To use better/higher ZSTD compression-level for
> > CONFIG_MODULE_COMPRESS_ZSTD=3Dy - do we need a newer KMOD version?
> >
> > DIFF for Linux-6.10.1:
> >
> > $ git diff scripts/Makefile.modinst
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index 0afd75472679..2a8b37c80cbf 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -146,7 +146,7 @@ quiet_cmd_gzip =3D GZIP    $@
> > quiet_cmd_xz =3D XZ      $@
> >       cmd_xz =3D $(XZ) --check=3Dcrc32 --lzma2=3Ddict=3D1MiB -f $<
> > quiet_cmd_zstd =3D ZSTD    $@
> > -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> > +      cmd_zstd =3D $(ZSTD) -T0 -19 --rm -f -q $<
> >
> > $(dst)/%.ko.gz: $(dst)/%.ko FORCE
> >        $(call cmd,gzip)
> >
>
> The compression tools (zstd, xz, etc) are used predominantly for two
> separate topics - kernel image and kernel module compression.
>
> Off the top of my head: in the former case, reasonable compression is
> used by all tools. Be that zstd, lzo, lzma, you name it.
> Honestly I don't know why and what's the merit behind the levels chosen.
>
> In the modules case, things are also consistent where the default
> compression level is used throughout.
> Here it makes sense to keep the default since you can consider that
> the decompression can be done by either kernel or user-space. Where
> each comes with it's limitations:
>
> The in-kernel one does not support ultra levels for zstd (or it used
> to at some point) IIRC. The kmod tools themselves rely on the zstd
> library liked in, although if one is using busybox then zstd
> compressed modules were not supported last time I checked (a year or
> so ago).
>
> So for example: you can have zstd --22 modules, if the kernel + kmod
> are new enough (have in-kernel decompression) things will fail. If
> they're not, things will work just fine.
>
> Which is why, I think it's up-to your distro/builder to choose the
> policy. Here is what we've been using In Arch `ZSTD_CLEVEL=3D19 make ...
> modules_install`.
>
> Tl:Dr: You'd want to use `ZSTD_CLEVEL` (or equivalent if using xz)
> during make modules_install **depending** on the components used and
> their version.
>
> HTH
> Emil

Hi Emil,

Thanks for the explanations and infos.

Sorry, for not being consistent with avoiding "top-posting".

I took my LATEST selfmade 6.10.1 LLVM/Clang kernel and re-compressed via:

root# zstd -T0 -19 -v *.ko

[ SIZES ]

576     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/net/mac80211/mac802=
11.ko.zst
752     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/net/mac80211/mac802=
11.ko.zst.orig

244     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wireles=
s/intel/iwlwifi/iwlwifi.ko.zst
316     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wireles=
s/intel/iwlwifi/iwlwifi.ko.zst.orig

144     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wireles=
s/intel/iwlwifi/dvm/iwldvm.ko.zst
184     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wireles=
s/intel/iwlwifi/dvm/iwldvm.ko.zst.orig

[ INSTRUCTIONS ]

I stopped NetworkManager.service + networking.service + removed iwldvm
kernel-module (modprobe -r -v iwldvm).

Compressed 3 kernel-modules (see above).

Reloaded modified iwldvm (modprobe -v iwldvm) + started
networking.service + NetworkManager.service

WIFI OK - Logs (dmesg) OK.

So user-space works with kernel-space here on Debian/unstable AMD64.

Thanks.

Best Regards,
-Sedat-

