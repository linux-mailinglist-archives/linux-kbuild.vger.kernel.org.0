Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EBB760B6FB
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Oct 2022 21:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbiJXTO7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Oct 2022 15:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbiJXTOW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Oct 2022 15:14:22 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3A17F133
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 10:52:47 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id r19so6071969qtx.6
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 10:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kQzpFZcP8Coy3MtkwLvplRdsueJt1u6B3qt5xoqDDG0=;
        b=DC/JXvGYxRCs4XEoLBmqW0D0Vz2KsH2C3DgLHL1fXNfSPBwBNLhBvG1aiiz7Uuj8I5
         WmXcMVYsgZ0vNojncjGyGTEg7WfCECT/PHBTwyfOAa1wN5JjymQANnwgpOuOnPLj5cBC
         azfIciBEYryDpqGxNAu6DhUj9whA1Y6gO1Ggc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQzpFZcP8Coy3MtkwLvplRdsueJt1u6B3qt5xoqDDG0=;
        b=Vpb8aRvqUmT5IU1XZupcfAHVO0uoFi0LU0G7awShPQoTz8Sezwo73zwbsPhwnGcFZF
         M4H9ET6XGudWqBieB8s8qc4Shcn1Z7gZR+lBFdVbxv+qTe7VmuxqBbY+ignPWy/MePbd
         HYlEBP8dTsrsz47S+J5MyVAzvNcn/n35XlwsRUa3lh8vxArr5FHRKDqocsvSvX0xHlW1
         X3dHI8wq+XtjgzbCHV/iIR6/Ygx1O+zGheWENwqLXRttLxSg+hDvJ/pAZARhzqs1B+5Q
         pYBpZB5IbAQ9bdOKAw49EAemuucy1eZcZSpppXxFcK5WZ8y7/IZywfHAo78KSfLEApdQ
         uy7w==
X-Gm-Message-State: ACrzQf1XGfvXssfSPKp9J6r2JUdMkapXy1lPXecuIZQZeGoXh6bAFAvH
        y4RwgvslkZm2f+Ri7u6YMr7xBiYzlF/nFg==
X-Google-Smtp-Source: AMsMyM4TlfRr60vGC9FU+Z9E1vcr8ZAMj8PfRu434q7RdWIXeBuRhPCIeu1xBceTr7kSADC2eDAs0w==
X-Received: by 2002:a05:622a:551:b0:39c:e5c7:8b1b with SMTP id m17-20020a05622a055100b0039ce5c78b1bmr28312733qtx.540.1666631472599;
        Mon, 24 Oct 2022 10:11:12 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id c27-20020a05620a269b00b006ee7923c187sm302900qkp.42.2022.10.24.10.11.09
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 10:11:10 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-369c2f83697so83912347b3.3
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 10:11:09 -0700 (PDT)
X-Received: by 2002:a81:d34c:0:b0:349:1e37:ce4e with SMTP id
 d12-20020a81d34c000000b003491e37ce4emr30065031ywl.112.1666631469533; Mon, 24
 Oct 2022 10:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <Y1BcpXAjR4tmV6RQ@zx2c4.com> <20221019203034.3795710-1-Jason@zx2c4.com>
 <Y1ZZyP4ZRBIbv+Kg@kili> <Y1ZbI4IzAOaNwhoD@kadam> <Y1a+cHkFt54gJv54@zx2c4.com>
In-Reply-To: <Y1a+cHkFt54gJv54@zx2c4.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 24 Oct 2022 10:10:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgK3Vs+7Kor-SisRHJYzV1tXD+=D4+W1XkfHOV2KN_OGw@mail.gmail.com>
Message-ID: <CAHk-=wgK3Vs+7Kor-SisRHJYzV1tXD+=D4+W1XkfHOV2KN_OGw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: treat char as always unsigned
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
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

On Mon, Oct 24, 2022 at 9:34 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Give these a minute to hit Lore, but patches just submitted to various
> maintainers as fixes (for 6.1), since these are already broken on some
> architecture.

Hold up a minute.

Some of those may need more thought. For example, that first one:

> https://lore.kernel.org/all/20221024163005.536097-1-Jason@zx2c4.com

looks just *strange*. As far as I can tell, no other wireless drivers
do any sign checks at all.

Now, I didn't really look around a lot, but looking at a few other
SIOCSIWESSID users, most don't even seem to treat it as a string at
all, but as just a byte dump (so memcpy() instead of strncpy())

As far as I know, there are no actual rules for SSID character sets,
and while using utf-8 or something else might cause interoperability
problems, this driver seems to be just confused. If you want to check
for "printable characters", that check is still wrong.

So I don't think this is a "assume char is signed" issue. I think this
is a "driver is confused" issue.

IOW, I don't think these are 6.1 material as some kind of obvious
fixes, at least not without driver author acks.

                Linus
