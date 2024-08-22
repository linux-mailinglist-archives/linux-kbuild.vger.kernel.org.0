Return-Path: <linux-kbuild+bounces-3152-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43395B628
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 15:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17502285753
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 13:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E071CB136;
	Thu, 22 Aug 2024 13:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CE494uAe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7011C9ED7;
	Thu, 22 Aug 2024 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332384; cv=none; b=NCnVaZn1RJEuV4ms+SK7lOs6JNGShxtlnW3dCgP2GMnJZw+AV1XRdZUTNBBVOudZ1mJ8T6rhsT/Gim5mRJt9EQeXJzL2ogGUMd1+vl/fv/Cf7BITxNIZzZPgckzzmEaN4r+xbq5xoNzUF4Md+oKx9VU2j9nSj2cIEyYIB2YSCHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332384; c=relaxed/simple;
	bh=eHFHFVkO8yflCBjcX0q/2VLQy2ZZemlkelO6ZHPxEAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhgWCiQq6g+kNF6YgryIeTUFOvJwC8V9w/WLusvEX+VEaAxhqKNaaFN8xcPtnHxoag5YFMnA69Vll9GjI2pUqR5HR5WQ1y+3q268IOIDyvKpkQu17XSdP3wVaInzKuCk7kpouDa5dgM7uMdavCgJfSD7byMkqCJ4QLTXIDfcJo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CE494uAe; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7b2dbd81e3so109420966b.1;
        Thu, 22 Aug 2024 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724332381; x=1724937181; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=udkTdSdoseUNrt8x3C8Yz1RB4Y1NzkA7st8NDJidNYI=;
        b=CE494uAelxFUsialVOsCPp35kFXrRnaEEewFu3Fd/DjBSfTWhyjoBp1jPDJeNZG1nC
         Xqc6gQB+HMEWps95D4vHmuXiPPEkGlUM2FksoZf5MqIH+xm/Ib8qY9p8Yv2N2ANuxaYh
         8IN97hggG9vHuqLYzyftHQDD6tWyD5Sm07e56AQfNgccuFhCqitOBg/0/ev28H35Obq1
         4eATvygRLPnnSOjLkMgB3THN7cVZtnpjprpfbWX5bsmur+m+2DQzfSg4ptsgQOh7skRo
         4XQMaXSXwzAr6bVhkxMAhHb7htZ+lBVFodnOAwMcMcKltXK67t9XTNBf/6xJhORXP6Z4
         oDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724332381; x=1724937181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udkTdSdoseUNrt8x3C8Yz1RB4Y1NzkA7st8NDJidNYI=;
        b=be2/tkMJG+4r3/WOBMGPN5t2vAm/rxBYzx7yn4GdMLlb/z89Z8Ju6ZrofcWKEhXH2N
         qzlf5hoqynE0kTjf+PzmYy/65OcbnlkjMjBfN7gHHqO65CuvurYVJZIKMrY/Kxr2n7OF
         0F3ItEgPDbtKMj/dl5Ru2K9ZRAB8gHyOlvjLp/G8xt8w/YQ8w/3BrdBWyxN7FdpVF5Hu
         Pl8dfgULUKLEATlUc34Y3RxNBc3JUQO4504JF0QuGdMGOlzyMEjpmC/ATIR1VaVKGoiE
         UIuaer6MfGTvftEwrJCNGQKK+uX9jcSOWPjopx8hvnjWNz/ggvMTNo0WI7j/zKwiV6Pk
         u3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzPDnrnEC/ZFyFffUFczGiBa7ArMQo9s3EoCLac5ilatjd3tNaKp5dku7Wee8GP52q7M2MEAwD/ApJx8g=@vger.kernel.org, AJvYcCVNlVPeRibEReUxTSOdr35kg146hGQOxD/5XH/IChTUY7Vurst2cUSSK+5wp33IiuYjNDDsph3OYEK4cys0@vger.kernel.org, AJvYcCXgmGjyf0qzvthZ/dXyhwGrUJr4X1sIRPmqAD3jSyzlUYh1OnNMbdNxxcjhbTRco09Tc/pIh0ZL03x9m40TsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1JC2tdfzeNKOBTUmpnSI4IRO8Npdul6tfqOu0t49Pmhl0toxZ
	na7FW1FrjJETegc7CSmPvGHSAzNJqrE384MCQDRZnys4Oz91+D0K
X-Google-Smtp-Source: AGHT+IHi5HRV9Zq2519+9+5nR366fQxmgYVy/Lux0TWc3QsPlYr2zr/3JMwshOwHFj/IQILe2mvpmw==
X-Received: by 2002:a17:907:60d2:b0:a86:83f8:f5a2 with SMTP id a640c23a62f3a-a8683f90253mr363164066b.19.1724332380989;
        Thu, 22 Aug 2024 06:13:00 -0700 (PDT)
