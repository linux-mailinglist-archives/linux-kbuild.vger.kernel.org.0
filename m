Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19EF160545F
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Oct 2022 02:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiJTALT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Oct 2022 20:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbiJTALS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Oct 2022 20:11:18 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CDEE1B6CAD
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 17:11:14 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id s17so10669497qkj.12
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 17:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TvTy8n6C/1bhGfXbm3sWLXfdEs9qoqny5LEASHEaNLk=;
        b=XUuyKUtVk/E8FvAa0yrjE7arzz1tSezBbWYYJSXcz6sxfS6RHTtGrPKvwnKEOdW3oD
         RsfHg547QyRyTxoGJWre6JJxFdMYHlAnnqnNTo5EIUQ7RxnVkA1jAWPv3TG/Y8W+QUJ+
         IgidGLePtNsUdi3C/qbpsGAfSgrU0ybb6wqpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvTy8n6C/1bhGfXbm3sWLXfdEs9qoqny5LEASHEaNLk=;
        b=nlAL1DuqFtvPhevgghJrKJXd2JHh8WBpLcXviCqdbwvnovDNqC0NCF305pPxmvaf8h
         rUU4SPN2bpgH2tx8WAVzQcNRx+opZK4/39f89XS7f2O5vg7+r17T/OManIw5EFG19REC
         NFa1t4Dzz2Cd0rLTm6nouM7lDoVkV9lgbFIjr5kPWjGv35MV0HQY6smM41A5AGm6WTAP
         Gt0Zm6AaIe523hTyArt2kXVFVixp37C08VUWdnWOPSkpBfF1yl0Fmo64GiBwAcaOTmF0
         3aqj+Mcb6oWj7mJwbhOSsHqbI6VXAXI2b94zoz8DDxkC98v04fd7Nzkei8eYicASDwAA
         RkEQ==
X-Gm-Message-State: ACrzQf2uq8N2FGfVm8/YI7Ny1GloyCdA2gnTf+kAyMPzTG4ohyguxxV/
        LaghIoaZRfQwVOpSqsT2Y0tH1ZsbMN4Sbg==
X-Google-Smtp-Source: AMsMyM6wuEUw1Xve+s9PDZnp25l+ww33aaaSIj5SLoW8jY5vgdOfRPd2jPOTRXICCgVFuXjxQUjKfg==
X-Received: by 2002:ae9:eb56:0:b0:6ea:894f:6d21 with SMTP id b83-20020ae9eb56000000b006ea894f6d21mr7435380qkg.301.1666224673859;
        Wed, 19 Oct 2022 17:11:13 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id br44-20020a05620a462c00b006bbb07ebd83sm5713382qkb.108.2022.10.19.17.11.11
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 17:11:12 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id r3so22752863yba.5
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 17:11:11 -0700 (PDT)
X-Received: by 2002:a05:6902:1002:b0:6be:d89d:98d0 with SMTP id
 w2-20020a056902100200b006bed89d98d0mr8880613ybt.571.1666224671596; Wed, 19
 Oct 2022 17:11:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221019162648.3557490-1-Jason@zx2c4.com> <20221019165455.GL25951@gate.crashing.org>
 <CAHk-=wiMWk2t8FHn0iqVVe1mn62OTAD6ffL5rn9Eeu021H9d1Q@mail.gmail.com>
 <20221019174345.GM25951@gate.crashing.org> <CAHk-=wiNNKLFfa0d+Hk=Wm5caiKjLY4V9wwu9DhcSSwPuMbxrg@mail.gmail.com>
 <CAKwvOdn4iocWHY_-sXMqE7F1XrV669QsyQDzh7vPFg6+7368Cg@mail.gmail.com>
 <CAHk-=wiD90ZphsbTzSetHsK3_kQzhgyiYYS0msboVsJ3jbNALQ@mail.gmail.com>
 <202210191209.919149F4@keescook> <CAHk-=wgz3Uba8w7kdXhsqR1qvfemYL+OFQdefJnkeqXG8qZ_pA@mail.gmail.com>
 <Y1Bfg06qV0sDiugt@zx2c4.com>
In-Reply-To: <Y1Bfg06qV0sDiugt@zx2c4.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 19 Oct 2022 17:10:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsbYJuO=3331LmQGePXWAdHEdT33HOup53shjMJFan6Q@mail.gmail.com>
Message-ID: <CAHk-=wjsbYJuO=3331LmQGePXWAdHEdT33HOup53shjMJFan6Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: treat char as always signed
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-toolchains@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 19, 2022 at 1:35 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> I wish folks would use `u8 *` when they mean "byte array".

Together with '-funsigned-char', we could typedef 'u8' to just 'char'
(just for __KERNEL__ code, though!), and then we really could just use
'strlen()' and friends on said kind of arrays without any warnings.

But we do have a *lot* of 'unsigned char' users, so it would be a huge
amount of churn to do this kind of thing.

And as mentioned, right now we definitely have a lot of other "ignore
sign" code.

Much of it is probably simply because we haven't been able to ever use
that warning flag, so it's just accumulated and might be trivial to
fix. But I wouldn't be surprised at all if some of it ends up somewhat
fundamental.

              Linus
