Return-Path: <linux-kbuild+bounces-6233-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 306C7A66E21
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Mar 2025 09:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 510BB18979B4
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Mar 2025 08:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835251F0983;
	Tue, 18 Mar 2025 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwyedMt3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551521C6FF4;
	Tue, 18 Mar 2025 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742286463; cv=none; b=Sw3klnrkzXi52nsSirrxHOhCZwqiO744nLy6E3AWDJCDyiD30Rw1tOngF3J/rJwCXRn+3l2rPq1fJPBvmeuMzHYEALPHVi7d1/VQSR9knKQUzkrkh1vc7SfzGwOcEP2z2Leox36JhE3drhTRgmJ/jHLT9YT8OEm4+vFl+ukS3sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742286463; c=relaxed/simple;
	bh=7lWJUOh5+tuck6WiqVNukyuVjEdMtSkNOW0wDpF/GbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zzp0pWA5yK83Ck3ZXCj14sbLkUtYWWDyZBCJN6W2xNqEbRprJngsWy3NxwlSGEVlCZ5BG7XzKkBdsFkRonMVLUtVLmIJWDF1h6lDw1aWCOVN6qjEzBCXDm3vRL2j1spf3morukUdU11zjJwxavsZumwqMdjNBFLF2lhyM0c5yRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwyedMt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED6AC4CEF0;
	Tue, 18 Mar 2025 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742286462;
	bh=7lWJUOh5+tuck6WiqVNukyuVjEdMtSkNOW0wDpF/GbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nwyedMt3CIqn9K96+vAu25tgRaMDZbQgBopXOw49HDLAFOxY1/WnwgLz+noq+PtlR
	 Ed0788Lt3agA1MFc6xa+GCCQFBHWhHlsVgvklJ6LxtyvKGXOVmwxMbdNBK5cYHOFUS
	 +4Cd6RgnDQBbSDENP4b/U3sGUDrimp5Qnq7Q13fs0BgQkk4nTWopVfmHL/RUbPOuH3
	 imW/U2iEWWXPQ2StrYrgEMiiZRj0Dm/mojmizlyDI17AQ35vKwdnaKs9KrcIvcOSYK
	 akHTqj64DfuMXzIRC5XP5EjKFXZlsSmuKhg0sAXBzQoqdvAkjqcUIDMZDGqZQBcvXr
	 itZ+gbK7SmVeQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54943bb8006so4865120e87.0;
        Tue, 18 Mar 2025 01:27:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7CLqoUdRU7fCQC3ECxl534t4vRnXE7R/i+P2Lc8yWw8lwJS2R2I4m6JWAq9V6yZY1y8tY/LRIFOtYgQ==@vger.kernel.org, AJvYcCWWWHHXi2S8ADF5SulhGXApXw/fHVrnuPu1KEmzG0MMeEs8xwVQC0tv9oITlTdAPoPt/j2jPpepH6SgsA==@vger.kernel.org, AJvYcCWxe8HhEOtokX3VsOYB9I0Fh/CrjXlNg3NKyCA6+haos9ik9tZrHUcfANqthE8K5T8Ak8H9qnjUeW+Vs/Vu@vger.kernel.org, AJvYcCXX7APjCdgRl8LZpvKrgZypvOP0k6xflyJ41iwHTJay44sLiYW35/b8jrNyl+gOuay1f96erUz/FyUSQTM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym059Sxo1CIJfw9/dwb+3TNzWQ/llgsCUa2S5WOndWnaqPw+wz
	PKNmNgZi1ItxXfSWN/Lo3DC0D0UlFV3VDCNiyDDdHya+hhfCbn6Faon7M3ERNPT15ONB1acOiBi
	7NXZLvQ2qENx5HNfwTmZovReXUnw=
