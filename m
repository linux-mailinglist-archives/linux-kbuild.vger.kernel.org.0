Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9817D563E18
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Jul 2022 06:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbiGBEGg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Jul 2022 00:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbiGBEG1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jul 2022 00:06:27 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745C42CC9C
        for <linux-kbuild@vger.kernel.org>; Fri,  1 Jul 2022 21:06:25 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id j7so2360386wmp.2
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Jul 2022 21:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aNrpQditMVEzFyzmpSk2zil+RQzMhf0c7Pi6bIl2lQA=;
        b=GnuVhVl72bylbCLXmrX2ZeWx8r2fYIBYdA0AKAzb+UyLeTck6yNXLV9RxU4EOOe7mb
         q3joHU7AyOrzPPgnLgeehd4wxqonuBta49LyB0YcwkKw/dwU9OqbHmAduR+EDVLWVheb
         dvZpkfSLVXNtQZ9sJxqqC0pT7jTv9Hf6CaOPZLrtqxeg0i9LPH8/BdNPstoLlYQpb8jz
         VyfYRc0/nocp7b7eAIrWhcozZXlBDqOqg23EQzjiRqcggxX880AjHT8oawPnX3VeQe4R
         hrrQfIL3mjM7JNYjfueqNEGDjBal1B//nzsvMD1y0+Eu2WdsYGnvNp+T8OEnGTyfHMQe
         aG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aNrpQditMVEzFyzmpSk2zil+RQzMhf0c7Pi6bIl2lQA=;
        b=34u/Hj40J4FUs0aMJxha06b8GHyqgQ8QopOtCzOposyYc2gBJaO7yIrIcu7ZjaXs/I
         bOr+4o0w1ZHnZXc+j/psk02WU4dLYtSpr40ye07UF9x5JDx0FhFwiJjYrlxOlp59aKqi
         0O5tKwolt69O0NIwAqK2JxcNQZ71ogi3pxBEO7NY0/vJs3Kl51ZxzBqszpAVo2krPQi2
         ICr27NpxlfNW1uIj8+qtxeCaX+cqYuc3m6rKSXsBznT+iysMwrNuvGn3M/rUP8YQhi3X
         v2GUxDutZzk0NJKEw2W37uslzhIe9WQN5itdCpJDXeQi2ykDYoSoKSRYqkbbby+iiEAA
         xuvQ==
X-Gm-Message-State: AJIora8B96toL2nEMRXWeYlMbqGKLeSBWzd0l8RLsDkiKlz29sx76zxj
        kIkPMLbDugzgs5J+4Ca4mymF9TgDcEf8/qWK598vrQ==
X-Google-Smtp-Source: AGRyM1u4kwUUQQkn63Aw/JJQWQpKKif6NpIsTbVsB3q0gHEM6LBcudovPxPlekXcr9Ryh3J58GRYvygfh9KuJdnqOo4=
X-Received: by 2002:a05:600c:1e14:b0:3a0:2bba:4b2e with SMTP id
 ay20-20020a05600c1e1400b003a02bba4b2emr19527464wmb.196.1656734783843; Fri, 01
 Jul 2022 21:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220701084744.3002019-1-davidgow@google.com> <20220701084744.3002019-4-davidgow@google.com>
 <Yr92OngNsEOxszUA@bombadil.infradead.org>
In-Reply-To: <Yr92OngNsEOxszUA@bombadil.infradead.org>
From:   David Gow <davidgow@google.com>
Date:   Sat, 2 Jul 2022 12:06:12 +0800
Message-ID: <CABVgOSnZwnQZAo5LH1KEbpVYvCtvTVCG4kZR=aV_gxFuU_D12g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] selftest: Taint kernel when test module loaded
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
        Sebastian Reichel <sre@kernel.org>,
        John Ogness <john.ogness@linutronix.de>,
        Joe Fradley <joefradley@google.com>,
        Daniel Latypov <dlatypov@google.com>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Aaron Tomlin <atomlin@redhat.com>,
        linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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

On Sat, Jul 2, 2022 at 6:33 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Fri, Jul 01, 2022 at 04:47:44PM +0800, David Gow wrote:
> > Make any kselftest test module (using the kselftest_module framework)
> > taint the kernel with TAINT_TEST on module load.
> >
> > Note that several selftests use kernel modules which are not based on
> > the kselftest_module framework, and so will not automatically taint the
> > kernel.
> >
> > This can be done in two ways:
> > - Moving the module to the tools/testing directory. All modules under
> >   this directory will taint the kernel.
> > - Adding the 'test' module property with:
> >   MODULE_INFO(test, "Y")
>
> This just needs to be documented somewhere other than a commit log.
> Otherwise I am not sure how we can be sure it will catch on.

I've updated the kselftest documentation for v5.

> > Similarly, selftests which do not load modules into the kernel generally
> > should not taint the kernel (or possibly should only do so on failure),
> > as it's assumed that testing from user-space should be safe. Regardless,
> > they can write to /proc/sys/kernel/tainted if required.
> >
> > Signed-off-by: David Gow <davidgow@google.com>
>
> Looks good otherwise!
>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
>
> Do we want this to go through selftest / kunit / modules tree?
> Happy for it to through any. I can't predict a conflict.

I don't mind which tree it goes through either -- I'm not aware of
anything which would depend on it. I do have it on the list of things
pending for the KUnit tree, but it's much less KUnit-specific now
compared to v1. Regardless, I'll leave in the KUnit to-do list, and
we'll pick it up if no-one else particularly wants to.

Cheers,
-- David
