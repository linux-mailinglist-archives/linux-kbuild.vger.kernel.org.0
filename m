Return-Path: <linux-kbuild+bounces-6119-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD773A5F0E8
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 11:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A82977A29B2
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 10:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2001265CAB;
	Thu, 13 Mar 2025 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gsk66exq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999D264FBD;
	Thu, 13 Mar 2025 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861819; cv=none; b=LzuctnxxcRqJJKOgfHkNfU3RyDKjhrJP/i5V3DogpSXvaHrJI5OAWVf9dg3A92SZk1lI5IweOaUZ5tVcOCM8ZjkReuq0WY8WlHXFC2HuFDnDRuKsudvNWgCmof5mYDJRb7lBXI90dv9DdVMKNxcH8Dr+/nZQSE6NhVdttWoW7dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861819; c=relaxed/simple;
	bh=QEvxVG8I/hTVZKOvqF1lYUikB1WAzIg+p5U+9zryPT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGQV1dZW26pb37q5V/vdr77xp8/ve+SFHeGLVzVDcgBl9gGl+4+ErxrwREZRRQHcTP7R6w2pmv1WKyorVoIlYPn0Dcl1rSCUXjWg3YccXtLXw2Vxtfm5DEao5suAxPfT/+Irs8ZB5UTWaVxpzrR6tBT+U+wDRIzxJV60A8wPvz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gsk66exq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16211C4CEE3;
	Thu, 13 Mar 2025 10:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741861819;
	bh=QEvxVG8I/hTVZKOvqF1lYUikB1WAzIg+p5U+9zryPT0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gsk66exqBT/kKfea0fo4Q+0PXcBK0s4a3sQigv+rvzP4d4w2XK1YQERTbFUgUmxBp
	 ajc7+UuXPVswVpY/MgdzOCPPqFEPMZRe5HS/PlS6Es+uXvGw4Dbp/I7Uqdk+xI94a4
	 yyVjGgU5aqhZymraWi0rnwcOp88dXSXNEq4W5RYg2lAKej/F6aEVU7WQg8cNTbLqCK
	 v4ZIDX5mtv+2PtqB1hEsHA3UZ+Y9qFm5JAJbYfyioVGXHo9QXwHHGwIb31mCB+8Mqw
	 GGo52/0ybPbADOqaSZhtOEcz/EjwEGo44RVi+rfGANjxXjHu5mMfhhiY4SVqdMflkK
	 rVMDVzGILcrAw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549967c72bcso945577e87.3;
        Thu, 13 Mar 2025 03:30:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUMu6yChRNoCDPG4ZAP6Jgt8cqi++9xP+J1FR12J/Xbx6cOWnQRFikaqU6iMiT9dv7laq/RQiZNz2fcwc=@vger.kernel.org, AJvYcCXf9/oMnqdu9eBZNGhfAkhX/Opcsk929uYgrCoJVON3WvlzBYz+mQK2y9UMB4CoTp+rbD3xMZF02sR2c/5i@vger.kernel.org
X-Gm-Message-State: AOJu0YzVJKgqqNoQm0OC9MQX2Fsof7aAusM/8lOEn3XMWXcMQiI/2a1I
	21wHTuhj0hZEQoiu6XmuT68C0eTRHaeNxphhJ4u5CBSKvuGTpaL1oZcjD7XJL3mpTjyomRFTS5l
	Whhvsg+g6KNvXCaG6PI4LhNezqb4=
X-Google-Smtp-Source: AGHT+IHYqyvlbFJWpUpXNCxWAr3gQGfo/B1oVwVdpaiXhvEQDZmER5taQn2phFdz+AWOWgVByaE0iZNyjmX15WzStcU=
X-Received: by 2002:a05:6512:2342:b0:549:8b24:988f with SMTP id
 2adb3069b0e04-54990da2790mr8737978e87.0.1741861817726; Thu, 13 Mar 2025
 03:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311110616.148682-9-ardb+git@google.com> <202503131715.Fb6CfjhT-lkp@intel.com>
 <CAMj1kXGBLV6W7mJcELmsQuDUi0u-DofyD985znmVoHoZKZTuxA@mail.gmail.com> <CAMj1kXEZccymq1OhXErSK+prS3L7sygm7_5_1v+j2cypncQuzA@mail.gmail.com>
