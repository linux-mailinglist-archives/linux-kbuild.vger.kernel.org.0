Return-Path: <linux-kbuild+bounces-3142-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357795A444
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 19:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00BB228317D
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 17:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D0971B2EF5;
	Wed, 21 Aug 2024 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHqmLwtl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5141C1B2ED8;
	Wed, 21 Aug 2024 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724263126; cv=none; b=r6TO5+LhLHLUGbIbyT1lWIYEjUmmqUTEF3qcB8Ozjc51/0FKQO+6I9e/vU/XuyiJ46WOJ1aAsaQqv3vf6/G36wXd/xokz7WUyDYyrhfFCAz4c4slNY8bBiSjN7UUzY+UHCJI0LkL1PAXlskQnMpQorFkjAZjY8aHjQVHHMIt9WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724263126; c=relaxed/simple;
	bh=+1/v5jZfzsR36zzUQoIWdG15/0GCUQBPshZcUiVHbok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiQSIXSQZ8/GnWU7AUKP2WKyQPiQqj2evOqSfxgW4JTxcx1lGEUYGengMSjbic8AinfR0lUS3fkEI2RW9pIwtnp1/2rOpyBYMHkC5MTdxRhK74AyWIY1HjQk5AWeBHrSN3vDtBtyYq8CBsAB7dMxPbcsS40QMzNYqUuSGGrzKgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHqmLwtl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DDF2C32781;
	Wed, 21 Aug 2024 17:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724263125;
	bh=+1/v5jZfzsR36zzUQoIWdG15/0GCUQBPshZcUiVHbok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHqmLwtlv9GTujsaLUbDxDZl6H/6MZHkU0XyLvwHf/NhE30jV8mLs951UMaqjL+BI
	 Xk6E6F6TPG2ZDD/TzERnotOwpbPYBSJKZb3wePKwWYpZMEJqNt5JqguJ27sTWQ3GNj
	 +6q4Pvcx9eFnvHvZC+aPEIuaOw1EEjJ6lubCHr8EqdYvm0hOA9EOxO5yZvKw+UTpvU
	 Ij5sYYVAD4nYuMBMwB8rVhXcBGO1253327gaRVUCR6iniWkKXUUW82hU1mAlRctlNe
	 1fG/UqHYc0Aj+SC4yJJi2PBiun+NqM3lO3RLrgK9U4mLjUsk/Vrk8uv3lOQ4EpAES9
	 lBSlku80TuG7w==
Date: Wed, 21 Aug 2024 10:58:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Michal Suchanek <msuchanek@suse.de>, linux-modules@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jiri Slaby <jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] kmod /usr support
Message-ID: <20240821175843.GA2531464@thelio-3990X>
References: <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf>
 <cover.1699618135.git.msuchanek@suse.de>
 <xbgto5tttcah4mrtyjih72ubod3qb375ww6e2fd4pi342rg4eg@wipwd57q43cc>
 <CAK7LNARYK-xjBS8puEM9xFtmjBNW6KJ2Qd6f7diZkdEEbUgVHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARYK-xjBS8puEM9xFtmjBNW6KJ2Qd6f7diZkdEEbUgVHA@mail.gmail.com>

On Tue, Dec 19, 2023 at 05:37:31PM +0900, Masahiro Yamada wrote:
> On Thu, Dec 7, 2023 at 3:37 AM Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> >
> > On Fri, Nov 10, 2023 at 01:13:53PM +0100, Michal Suchanek wrote:
> > >Hello,
> > >
> > >This is resend of the last patch in the series that adds prefix support
> > >to kernel module location together with additional patch for validating
> > >the user supplied input to options that are interpreted as directories.
> > >
> > >Thanks
> >
> > applied, thanks
> >
> > Lucas De Marchi
> 
> 
> 
> If I understood this correctly, MODULE_DIRECTORY is determined
> by "configure --with-module-directory=...", and there is no
> way to change it after that.
> 
> 
> If so, how to work with cross-building?
> 
> Cross-building is typical when building embedded Linux systems.
> 
> 
> Consider this scenario:
> 
> - Your build machine adopts
>     MODULE_DIRECTORY=/usr/lib/modules
> - The target embedded system adopts
>     MODULE_DIRECTORY=/lib/modules
> 
> (or vice a versa)
> 
> 
> 
> 
> depmod is used also for cross-building because
> it is executed as a part of "make module_install".
> 
> 
> The counterpart patch set for Kbuild provides
> KERNEL_MODULE_DIRECTORY, which only changes
> the destination directory to which *.ko are copied.
> 
> You cannot change the directory where the
> depmod searches for modules, as it is fixed
> at the compile-time of kmod.
> 
> 
> 
> 
> In this case, what we can do is to build another
> instance of kmod configured for the target system,
> and use it for modules_install:
> 
> 1. In the kmod source directory
>     ./configure --with=module-directory=/lib/modules
>     make
> 
> 2. make modules_install INSTALL_MOD_PATH=<staging-dir>
>      KERNEL_MODULE_DIRECTORY=/lib/modules
>      DEPMOD=<new-depmod-you-has-just-built>
> 
> 
> 
> If you use OpenEmbedded etc., this is what you do
> because host tools are built from sources.
> 
> But, should it be required all the time?
> Even when the target embedded system uses
> busybox-based modprobe instead of kmod?
> 
> 
> 
> depmod provides --basedir option, which changes
> the prefix part, but there is no way to override
> the stem part, MODULE_DIRECTRY.
> 
> In the review of the counter patch set,
> I am suggesting an option to override MODULE_DIRECTRY
> (let's say --moduledir) at least for depmod.
> 
> (Perhaps modinfo too, as it also supports --basedir)
> 
> 
> 
> Then, we can change scripts/depmod.sh so that
> Kbuild can propagate KERNEL_MODULE_DIRECTORY
> to depmod.
> 
> 
> if  <depmod supports --moduledir>; then
>     set -- "$@"  --moduledir "${KERNEL_MODULE_DIRECTORY}"
> fi
> 
> 
> 
> Does it make sense?

Did this conversation go anywhere? After the upgrade to kmod 33 in Arch
Linux, which includes building with the configuration option
'--with-module-directory' set to '/usr/lib/modules' [1], building a
tarzst-pkg breaks for me, seemingly for the reason noted above.

  $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- O=$HOME/tmp/build/linux defconfig tarzst-pkg
  depmod: ERROR: could not open directory /home/nathan/tmp/build/linux/tar-install/usr/lib/modules/6.11.0-rc4-00019-gb311c1b497e5: No such file or directory
  depmod: FATAL: could not search modules: No such file or directory

  $ ls $HOME/tmp/build/linux/tar-install
  boot  lib

I don't see how to get around this without an option to override
MODULE_DIRECTORY.

I guess I'll ask Arch Linux to revert this option for the time being, as
it mentions they do not really need it at the moment.

[1]: https://gitlab.archlinux.org/archlinux/packaging/packages/kmod/-/commit/0efd732cb78bc0b7851a8367f4dc8e6933f5b99d

Cheers,
Nathan

