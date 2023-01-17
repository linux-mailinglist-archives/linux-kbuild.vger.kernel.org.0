Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C13E670C0C
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jan 2023 23:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjAQWsW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Jan 2023 17:48:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbjAQWrA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 17:47:00 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F1A2F7A1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Jan 2023 13:51:32 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id dw9so32372394pjb.5
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Jan 2023 13:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2stNMlcd03sTMLdhKHCy310b+efi08LDuME6CHy47Gs=;
        b=fVkUmtTFZGAJSoRDV4KCMHLse3U+YQCs+whBM3uQpEOJUtXjLLTQ+waV41iAXZecIb
         Kc8bsAn4nTyPF5xzMsXgUroVNnRR9Xf1B+2kWpPVQP3Tu+0AmxD3v3ues4Xgkn8IyU7z
         MhVQVLf7P1Y0k6xyG91d1UxCbLL39pdEFg9cuD7JJsP4K+njY7AJinqn944hnZk99GBs
         68vHpYfzQJixHBUAY9AioJH2k4ycffffxDSGLdijlt+hZnGqAfPv6ljYZ2BgIOZGxVHL
         BmpfMHpdAyMD3DIqq1CDWxhSo2uiSVaMYx7JO1a9cJ+pyhUOxwgseXMCqPn459HeIgxA
         hqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2stNMlcd03sTMLdhKHCy310b+efi08LDuME6CHy47Gs=;
        b=YIk5T1osoLwFxn7hILTSnu2dWSEuRTuQFVXQhEtWoi9ZVhKH0ty0L5Z8ZYdhhkJHoj
         CkhQHfgrptBxjUkAvc9mMwvLwu2D6SlGOJw99vTbRlh2rPshaaULPZ3pP/5TY1ZPQO7b
         CG6F4eisfvXLkVJjKfcJv+XtwbpMuWZA+CAuD1SbPGCsl0tdoero9P2Qw+AK/iCqh4av
         W/gFID2AuDw+msMkZX1elkAL0m9U5JbkjODqLUtQPBBWecWApd/ueBmSfiDg4Siek8AC
         KPmZxyK7+SsHwCO+wmelvJJ/zHL4jZqEFtKPnvdOvxGW9RQFZFAqzcS8l0HCG68RdqO/
         l3jw==
X-Gm-Message-State: AFqh2kqKUAnfstgl+UZXYQeZ7KVI/Zj76NXjJTSstpVHFZ2kiTBOh3b3
        Qa4A5t4XFR6zOBJmU+E5dre99A==
X-Google-Smtp-Source: AMrXdXvi521WMXONarE2w58tGYzOEndhU1uZaaE6il4HHDcSjlB2ldGjuFIcc+CCtgdf1ABr9Jf08Q==
X-Received: by 2002:a17:90a:fd12:b0:226:5758:a57f with SMTP id cv18-20020a17090afd1200b002265758a57fmr2824644pjb.2.1673992291845;
        Tue, 17 Jan 2023 13:51:31 -0800 (PST)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id g11-20020a17090a300b00b0020bfd6586c6sm29685pjb.7.2023.01.17.13.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 13:51:31 -0800 (PST)
Date:   Tue, 17 Jan 2023 13:51:27 -0800
From:   William McVicker <willmcvicker@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, kernel-team@android.com
Subject: Re: modpost warning by default on missing Module.symvers
Message-ID: <Y8cYX4cjV3adqUmX@google.com>
References: <Y7x89C9nAVX98T4g@google.com>
 <CAK7LNASAaqOcLhHLi+fd-b0p=ZTEjCjWAfgZ2=_ShR_0crEQhw@mail.gmail.com>
 <Y72x1rZNo57XnIiv@google.com>
 <CAK7LNAS40TFhrPr+ezproH3ZsBDAK_FcYSEJE4N-uQ93AOwCWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS40TFhrPr+ezproH3ZsBDAK_FcYSEJE4N-uQ93AOwCWw@mail.gmail.com>