In-Reply-To: <CAMj1kXEZccymq1OhXErSK+prS3L7sygm7_5_1v+j2cypncQuzA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Mar 2025 19:29:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_NRio2pkR1Km5Nq8KM38zYF7VCoGP0OjEP_Owg-ukpQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrvxKSzDk58nqsT3nejvFSY6kfeqbfgNaL4ldnTl0LmsnwFvj15KgRa8Ec
Message-ID: <CAK7LNAT_NRio2pkR1Km5Nq8KM38zYF7VCoGP0OjEP_Owg-ukpQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
To: Ard Biesheuvel <ardb@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 7:18=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Thu, 13 Mar 2025 at 10:34, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Thu, 13 Mar 2025 at 10:21, kernel test robot <lkp@intel.com> wrote:
> > >
> > > Hi Ard,
> > >
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on masahiroy-kbuild/for-next]
> > > [also build test ERROR on masahiroy-kbuild/fixes tip/x86/core s390/fe=
atures linus/master v6.14-rc6 next-20250312]
> > > [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> > > And when submitting patch, we suggest to use '--base' as documented i=
n
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel=
/Kbuild-link-vmlinux-sh-Make-output-file-name-configurable/20250311-190926
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/lin=
ux-kbuild.git for-next
> > > patch link:    https://lore.kernel.org/r/20250311110616.148682-9-ardb=
%2Bgit%40google.com
> > > patch subject: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux bui=
ld with relocations preserved
> > > config: x86_64-randconfig-076-20250313 (https://download.01.org/0day-=
ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202503131715.Fb6CfjhT=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> gawk: scripts/generate_builtin_ranges.awk:82: fatal: cannot open f=
ile `vmlinux.map' for reading: No such file or directory
> > >
> >
> > Hmm it seems I missed some things in link-vmlinux.sh - I will take a lo=
ok.
>
> We'd need something like the below applied on top - shall I send a v3?


I will insert this before you patch set.
https://lore.kernel.org/linux-kbuild/20250313102604.1491732-1-masahiroy@ker=
nel.org/T/#u

I would have done this earlier.
That is simply because I always run out of my time
and I do not have time to fix issues before someone stumbles on them.



>
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -46,6 +46,7 @@
>
>  # Link of vmlinux
>  # ${1} - output file
> +# ${2} - map file
>  vmlinux_link()
>  {
>         local output=3D${1}
> @@ -99,7 +100,7 @@ vmlinux_link()
>         fi
>
>         if is_enabled CONFIG_VMLINUX_MAP; then
> -               ldflags=3D"${ldflags} ${wl}-Map=3D${output}.map"
> +               ldflags=3D"${ldflags} ${wl}-Map=3D${2}"
>         fi
>
>         ${ld} ${ldflags} -o ${output}                                   \
> @@ -185,7 +186,7 @@
>  {
>         rm -f .btf.*
>         rm -f System.map
> -       rm -f vmlinux
> +       rm -f ${VMLINUX}
>         rm -f vmlinux.map
>  }
>
> @@ -224,7 +225,7 @@
>                 strip_debug=3D1
>         fi
>
> -       vmlinux_link .tmp_vmlinux1
> +       vmlinux_link .tmp_vmlinux1 .tmp_vmlinux1.map
>  fi
>
>  if is_enabled CONFIG_DEBUG_INFO_BTF; then
> @@ -267,19 +268,19 @@
>         sysmap_and_kallsyms .tmp_vmlinux1
>         size1=3D$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kal=
lsymso})
>
> -       vmlinux_link .tmp_vmlinux2
> +       vmlinux_link .tmp_vmlinux2 .tmp_vmlinux2.map
>         sysmap_and_kallsyms .tmp_vmlinux2
>         size2=3D$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kal=
lsymso})
>
>         if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
> -               vmlinux_link .tmp_vmlinux3
> +               vmlinux_link .tmp_vmlinux3 .tmp_vmlinux3.map
>                 sysmap_and_kallsyms .tmp_vmlinux3
>         fi
>  fi
>
>  strip_debug=3D
>
> -vmlinux_link "${VMLINUX}"
> +vmlinux_link "${VMLINUX}" vmlinux.map
>
>  # fill in BTF IDs
>  if is_enabled CONFIG_DEBUG_INFO_BTF; then



--=20
Best Regards
Masahiro Yamada