Received: from arch-x395 (cpc92320-cmbg19-2-0-cust3522.5-4.cable.virginm.net. [82.13.77.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f436175sm118481266b.129.2024.08.22.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 06:13:00 -0700 (PDT)
Date: Thu, 22 Aug 2024 14:12:58 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Michal Suchanek <msuchanek@suse.de>, linux-modules@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] kmod /usr support
Message-ID: <Zsc5Wh0PKTdXKRlX@arch-x395>
References: <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf>
 <cover.1699618135.git.msuchanek@suse.de>
 <xbgto5tttcah4mrtyjih72ubod3qb375ww6e2fd4pi342rg4eg@wipwd57q43cc>
 <CAK7LNARYK-xjBS8puEM9xFtmjBNW6KJ2Qd6f7diZkdEEbUgVHA@mail.gmail.com>
 <20240821175843.GA2531464@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240821175843.GA2531464@thelio-3990X>

On 2024/08/21, Nathan Chancellor wrote:
> On Tue, Dec 19, 2023 at 05:37:31PM +0900, Masahiro Yamada wrote:
> > On Thu, Dec 7, 2023 at 3:37 AM Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > >
> > > On Fri, Nov 10, 2023 at 01:13:53PM +0100, Michal Suchanek wrote:
> > > >Hello,
> > > >
> > > >This is resend of the last patch in the series that adds prefix support
> > > >to kernel module location together with additional patch for validating
> > > >the user supplied input to options that are interpreted as directories.
> > > >
> > > >Thanks
> > >
> > > applied, thanks
> > >
> > > Lucas De Marchi
> > 
> > 
> > 
> > If I understood this correctly, MODULE_DIRECTORY is determined
> > by "configure --with-module-directory=...", and there is no
> > way to change it after that.
> > 
> > 
> > If so, how to work with cross-building?
> > 
> > Cross-building is typical when building embedded Linux systems.
> > 
> > 
> > Consider this scenario:
> > 
> > - Your build machine adopts
> >     MODULE_DIRECTORY=/usr/lib/modules
> > - The target embedded system adopts
> >     MODULE_DIRECTORY=/lib/modules
> > 
> > (or vice a versa)
> > 
> > 
> > 
> > 
> > depmod is used also for cross-building because
> > it is executed as a part of "make module_install".
> > 
> > 
> > The counterpart patch set for Kbuild provides
> > KERNEL_MODULE_DIRECTORY, which only changes
> > the destination directory to which *.ko are copied.
> > 
> > You cannot change the directory where the
> > depmod searches for modules, as it is fixed
> > at the compile-time of kmod.
> > 
> > 
> > 
> > 
> > In this case, what we can do is to build another
> > instance of kmod configured for the target system,
> > and use it for modules_install:
> > 
> > 1. In the kmod source directory
> >     ./configure --with=module-directory=/lib/modules
> >     make
> > 
> > 2. make modules_install INSTALL_MOD_PATH=<staging-dir>
> >      KERNEL_MODULE_DIRECTORY=/lib/modules
> >      DEPMOD=<new-depmod-you-has-just-built>
> > 
> > 
> > 
> > If you use OpenEmbedded etc., this is what you do
> > because host tools are built from sources.
> > 
> > But, should it be required all the time?
> > Even when the target embedded system uses
> > busybox-based modprobe instead of kmod?
> > 
> > 
> > 
> > depmod provides --basedir option, which changes
> > the prefix part, but there is no way to override
> > the stem part, MODULE_DIRECTRY.
> > 
> > In the review of the counter patch set,
> > I am suggesting an option to override MODULE_DIRECTRY
> > (let's say --moduledir) at least for depmod.
> > 
> > (Perhaps modinfo too, as it also supports --basedir)
> > 
> > 
> > 
> > Then, we can change scripts/depmod.sh so that
> > Kbuild can propagate KERNEL_MODULE_DIRECTORY
> > to depmod.
> > 
> > 
> > if  <depmod supports --moduledir>; then
> >     set -- "$@"  --moduledir "${KERNEL_MODULE_DIRECTORY}"
> > fi
> > 
> > 
> > 
> > Does it make sense?
> 
> Did this conversation go anywhere? After the upgrade to kmod 33 in Arch
> Linux, which includes building with the configuration option
> '--with-module-directory' set to '/usr/lib/modules' [1], building a
> tarzst-pkg breaks for me, seemingly for the reason noted above.
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- O=$HOME/tmp/build/linux defconfig tarzst-pkg
>   depmod: ERROR: could not open directory /home/nathan/tmp/build/linux/tar-install/usr/lib/modules/6.11.0-rc4-00019-gb311c1b497e5: No such file or directory
>   depmod: FATAL: could not search modules: No such file or directory
> 
>   $ ls $HOME/tmp/build/linux/tar-install
>   boot  lib
> 
> I don't see how to get around this without an option to override
> MODULE_DIRECTORY.
> 
> I guess I'll ask Arch Linux to revert this option for the time being, as
> it mentions they do not really need it at the moment.
> 
> [1]: https://gitlab.archlinux.org/archlinux/packaging/packages/kmod/-/commit/0efd732cb78bc0b7851a8367f4dc8e6933f5b99d
> 

Since we've officially (?) switched to Github for issues, I opened one
[1].

I suspect it would be a little harder to get lost in the noise, although
Github and all that.

Everyone feel free to subscribe, comment ... or even send some patches.
Ideally we'll get Michal to help this although I'm not sure how busy he
is.

HTH
Emil

[1] https://github.com/kmod-project/kmod/issues/85

