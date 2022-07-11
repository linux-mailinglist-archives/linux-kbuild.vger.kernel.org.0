Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7A345701CF
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jul 2022 14:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbiGKMN6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jul 2022 08:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230319AbiGKMN5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jul 2022 08:13:57 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AEB41D0C
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jul 2022 05:13:55 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id y14-20020a17090a644e00b001ef775f7118so8113466pjm.2
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Jul 2022 05:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EikphSww+RafS6vS77TASll+8j79PUv6238cbi6iVMA=;
        b=O4nCCNVToeENZCd2uNBHhkhU2XDwidLTGenLewpScaiByzPAeJVY2KIcN/3JprQmiM
         mKwbwyGQEkba2QRiOiCtiNcg8pVERqDTSAn4PD5/NlWOibA2EC36v5lyVugX9y6RrIta
         wMN8mjheLUHWr5fF4yBbbgZXW697zaCO8WOUBNRo0rYZ4qj+QgeeBI5cVPU+g+c3E0Lc
         EkcfO4m/KPfbJBaXpAL8Oj18ttrXEDKHcZwT/F0CGc88UgS4pQGpkAWEZd/3bE6RcFmr
         hc0TB//9V/8GA4rJyEMJW96FHu+/+e8oTV4BHAwgqOiclfVwKYJYvbBuNRcW1jWZ73YU
         851g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EikphSww+RafS6vS77TASll+8j79PUv6238cbi6iVMA=;
        b=qUDbhHJqiEaw4Sw8BN9YTM4kMCBVVWVJuT45xkao6FmkquMXrM2Xh512NO1YSVCcyi
         mvXgHnhVV2KAI7q614zMgoEM8KNBBVYPGM4t/XQY5zRvYW3NixUMM8TBraj1cNLU14o/
         2LjEJak/qEGXlh4AvjS/mZ+qqWfZ7OJzG9B6psGddboqCWpcz+jbRpCZ+UqFutb5Bxjo
         KL6G+Jlsi6qkK+2Z5kYLu4TQRWWj0iaekaU9tCe2yyY6KmSeIiTiGJEKUV8D9Q+iZtp/
         m30iNquNBiSn6Qa2HFtHtCxQ7X03pJv5acEZw9d41ZZJjyji2UX/TEAW0FSyCcvnGM0z
         Zr8A==
X-Gm-Message-State: AJIora/dE7H2/g1AzXM1V99szCv26VHv/WBTC1vCKPpNif4OiQdqmgkd
        H1VZeUg6pIl/t56f16vyPsPoGUx9+1k2DHFljqOj2A==
X-Google-Smtp-Source: AGRyM1uYYgVQ/CRLBzJHlsyYOdpfgtPTuYXcJR33Ka+9OyT0mkFsfqhEjFp31HC9k/tzrqlaMoczxBPOnhToGzC+SKY=
X-Received: by 2002:a17:903:2cb:b0:14f:4fb6:2fb0 with SMTP id
 s11-20020a17090302cb00b0014f4fb62fb0mr18233212plk.172.1657541635385; Mon, 11
 Jul 2022 05:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657296695.git.guillaume.tucker@collabora.com> <b39b9e0b-45f3-1818-39fe-58921182d957@linuxfoundation.org>
In-Reply-To: <b39b9e0b-45f3-1818-39fe-58921182d957@linuxfoundation.org>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Mon, 11 Jul 2022 14:13:44 +0200
Message-ID: <CADYN=9JncW4XKk8zVAuiux4R+FF2Z=LhBh--ajUqyGMC5yyxLQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix kselftest build with sub-directory
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Shuah Khan <shuah@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        kernel@collabora.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 8 Jul 2022 at 19:14, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 7/8/22 10:23 AM, Guillaume Tucker wrote:
> > Earlier attempts to get "make O=build kselftest-all" to work were
> > not successful as they made undesirable changes to some functions
> > in the top-level Makefile.  This series takes a different
> > approach by removing the root cause of the problem within
> > kselftest, which is when the sub-Makefile tries to install kernel
> > headers "backwards" by calling make with the top-level Makefile.
> > The actual issue comes from the fact that $(srctree) is ".." when
> > building in a sub-directory with "O=build" which then obviously
> > makes "-C $(top_srcdir)" point outside of the real source tree.
> >
> > With this series, the generic kselftest targets work as expected
> > from the top level with or without a build directory e.g.:
> >
> >    $ make kselftest-all
> >
> >    $ make O=build kselftest-all
> >
> > Then in order to build using the sub-Makefile explicitly, the
> > headers have to be installed first.  This is arguably a valid
> > requirement to have when building a tool from a sub-Makefile.
> > For example, "make -C tools/testing/nvdimm/" fails in a similar
> > way until <asm/rwonce.h> has been generated by a kernel build.
> >
> > Guillaume Tucker (4):
> >    selftests: drop khdr make target
> >    selftests: stop using KSFT_KHDR_INSTALL
> >    selftests: drop KSFT_KHDR_INSTALL make target
> >    Makefile: add headers_install to kselftest targets
> >
>
> This takes us to back to the state before b2d35fa5fc80 added
> khdr support. I reluctantly agreed to the change and it has
> proven to be a problematic change. I would rather have had the
> dependency stated that headers should be installed prior to
> building tests - test build depends on kernel build anyway and
> having dependency on headers having build isn't a huge deal.

I agree that it's not a huge deal.

>
> So I am in favor of getting rid of khdr support. However, this
> khdr support was a change originated from Linaro test ring. Undoing
> this might have implication on their workflow.

It shouldn't be a problem.
I've been running these patches through a smoke test and it looks
good.

Tested-by: Anders Roxell <anders.roxell@linaro.org>


Cheers,
Anders

>
> I will pull them into the discussion so they are aware of it and
> be prepared for this change.
>
> thanks,
> -- Shuah
>
>
