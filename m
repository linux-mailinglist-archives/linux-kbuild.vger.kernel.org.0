Return-Path: <linux-kbuild+bounces-10067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 693BDCB608C
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 14:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 538FE3032FE8
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Dec 2025 13:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B1F2DCC1B;
	Thu, 11 Dec 2025 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SSMiAuNG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FCA4A3E
	for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459918; cv=none; b=M7Y1t8JSPBvUodPeT73NVCNmuOx/NCckwZ6yiFmmHAOSzZdF1F5Yw/IFKpTYTBryjphmAORtk4spqFq16GjK53VbLKnR7wdfsnmRFOgoKJXZqGBS9DZ7wspGUXHurZwGyKDJxxvMUeE8uq3bzjZHlLl1z/Q496NpojZy4UR4u80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459918; c=relaxed/simple;
	bh=SWn6ENfXlqkJSR/QqedDXLlFiDm1ysg5DooojkPKPhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWHUKEFV45bM3M5hFGWD0CjgfkadG4JmYdrGX23Z803Zx1MS5xG19MPqyGW+qnbBrvPnnIwHARHrNgBIi9KIF0Hzvh3mwpULgGlOV7A9pinjEvySvQGVqgyWM8y3dIm9J9zJQuhs5XmCVBSeBP2Dafh1yMKM+hfaAosAenpuxxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SSMiAuNG; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640c1fda178so195145a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2025 05:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765459915; x=1766064715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JaEmQHvGSI2x2gLiYB+bj+2e+ulZAo6jhqvSHW6UxLU=;
        b=SSMiAuNG4IV33iJmVSk1nh3afj/WybLkGQ0HMO88xmoTBMqNJXGDm5PHEUZ2nyGaLK
         HH3gOONg+WR9KVkHEbe2sKA4TxqnIjCO02hi1oIbZ3iiQmEIDz3ICHR4abUqnGQpLWIH
         BxHgZKULqkG4gmmVPrrHnZjhF1HX0218PSxY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765459915; x=1766064715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JaEmQHvGSI2x2gLiYB+bj+2e+ulZAo6jhqvSHW6UxLU=;
        b=NTjChz9M8LmyQ32IRX3yoK6Dk9WwXQaqO7hWHONQa9PqeTFcdY6Nj91M286RjVWrQt
         0OIIdro0Euqgk0stIt24Mj0nwWjdVI8cZIaiKoAdMGW0P2K2I8NSUYnFO64aAuhy5acW
         BZlQ+RClG+vyQ5/zcbpeEpfqnp0frv9UJVdBUUtknMjf+bTeBWLy9sxV7AROLEQXmPIa
         J8k/r+LApqmIuFuVSG3u7LkF8W+DESPgZVq7Dph6MEHx25oeK95CfJ6nw4JczsynTJao
         RYetkb7lVMvC6gvbAn6b+t5L1GiGJr8I9mzHfRjLpjESYhfmRVax94XO0EJzUv8WJC8Z
         LNew==
X-Forwarded-Encrypted: i=1; AJvYcCUOPka0zunJYyyq3pG5Fc5/w7VGp+R90e+e/Nx0n+8Za84mXZC3FHNaZ6U6qZU/GSQXjZ2xXH1diov3ySg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7O4cwBGra2CAEp5YM1pgCbFYm7Esfm35nC/Zkj0bkID9Evix6
	3XUn7G/BeGYZ8ouKvwDCUdcQqy6F2B6juP1H+fAGE20h17Bw4Wq13UUXppljmWBCuLW64rWWruo
	hb6SbcxutYTOJiysUlwSLCXHopgJprBpZzG5NiK8/
X-Gm-Gg: AY/fxX5hzawl0iJGjvVIC3qmSk6AI5WeiKqxTUMjC/EWrcrpXs4X1NKSVComPz46NvA
	yOju3ixmDyWlofME9SLaha9i3W577WHHazhHVsJuR3FoNEIVYCmcVAokLU+k0NaNUMWHD84KTUW
	waX57xZjG+mgs7KS9cLOfuFpp/To6xQy4AWo1lx+rocCYfwIznxM5AuB2HrLUt0fDcLPNVGdH/K
	FjWwux+NBSlIbyf6kRD/63ysPC7c47yX3sx4rGw/Ku4Y1XgmsboCZE9LufHAzYCK5UbDQ==
X-Google-Smtp-Source: AGHT+IFaqY7OCdXtwT3KVg3u/conwzCT1yxeCEixjiz94w9/B3FO353YXzCOf6sA/xKAT/ScJz6kIyVHLfEhIOk6pUY=
X-Received: by 2002:a05:6402:144d:b0:640:ca0a:dc1c with SMTP id
 4fb4d7f45d1cf-6496cb6b889mr6159928a12.7.1765459915034; Thu, 11 Dec 2025
 05:31:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119181333.991099-1-sjg@chromium.org> <20251119181333.991099-7-sjg@chromium.org>
 <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
 <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>
 <20251126080620-921e6880-cacf-44c5-bd8b-f380fbb8090a@linutronix.de>
 <28e18785-1336-4fbc-9f2b-69aa6bb06375@pengutronix.de> <20251202112039-b03af7ec-ae06-41ab-914b-703940cc98a2@linutronix.de>
