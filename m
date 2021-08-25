Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 179453F6E81
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Aug 2021 06:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbhHYEjy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 00:39:54 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:18847 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhHYEjy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 00:39:54 -0400
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17P4chLW020518
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 13:38:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17P4chLW020518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629866323;
        bh=ghMeldz2FSJgsGbHpb2xXDwEpCxBtlcCW3CPZ3H7dro=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HkNK6/PmNTNJWuhaCzJNB+fa3vmdHYLCMvqTl6vbKhsYryZVPFyXgLCH+o019YpsK
         S9C/FlUYCHRCWBjmSCO9Q74ez1zQhnJKWygs9bNxClnGHMv9cm9FfVSLX19MIRFj9Y
         7JO5WmR/PZTVQo1W5sB1cZOvgQ3A6YsuKvFXdVS0fNE26RzrN14nvN7cCnFAEIhX9b
         qVoin2I5sMQmxqpn28LFffWj1docL3f8U3O6iLtL0wm9qAWT6Xewibi0mceztzz9kJ
         CZZ3hDxEm+5umpXCNP/R4JPhYo7JY109mBZWol6uRAnEva7PYxeLLhVJIBlrOMM3V1
         DEabkqQUDRYww==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id b9so9201576plx.2
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Aug 2021 21:38:43 -0700 (PDT)
X-Gm-Message-State: AOAM530N0FubgTzUKMLK8+WRZzNo/1rkYVtF4uvrdXAFQcDd+POsgMXy
        LqoIRrbEuVL6z5uVvRLPIJ1H6/gxaaaK88KOvnI=
X-Google-Smtp-Source: ABdhPJyTggCjmDmxU39Sm+EqceyjjgOcfwdnP+TpuyabKZaRk+8NKLyxCvu59yefd+umqCXUYobMxSUcC/f4uMwGr30=
X-Received: by 2002:a17:902:a5c5:b029:12c:a867:a839 with SMTP id
 t5-20020a170902a5c5b029012ca867a839mr36578125plq.71.1629866322644; Tue, 24
 Aug 2021 21:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-5-ndesaulniers@google.com> <bc8cf0be-9e51-e769-0685-2594802eead0@kernel.org>
 <CAKwvOdkO3ax7gN-n5OJO7-320BVK+B-JDs0v=3vZs9fPezwjDg@mail.gmail.com> <8b9bf97a-8f6f-80b9-3bab-32bb525adf9e@kernel.org>
In-Reply-To: <8b9bf97a-8f6f-80b9-3bab-32bb525adf9e@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Aug 2021 13:38:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASN2YmH5kxzx8XMxM5UfJOEc9JJ0AWdKsP8=Fr9wqSN0Q@mail.gmail.com>
Message-ID: <CAK7LNASN2YmH5kxzx8XMxM5UfJOEc9JJ0AWdKsP8=Fr9wqSN0Q@mail.gmail.com>
Subject: Re: [PATCH 4/7] arc: replace cc-option-yn uses with cc-option
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Vineet Gupta <vgupta@kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 18, 2021 at 10:40 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
>
>
> On 8/17/2021 11:07 AM, 'Nick Desaulniers' via Clang Built Linux wrote:
> > On Mon, Aug 16, 2021 at 7:05 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >>
> >> On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> >>> cc-option-yn can be replaced with cc-option. ie.
> >>> Checking for support:
> >>> ifeq ($(call cc-option-yn,$(FLAG)),y)
> >>> becomes:
> >>> ifneq ($(call cc-option,$(FLAG)),)
> >>>
> >>> Checking for lack of support:
> >>> ifeq ($(call cc-option-yn,$(FLAG)),n)
> >>> becomes:
> >>> ifeq ($(call cc-option,$(FLAG)),)
> >>>
> >>> This allows us to pursue removing cc-option-yn.
> >>>
> >>> Cc: Vineet Gupta <vgupta@kernel.org>
> >>> Cc: linux-snps-arc@lists.infradead.org
> >>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >>> ---
> >>>    arch/arc/Makefile | 3 +--
> >>>    1 file changed, 1 insertion(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> >>> index c0d87ac2e221..8782a03f24a8 100644
> >>> --- a/arch/arc/Makefile
> >>> +++ b/arch/arc/Makefile
> >>> @@ -18,8 +18,7 @@ ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
> >>>    cflags-y                            += $(tune-mcpu-def-y)
> >>>    else
> >>>    tune-mcpu                           := $(shell echo $(CONFIG_ARC_TUNE_MCPU))
> >>> -tune-mcpu-ok                                 := $(call cc-option-yn, $(tune-mcpu))
> >>> -ifeq ($(tune-mcpu-ok),y)
> >>> +ifneq ($(call cc-option,$(tune-mcpu)),)
> >>>    cflags-y                            += $(tune-mcpu)
> >>
> >> Any reason not to just turn this into
> >>
> >> cflags-y += $(call cc-option,$(tune-mcpu))
> >>
> >> ?
> >
> > Yes, you'll need to pull up the source; the diff doesn't provide
> > enough context. tune-mcpu is used in the body of the else branch
> > hinted at by the diff. PTAL
>
> Ah, fair enough. The warning is a little unconventional but oh well :)
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> >>
> >> If $(tune-mcpu) is empty or invalid, nothing will be added to cflags-y.
> >>
> >>>    else
> >>>    # The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
> >>>
> >
> >
> >

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
