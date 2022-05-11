Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE24523CD6
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 May 2022 20:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345025AbiEKSsM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 May 2022 14:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346479AbiEKSsL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 May 2022 14:48:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816361AB808
        for <linux-kbuild@vger.kernel.org>; Wed, 11 May 2022 11:48:09 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bq30so5155526lfb.3
        for <linux-kbuild@vger.kernel.org>; Wed, 11 May 2022 11:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LjOBAquXwgrrgXm8VNOmvziGW6n+WunCBS4qV3JJbEM=;
        b=cA8UQtFoVUliUtfWSv912J6B0ub0HcxW8gmIXite+joZhlMbpeCS+bUAZWYfMzZ8Xa
         G/fJOfLTcngtIL8G90CQr+73lLbCL1AHxsh2R+qmJrgmJRTCuyNKXj7cliEo28pPuXQj
         6w3VaEUFPmnSDKtF91NPiV/sgjc8ZRv71y4uYb9hxeHwZUr5je/pDiqFgm2aSZ7bIISf
         /1UJjBBsIPYSlsXi1kwAQ99jbSUPR+9P2r7SaKBX1wGFQEJXaWfpYonbpRKCQDD6CxUK
         Dp+b87CVNCLP2zVCceaShTI1HSRNKEIjVASMSKh/ElRg8CR6aP+J3pZQ1S3J5UZUSIaH
         1EZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LjOBAquXwgrrgXm8VNOmvziGW6n+WunCBS4qV3JJbEM=;
        b=PU5Tevkwo6RHC84MvAVOx2gHjipbBIWqNEIfI7QywTIETEoLsv2q4pNUrkeeBpbNA2
         +a9Z9WF/0VDzpH5pwwNwcQQ6qKR0q/2ubCh4VF/taCqwmlfzwF8as0qAW/KK+VksL9bE
         ozMY0fOIZrP41QpnIedrL7jqaQHnnwgS3TJq5kTzj0QJSfL+MXUfQJQ4XtaI1sIERkK5
         0YaIW3VWjt30ilKqP8sWANAOSgMPW92tH2ExhvBPpsh843wTO34tU9TnVBfXQ7oBOkQO
         MDPOMRaHdG5mMrUVer9gwLLlnBxJR8v3wIVsN90qqMngMQzwyURRUxflfpjWIwd6xLkV
         exhQ==
X-Gm-Message-State: AOAM533aD//yfJ0deCJXDuMLFBy6xl/gSLW9WTnmT9ktaCpXPxK4rEtl
        XDITj9QfQ16ZksGanmGCevpAzv5rjqNHgPPS184tsw==
X-Google-Smtp-Source: ABdhPJwORYNYs+f4SpR17x+QtOIu9Uo6dxlRowGZd30bvV7AXP2VnNh+RNLxsgttKR9yFrJ+aoveRa6JaxEnp5h+sgs=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr20624164lfp.392.1652294887500; Wed, 11
 May 2022 11:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-4-masahiroy@kernel.org> <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
 <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
In-Reply-To: <CAK7LNARGNEDzPPUsPjDXsXUUUPSFK2erQRuyPocR_v5hTYRihg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 11 May 2022 11:47:56 -0700
Message-ID: <CAKwvOdmK4oH0t8Q6F19sWKX1fT=AgS=kfvn05FT01HffLJwgMQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] modpost: split the section mismatch checks into section-check.c
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 9, 2022 at 11:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index a78b75f0eeb0..e7e2c70a98f5 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -31,7 +31,7 @@ static bool external_module;
> > >  /* Only warn about unresolved symbols */
> > >  static bool warn_unresolved;
> > >
> > > -static int sec_mismatch_count;
> > > +int sec_mismatch_count;
> >
> > ^ this should go in modpost.h if it is to be used in two translation
> > units, rather than forward declaring it in section-check.c.  You did
> > this for the functions.
>
>
> Sorry, I do not understand.
>
>
> In modpost.h, I put the declaration:
>
>   extern int sec_mismatch_count;
>
> If I moved it to the header without 'extern'
> I would get multiple definitions.

Yeah, you need to _declare_ it w/ extern in the header, then _define_
it in one source file.

That way, if the type ever changes, the sources will agree on type in
all source files. You will get a redefinition error if the definition
changes the type of the variable since the last declaration.

What you're doing is forward declaring, which works, and is a common
pattern for (bloated) C++, but is less type safe than sharing a single
common declaration between multiple source files via a single common
shared header. (Sorry I didn't respond before you sent v5)
-- 
Thanks,
~Nick Desaulniers
