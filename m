Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 282FC60543F
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Oct 2022 01:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbiJSX40 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Oct 2022 19:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiJSX4Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Oct 2022 19:56:24 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FEDF17C149
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 16:56:23 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id x188so21115133oig.5
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 16:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VigXITkVLYj2H0N/7H5h8chIQ6OrSCW4jyaDySBHArA=;
        b=dVipe01F0+/PKATXxNO5MrvQYydwK3wDKFHJJPYZu33TRsdQlwODeaeTcxofz+TcBy
         i9QkXwhJMph9EfoGPMbJeRd2V3zcRj3Q1p7Ywf3RVXRl5yNd3cPt/0QbtxIPuhrUznxB
         QKXH8CkolwUIi7/w8E0M06X2b4SfFZEteQSOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VigXITkVLYj2H0N/7H5h8chIQ6OrSCW4jyaDySBHArA=;
        b=sCNH5pEVqnOInZ68+0ZAHd/Kd8waS2mUSaWEnqgWW1GUqpT39JmAUi/MskF5e/xoEw
         PbQ9ccPQE9FW1VpB7RdRiVCENZOWHjkkJAx8BS6HELgb+yrEwrgGTUrO1jQhLhIb2rKa
         hQLrcyI9U4q4R9gl9y0283QHC2OAqsywI9mev3HvT6JorkwPG8MaNKezvFXiMSigEtdL
         NL4RYnXHn0n0z1VwF6RIuO8LMZxJSnEgGA/N3qMMaQEDVs6NlG3uLOaY9r0A/o4XO3ac
         po+X2r9vQXKb26CrV6/Wp1pQvbz5TwQSEnclP3t5+bRWI+JvbifwMhvboZshHmkNLEx0
         WDqg==
X-Gm-Message-State: ACrzQf2pZ5TtjU9/zZ41z8zH9uPdZYyuVr2/YL/wzbEVYSx3+RcfWNVq
        9JD2JWWqxbXkA4bcFoZD8wNcuD3Fm5pzmw==
X-Google-Smtp-Source: AMsMyM426FKMcXJr0xtbLhCqR9jycrq5u0z1l1FeZH1ltiAcL4rXsXn4nGjxmJ4R0FqY5qCodENlTQ==
X-Received: by 2002:aca:34c5:0:b0:353:f98f:641e with SMTP id b188-20020aca34c5000000b00353f98f641emr20264183oia.94.1666223782203;
        Wed, 19 Oct 2022 16:56:22 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id h5-20020a4aa9c5000000b00480e77f90f9sm1153275oon.41.2022.10.19.16.56.19
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 16:56:20 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so10459935otb.8
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 16:56:19 -0700 (PDT)
X-Received: by 2002:a9d:7745:0:b0:661:a3c9:3cff with SMTP id
 t5-20020a9d7745000000b00661a3c93cffmr5595353otl.176.1666223779433; Wed, 19
 Oct 2022 16:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
In-Reply-To: <20221019203034.3795710-1-Jason@zx2c4.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 19 Oct 2022 16:56:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wit-67VU=kt-8Ojtx04m6wxfqypKLzW7CuSeEH_9MYZvw@mail.gmail.com>
Message-ID: <CAHk-=wit-67VU=kt-8Ojtx04m6wxfqypKLzW7CuSeEH_9MYZvw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: treat char as always unsigned
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-toolchains@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 19, 2022 at 1:30 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> So let's just eliminate this particular variety of heisensign bugs
> entirely. Set `-funsigned-char` globally, so that gcc makes the type
> unsigned on all architectures.
>
> This will break things in some places and fix things in others, so this
> will likely cause a bit of churn while reconciling the type misuse.

Yeah, if we were still in the merge window, I'd probably apply this,
but as things stand, I think it should go into linux-next and cook
there for the next merge window.

Anybody willing to put this in their -next trees?

Any breakage it causes is likely going to be fairly subtle, and in
some random driver that isn't used on architectures that already have
an unsigned 'char' type.

I think the architectures with an unsigned 'char' are arm, powerpc and
s390, in all their variations (ie both 32- and 64-bit).

So all *core* code should be fine with this, but that still leaves a
lot of drivers that have likely never been tested on anything but x86,
and could just stop working.

I don't think breakage is very *likely*, but I suspect it exists.

                       Linus
