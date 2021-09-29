Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EE941CD61
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Sep 2021 22:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346707AbhI2U1B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Sep 2021 16:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346710AbhI2U1B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Sep 2021 16:27:01 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37B1C061766
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 13:25:19 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id om12-20020a17090b3a8c00b0019eff43daf5so2936599pjb.4
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Sep 2021 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BUBvo02+e+5GDikUUveOdH1uDHUT9sKYGIFKKqY5fqU=;
        b=SXHyTGNpWjeYTLxcIMpnSmPDFAjptH6ZmfzCgx9YzmZjU1V8uKZu8G3t/G5gEVRgqQ
         ybCdjCPKGm9EUpwMHEJB8/rnNWmV/+nfKszYb9nUEtdsxMGbna3my2JupqTd0pqxz/ck
         LRx8lxH6GYfkV9+xoTRQ266xJ7+TpMqYISBY4tR1o+xnykRnYJ/6clseru7yrlk1m2zM
         ACZFQIsfBD4XAxrElcUsgNEHbdu8xKHCfbHV63ipJdb9czfDsiiyCSUALPdNC66iG+bu
         gIheiodGXBCrjT/nQYttErY+l2+vPfbu9DTuVrNxElKOR7AIzXZ/zyyTO0X1kLdDSqlM
         oDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BUBvo02+e+5GDikUUveOdH1uDHUT9sKYGIFKKqY5fqU=;
        b=C7yiY5kWccnRShIkt6q1zg7IMifdcvnFCiMpVpZJs1Cp5Dclu9NrtMaO1mIJqaB3t8
         aTASZQo+OjJ/Xz5B2h4WQpPqMLt9AIRChWO6huU64fUqaak16HfVm8ckCI/H5T4ygoym
         UVp30/qj4Be5zxVO+C2zBDSr3tiw1U0qghD9hLjf3kQUJ4mupoSQCi8btQkUZAL0yfpn
         qNFX9l9n8YrlQM9HTRf59IfRbRz6D2E5GDVZsl227gRjB4a41vbcbGldz6r0sq083+Ty
         tvO/PnS5U4EcpQ92caRZpiHjOKn7iE/QkU8yz1DtwA7DiF1KcizyoLSrO4A8cLvHPCc8
         TlQw==
X-Gm-Message-State: AOAM530qc1ZpYyIt8f84B1muWF8F8z05evgcXGntB+ZGQbxJiE3+3j2y
        r5YIT5koBcnHnwIdMkn2hWDpgFLlLxmCQr7mAs0eFA==
X-Google-Smtp-Source: ABdhPJxpJOgC3k+TWaoTKANUQVPD/FVHVFgCe1rsICLyPH/Z9FIobrEZqMMPj8b91Xa2Z3xbADXcFUSb99b620EiBS8=
X-Received: by 2002:a17:90b:3108:: with SMTP id gc8mr8269060pjb.63.1632947118847;
 Wed, 29 Sep 2021 13:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061104.2680133-1-brendanhiggins@google.com>
 <20210917061104.2680133-2-brendanhiggins@google.com> <202109170808.629688A460@keescook>
In-Reply-To: <202109170808.629688A460@keescook>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 29 Sep 2021 13:25:07 -0700
Message-ID: <CAFd5g47YMnMzR+dtSLy9NvMb4TkeDkbSNt3qs-kvfLo_0y9-eg@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] gcc-plugins/structleak: add makefile var for
 disabling structleak
To:     Kees Cook <keescook@chromium.org>
Cc:     shuah@kernel.org, davidgow@google.com, arnd@arndb.de,
        rafael@kernel.org, jic23@kernel.org, lars@metafoo.de,
        ulf.hansson@linaro.org, andreas.noever@gmail.com,
        michael.jamet@intel.com, mika.westerberg@linux.intel.com,
        yehezkelshb@gmail.com, masahiroy@kernel.org,
        michal.lkml@markovi.net, ndesaulniers@google.com,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
        gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 17, 2021 at 8:48 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Sep 16, 2021 at 11:10:59PM -0700, Brendan Higgins wrote:
> > KUnit and structleak don't play nice, so add a makefile variable for
> > enabling structleak when it complains.
> >
> > Co-developed-by: Kees Cook <keescook@chromium.org>
>
> For a C-d-b, also include a S-o-b:
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
>
> But otherwise, yes, this is good. :)

Yeah, I know that's necessary for the patch to be accepted, but in
this case, I don't think your original version of this (it wasn't
actually a patch) had a S-o-b on it, so I didn't want to say that you
had signed off on something that you didn't.

I have run into this situation before and handled it this way -
letting the co-developer sign off on the list. Is this something I
should avoid in the future?

In any case, I will resubmit this now that I have your S-o-b.

Thanks!
