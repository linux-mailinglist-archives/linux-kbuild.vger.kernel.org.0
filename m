Return-Path: <linux-kbuild+bounces-2806-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99005946CE9
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 09:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F0CEB2110C
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2024 07:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB22101E2;
	Sun,  4 Aug 2024 07:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0jI90Xk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871D3BE47
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Aug 2024 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722754965; cv=none; b=DIvO+PxRl1fUHcdi3Gzy8EwmWkabesk+3LB0HuRS+fcM483PTPaCnKKTZiKu2RtgzMZV0q7gba+rSMMeb5//nKMXPxFlPGmJM+DVxya/CpHI/yORYEJ4Qu7thNGLwBw+p//J7I7uPrEL1JXIxqBsF4HwX3f1UOmkwzRg1JOsMOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722754965; c=relaxed/simple;
	bh=j9z6VdxuxsQwzVR3XhaKk+41zkmWWa7WOhvfILyUX2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFemg5RGYOQGPDOQ3+Kkzc9t86fxTGDrry4VQkmLK4U3CpwCd7iVUuNazQe2BIeo9vFU5pFEWzeuzlsAqOT/JYDJQoNDcV/rbs+zA69m0Hur8Mz3nEJjh3kLjwQ4nfcWMjEHZlefilCZkolrlzeVDLaooNvytWu/EWXzrtfXh3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0jI90Xk; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f04150796so14807800e87.3
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Aug 2024 00:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722754962; x=1723359762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vGqablnUFYtJ9QcxJSQgXoBCRL+eF0mMReQkK3do3Oo=;
        b=S0jI90XkGIs9brN9mlBO6CTjUX5b8mFlKL0Vz4A9rTH8Qng6rxXrmSJS2nlUXJ2/iD
         /mA3P3IRwKJ1OV70cHhREY23pY5v8Mq/f1ZS7blquO9eXBGFn2wF8wEroHdgddCokZb2
         gSJc+sCsPnNE2GKToivXhSA+3D06daGp9S0ftoiBzPTIcWmp222ugE8ZTyuzdO+yJYBG
         uiueN2jrDb2G/uffu6c29nMsJ9iTg+q9anHLn0CAwYjl60vryJ/0EDMvz/9JOhWZmdFm
         9cjLFbZOq8UjUSZpl/gDL3kOkzMjWcikCq3FOusJ3rEV+Jh3YeTa+qewErZMd7RKSjQl
         A9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722754962; x=1723359762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vGqablnUFYtJ9QcxJSQgXoBCRL+eF0mMReQkK3do3Oo=;
        b=Frk00sSmJsrQLSveGxN4Fu2zE/DT9XPSOUX4xnUm0fA/vqMCIzhjYI1WwnWGCiOYM5
         9Vdo+J071R4Sc+Sp2+uaI0Oer1G93s1eR8M6je/ons45oowyDHoWgbCF8Hk6kFS4qgvb
         Ey9w4rAgrvrVAgTZ2bbbkUj3zRFGcXHmUkVvEEsxlTLVLMnEH1s+CZjygoEOAQVqw7kS
         37SadZ7iBKo3H/LSYvkVI024kkRGYy74HDjEHfkzuwhIqYiQFl1mKTXpDVJV9KQytExK
         l8UEPz/Y/vlFJCYP6yr3gUOThEGJbvrIiw0HEcPbY/izBgh9xbHCXJ4iE/1yzTW1i9At
         HS+g==
X-Forwarded-Encrypted: i=1; AJvYcCVdAja4RJzqbGxrgj8JkyQvKLyuH6dh4qHIjhV0tP6PWkQK7ellfRBTyCsl6K65MrZaEwt8lgEwvM5uRKNFv3U8BSmiq3QOz4Wc8GZv
X-Gm-Message-State: AOJu0YzvlZ0ASp/Gi5ouswLNoDpXYvOG1Sw+TMVORTrfDDlA2FmJaUL+
	Uib6wwL4E8+XXT7XbMNL1JsbAjfCGFWq/TgIhJiAeF6UPiiWXymc1uvZ4Up4N3xoxvsaoxYByIH
	6J7pmq+AK6Q564LWheJOb9Z/mZvc=
