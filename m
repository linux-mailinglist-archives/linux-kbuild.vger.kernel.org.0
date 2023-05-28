Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1284D713834
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 May 2023 09:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbjE1HBn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 May 2023 03:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjE1HBm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 May 2023 03:01:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E2FDC
        for <linux-kbuild@vger.kernel.org>; Sun, 28 May 2023 00:01:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A240E60BA6
        for <linux-kbuild@vger.kernel.org>; Sun, 28 May 2023 07:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E8DC4339B
        for <linux-kbuild@vger.kernel.org>; Sun, 28 May 2023 07:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685257300;
        bh=nFRvjgEJI8wYrO4y08Sgf1E7M+ZWKLOFf99mFgOiFow=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZRg4ni0KCtsWnzsm4cD+qCveP30kgPelE/wpWpnABMQ+E/sUCPQlvY9G0kzTQxdQ4
         G+k3K1T/Fs9gp8CH3YjhpBB77EhVTlQo8ixb+pw4hafMxBjcLt7UpF0tSkv/ZWbmGf
         gtIVvwev/XyHRHaQ36I8DcwUhyodezTTU6pfiaO6tQlQ92QonlFi9Jd+mpLp8Bf4pG
         5KGLPw8G7a5gQrXpbegBpjpZM0T+fOW7xUeKdoPXkDwjhQToVX01JoazVrtxx9MVJc
         DRyMGFF5Bx5FRXSw248K6X9gweS0igFjjupqJT1aJeZMofsBv3UOUohZolHpAn4NZo
         Axn/NWnsByD6g==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-199dd37f0e4so1975349fac.2
        for <linux-kbuild@vger.kernel.org>; Sun, 28 May 2023 00:01:40 -0700 (PDT)
X-Gm-Message-State: AC+VfDy/DcrUw9+8m4M88R+e4DoaJHBLCYbeJGP3scv6Cz1SOR6HmyGu
        gKr1O5WjygoDUxQI+ymebMktQh1QLBAtNaMPp4M=
X-Google-Smtp-Source: ACHHUZ7E9CRDv4PQTFKd9LASDLqdg9llXmCCe6W4BdyoCyE1Z5j5SPPYEuZtuUtXfCrcOCNKrFi9pkuVc9/XEGqBd4k=
X-Received: by 2002:a05:6870:172c:b0:196:8dc3:4e21 with SMTP id
 h44-20020a056870172c00b001968dc34e21mr2576337oae.41.1685257299300; Sun, 28
 May 2023 00:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <202305280830.Rj5ltc9M-lkp@intel.com>
In-Reply-To: <202305280830.Rj5ltc9M-lkp@intel.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 May 2023 16:01:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQZ6E7N485L=YtKaE9nGuO609i_fgMbXMPdxfW6dfR1qA@mail.gmail.com>
Message-ID: <CAK7LNAQZ6E7N485L=YtKaE9nGuO609i_fgMbXMPdxfW6dfR1qA@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:modpost-v5 23/23] arch/x86/kernel/callthunks.c:45:1:
 sparse: sparse: cast removes address space '__percpu' of expression
To:     kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 28, 2023 at 9:40=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git modpost-v5
> head:   952d644bb57db01d034e1faf94519473fbb1a0a1
> commit: 952d644bb57db01d034e1faf94519473fbb1a0a1 [23/23] kbuild: implemen=
t CONFIG_TRIM_UNUSED_KSYMS without recursion
> config: x86_64-randconfig-s053-20230528 (https://download.01.org/0day-ci/=
archive/20230528/202305280830.Rj5ltc9M-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux=
-kbuild.git/commit/?id=3D952d644bb57db01d034e1faf94519473fbb1a0a1
>         git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/li=
nux/kernel/git/masahiroy/linux-kbuild.git
>         git fetch --no-tags masahiroy-kbuild modpost-v5
>         git checkout 952d644bb57db01d034e1faf94519473fbb1a0a1
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=
=3Dbuild_dir ARCH=3Dx86_64 olddefconfig
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=
=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash arch/x86/kernel/ kernel/trace/=
 lib/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305280830.Rj5ltc9M-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> arch/x86/kernel/callthunks.c:45:1: sparse: sparse: cast removes addres=
s space '__percpu' of expression
>    arch/x86/kernel/callthunks.c:46:1: sparse: sparse: cast removes addres=
s space '__percpu' of expression





Thanks.

This commit is unrelated.

This seems to be a regression of
https://patchwork.kernel.org/project/linux-kbuild/patch/20230521160426.1881=
124-11-masahiroy@kernel.org/

I will squash the following fix-up.


diff --git a/include/linux/export.h b/include/linux/export.h
index 32461a01608c..245ecd342772 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -56,6 +56,7 @@ extern struct module __this_module;
 #else

 #define ___EXPORT_SYMBOL(sym, license, ns)                     \
+       extern typeof(sym) sym;                                 \
        __ADDRESSABLE(sym)                                      \
        asm(__stringify(____EXPORT_SYMBOL(sym, license, ns)))























> vim +/__percpu +45 arch/x86/kernel/callthunks.c
>
> e81dc127ef6988 Thomas Gleixner 2022-09-15  39
> f5c1bb2afe9339 Thomas Gleixner 2022-09-15  40  #ifdef CONFIG_CALL_THUNKS_=
DEBUG
> f5c1bb2afe9339 Thomas Gleixner 2022-09-15  41  DEFINE_PER_CPU(u64, __x86_=
call_count);
> f5c1bb2afe9339 Thomas Gleixner 2022-09-15  42  DEFINE_PER_CPU(u64, __x86_=
ret_count);
> f5c1bb2afe9339 Thomas Gleixner 2022-09-15  43  DEFINE_PER_CPU(u64, __x86_=
stuffs_count);
> f5c1bb2afe9339 Thomas Gleixner 2022-09-15  44  DEFINE_PER_CPU(u64, __x86_=
ctxsw_count);
> f5c1bb2afe9339 Thomas Gleixner 2022-09-15 @45  EXPORT_SYMBOL_GPL(__x86_ct=
xsw_count);
> f5c1bb2afe9339 Thomas Gleixner 2022-09-15  46  EXPORT_SYMBOL_GPL(__x86_ca=
ll_count);
> f5c1bb2afe9339 Thomas Gleixner 2022-09-15  47  #endif
> f5c1bb2afe9339 Thomas Gleixner 2022-09-15  48
>
> :::::: The code at line 45 was first introduced by commit
> :::::: f5c1bb2afe93396d41c5cbdcb909b08a75b8dde4 x86/calldepth: Add ret/ca=
ll counting for debug
>
> :::::: TO: Thomas Gleixner <tglx@linutronix.de>
> :::::: CC: Peter Zijlstra <peterz@infradead.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Best Regards
Masahiro Yamada
