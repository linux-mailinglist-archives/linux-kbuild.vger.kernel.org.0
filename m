Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D30B636431
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Nov 2022 16:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236692AbiKWPmS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Nov 2022 10:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238925AbiKWPmE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2022 10:42:04 -0500
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6334FC4C16
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2022 07:42:03 -0800 (PST)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 2ANFfeUT021529
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Nov 2022 00:41:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 2ANFfeUT021529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1669218101;
        bh=Pe8I8yUWzr/Q7MPEhIIUhIKuEKa8ANCjuVuo9dAV7KA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=s34WZh+aKf7z1eNupHBABDHmntw4Dch9+WJSsn0daQ3rcQBq+Siyfq+ZJ4b5EDnKm
         WfJpkqnaiJRJWG29Ceyr15FcwR17fwdN9J7ytUeObTGLAKFBHfOr1flXBxDoQQR8jP
         PZkuA7yZhcFAgtx2F/ZeUeLo84fwKwCuJGdgxLoxE/8S7Yc5dMO3vzXPdaaEDsWoHw
         jSkgkjfTWpt1Xcd0dFqHLrfW0G6zt2C+MSZoFSyqQ83cGOSoEMolDsW6kaadqVX0LA
         U2mYbIWUirTUJ2G5DWH7ou4sf020wWL09gbj4vNwI8RuqDJu4CmnbxfhWLSO7L+5CI
         W8geyzEytHJiA==
X-Nifty-SrcIP: [209.85.167.174]
Received: by mail-oi1-f174.google.com with SMTP id m204so19413578oib.6
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2022 07:41:41 -0800 (PST)
X-Gm-Message-State: ANoB5plkIZCv3WE6x0UqgIMF+FTwNbV1HfmAyUYjH5XrLjDTc37Ct+Of
        DkNflmIg15vcS5RCX1Ii1RGKWjaV83+2vEfpDE0=
X-Google-Smtp-Source: AA0mqf5oI5BLHjmItF562/LaQFh8pytJs2Z0zLaF79hg4Sn8WUoXxy0ezLB8UHstPE6YROkawIbwLjuqfuzcaG6jo10=
X-Received: by 2002:aca:1c06:0:b0:354:28ae:23b3 with SMTP id
 c6-20020aca1c06000000b0035428ae23b3mr5804016oic.287.1669218099852; Wed, 23
 Nov 2022 07:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20221123153202.1814324-1-dzickus@redhat.com>
In-Reply-To: <20221123153202.1814324-1-dzickus@redhat.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 24 Nov 2022 00:41:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASW1=P8DKQD=pD8U2B5spTgjdxSOxqh559h-NCehUh5DQ@mail.gmail.com>
Message-ID: <CAK7LNASW1=P8DKQD=pD8U2B5spTgjdxSOxqh559h-NCehUh5DQ@mail.gmail.com>
Subject: Re: [OS-BUILD PATCH] Adding support for distro targets in Makefile
To:     Don Zickus <dzickus@redhat.com>
Cc:     linux-kbuild@vger.kernel.org, jforbes@fedoraproject.org,
        prarit@redhat.com, scweaver@redhat.com, ptalbert@redhat.com,
        herton@redhat.com, jtoppins@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 24, 2022 at 12:32 AM Don Zickus <dzickus@redhat.com> wrote:
>
> Fedora adds a directory to its source git tree to provide packaging
> information[1] specific for its distro.  We would like to propagate our
> 'help' section to the toplevel to be seen by 'make help' as it isn't
> obvious to users to use 'make dist-help'[2].
>
> Instead of keeping Fedora changes local, I am proposing a generic
> mechanism for other distros to use if they would like.  The change looks
> for a distro directory and leverages that Makefile if it exists.
> Otherwise it is ignored.
>
> [1] - https://gitlab.com/cki-project/kernel-ark/-/tree/os-build/redhat
> [2] - https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/redhat/Makefile#L809
>
> Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>
> Signed-off-by: Don Zickus <dzickus@redhat.com>
>
> ----
> This patch is more of a conversation starter than anything.
>
> I think other distros might find this useful and examples of what we would
> populate the directory with can be found in [1].
>
> Thoughts?

I do not like to merge any code that is irrelevant to the upstream.


> ---
>  Makefile | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 6f846b1f2618f..45fdb18dde46f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1635,6 +1635,16 @@ distclean: mrproper
>  %pkg: include/config/kernel.release FORCE
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
>
> +# Distribution of the kernel
> +# ---------------------------------------------------------------------------
> +
> +dist%: FORCE
> +       @if ! test -f $(srctree)/distro/Makefile; then \
> +               echo 'No distribution targets defined'; \
> +               exit 1; \
> +       fi
> +       $(Q)$(MAKE) -C $(srctree)/distro $@
> +
>  # Brief documentation of the typical targets used
>  # ---------------------------------------------------------------------------
>
> @@ -1732,6 +1742,11 @@ help:
>         @echo  ''
>         @echo  'Kernel packaging:'
>         @$(MAKE) -f $(srctree)/scripts/Makefile.package help
> +       @if test -f $(srctree)/distro/Makefile; then \
> +               echo ''; \
> +               echo 'Distro targets:'; \
> +               $(MAKE) -C $(srctree)/distro dist-help; \
> +       fi
>         @echo  ''
>         @echo  'Documentation targets:'
>         @$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
> --
> 2.38.1
>


-- 
Best Regards
Masahiro Yamada
