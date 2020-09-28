Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B9527ACB5
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Sep 2020 13:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgI1L3g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Sep 2020 07:29:36 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:26180 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1L3f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Sep 2020 07:29:35 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 08SBTIZo006002;
        Mon, 28 Sep 2020 20:29:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 08SBTIZo006002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1601292558;
        bh=dAHDBKnRo5H4VGCubh2JayTblFUcU7x9zWqqFA0TefA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2EtzaCpQrm1yeFzUFwHnLucZZxcz645G+8YEnqQefxrjPkswsiBZwGiJdLjpC7DXW
         BU/GlUyc0zpFaQRKXKXd4cVkGpChF36vvwjMlGB4pWYlinLacBwvhJce5RJNI5EqFq
         SDKKr/A56jAz47X7YCBKp35hMJ4h3ivsLokkgDGE7lfy2IlhoZ8EYYB4NfwuMrYE7s
         XdrT0DRG2C1VM+vglc+L4blA45K6iAXjJNRcmDkbw/aFfxnc3OQ5dNpIjRIqIPudtB
         djv6wjf7F1nMEvwZU5hbSRRzALRp8dMSIiAEkuSvFVcVibjJbEx1hCBlLCrxTtdgx2
         zExuVYr/sccHw==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id s14so2097185pju.1;
        Mon, 28 Sep 2020 04:29:18 -0700 (PDT)
X-Gm-Message-State: AOAM531TCrhi5dP06evEdwueDpRQtb3V/pKszeIXTOpxSsaXrqZhh4GN
        EFh4qwPAMie+otk4jjNXqN9M/6pKvlurTv9rfJk=
X-Google-Smtp-Source: ABdhPJzWqDhdIsNJPkJ596mhZG9tc0uVp7T+xNkSujcLvuLMJSbxUCJxqXGZMVSxYGaXZ4YTc0g3cZsfccjUKkTS1b4=
X-Received: by 2002:a17:90b:1211:: with SMTP id gl17mr947942pjb.87.1601292557471;
 Mon, 28 Sep 2020 04:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200928064244.29206-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200928064244.29206-1-lukas.bulwahn@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 28 Sep 2020 20:28:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com>
Message-ID: <CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com>
Subject: Re: [PATCH RFC] kbuild: doc: describe proper script invocation
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 28, 2020 at 3:42 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> During an investigation to fix up the execute bits of scripts in the kernel
> repository, Andrew Morton and Kees Cook pointed out that the execute bit
> should not matter, and that build scripts cannot rely on that. Kees could
> not point to any documentation, though.
>
> Provide some basic documentation how the build shall invoke scripts, such
> that the execute bits do not matter.
>
> This serves as reference for further clean-up patches in the future.


For scripts run by users directly, the executable bit
should be set. (e.g. scripts/checkpatch.pl)


For scripts invoked from the build system, the
convention is to use interpreters such as
$(CONFIG_SHELL), and we do not need to set
the executable bit. But, we often set the executable bit
for this case, too.


This convention started from the following commit, which
was made by the previous kbuild maintainer.



commit 06ed5c2bfacaf67039e87a213fa5d1cdde34246a
Author: Michal Marek <mmarek@suse.cz>
Date:   Wed Aug 20 16:02:59 2014 +0200

    kbuild: Make scripts executable

    The Makefiles call the respective interpreter explicitly, but this makes
    it easier to use the scripts manually.

    Signed-off-by: Michal Marek <mmarek@suse.cz>








> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20200925 and v5.9-rc7
>
> Kees, Andrew, please ack.
>
> Masahiro-san, please pick this small documentation update into your kbuild tree.
>
> Ujjwal Kumar, a potential future mentee, will follow up with further fixes to
> the build scripts.
>
>  Documentation/kbuild/makefiles.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 58d513a0fa95..9d0d198adb7e 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -21,6 +21,7 @@ This document describes the Linux kernel Makefiles.
>            --- 3.10 Special Rules
>            --- 3.11 $(CC) support functions
>            --- 3.12 $(LD) support functions
> +          --- 3.13 Script Invocation
>
>         === 4 Host Program support
>            --- 4.1 Simple Host Program
> @@ -605,6 +606,23 @@ more details, with real examples.
>                 #Makefile
>                 LDFLAGS_vmlinux += $(call ld-option, -X)
>
> +3.13 Script invocation
> +----------------------
> +
> +       Make rules may invoke scripts to build the kernel. The rules shall
> +       always provide the appropriate interpreter to execute the script. They
> +       shall not rely on the execute bits being set, and shall not invoke the
> +       script directly.
> +
> +       Kbuild provides variables $(CONFIG_SHELL), $(AWK), $(PERL),
> +       $(PYTHON) and $(PYTHON3) to refer to interpreters for the respective
> +       scripts.
> +
> +       Example::
> +
> +               #Makefile
> +               cmd_depmod = $(CONFIG_SHELL) $(srctree)/scripts/depmod.sh $(DEPMOD) \
> +                            $(KERNELRELEASE)
>
>  4 Host Program support
>  ======================
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
