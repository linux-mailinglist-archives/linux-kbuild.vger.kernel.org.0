Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A06EB6653E6
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jan 2023 06:41:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbjAKFkn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 00:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235944AbjAKFiz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 00:38:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3BCEE3C
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2023 21:35:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D94F1619F7
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 05:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD52C433F0
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 05:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673415306;
        bh=U9+2yEzXFypOxtBWnnT0iGEmHFCEFeTxwTDi7rQDdFk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RFfaR9mnOtPeRJhHnoZgA2Eo/b+KJRRuUVYJFK8M+nJzYcgG11Hos4IAqMT1ytRDj
         ly8DYztjVf5PP22Rnh8SG0bvmOg1NOpYAw9RGoWVqOlmubLnsdfStPUTMZKWkhTvAz
         jUbYPtlPK9NbC1LaEbQ70GnPacPggOeQNo68PPendYmSduhOa1ltoNG62k0+evWK94
         iU2tGWyu9pzF4a2xQdgdX2Aia8N8MzxYoPAEW0T5tIJQ9Bk1DGrcKLwhRgLsug0kGq
         GOSFi8uMu+lnWpw1rJ6RUZuxXDgDrLDpBq+vJx1+qSYQnD/TZlZ/7jtYZaLI1O/80D
         jAt/cvnt6l+tQ==
Received: by mail-ot1-f46.google.com with SMTP id y18-20020a0568301d9200b0067082cd4679so8257950oti.4
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2023 21:35:06 -0800 (PST)
X-Gm-Message-State: AFqh2kquHU6wBEHO8gKIbszvoXZVcRFVg+9PPjpYGZOV+wvsspQitl4C
        j/syFsH9fpPnIVCQuj8jtdMC7vfockjOR+C8F1U=
X-Google-Smtp-Source: AMrXdXsAS9YXu1AFQ+IYiiooKkDW2+9Em5c4u8guFFTiaDnXAtXH4LPMC3h5dzCE9zf9VA82fk/m+Pe/wv64TIjVmmU=
X-Received: by 2002:a05:6830:14c7:b0:684:a3ad:87e8 with SMTP id
 t7-20020a05683014c700b00684a3ad87e8mr253590otq.225.1673415305465; Tue, 10 Jan
 2023 21:35:05 -0800 (PST)
MIME-Version: 1.0
References: <Y7x89C9nAVX98T4g@google.com> <CAK7LNASAaqOcLhHLi+fd-b0p=ZTEjCjWAfgZ2=_ShR_0crEQhw@mail.gmail.com>
 <Y72x1rZNo57XnIiv@google.com>
In-Reply-To: <Y72x1rZNo57XnIiv@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 11 Jan 2023 14:34:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS40TFhrPr+ezproH3ZsBDAK_FcYSEJE4N-uQ93AOwCWw@mail.gmail.com>
Message-ID: <CAK7LNAS40TFhrPr+ezproH3ZsBDAK_FcYSEJE4N-uQ93AOwCWw@mail.gmail.com>
Subject: Re: modpost warning by default on missing Module.symvers
To:     William McVicker <willmcvicker@google.com>
Cc:     linux-kbuild@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 11, 2023 at 3:43 AM William McVicker
<willmcvicker@google.com> wrote:
>
> On 01/10/2023, Masahiro Yamada wrote:
> > On Tue, Jan 10, 2023 at 5:45 AM William McVicker
> > <willmcvicker@google.com> wrote:
> > >
> > > Hi Masahiro,
> > >
> > > I recently noticed that in commit 4475dff55c54 ("kbuild: fix false-positive
> > > modpost warning when all symbols are trimmed") [1] you modified the modpost
> > > behavior to always warn (by passing `-w`) when there are missing Module.symver
> > > files in order to allow module builds to continue building with warnings
> > > instead of errors. I'm curious why you decided to not continue to rely on
> > > KBUILD_MODPOST_WARN to enable/disable that functionality?
> > >
> > > I personally find it useful to keep these types of warnings as errors in order
> > > to catch missing dependencies at build time (ideally by the CI build) instead
> > > of at runtime when a module fails to load due to a missing symbol dependency.
> > >
> > > Let me know your thoughts on this and I'll try to come up with a solution to
> > > factor in any concerns you have.
> > >
> > > Thanks,
> > > Will
> > >
> > > [1] https://lore.kernel.org/all/20210325185412.2352951-3-masahiroy@kernel.org/
> >
> >
> >
> > Good point.
> >
> > I think we can always require KBUILD_MODPOST_WARN=1 explicitly.
> >
> > Skipping unresolved symbols is not a good idea.
> > Users can proceed if they want,
> > but they should be aware of what they are doing, at least.
> >
> >
> > How about something like this?
> >
> >
> >
> >
> > diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> > index 43343e13c542..34baef239816 100644
> > --- a/scripts/Makefile.modpost
> > +++ b/scripts/Makefile.modpost
> > @@ -121,16 +121,14 @@ modpost-args += -e $(addprefix -i ,
> > $(KBUILD_EXTRA_SYMBOLS))
> >
> >  endif # ($(KBUILD_EXTMOD),)
> >
> > -ifneq ($(missing-input),)
> > -modpost-args += -w
> > -endif
> > -
> >  quiet_cmd_modpost = MODPOST $@
> >        cmd_modpost = \
> >         $(if $(missing-input), \
> >                 echo >&2 "WARNING: $(missing-input) is missing."; \
> >                 echo >&2 "         Modules may not have dependencies
> > or modversions."; \
> > -               echo >&2 "         You may get many unresolved symbol
> > warnings.";) \
> > +               echo >&2 "         You may get many unresolved symbol
> > errors.";) \
> > +               echo >&2 "         You can set KBUILD_MODPOST_WARN=1
> > to turn errors into warning"; \
> > +               echo >&2 "         if you know what you are doing."; \
> >         $(MODPOST) $(modpost-args)
> >
> >  targets += $(output-symdump)
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > --
> > Best Regards
> >
> > Masahiro Yamada
>
> That looks good to me! You do mention in [1] that there's a case where
> unresolved symbols are expected. Can you clarify that? Why would you want to
> build a kernel or module with unresolved symbols?
>
> [1] https://lore.kernel.org/all/20230104140459.1147626-1-masahiroy@kernel.org/
>
> Thanks,
> Will



What I have in mind is the following cases.
We cannot check unresolved symbols due to missing vmlinux.



[1] Build in-tree modules without building vmlinux

    $ make defconfig
    $ make modules


   Perhaps, this is useful for people who are only interested
   in particular modules, but not the entire kernel?


[2] Build external modules with minimal setups

    $ make defconfig
    $ make modules_prepare
    $ make M=<path/to/eternal/module>

   This is useful if people want to compile their modules quicily?


[3] Build single *.ko

   $ make defconfig
   $ make <path/to/a/module>.ko

   Perhaps, this is useful for people who are only interested
   in modules they maintain.




I am not a big fan of any of them, but those have been available
since before I became the maintainer.




-- 
Best Regards
Masahiro Yamada