In-Reply-To: <20251202112039-b03af7ec-ae06-41ab-914b-703940cc98a2@linutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 11 Dec 2025 06:31:43 -0700
X-Gm-Features: AQt7F2qH4HrZCRqWeMpn2CN38Ll3uZiYfTCxiVjKfBmcJrFAqbKfniV1G2JLLk4
Message-ID: <CAFLszTh3sM3AEW2MVvR-3szkEtvgnNMsWUcwH6AgBa+KThNF7w@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	=?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>, Nicolas Schier <nsc@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, 
	Tamir Duberstein <tamird@gmail.com>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Tue, 2 Dec 2025 at 03:31, Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Wed, Nov 26, 2025 at 12:26:49PM +0100, Ahmad Fatoum wrote:
> > On 11/26/25 8:16 AM, Thomas Wei=C3=9Fschuh wrote:
> > > On Tue, Nov 25, 2025 at 02:58:12PM -0700, Simon Glass wrote:
> > >> On Thu, 20 Nov 2025 at 00:49, Thomas Wei=C3=9Fschuh
> > >> <thomas.weissschuh@linutronix.de> wrote:
> > >>>
> > >>> On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:
> > >
> > > (...)
> > >
> > >>>>  quiet_cmd_fit =3D FIT     $@
> > >>>>        cmd_fit =3D $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os li=
nux \
> > >>>> -             --name '$(UIMAGE_NAME)' \
> > >>>> +             --name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
> > >>>
> > >>> Remnant of a previous revision?
> > >>
> > >> The flags are there to allow extra options to be passed if needed.
> > >
> > > Are they necessary for the module functionality added here?
> > > If not I'd put them into a dedicated commit.
> > >
> > >>>
> > >>>>               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
> > >>>>               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> > >>>> +             $(if $(FIT_MODULES),--modules @$(objtree)/modules.or=
der) \
> > >>>
> > >>> I am wondering how module dependencies work without the depmod invo=
cation
> > >>> and modules.dep file.
> > >>
> > >> We have a mechanism to place a pre-build initrd with the filesystem,
> > >> etc. into the FIT. But for this particular feature (suggested by Ahm=
ad
> > >> Fatoum) we are just providing the raw modules. Presumably another
> > >> initrd would be needed to provide the startup files?
> > >
> > > modules.dep is more than optional and generic startup files but an in=
tegral
> > > part of a module tree. Without it, any module depending on another mo=
dule's
> > > symbols will fail to load. Also the modules will be unsigned, potenti=
ally
> > > making them unloadable.
> >
> > I'll use the occasion to elaborate a bit on why I thought adding module=
s
> > is a good idea.
> >
> > - You have a system boot from FIT and maybe even a r/o rootfs
> > - You want to boot a different kernel without any userspace changes,
> > e.g. to bisect
> > - Fortunately, you have a build target that generates you a FIT with
> > kernel, enabled device trees and all modules (including deps and such)
> > - In the bootloader[1], you specify that a CPIO with a minimal init[2]
> > that bindmounts /lib/modules in the initramfs over the rootfs modules
> > before pivot_root
> >
> > and that's it, you are running your new kernel with the old rootfs
> > unchanged. I believe this would be really handy, which is why I
> > suggested it.
>
> The idea sounds good.
>
> > > Ahmad's patch does produce a complete and fully
> > > functional module tree by means of 'make headers_install'.
> >
> > I originally thought that we could generate the CPIO normally as part o=
f
> > the kernel build and then we can readily depend on it in the rule that
> > invokes make_fit.py.
>
> That works, but it is not what the patch under discussion does, or did.
>
> > If this proves to be too cumbersome, I think it's already an improvemen=
t
> > if the user can manually run make modules-cpio-pkg and then make
> > image.fit with the initrd specified. A single target would be neater of
> > course, but I didn't intend for this to stall the series.
>
> The single target idea would require 'modules-cpio-pkg' to not be a PHONY
> target anymore but to properly track dependencies. Otherwise the CPIO and=
 FIT
> image will be rebuilt even if no sources change. Proper dependencies are =
always
> better than PHONY targets, but it will be a bit of additional work.
>
> > It can always follow later.
>
> Yep. But for the patch as it is proposed I am still wondering how it will=
 work
> without modules.dep and friends.
>
> (...)

I'm going to send a v7 and perhaps Ahmad can help to refine this.
Unfortunately the modules generation has turned into a significant
detour. We can either drop it, or continue to try to resolve this.

Regards,
SImon