X-Spam-Status: No, score=-16.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 01/11/2023, Masahiro Yamada wrote:
> On Wed, Jan 11, 2023 at 3:43 AM William McVicker
> <willmcvicker@google.com> wrote:
> >
> > On 01/10/2023, Masahiro Yamada wrote:
> > > On Tue, Jan 10, 2023 at 5:45 AM William McVicker
> > > <willmcvicker@google.com> wrote:
> > > >
> > > > Hi Masahiro,
> > > >
> > > > I recently noticed that in commit 4475dff55c54 ("kbuild: fix false-positive
> > > > modpost warning when all symbols are trimmed") [1] you modified the modpost
> > > > behavior to always warn (by passing `-w`) when there are missing Module.symver
> > > > files in order to allow module builds to continue building with warnings
> > > > instead of errors. I'm curious why you decided to not continue to rely on
> > > > KBUILD_MODPOST_WARN to enable/disable that functionality?
> > > >
> > > > I personally find it useful to keep these types of warnings as errors in order
> > > > to catch missing dependencies at build time (ideally by the CI build) instead
> > > > of at runtime when a module fails to load due to a missing symbol dependency.
> > > >
> > > > Let me know your thoughts on this and I'll try to come up with a solution to
> > > > factor in any concerns you have.
> > > >
> > > > Thanks,
> > > > Will
> > > >
> > > > [1] https://lore.kernel.org/all/20210325185412.2352951-3-masahiroy@kernel.org/
> > >
> > >
> > >
> > > Good point.
> > >
> > > I think we can always require KBUILD_MODPOST_WARN=1 explicitly.
> > >
> > > Skipping unresolved symbols is not a good idea.
> > > Users can proceed if they want,
> > > but they should be aware of what they are doing, at least.
> > >
> > >
> > > How about something like this?
> > >
> > >
> > >
> > >
> > > diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> > > index 43343e13c542..34baef239816 100644
> > > --- a/scripts/Makefile.modpost
> > > +++ b/scripts/Makefile.modpost
> > > @@ -121,16 +121,14 @@ modpost-args += -e $(addprefix -i ,
> > > $(KBUILD_EXTRA_SYMBOLS))
> > >
> > >  endif # ($(KBUILD_EXTMOD),)
> > >
> > > -ifneq ($(missing-input),)
> > > -modpost-args += -w
> > > -endif
> > > -
> > >  quiet_cmd_modpost = MODPOST $@
> > >        cmd_modpost = \
> > >         $(if $(missing-input), \
> > >                 echo >&2 "WARNING: $(missing-input) is missing."; \
> > >                 echo >&2 "         Modules may not have dependencies
> > > or modversions."; \
> > > -               echo >&2 "         You may get many unresolved symbol
> > > warnings.";) \
> > > +               echo >&2 "         You may get many unresolved symbol
> > > errors.";) \
> > > +               echo >&2 "         You can set KBUILD_MODPOST_WARN=1
> > > to turn errors into warning"; \
> > > +               echo >&2 "         if you know what you are doing."; \
> > >         $(MODPOST) $(modpost-args)
> > >
> > >  targets += $(output-symdump)
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > > --
> > > Best Regards
> > >
> > > Masahiro Yamada
> >
> > That looks good to me! You do mention in [1] that there's a case where
> > unresolved symbols are expected. Can you clarify that? Why would you want to
> > build a kernel or module with unresolved symbols?
> >
> > [1] https://lore.kernel.org/all/20230104140459.1147626-1-masahiroy@kernel.org/
> >
> > Thanks,
> > Will
> 
> 
> 
> What I have in mind is the following cases.
> We cannot check unresolved symbols due to missing vmlinux.
> 
> 
> 
> [1] Build in-tree modules without building vmlinux
> 
>     $ make defconfig
>     $ make modules
> 
> 
>    Perhaps, this is useful for people who are only interested
>    in particular modules, but not the entire kernel?
> 
> 
> [2] Build external modules with minimal setups
> 
>     $ make defconfig
>     $ make modules_prepare
>     $ make M=<path/to/eternal/module>
> 
>    This is useful if people want to compile their modules quicily?
> 
> 
> [3] Build single *.ko
> 
>    $ make defconfig
>    $ make <path/to/a/module>.ko
> 
>    Perhaps, this is useful for people who are only interested
>    in modules they maintain.
> 
> 
> 
> 
> I am not a big fan of any of them, but those have been available
> since before I became the maintainer.
> 
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 
> -- 
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> 

Sorry for the delay in getting back to you.

This sounds good to me. I personally always build my modules with the
vmlinux so that I can detect at build time if there are any issues, e.g.
unresolved symbols. For these 3 cases, would your change require devs to
set KBUILD_MODPOST_WARN=1 if they want to ignore the unresolved symbols
error?

Thanks,
Will

