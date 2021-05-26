Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D1C392179
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 22:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhEZUaA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 16:30:00 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52592 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbhEZUaA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 16:30:00 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 581A61FD2A;
        Wed, 26 May 2021 20:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622060907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fRjKeo3mtIKPOow1iS/LCdTM3sotH5MsBH/Cg0l0qmY=;
        b=oTxw1b4FsB1u5hX3UnFMroP3Ha3Wt0eOBG0DwdfSfAKWKfXL8BFitt4IyrUavzHjp9ijRD
        Y5/9dcjLZzvpip9Zw4v1T0K6Wb9W9yBWjePTbMUOeJTfyIU5OcIRMqsRWhlyIGfPOtgN1i
        pBybavChJV2XPs2gdyVflD9cgiZjgWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622060907;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fRjKeo3mtIKPOow1iS/LCdTM3sotH5MsBH/Cg0l0qmY=;
        b=hDe2RguBEm6J7HQ1WCSmUFfMo9X/GCZaVx1g95lWat3gP197d/wFfXR5C42ubPzgJ3Tw+V
        9zzu3o9oE7zVETCA==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
        by imap.suse.de (Postfix) with ESMTPSA id 3878411A98;
        Wed, 26 May 2021 20:28:27 +0000 (UTC)
Date:   Wed, 26 May 2021 22:28:26 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "kbuild: merge scripts/mkmakefile to top Makefile"
Message-ID: <20210526202825.GB8544@kitsune.suse.cz>
References: <20210526173855.5963-1-msuchanek@suse.de>
 <CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 27, 2021 at 03:56:41AM +0900, Masahiro Yamada wrote:
> On Thu, May 27, 2021 at 2:39 AM Michal Suchanek <msuchanek@suse.de> wrote:
> >
> > This reverts commit 243b50c141d71fcf7b88e94474b3b9269f0b1f9d.
> >
> > When packaging the kernel it is built in different place from the one in
> > which it will be installed. After build the makefile needs to be
> > regenerated with the target location but with mkmakefile merged into
> > Makefile tehre is no way to do that.
> >
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> 
> My patch was not working as expected
> regardless of packaging.
> 
> Does the following fix-up work for you?

For the packaging I need some way to regenerate the Makefile and fake
the directory where the Makefile will be on the user system (ie DESTDIR)

Without the mkmakefile I do not see any way to do it.

If the kernel makefile is no longer location dependent there is no need
any more, of course.

Thanks

Michal
> 
> 
> diff --git a/Makefile b/Makefile
> index 54bb019a7da3..504327207d66 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -552,16 +552,13 @@ ifdef building_out_of_srctree
>  # At the same time when output Makefile generated, generate .gitignore to
>  # ignore whole output directory
> 
> -quiet_cmd_makefile = GEN     $@
> +quiet_cmd_makefile = GEN     Makefile
>        cmd_makefile = { \
>         echo "\# Automatically generated by $(srctree)/Makefile: don't edit"; \
>         echo "include $(srctree)/Makefile"; \
> -       } > $@
> +       } > Makefile
> 
> -Makefile: FORCE
> -       $(call cmd,makefile)
> -
> -outputmakefile: Makefile
> +outputmakefile:
>         $(Q)if [ -f $(srctree)/.config -o \
>                  -d $(srctree)/include/config -o \
>                  -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
> @@ -572,6 +569,7 @@ outputmakefile: Makefile
>                 false; \
>         fi
>         $(Q)ln -fsn $(srctree) source
> +       $(call cmd,makefile)
>         $(Q)test -e .gitignore || \
>         { echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
>  endif
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> > ---
> >  Makefile           | 15 +++------------
> >  scripts/mkmakefile | 17 +++++++++++++++++
> >  2 files changed, 20 insertions(+), 12 deletions(-)
> >  create mode 100755 scripts/mkmakefile
> >
> > diff --git a/Makefile b/Makefile
> > index 58b086b30144..462899c1b5d7 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -573,24 +573,14 @@ scripts_basic:
> >         $(Q)rm -f .tmp_quiet_recordmcount
> >
> >  PHONY += outputmakefile
> > -ifdef building_out_of_srctree
> >  # Before starting out-of-tree build, make sure the source tree is clean.
> >  # outputmakefile generates a Makefile in the output directory, if using a
> >  # separate output directory. This allows convenient use of make in the
> >  # output directory.
> >  # At the same time when output Makefile generated, generate .gitignore to
> >  # ignore whole output directory
> > -
> > -quiet_cmd_makefile = GEN     $@
> > -      cmd_makefile = { \
> > -       echo "\# Automatically generated by $(srctree)/Makefile: don't edit"; \
> > -       echo "include $(srctree)/Makefile"; \
> > -       } > $@
> > -
> > -Makefile: FORCE
> > -       $(call cmd,makefile)
> > -
> > -outputmakefile: Makefile
> > +outputmakefile:
> > +ifdef building_out_of_srctree
> >         $(Q)if [ -f $(srctree)/.config -o \
> >                  -d $(srctree)/include/config -o \
> >                  -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
> > @@ -601,6 +591,7 @@ outputmakefile: Makefile
> >                 false; \
> >         fi
> >         $(Q)ln -fsn $(srctree) source
> > +       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
> >         $(Q)test -e .gitignore || \
> >         { echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
> >  endif
> > diff --git a/scripts/mkmakefile b/scripts/mkmakefile
> > new file mode 100755
> > index 000000000000..1cb174751429
> > --- /dev/null
> > +++ b/scripts/mkmakefile
> > @@ -0,0 +1,17 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +# Generates a small Makefile used in the root of the output
> > +# directory, to allow make to be started from there.
> > +# The Makefile also allow for more convinient build of external modules
> > +
> > +# Usage
> > +# $1 - Kernel src directory
> > +
> > +if [ "${quiet}" != "silent_" ]; then
> > +       echo "  GEN     Makefile"
> > +fi
> > +
> > +cat << EOF > Makefile
> > +# Automatically generated by $0: don't edit
> > +include $1/Makefile
> > +EOF
> > --
> > 2.26.2
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