X-Google-Smtp-Source: AGHT+IHQHZFuhsCxcJhS5eHvOmgVQ6bpGZYq6jWWZRm/ujYko/dVQcwxRlui9Xt9PDpi31/F9YhGACQ9XHddddRe6Mo=
X-Received: by 2002:a05:6512:3092:b0:530:b804:df26 with SMTP id
 2adb3069b0e04-530bb38120amr4969046e87.30.1722754961265; Sun, 04 Aug 2024
 00:02:41 -0700 (PDT)
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
 <CA+icZUVBqNjqO7LPydyYH0FxeiaX6NG6Hoq4WAOi_1cpAs5k0g@mail.gmail.com> <CACvgo52F2b2MiK4FcqMBTSP_pYjoGVZqnB86omXiEUv-FFNODg@mail.gmail.com>
In-Reply-To: <CACvgo52F2b2MiK4FcqMBTSP_pYjoGVZqnB86omXiEUv-FFNODg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sun, 4 Aug 2024 09:02:04 +0200
Message-ID: <CA+icZUU56KwRta_5MvmUiShZ_Yh72z8VmX-JaRjS7pkG_wYZjg@mail.gmail.com>
Subject: Re: ZSTD compression-level when CONFIG_MODULE_COMPRESS_ZSTD=y
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Piotr Gorski <lucjan.lucjanov@gmail.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, 
	q66 <q66@chimera-linux.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Torge Matthies <openglfreak@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 6:44=E2=80=AFPM Emil Velikov <emil.l.velikov@gmail.=