X-Google-Smtp-Source: AGHT+IFm2NNGJ0oxJGat/+Vip0VVv53VVyEJlM96ngexdcI0hc7G/jRjzyAak+F4mkF5WVC6pr9Xly+ALZj24JosKH4=
X-Received: by 2002:a05:6512:3d05:b0:549:8d07:ff13 with SMTP id
 2adb3069b0e04-549c3989d78mr9351478e87.51.1742286461210; Tue, 18 Mar 2025
 01:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311110616.148682-9-ardb+git@google.com> <202503131715.Fb6CfjhT-lkp@intel.com>
 <CAMj1kXGBLV6W7mJcELmsQuDUi0u-DofyD985znmVoHoZKZTuxA@mail.gmail.com>
 <CAMj1kXEZccymq1OhXErSK+prS3L7sygm7_5_1v+j2cypncQuzA@mail.gmail.com>
 <CAK7LNAT_NRio2pkR1Km5Nq8KM38zYF7VCoGP0OjEP_Owg-ukpQ@mail.gmail.com> <20250318081753.8448Abd-hca@linux.ibm.com>
In-Reply-To: <20250318081753.8448Abd-hca@linux.ibm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 18 Mar 2025 09:27:29 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHoCgRu5werVnEJs+w4nkuiHA1SAyhwxqPyPF6Mk6Js3w@mail.gmail.com>
X-Gm-Features: AQ5f1Jq6lyUmwBDAkReAZ_3PGo-n5HOZWmjSnQq5Gzgz1VOVXF1vvkqoyEHCz6E
Message-ID: <CAMj1kXHoCgRu5werVnEJs+w4nkuiHA1SAyhwxqPyPF6Mk6Js3w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, kernel test robot <lkp@intel.com>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, linux-next@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Mar 2025 at 09:18, Heiko Carstens <hca@linux.ibm.com> wrote:
>
> On Thu, Mar 13, 2025 at 07:29:41PM +0900, Masahiro Yamada wrote:
> > On Thu, Mar 13, 2025 at 7:18=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> > > On Thu, 13 Mar 2025 at 10:34, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > > On Thu, 13 Mar 2025 at 10:21, kernel test robot <lkp@intel.com> wro=
te:
> > > > > kernel test robot noticed the following build errors:
> > > > >
> > > > > [auto build test ERROR on masahiroy-kbuild/for-next]
> > > > > [also build test ERROR on masahiroy-kbuild/fixes tip/x86/core s39=
0/features linus/master v6.14-rc6 next-20250312]
> > > > > [If your patch is applied to the wrong git tree, kindly drop us a=
 note.
> > > > > And when submitting patch, we suggest to use '--base' as document=
ed in
> > > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > > >
> > > > > url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Bieshe=
uvel/Kbuild-link-vmlinux-sh-Make-output-file-name-configurable/20250311-190=
926
> > > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy=
/linux-kbuild.git for-next
> > > > > patch link:    https://lore.kernel.org/r/20250311110616.148682-9-=
ardb%2Bgit%40google.com
> > > > > patch subject: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux=
 build with relocations preserved
> > > > > config: x86_64-randconfig-076-20250313 (https://download.01.org/0=
day-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/config)
> > > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-=
ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/reproduce)
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202503131715.Fb6C=
fjhT-lkp@intel.com/
> > > > >
> > > > > All errors (new ones prefixed by >>):
> > > > >
> > > > > >> gawk: scripts/generate_builtin_ranges.awk:82: fatal: cannot op=
en file `vmlinux.map' for reading: No such file or directory
> > > > >
> > > >
> > > > Hmm it seems I missed some things in link-vmlinux.sh - I will take =
a look.
> > >
> > > We'd need something like the below applied on top - shall I send a v3=
?
> >
> > I will insert this before you patch set.
> > https://lore.kernel.org/linux-kbuild/20250313102604.1491732-1-masahiroy=
@kernel.org/T/#u
> ...
> > > --- a/scripts/link-vmlinux.sh
> > > +++ b/scripts/link-vmlinux.sh
> ...
> > > -vmlinux_link "${VMLINUX}"
> > > +vmlinux_link "${VMLINUX}" vmlinux.map
> > >
> > >  # fill in BTF IDs
> > >  if is_enabled CONFIG_DEBUG_INFO_BTF; then
>
> Building linux-next breaks on s390 with DEBUG_INFO_BTF enabled because
> of this; just where your addon patch ends:
>

Apologies for the breakage - this should already have been fixed in
the kbuild tree [0] but the fix does not appear to have landed yet.

[0] https://lore.kernel.org/all/202503161833.ytx1ivfu-lkp@intel.com


Masahiro?

