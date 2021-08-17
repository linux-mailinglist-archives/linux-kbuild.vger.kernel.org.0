Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDAB3EF172
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 20:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhHQSKF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 14:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232948AbhHQSIb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 14:08:31 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE5CC061764
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 11:07:58 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id t9so43025419lfc.6
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 11:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K3Ka4koAuO/eyWNzbf7wpZBKsg+7E2Iw97vQbCYohS0=;
        b=NKdK8us0UjF2ppRMH86hdVaNueUfnMBvVo0xnUJrja01i7RDrT+fQkYMpzDYTDWH1r
         tOhyqLud6C5Jbi1f2+ze6/nGP4+XH+hUrEoPYtCZBVdAQ8TQCUIgwe3CQ1a5Tszldu1N
         Vxnnt1qCx7DgsYm68Do9wIUFzF+LFRScwdKcxkj+7rAPI88iIffQuwlpZXkr2LGBTH2J
         5FtOispkpA5ky6OrkrZv3CavGXNnJ5ijzKKwAyV0YM4q1uZARsR3vxX73p4X6RRnGGfo
         vXvqf6VEkUHT5TRk+JvxFP0dXko+A9GmBZdoKJ+n8ky4UDkxIgSKkqo6SJgLb3DqRn5y
         27Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K3Ka4koAuO/eyWNzbf7wpZBKsg+7E2Iw97vQbCYohS0=;
        b=EsWGpvqCEFJ/hdiQvEYirb2ri79yyEy2gDcLCg2EIFNAOJ+4pGL9HmaqAsTr4x37Qz
         GiyGUf+GZLjziDI67Gem9eZnzR+PeYHOwahzE5WpSWVcFEhJwDQvj256PbJDnOqb1XZc
         gWrYdCs6uroMrfoJfjPkveyc9jaLPaQ2t3Tpp3DR6T9JT4GuN/3MOGoK+IY+r/w/ezfs
         ebWNVVx2EYveIS6H/ntQM2QAEohkN1CF56bOf6vIXBAO3r/pKTcO8OM5da/v9GUPClm8
         wNAAAHjlsKSwbqWnsq+mtJbfJzNPh/sVSU/xHJ2z2ots4/nqFfNMavvEgKpdwRarPSwA
         CetQ==
X-Gm-Message-State: AOAM532LFAfdwPvKgCxZytTtNQu4koNneURro+kak6Dsw8ciwN/sHIbn
        lDXNq8tAA3tHSbAVOQVoCKfeFpUDQjs4SK/e8ULoSA==
X-Google-Smtp-Source: ABdhPJyRD0Yu6Wccx8j1XxfX9A1nXqv/eybdNeKph2H0pBv/4jnbGUXJS9WI64EHG2MCCnyNynl1F6KGtDwIke3gOMA=
X-Received: by 2002:a05:6512:3041:: with SMTP id b1mr3246042lfb.122.1629223676223;
 Tue, 17 Aug 2021 11:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-5-ndesaulniers@google.com> <bc8cf0be-9e51-e769-0685-2594802eead0@kernel.org>
In-Reply-To: <bc8cf0be-9e51-e769-0685-2594802eead0@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 17 Aug 2021 11:07:45 -0700
Message-ID: <CAKwvOdkO3ax7gN-n5OJO7-320BVK+B-JDs0v=3vZs9fPezwjDg@mail.gmail.com>
Subject: Re: [PATCH 4/7] arc: replace cc-option-yn uses with cc-option
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Vineet Gupta <vgupta@kernel.org>,
        linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 16, 2021 at 7:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> > cc-option-yn can be replaced with cc-option. ie.
> > Checking for support:
> > ifeq ($(call cc-option-yn,$(FLAG)),y)
> > becomes:
> > ifneq ($(call cc-option,$(FLAG)),)
> >
> > Checking for lack of support:
> > ifeq ($(call cc-option-yn,$(FLAG)),n)
> > becomes:
> > ifeq ($(call cc-option,$(FLAG)),)
> >
> > This allows us to pursue removing cc-option-yn.
> >
> > Cc: Vineet Gupta <vgupta@kernel.org>
> > Cc: linux-snps-arc@lists.infradead.org
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >   arch/arc/Makefile | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> > index c0d87ac2e221..8782a03f24a8 100644
> > --- a/arch/arc/Makefile
> > +++ b/arch/arc/Makefile
> > @@ -18,8 +18,7 @@ ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
> >   cflags-y                            += $(tune-mcpu-def-y)
> >   else
> >   tune-mcpu                           := $(shell echo $(CONFIG_ARC_TUNE_MCPU))
> > -tune-mcpu-ok                                 := $(call cc-option-yn, $(tune-mcpu))
> > -ifeq ($(tune-mcpu-ok),y)
> > +ifneq ($(call cc-option,$(tune-mcpu)),)
> >   cflags-y                            += $(tune-mcpu)
>
> Any reason not to just turn this into
>
> cflags-y += $(call cc-option,$(tune-mcpu))
>
> ?

Yes, you'll need to pull up the source; the diff doesn't provide
enough context. tune-mcpu is used in the body of the else branch
hinted at by the diff. PTAL

>
> If $(tune-mcpu) is empty or invalid, nothing will be added to cflags-y.
>
> >   else
> >   # The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
> >



-- 
Thanks,
~Nick Desaulniers