com> wrote:
>
> On Tue, 30 Jul 2024 at 01:51, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Sat, Jul 27, 2024 at 12:18=E2=80=AFAM Emil Velikov <emil.l.velikov@g=
mail.com> wrote:
> > >
> > > Hi Sedat, all,
> > >
> > > The mixed quoting is confusing me a bit, hopefully not to the point
> > > where I miss some questions.
> > >
> > > On Thu, 25 Jul 2024 at 21:00, Sedat Dilek <sedat.dilek@gmail.com> wro=
te:
> > > >
> > > > On Thu, Jul 25, 2024 at 9:23=E2=80=AFPM Sedat Dilek <sedat.dilek@gm=
ail.com> wrote:
> > > > >
> > > > > dileks@iniza:~/src/linux/git$ git grep zstd scripts/ | egrep '\-(=
19|22|T0)'
> > > > > scripts/Makefile.lib:      cmd_zstd =3D cat $(real-prereqs) | $(Z=
STD) -19 > $@
> > > > > scripts/Makefile.lib:      cmd_zstd22 =3D cat $(real-prereqs) | $=
(ZSTD)
> > > > > -22 --ultra > $@
> > > > > scripts/Makefile.lib:      cmd_zstd22_with_size =3D { cat
> > > > > $(real-prereqs) | $(ZSTD) -22 --ultra; $(size_append); } > $@
> > > > > scripts/Makefile.modinst:      cmd_zstd =3D $(ZSTD) -T0 --rm -f -=
q $<
> > > > >
> > > > > -sed@-
> > > > >
> > > > > On Thu, Jul 25, 2024 at 9:09=E2=80=AFPM Sedat Dilek <sedat.dilek@=
gmail.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > I am a big fan of ZSTD - here version 1.5.6 on Debian/unstable =
AMD64.
> > > > > >
> > > > > > When playing with CONFIG_MODULE_COMPRESS_ZSTD=3Dy I observed a =
35MiB
> > > > > > greater linux-image Debian file.
> > > > > >
> > > > > > Debian: ~100MiB <--- CONFIG_MODULE_COMPRESS_XZ=3Dy
> > > > > > Selfmade: ~135MiB <--- CONFIG_MODULE_COMPRESS_ZSTD=3Dy
> > > > > >
> > > > > > So, I checked the used compression-level of ZSTD in the build-p=
rocess:
> > > > > >
> > > > > > [ vmlinux.bin.zst ]
> > > > > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep vm=
linux.bin.zst
> > > > > >  { cat arch/x86/boot/compressed/vmlinux.bin
> > > > > > arch/x86/boot/compressed/vmlinux.relocs | zstd -22 --ultra; pri=
ntf
> > > > > > \370\040\157\003; } > arch/x86/boot/compressed/vmlinux.
> > > > > > bin.zst
> > > > > >
> > > > > > [ amdgpu.ko.zst ]
> > > > > > $ grep zstd build-log_6.10.1-1-amd64-clang18-kcfi.txt | grep '\=
-T0' |
> > > > > > grep amdgpu
> > > > > >  zstd -T0 --rm -f -q
> > > > > > debian/linux-image-6.10.1-1-amd64-clang18-kcfi/lib/modules/6.10=
.1-1-amd64-clang18-kcfi/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> > > > > >
> > > > > > Here some numbers:
> > > > > >
> > > > > > [ Values in KiB ]
> > > > > > $ du -k amdgpu.ko*
> > > > > > 29264   amdgpu.ko
> > > > > > 5672    amdgpu.ko.zst <--- XXX: -T0
> > > > > > 4264    amdgpu.ko.zst_T0-19 <--- XXX:  -T0 -19
> > > > > > 4260    amdgpu.ko.zst_T0-22
> > > > > > 4308    amdgpu.ko.zst_T0-22-ultra
> > > > > >
> > > > > > $ time zstd -T0 -v amdgpu.ko
> > > > > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > > > > Note: 2 physical core(s) detected
> > > > > > zstd: amdgpu.ko.zst already exists; overwrite (y/n) ? y
> > > > > > amdgpu.ko            : 19.38%   (  28.6 MiB =3D>   5.54 MiB, am=
dgpu.ko.zst)
> > > > > >
> > > > > > real    0m2,496s
> > > > > > user    0m0,448s
> > > > > > sys     0m0,064s
> > > > > >
> > > > > > $ time zstd -T0 -19 -v amdgpu.ko
> > > > > > *** Zstandard CLI (64-bit) v1.5.6, by Yann Collet ***
> > > > > > Note: 2 physical core(s) detected
> > > > > > amdgpu.ko            : 14.56%   (  28.6 MiB =3D>   4.16 MiB, am=
dgpu.ko.zst)
> > > > > >
> > > > > > real    0m22,821s
> > > > > > user    0m22,759s
> > > > > > sys     0m0,080s
> > > > > >
> > > > > > My wish is to use the zstd-option "-T0" (see vmlinux.bin.zst) e=
verywhere.
> > > > > >
> > > > > > For CONFIG_MODULE_COMPRESS_ZSTD=3Dy: Add compress-level =3D -19
> > > > > >
> > > > > > NOTE: -22 w/ or w/o ultra has no big effect here and increases =
even
> > > > > > more build-time.
> > > > > >
> > > > > > What do you think?
> > > > > >
> > > > > > Thanks.
> > > > > >
> > > > > > Best regards,
> > > > > > -Sedat-
> > > >
> > > > [ Adding some more folks - kmod / authors of commit c3d7ef377eb2
> > > > ("kbuild: add support for zstd compressed modules") ]
> > > >
> > > > Debian/unstable AMD54 ships kmod version 32+20240611-1.
> > > >
> > > > To use better/higher ZSTD compression-level for
> > > > CONFIG_MODULE_COMPRESS_ZSTD=3Dy - do we need a newer KMOD version?
> > > >
> > > > DIFF for Linux-6.10.1:
> > > >
> > > > $ git diff scripts/Makefile.modinst
> > > > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > > > index 0afd75472679..2a8b37c80cbf 100644
> > > > --- a/scripts/Makefile.modinst
> > > > +++ b/scripts/Makefile.modinst
> > > > @@ -146,7 +146,7 @@ quiet_cmd_gzip =3D GZIP    $@
> > > > quiet_cmd_xz =3D XZ      $@
> > > >       cmd_xz =3D $(XZ) --check=3Dcrc32 --lzma2=3Ddict=3D1MiB -f $<
> > > > quiet_cmd_zstd =3D ZSTD    $@
> > > > -      cmd_zstd =3D $(ZSTD) -T0 --rm -f -q $<
> > > > +      cmd_zstd =3D $(ZSTD) -T0 -19 --rm -f -q $<
> > > >
> > > > $(dst)/%.ko.gz: $(dst)/%.ko FORCE
> > > >        $(call cmd,gzip)
> > > >
> > >
> > > The compression tools (zstd, xz, etc) are used predominantly for two
> > > separate topics - kernel image and kernel module compression.
> > >
> > > Off the top of my head: in the former case, reasonable compression is
> > > used by all tools. Be that zstd, lzo, lzma, you name it.
> > > Honestly I don't know why and what's the merit behind the levels chos=
en.
> > >
> > > In the modules case, things are also consistent where the default
> > > compression level is used throughout.
> > > Here it makes sense to keep the default since you can consider that
> > > the decompression can be done by either kernel or user-space. Where
> > > each comes with it's limitations:
> > >
> > > The in-kernel one does not support ultra levels for zstd (or it used
> > > to at some point) IIRC. The kmod tools themselves rely on the zstd
> > > library liked in, although if one is using busybox then zstd
> > > compressed modules were not supported last time I checked (a year or
> > > so ago).
> > >
> > > So for example: you can have zstd --22 modules, if the kernel + kmod
> > > are new enough (have in-kernel decompression) things will fail. If
> > > they're not, things will work just fine.
> > >
> > > Which is why, I think it's up-to your distro/builder to choose the
> > > policy. Here is what we've been using In Arch `ZSTD_CLEVEL=3D19 make =
...
> > > modules_install`.
> > >
> > > Tl:Dr: You'd want to use `ZSTD_CLEVEL` (or equivalent if using xz)
> > > during make modules_install **depending** on the components used and
> > > their version.
> > >
> > > HTH
> > > Emil
> >
> > Hi Emil,
> >
> > Thanks for the explanations and infos.
> >
> > Sorry, for not being consistent with avoiding "top-posting".
> >
> > I took my LATEST selfmade 6.10.1 LLVM/Clang kernel and re-compressed vi=
a:
> >
> > root# zstd -T0 -19 -v *.ko
> >
> > [ SIZES ]
> >
> > 576     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/net/mac80211/ma=
c80211.ko.zst
> > 752     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/net/mac80211/ma=
c80211.ko.zst.orig
> >
> > 244     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wir=
eless/intel/iwlwifi/iwlwifi.ko.zst
> > 316     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wir=
eless/intel/iwlwifi/iwlwifi.ko.zst.orig
> >
> > 144     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wir=
eless/intel/iwlwifi/dvm/iwldvm.ko.zst
> > 184     /lib/modules/6.10.1-1-amd64-clang18-kcfi/kernel/drivers/net/wir=
eless/intel/iwlwifi/dvm/iwldvm.ko.zst.orig
> >
>
> If you use the `ZSTD_CLEVEL=3D19 make modules_install ...` (somewhere in
> your Debian recipe) as mention earlier the extra re-compression should
> not be needed.
>

Hi Emil,

Is ZSTD_CLEVEL an Arch Linux specific variable?

git grep shows the usage of ... in the Linux-kernel source:

include/linux/zstd_lib.h:#  define ZSTD_CLEVEL_DEFAULT 3

I tried Linux v6.10.3 with my "[PATCH] kbuild: Use better
compress-level for zstd compressed modules"

Result: 25MiB smaller linux-image Debian package and same size
reduction in /lib/modules/.

Link: https://lore.kernel.org/all/CA+icZUUQadYjAXiCNx7PmKDV20WctvnzkXC3R2F7=
FM4Gzcm39Q@mail.gmail.com/

> > [ INSTRUCTIONS ]
> >
> > I stopped NetworkManager.service + networking.service + removed iwldvm
> > kernel-module (modprobe -r -v iwldvm).
> >
> > Compressed 3 kernel-modules (see above).
> >
> > Reloaded modified iwldvm (modprobe -v iwldvm) + started
> > networking.service + NetworkManager.service
> >
> > WIFI OK - Logs (dmesg) OK.
> >
> > So user-space works with kernel-space here on Debian/unstable AMD64.
> >
>
> Nice, so it's working as expected.
>
> Using level 19 level is safe assuming you don't use busybox initrd,
> with zstd compressed modules. Although you can use even higher level,
> if using kmod before commit 09c9f8c5df0475d2627d9498e26250592dbfebd6 -
> kmod v30 it seems.
>
> Since I'm not everyone is a Debian person, it'll be great to
> explicitly list the versions used ... for the future.
>
> If you have particular question/concern, let me know.
>

I can NOT say if some new KConfigs make sense here to check for
pre-requisites of specific versions of kmod/zstd/etc.
Introducing CONFIG_MODULE_COMPRESS_ZSTD_CLEVEL?

Thanks for your feedback.

-Sedat-

