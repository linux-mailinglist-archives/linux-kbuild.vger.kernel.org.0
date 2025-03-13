Return-Path: <linux-kbuild+bounces-6117-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F92A5F074
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 11:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D73703AFE5B
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 10:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8EC2356A7;
	Thu, 13 Mar 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8AIJNXz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64831EE028;
	Thu, 13 Mar 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741861135; cv=none; b=RszduTI7lxyu12BTwuJ3VX1Nkh+lbCQ6UV3pLRCg+J3aIdVxr58E+fvMf+E+TYmCfUSSZonWINjocDv9T/ZT5kqfbWh0olIRmsKCtM5xppbkBS0QnmXZ+OCQi1UL3N0MbXow47TuJZZ90dc6rLtWz+oVOLeOd+YMrHgklPL/ngE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741861135; c=relaxed/simple;
	bh=FTKrcyyQeQ7tmBXUmBwOgo7Ir173BAfEtpApsdgjLic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RxcaTEP7A1r6LiwlhvK+UtdcWeE29Wrkd8TB7Tdzl0z0vnFbzyVd1VW6fN4xOT3THbXnfsCnHgqj7g61u0qwKWON064/NvUVVkC8gdt8vtyy+LmAB/7UDSMtp4lkkd3FFdO/0L4ktucSjF96D0qiCH6n3amOB4Eg5w+h1boTGec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d8AIJNXz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56650C4CEDD;
	Thu, 13 Mar 2025 10:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741861135;
	bh=FTKrcyyQeQ7tmBXUmBwOgo7Ir173BAfEtpApsdgjLic=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d8AIJNXzWri+NBCqfzDuCYgLglph1i4Kzqz7c3BHkNAh46Ft3BZy0dqREYAMbaY7M
	 ypREYs0cDws0cuwN6zSlnpHM8qs0DLbnznTsjLIV7J5mMQ5qoRu99L9rkk/MFB2dF7
	 OFeMrLAqN+lxf8dCnUj/U+FxM58CXl1rxO/TE7HvRuh/wHt0XLfj3athNF9tVPT05i
	 Wvf/0vGa08SNKQKDkCNPFJaOSFEcJhqBpu6+PukTNJSq/Rh9KVTkwDaAMPccLEDP8n
	 ggKPKDbsBQJBw6QYWRkhUktEksrFHo0fdtw362FffeKyU7xdsBI6ANmqzrtBae1zjQ
	 LAkKs3eCI93sw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-543d8badc30so910057e87.0;
        Thu, 13 Mar 2025 03:18:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWN7ucdDF1mJ9VR0lbIINAHdn1flkdjHjreHfLS6iLBVoIY4MO1lAv/IEQd1rWy8k58yC2co+RE1cB52zfm@vger.kernel.org, AJvYcCWULm4v3p7Sg0w1SwKL1ldpJSeYa39yVt3ayszCIdJHcvqaS5bsaRLry7WugeT8qCRWix+XwhjpUHa6hjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzNWsup8NosY/vN80Y0OJewQ+nkd5+LzbJ7/0FTMFca6p6U416
	r0opxt84uiFIU9pSFN4O/iD+qvkQyU3ptnJ+oYq9BR4zV53JZrYW86wxbomfyZ5eydv2MM3mc7c
	BA+4VrEazcZdzO4ndgAyrvR415Ew=
X-Google-Smtp-Source: AGHT+IHq6Pxry6ZGZaXGGKTZD5Zwxyw3GPMTtp0+b1RPVMC1CiPQCBVU9iDcO+7VZneBYpHoK6uXzY+fg0k0YT26H50=
X-Received: by 2002:a05:6512:ad1:b0:549:8c2a:3b4 with SMTP id
 2adb3069b0e04-54990e5d34dmr8849594e87.13.1741861133701; Thu, 13 Mar 2025
 03:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311110616.148682-9-ardb+git@google.com> <202503131715.Fb6CfjhT-lkp@intel.com>
 <CAMj1kXGBLV6W7mJcELmsQuDUi0u-DofyD985znmVoHoZKZTuxA@mail.gmail.com>
In-Reply-To: <CAMj1kXGBLV6W7mJcELmsQuDUi0u-DofyD985znmVoHoZKZTuxA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 13 Mar 2025 11:18:42 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEZccymq1OhXErSK+prS3L7sygm7_5_1v+j2cypncQuzA@mail.gmail.com>
X-Gm-Features: AQ5f1JrT-4J42j4-vPHU-3Mdj-3dgjCJvLxfurRawm2tNjATHJ-QBthpBHMITpU
Message-ID: <CAMj1kXEZccymq1OhXErSK+prS3L7sygm7_5_1v+j2cypncQuzA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
To: kernel test robot <lkp@intel.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org, x86@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Mar 2025 at 10:34, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 13 Mar 2025 at 10:21, kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Ard,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on masahiroy-kbuild/for-next]
> > [also build test ERROR on masahiroy-kbuild/fixes tip/x86/core s390/features linus/master v6.14-rc6 next-20250312]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/Kbuild-link-vmlinux-sh-Make-output-file-name-configurable/20250311-190926
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> > patch link:    https://lore.kernel.org/r/20250311110616.148682-9-ardb%2Bgit%40google.com
> > patch subject: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with relocations preserved
> > config: x86_64-randconfig-076-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202503131715.Fb6CfjhT-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> gawk: scripts/generate_builtin_ranges.awk:82: fatal: cannot open file `vmlinux.map' for reading: No such file or directory
> >
>
> Hmm it seems I missed some things in link-vmlinux.sh - I will take a look.

We'd need something like the below applied on top - shall I send a v3?

--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -46,6 +46,7 @@

 # Link of vmlinux
 # ${1} - output file
+# ${2} - map file
 vmlinux_link()
 {
        local output=${1}
@@ -99,7 +100,7 @@ vmlinux_link()
        fi

        if is_enabled CONFIG_VMLINUX_MAP; then
-               ldflags="${ldflags} ${wl}-Map=${output}.map"
+               ldflags="${ldflags} ${wl}-Map=${2}"
        fi

        ${ld} ${ldflags} -o ${output}                                   \
@@ -185,7 +186,7 @@
 {
        rm -f .btf.*
        rm -f System.map
-       rm -f vmlinux
+       rm -f ${VMLINUX}
        rm -f vmlinux.map
 }

@@ -224,7 +225,7 @@
                strip_debug=1
        fi

-       vmlinux_link .tmp_vmlinux1
+       vmlinux_link .tmp_vmlinux1 .tmp_vmlinux1.map
 fi

 if is_enabled CONFIG_DEBUG_INFO_BTF; then
@@ -267,19 +268,19 @@
        sysmap_and_kallsyms .tmp_vmlinux1
        size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})

-       vmlinux_link .tmp_vmlinux2
+       vmlinux_link .tmp_vmlinux2 .tmp_vmlinux2.map
        sysmap_and_kallsyms .tmp_vmlinux2
        size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})

        if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
-               vmlinux_link .tmp_vmlinux3
+               vmlinux_link .tmp_vmlinux3 .tmp_vmlinux3.map
                sysmap_and_kallsyms .tmp_vmlinux3
        fi
 fi

 strip_debug=

-vmlinux_link "${VMLINUX}"
+vmlinux_link "${VMLINUX}" vmlinux.map

 # fill in BTF IDs
 if is_enabled CONFIG_DEBUG_INFO_BTF; then

