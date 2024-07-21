Return-Path: <linux-kbuild+bounces-2616-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EC49385A3
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 19:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F3C428103A
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jul 2024 17:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEFF1EEE6;
	Sun, 21 Jul 2024 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="YtQh5fMb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111F31EA87;
	Sun, 21 Jul 2024 17:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721582483; cv=none; b=FFS0t/0DnG5bGPhT72DpmdO+qi1FbaDMMWq1uh0fO0HVgq3n6HXTT5vBBzUhWmhdWnQ9LubGCp/KbSrnETv11MHrUGVk6ETMGXo5wvWR4/0hJG3KymNzP0fGC9PEbRjuNnyWSuvirNcTnyquB1jpl4278JZ0iGk/sT46CxWZhxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721582483; c=relaxed/simple;
	bh=P7OBUODgIpwQmjQlV7VL1Qda8n7nj+5uuXhMD5/fFLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GR1YFTFlHmAOHH+NtQx05J3RUwURo/RvVd3CpR9vNY8BBdugZNikJXiiL1k47GJyfZEKi+FlZlL2zXAc2i0S0TbewgxZo+3q5L5LrWhap/kw/Choa7YX8szxEpOJSgdUP1lJDBM/SoLIvPNIdOF4Hp51AR/zBA64HAe75L9viBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=YtQh5fMb; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1721582477;
	bh=P7OBUODgIpwQmjQlV7VL1Qda8n7nj+5uuXhMD5/fFLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtQh5fMbr2MdrbYBU4hE37RGw0Pn8ZSSxIxEgv5Dxpv7RYpK0n9G9HB7jGjuZ8YcK
	 1kc0lPwlVzKiQ3XN2Vyw/GCTSyJ7JKE5bB9+lXpwVF44fYZLLUhbZ9AKNYe25CIw+9
	 jiJ6g9oEjUyjXFuz09YVxl4pNs5k0WxEHRqAw60s=
Date: Sun, 21 Jul 2024 19:21:16 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v7] kbuild: add script and target to generate pacman
 package
Message-ID: <f85f96a0-6ac0-4a44-a450-f23cde5a00c1@t-8ch.de>
References: <20240720-kbuild-pacman-pkg-v7-1-74a79b4401d2@weissschuh.net>
 <20240721033209.GA545406@thelio-3990X>
 <CAK7LNARj9fxm_3h=7g4PLbLDHXNUQrRu8iOQ4sZdx8Ag3YS9sA@mail.gmail.com>
 <20240721121109.GA3599565@thelio-3990X>
 <CAK7LNAQyRaMgcgg5urnJU8ePqULAOB6TkFDjRVEwjEZEvT6s-g@mail.gmail.com>
 <5db8b1e9-894b-4626-b635-420078df10ce@t-8ch.de>
 <CAK7LNAQ5RhUg=ktGZnfGxNLMckJzKM12r1Q=KpCjvFU=_vaZEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQ5RhUg=ktGZnfGxNLMckJzKM12r1Q=KpCjvFU=_vaZEw@mail.gmail.com>

On 2024-07-22 01:02:43+0000, Masahiro Yamada wrote:
> On Sun, Jul 21, 2024 at 11:57 PM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > On 2024-07-21 22:42:12+0000, Masahiro Yamada wrote:
> > > On Sun, Jul 21, 2024 at 9:11 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > > On Sun, Jul 21, 2024 at 03:58:49PM +0900, Masahiro Yamada wrote:
> > > > > On Sun, Jul 21, 2024 at 12:32 PM Nathan Chancellor <nathan@kernel.org> wrote:

<snip>

> > > > > I believe this is a separate issue, but
> > > > > Debian/Ubuntu provides a 'makepkg' package, which fails
> > > > > with 'User defined signal 1' error.
> > > > >
> > > > > After 'sudo apt install makepkg',
> > > > >
> > > > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ cat
> > > > > /etc/os-release
> > > > > PRETTY_NAME="Ubuntu 24.04 LTS"
> > > > > NAME="Ubuntu"
> > > > > VERSION_ID="24.04"
> > > > > VERSION="24.04 LTS (Noble Numbat)"
> > > > > VERSION_CODENAME=noble
> > > > > ID=ubuntu
> > > > > ID_LIKE=debian
> > > > > HOME_URL="https://www.ubuntu.com/"
> > > > > SUPPORT_URL="https://help.ubuntu.com/"
> > > > > BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
> > > > > PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
> > > > > UBUNTU_CODENAME=noble
> > > > > LOGO=ubuntu-logo
> > > > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
> > > > > makepkg --version
> > > > > makepkg (pacman) 6.0.2
> > > > > Copyright (c) 2006-2021 Pacman Development Team <pacman-dev@archlinux.org>.
> > > > > Copyright (C) 2002-2006 Judd Vinet <jvinet@zeroflux.org>.
> > > > >
> > > > > This is free software; see the source for copying conditions.
> > > > > There is NO WARRANTY, to the extent permitted by law.
> > > > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$ git
> > > > > log --oneline -2
> > > > > 5dcaebb67ad9 (HEAD) kbuild: add script and target to generate pacman package
> > > > > 41c196e567fb (tag: next-20240719, origin/master, origin/HEAD) Add
> > > > > linux-next specific files for 20240719
> > > > > masahiro@zoe:~/ref/linux-next((HEAD detached from origin/master))$
> > > > > make defconfig  pacman-pkg
> > > > > *** Default configuration is based on 'x86_64_defconfig'
> > > > > #
> > > > > # No change to .config
> > > > > #
> > > > > objtree="/home/masahiro/ref/linux-next" \
> > > > > BUILDDIR="" \
> > > >
> > > > It is not related to this issue but I don't think this should be empty.
> > > > 'realpath pacman' does not appear to work here, I was able to fix this
> > > > with the following diff:
> > > >
> > > > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > > > index 94357f47d2fa..b0fd44a40075 100644
> > > > --- a/scripts/Makefile.package
> > > > +++ b/scripts/Makefile.package
> > > > @@ -148,7 +148,7 @@ PHONY += pacman-pkg
> > > >  pacman-pkg:
> > > >         @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> > > >         +objtree="$(realpath $(objtree))" \
> > > > -               BUILDDIR="$(realpath pacman)" \
> > > > +               BUILDDIR="$(realpath $(objtree))/pacman" \
> > >
> > >
> > > Right.
> > >
> > > $(realpath pacman) expands to empty
> > > if 'pacman' does not exist yet.
> > > Your fix is correct.
> >
> > I'm wondering how it worked for me, as I specifically tested this case.
> > But I'm fine with the proposal.
> >
> > Shouldn't it be "$(realpath ./pacman)" though?
> 
> 
> No.
> 
> Aa I said, $(realpath ./pacman) expands to an empty string
> if ./pacman does not exist.

My bad, I misread the braces and thought the code was doing
BUILDDIR="$(realpath $(objtree)/pacman)"


Thomas

