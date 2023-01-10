Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2382C664B94
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Jan 2023 19:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239174AbjAJSvK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Jan 2023 13:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239675AbjAJSuS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jan 2023 13:50:18 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6AB953280
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2023 10:43:39 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id l1-20020a17090a384100b00226f05b9595so12451675pjf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Jan 2023 10:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O0O9gIWn1O+ZBxObTvRWB+PPEVkWWcopfOLEqiaTl1o=;
        b=ZAf4n0HP3WuOing1LJ9gzhDmWRYAglh7/Hmey8b3TzmFYhqazZmzMi+lck39S5qq71
         DRItXIbegCi4OYZatvH+YTj0vq1WCg4ejgEJgHDE0QdBgjxCnQkOIQAMA9FObGrp6uhi
         M0DSR06r7eUPYEF3dzgELyh10NspprA8Q/sy6a1BrGlovbBn7lU5PrsZW+umkOB62w4l
         lH+StdFpVxTTGGv5760aNNLRXIuOuQwBWUkSK7vPLrlGJ2z81BB+nzcr5q83zlweJ56o
         ONVCDIP7+tqprFaYOV23qoD1mBEttQyFrcc3lUxa1SJrOT/gWGCjlion03EjWkFXOe62
         gKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0O9gIWn1O+ZBxObTvRWB+PPEVkWWcopfOLEqiaTl1o=;
        b=x9Qi5GkXwRN0GUy/x9138zV1M03V2os8wXW+Ofd1ebnnrbyEl/yFjzLxTVAIhKnXbo
         uRBjmINgT2JABiueksxJ7/bUhbo2fqpiVephbDH0YHTgrViMlFiIEJvTP//EuNqzBHGf
         j8zWosmP+tyjEbMkiMePcCGMVwulwJ67xIw/ZN41G5f2xshB/ddz4XpCJ5PtyxNUZ7ob
         mxwMc9OYXiKvoutD5HQlpEgmpgRn95E8DRwTKB1IF3plmdvvChQ0m//VWedma9K3BDlu
         GWM24Wn3Wxhj/Snxfx0SdqM9JhrNeefGpZIXfyq7GrMQ09BKPd7/hnbAJpQsQsAJ/mi5
         ZgfQ==
X-Gm-Message-State: AFqh2krm1lI0oQEYqA3QwPdP7wy1KgFFoM6tJzOw4jzSd/6jC5ulXdIv
        Y/JMe5QOCA5pi6VYK4lrPjaimw==
X-Google-Smtp-Source: AMrXdXvjijRBkOUbN8mcOyfB5i4dIw7T74SSZp/ILcwJvC0pEGPN9J5cKOqQAOegx4h6fmT70CWOOg==
X-Received: by 2002:a05:6a20:a883:b0:a4:efde:2ed8 with SMTP id ca3-20020a056a20a88300b000a4efde2ed8mr100945pzb.0.1673376218855;
        Tue, 10 Jan 2023 10:43:38 -0800 (PST)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id t20-20020aa79474000000b005636326fdbfsm8427484pfq.78.2023.01.10.10.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 10:43:38 -0800 (PST)
Date:   Tue, 10 Jan 2023 10:43:34 -0800
From:   William McVicker <willmcvicker@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, kernel-team@android.com
Subject: Re: modpost warning by default on missing Module.symvers
Message-ID: <Y72x1rZNo57XnIiv@google.com>
References: <Y7x89C9nAVX98T4g@google.com>
 <CAK7LNASAaqOcLhHLi+fd-b0p=ZTEjCjWAfgZ2=_ShR_0crEQhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASAaqOcLhHLi+fd-b0p=ZTEjCjWAfgZ2=_ShR_0crEQhw@mail.gmail.com>
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

On 01/10/2023, Masahiro Yamada wrote:
> On Tue, Jan 10, 2023 at 5:45 AM William McVicker
> <willmcvicker@google.com> wrote:
> >
> > Hi Masahiro,
> >
> > I recently noticed that in commit 4475dff55c54 ("kbuild: fix false-positive
> > modpost warning when all symbols are trimmed") [1] you modified the modpost
> > behavior to always warn (by passing `-w`) when there are missing Module.symver
> > files in order to allow module builds to continue building with warnings
> > instead of errors. I'm curious why you decided to not continue to rely on
> > KBUILD_MODPOST_WARN to enable/disable that functionality?
> >
> > I personally find it useful to keep these types of warnings as errors in order
> > to catch missing dependencies at build time (ideally by the CI build) instead
> > of at runtime when a module fails to load due to a missing symbol dependency.
> >
> > Let me know your thoughts on this and I'll try to come up with a solution to
> > factor in any concerns you have.
> >
> > Thanks,
> > Will
> >
> > [1] https://lore.kernel.org/all/20210325185412.2352951-3-masahiroy@kernel.org/
> 
> 
> 
> Good point.
> 
> I think we can always require KBUILD_MODPOST_WARN=1 explicitly.
> 
> Skipping unresolved symbols is not a good idea.
> Users can proceed if they want,
> but they should be aware of what they are doing, at least.
> 
> 
> How about something like this?
> 
> 
> 
> 
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 43343e13c542..34baef239816 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -121,16 +121,14 @@ modpost-args += -e $(addprefix -i ,
> $(KBUILD_EXTRA_SYMBOLS))
> 
>  endif # ($(KBUILD_EXTMOD),)
> 
> -ifneq ($(missing-input),)
> -modpost-args += -w
> -endif
> -
>  quiet_cmd_modpost = MODPOST $@
>        cmd_modpost = \
>         $(if $(missing-input), \
>                 echo >&2 "WARNING: $(missing-input) is missing."; \
>                 echo >&2 "         Modules may not have dependencies
> or modversions."; \
> -               echo >&2 "         You may get many unresolved symbol
> warnings.";) \
> +               echo >&2 "         You may get many unresolved symbol
> errors.";) \
> +               echo >&2 "         You can set KBUILD_MODPOST_WARN=1
> to turn errors into warning"; \
> +               echo >&2 "         if you know what you are doing."; \
>         $(MODPOST) $(modpost-args)
> 
>  targets += $(output-symdump)
> 
> 
> 
> 
> 
> 
> 
> 
> 
> --
> Best Regards
> 
> Masahiro Yamada

That looks good to me! You do mention in [1] that there's a case where
unresolved symbols are expected. Can you clarify that? Why would you want to
build a kernel or module with unresolved symbols?

[1] https://lore.kernel.org/all/20230104140459.1147626-1-masahiroy@kernel.org/

Thanks,
Will
