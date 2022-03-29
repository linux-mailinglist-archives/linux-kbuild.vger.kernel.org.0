Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F62D4EB47A
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Mar 2022 22:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiC2UMe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Mar 2022 16:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiC2UMe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Mar 2022 16:12:34 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744B5A27DA
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Mar 2022 13:10:50 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s13so7869783ljd.5
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Mar 2022 13:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0oU9jeX9iLhMYZKUyj4AbviUR1091ghdikwJSuXqLCs=;
        b=Nsn+ciQzT1Wa4x0yQPbzfiy4QANLLiRrBUKK1/DCgDgUqrMTXpAg947w50LiufKKTr
         HN5ebNO9/oTpHluLDirWIqISaBp8aGbx2/D2Vgn5Z881qILdQSMotEVnQ10w4VfVbSts
         PzXEtkY1Xp7HOhvQw5GU8RF4QJFEHAoIF2wh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0oU9jeX9iLhMYZKUyj4AbviUR1091ghdikwJSuXqLCs=;
        b=UoLjgFSKAnjVCMGKzQabOMcfQN3Ya240v+QMSIrp9VMXvOHOD2tC3I+JSgcQpOntIQ
         OBE3zIRRMN6s3wODc9nul9XwcvtWB5RPGV1QFlW4288GfCaqnOkYdyX8XihYnCrHVv36
         ALNvI8d4th0/FcAw0vaM15IV31y7G09pUSIoJ0A2eXOJoxVKrxA30Kdoefzv1IfFqSq3
         VW+xktadKAVXUWFU1ZwMuUvcoMHWpPZ4h2gpVwcLidmqnciInffnggI1AEVwj3fP9qmv
         PM8Ds5Mn/iVdBfTjNrbuYpHKMUqDNzbO/rwGoL5IbemhSJZNrUNWo6FfapOqsYI0Xebo
         c65g==
X-Gm-Message-State: AOAM533Pd58QdWyB5Rx5eYgTolkSwIKFW+W2gsm4QZ4RSvKOkLBxpz9W
        VNILmcg4H0i7s/7U+12e2KmYi0t2JeJY2uL9
X-Google-Smtp-Source: ABdhPJyLEgdyCb17TBeuHZYIWvFAaVtSBhHnt4sf8fI/jPRFyR2rGBpcGvInePstrgL1X2cfbIKVbg==
X-Received: by 2002:a2e:a7ce:0:b0:249:862b:503 with SMTP id x14-20020a2ea7ce000000b00249862b0503mr4022523ljp.369.1648584648349;
        Tue, 29 Mar 2022 13:10:48 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id j3-20020a196e03000000b0044a6e47c27esm1709237lfc.48.2022.03.29.13.10.47
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 13:10:47 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id p10so26338815lfa.12
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Mar 2022 13:10:47 -0700 (PDT)
X-Received: by 2002:ac2:4203:0:b0:448:8053:d402 with SMTP id
 y3-20020ac24203000000b004488053d402mr4181682lfh.687.1648584646973; Tue, 29
 Mar 2022 13:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATL4v40ZHJ+Ym3k_fVe4ddmMA3wFQXb5RaTz9hmPebeuQ@mail.gmail.com>
In-Reply-To: <CAK7LNATL4v40ZHJ+Ym3k_fVe4ddmMA3wFQXb5RaTz9hmPebeuQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 29 Mar 2022 13:10:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgxcu9DFkXAOAFdDtLWwuv6qb5iV1E69yWE-JEVsd-NFg@mail.gmail.com>
Message-ID: <CAHk-=wgxcu9DFkXAOAFdDtLWwuv6qb5iV1E69yWE-JEVsd-NFg@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v5.18-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I pulled this, and then immediately unpulled.

On Mon, Mar 28, 2022 at 5:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  - Change the .config format to use CONFIG_FOO=n instead of
>    "# CONFIG_FOO is not set"

This is unacceptable.

The change was apparently made to make automation easier, at the
expense of making it harder for people to parse.

That is not a valid tradeoff.

I _look_ at my config files. Constantly. I don't want some mess where
it's really damn hard to visually tell the difference between "this is
enabled" and "this is not enabled".

So no, I'm not pulling this kind of horrible "make it simpler for
automation, and harder for humans" to read.

                Linus
