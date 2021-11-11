Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD4544D435
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Nov 2021 10:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhKKJmv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Nov 2021 04:42:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbhKKJmu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Nov 2021 04:42:50 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7CA0C061767
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Nov 2021 01:40:01 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso8074816ots.6
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Nov 2021 01:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6/bKopAPmkHa57hfJnxgSr31+HwEgFYE/Py/TQAdG68=;
        b=gkiWiOX8zlm9XT8Og6moU9xIJyu8+w/wkXHcSyju6P6MfcJ+1eMp46rl/6GcYATuSD
         2lPIpohCRFh7xvqOYiub6Ne4RHSEdGx9iFmYpyAsiq3v8QkHfNUJorlkCpu59ecFoyDX
         5cQ+gXFtQLFy6nzBtySiGlpS4F3A0n+VJS6gxzp6HcokIb00BTd0Hc6kjoNNwCCC2c/w
         ZdaDUyw/oqZOrPVWQ0w/HvLeXtkQbp1Qk8FLjaPH5u8mH1zES5uW7Hh7l8usP8LoHwFM
         rbM/lILsGVEEwAsxpEXLBi0WLmXQFnRPjUj7OPMUk81PvcRFPIE0OTrfSX25AJlr9m4G
         0XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6/bKopAPmkHa57hfJnxgSr31+HwEgFYE/Py/TQAdG68=;
        b=07oV8BXF6oOgiGWsl0MieR+2QHUmpfv2ZtrPBHRtVY5/N/BOdmQNc2ilVZRaTcRgcm
         NVSA7Avx7HzqGTk8OzibvmApGJGlyGb4HEoroLjfcGrTMfZ0wwhGTB7kCeMfTpGDkNLW
         zCz9u8FxpHc6gHUCVt+3/yeGCJclB4eamc10aWBAd5N1RH/8kNStiTw/q6cmdryufOjp
         o6pvC7LmDvZbXabPHgR0f5oVCOKW918zTk6tIfcZY6VkIkgsu8tlp32pTwghIWuShkmN
         gs4S+GGBBlvB5At0nF9iznN3P8FpDXhLMKEW2OvkVAi2K+P0g6AcQMLjF7Hg4TcJw4Z6
         oBPQ==
X-Gm-Message-State: AOAM533Ey1cKkm9FmFdSaD0USlZbmgNXgqMmoMdx9ntEZFrXou3/GGXC
        ENBVwsdbQXdMHGM9U8pgYl/TxWxG8WkHfcwa/ulPdQ==
X-Google-Smtp-Source: ABdhPJwHNib4Izwq5VRvwx+F+i/iw/cbi3VPdxj/5KCILWR5ZipAgx6octOLOllqAzJpni78t8/MutpmCyKpGH1Zi1I=
X-Received: by 2002:a9d:77d1:: with SMTP id w17mr4805850otl.329.1636623600901;
 Thu, 11 Nov 2021 01:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-5-valentin.schneider@arm.com> <YYzeOQNFmuieCk3T@elver.google.com>
In-Reply-To: <YYzeOQNFmuieCk3T@elver.google.com>
From:   Marco Elver <elver@google.com>
Date:   Thu, 11 Nov 2021 10:39:49 +0100
Message-ID: <CANpmjNPvYZSSLnsg_BGfzb=Yu4bTvCp+N14FHcJfUDjDgzrywg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] kscan: Use preemption model accessors
To:     Valentin Schneider <valentin.schneider@arm.com>
Cc:     linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Galbraith <efault@gmx.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 11 Nov 2021 at 10:11, Marco Elver <elver@google.com> wrote:
>
> Subject s/kscan/kcsan/
>
> On Wed, Nov 10, 2021 at 08:24PM +0000, Valentin Schneider wrote:
> > Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
> > preemption model of the live kernel. Use the newly-introduced accessors
> > instead.
> >
> > Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
>
> Reviewed-by: Marco Elver <elver@google.com>
>
> Though it currently doesn't compile as a module due to missing
> EXPORT_SYMBOL of is_preempt*().
>
> > ---
> >  kernel/kcsan/kcsan_test.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
> > index dc55fd5a36fc..14d811eb9a21 100644
> > --- a/kernel/kcsan/kcsan_test.c
> > +++ b/kernel/kcsan/kcsan_test.c
> > @@ -1005,13 +1005,13 @@ static const void *nthreads_gen_params(const void *prev, char *desc)
> >       else
> >               nthreads *= 2;
> >
> > -     if (!IS_ENABLED(CONFIG_PREEMPT) || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
> > +     if (!is_preempt_full() || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {

In case you introduce the 5th helper I suggested
(is_preempt_full_or_rt() or whatever you'll call it), this one can be
switched, because this check really does want to know if "at least
full preemption" and not "precisely full preemption".

Thanks,
-- Marco
