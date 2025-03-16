Return-Path: <linux-kbuild+bounces-6192-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 815CDA6363D
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 16:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73F0A188EAEE
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 15:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC18B4430;
	Sun, 16 Mar 2025 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihu+uw4N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8761A1AB6F1
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Mar 2025 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742138903; cv=none; b=fSYM8jTWiWaJI1md2Ayzlo2p+K/tmvNqYb9bBqBR/3v999lW8IXignlcXm5yS/i564zzSLPMuCaxL9to9I+JzNGsyBfh9qrbdjtcNr6+HHSl0D0IXJH4D3TySOrZs2csdP7GSoTJVFh8ddSRP9EGJzcUZwQrxMbecVYqbyrcRj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742138903; c=relaxed/simple;
	bh=vNFIcfTzkV5HNpQWF5fiB0x3n1TkSfLen+jXEaLkoaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDdi4dgTV9DLrfPFV8LQw2qDzvu2cMIY2jDV2Ia3uzKG/DroYBnBR232fxzfn25z0OmAN81SAoCQrrPC9qyeSnN/VzA9SVPhRe/sf6Xj8wl/inrsSGq5ghd87F83gdVPEHuNjmX+fSqmZzXpHQB19N51jXBGYmjupJa1wxvIGEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihu+uw4N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1364BC4CEDD
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Mar 2025 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742138903;
	bh=vNFIcfTzkV5HNpQWF5fiB0x3n1TkSfLen+jXEaLkoaU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ihu+uw4NVrI3VGioO3HJt0RrTmRmLKbMN1Mvikqk+VhT1F9yePzBV6bM/p5mL/Jif
	 TfJghxNKoaaQLm5CFXx4uPxftH/LQdtuZzptF1lWEnvpiURrRpUqWdeAP94+smC6I1
	 ksnj7kFCtLxoGFoc7sHjJT5C3TxG3XkZWFq6x032McraqNUzkAswrUZBuWWc+ITkfn
	 nFVcW5HfS3XwxpkGtWxJPcFKqCqpTZv+n7toUeWjo46bIQtIx8m6M57WYkRd9D55gE
	 EgEGR3PwMNY/10IXXCvyl/ypic19UM3s1d3GR7XjF2cPFCaXjjiS5IQYpLjOAw01YB
	 AMKKHn/5Ubdaw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5498c742661so3919518e87.1
        for <linux-kbuild@vger.kernel.org>; Sun, 16 Mar 2025 08:28:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPslQBMYxNwvd6poEvmgEOCBGqgO6cvhPtkBNDcQtwQNhTphRlcjKPGRfjGedc2zm3iNhoTNRqvVnfDqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YydbbqR7FXBj2+ew+8nq0UeWnlfnb3vnwsp4id0B/wOhW04BYUZ
	4XITYYqrKoRrvBhTiUwIYvcRD0tKek6CF2HqpkjyncxP30O/H+J4QD+vUoB0FhckQ8SEzGxjqjv
	rptAZS9dyjEg1mbKJTIFZa9TEgAY=
X-Google-Smtp-Source: AGHT+IF0Dt/laO7zegcvare8prIKHkNI8ibK0zBaerP9xH93a7mlsM62yg1nkaUMORLNbgZvlejJ+P64c8Z98vSiZ/4=
X-Received: by 2002:a05:6512:1115:b0:545:576:cbd2 with SMTP id
 2adb3069b0e04-549c38eacbdmr4026754e87.10.1742138901595; Sun, 16 Mar 2025
 08:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202503161833.ytx1ivfu-lkp@intel.com> <CAMj1kXGqqW2UPvxB+o_LNSXb3CBk1QsQuCpmY=OsQPY=kWHFnw@mail.gmail.com>
In-Reply-To: <CAMj1kXGqqW2UPvxB+o_LNSXb3CBk1QsQuCpmY=OsQPY=kWHFnw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 17 Mar 2025 00:27:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNASkwp3zecQ0=NQ7FNPD1pO-a+RvJwA_O-whWgMhvLnqqQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqOtuPZIF1zzaDqY6ahVhL15CrS9kVkzOE7SbAbWWYxP20TDdkaQblTtS4
Message-ID: <CAK7LNASkwp3zecQ0=NQ7FNPD1pO-a+RvJwA_O-whWgMhvLnqqQ@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 25/35] FAILED cannot open vmlinux: No
 such file or directory
To: Ard Biesheuvel <ardb@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 11:09=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Sun, 16 Mar 2025 at 11:20, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux=
-kbuild.git kbuild
> > head:   e3de46f775ec29a17f671523798c28222a4ce818
> > commit: cac289e2b2b0909b52c0a694c4469a9ad9f03764 [25/35] kbuild: Create=
 intermediate vmlinux build with relocations preserved
> > config: i386-buildonly-randconfig-001-20250316 (https://download.01.org=
/0day-ci/archive/20250316/202503161833.ytx1ivfu-lkp@intel.com/config)
> > compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24=
a30daaa559829ad079f2ff7f73eb4e18095f88)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250316/202503161833.ytx1ivfu-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202503161833.ytx1ivfu-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> FAILED cannot open vmlinux: No such file or directory
> >
>
> We need the below - Masahiro, would you like me to send this is a
> follow-up patch?
>
>
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -185,7 +185,7 @@ cleanup()
>  {
>         rm -f .btf.*
>         rm -f System.map
> -       rm -f vmlinux
> +       rm -f "${VMLINUX}"

This is wrong because the target vmlinux is not passed
during 'make clean'.

https://github.com/torvalds/linux/blob/v6.14-rc5/Makefile#L1583



>         rm -f vmlinux.map
>  }
>
> @@ -288,12 +288,12 @@ vmlinux_link "${VMLINUX}"
>
>  # fill in BTF IDs
>  if is_enabled CONFIG_DEBUG_INFO_BTF; then
> -       info BTFIDS vmlinux
> +       info BTFIDS "${VMLINUX}"
>         RESOLVE_BTFIDS_ARGS=3D""
>         if is_enabled CONFIG_WERROR; then
>                 RESOLVE_BTFIDS_ARGS=3D" --fatal_warnings "
>         fi
> -       ${RESOLVE_BTFIDS} ${RESOLVE_BTFIDS_ARGS} vmlinux
> +       ${RESOLVE_BTFIDS} ${RESOLVE_BTFIDS_ARGS} "${VMLINUX}"

These two changes  are correct.

I will squash.


--=20
Best Regards
Masahiro Yamada

