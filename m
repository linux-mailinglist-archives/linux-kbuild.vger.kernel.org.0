Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD0C604E4C
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Oct 2022 19:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiJSROq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Oct 2022 13:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbiJSROl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Oct 2022 13:14:41 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5494E85B
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 10:14:38 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id f4-20020a9d0384000000b0066208c73094so808241otf.0
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 10:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KQxzROgST2+8KIjtVZdr5+s36xe/ZTzSg3ETS6Z3ulQ=;
        b=LHMjzMXASHQR480KuNviD0xWrYZLfPGTCqeVvQUzo3gve/gy/NSntm2Y3IkOnCwj1p
         +2IyuKYK8OWw/x9y83GLy2MuG6uqB0UvRc95PvRt9RDfj9DT+fECM5grlCAHIYJa4yIC
         pJNjoJ+eCxvdc3VlvJicxtqeqtYoTOSjDGAh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQxzROgST2+8KIjtVZdr5+s36xe/ZTzSg3ETS6Z3ulQ=;
        b=C6o/B3abVIFRUEV+4jT8WqBp0f4lhY1OE7n3/0JF4fOSGwGv3zycg3XVyKsIu/+sAx
         HM1TZ5ECyNXjP4f6QhMN9BCm5XtEFHEH65BuQYMMUMt5lFK2TFXOJPQw7w/ixQxI1nXq
         1s5y7vw/s02vrFrcx0slKs47ZUf4V4LALCw5P07sgM0VapozwSylRFrf9AcnbmOazv9t
         1Eq7O35Xl/X0Mpgadfy/aRQutkpA+QRQSkfsvmCaFWTyqzB8V88gtve5WRlUVJj3nvqu
         rOd10bGjC+cgZTY6/sVO1TdIzIFWI4dmlJbCzc/vvOv30pEVgJBdUzDoMzD6OujxeA7w
         M6kw==
X-Gm-Message-State: ACrzQf3G8tRkYJQbV1F3rEELcfLRDdj7aSAxZmZSOm8PbRzelf95faRc
        E+8E63jDj9WcFp6GxuCbPGm/2Od0aDYXrA==
X-Google-Smtp-Source: AMsMyM4tUt5RYaF4sokC9vx+6XeAApmWC3E3lY9D/7L67C4oZVPYLnAoDh/a+v5M9/4rLxr/mJhwCQ==
X-Received: by 2002:a05:6830:278a:b0:65c:5217:ca79 with SMTP id x10-20020a056830278a00b0065c5217ca79mr4467862otu.374.1666199677788;
        Wed, 19 Oct 2022 10:14:37 -0700 (PDT)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id l15-20020a9d550f000000b00661abf2162dsm7389746oth.48.2022.10.19.10.14.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 10:14:37 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id m81so19995311oia.1
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Oct 2022 10:14:36 -0700 (PDT)
X-Received: by 2002:a05:6808:23c3:b0:351:4ecf:477d with SMTP id
 bq3-20020a05680823c300b003514ecf477dmr5072747oib.126.1666199676600; Wed, 19
 Oct 2022 10:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221019162648.3557490-1-Jason@zx2c4.com> <20221019165455.GL25951@gate.crashing.org>
In-Reply-To: <20221019165455.GL25951@gate.crashing.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 19 Oct 2022 10:14:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiMWk2t8FHn0iqVVe1mn62OTAD6ffL5rn9Eeu021H9d1Q@mail.gmail.com>
Message-ID: <CAHk-=wiMWk2t8FHn0iqVVe1mn62OTAD6ffL5rn9Eeu021H9d1Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: treat char as always signed
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
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

On Wed, Oct 19, 2022 at 9:57 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> This is an ABI change.  It is also hugely detrimental to generated
> code quality on architectures that make the saner choice (that is, have
> most instructions zero-extend byte quantities).

Yeah, I agree. We should just accept the standard wording, and be
aware that 'char' has indeterminate signedness.

But:

> Instead, don't actively disable the compiler warnings that catch such
> cases?  So start with removing footguns like
>
>   # disable pointer signed / unsigned warnings in gcc 4.0
>   KBUILD_CFLAGS += -Wno-pointer-sign

Nope, that won't fly.

The pointer-sign thing doesn't actually help (ie it won't find places
where you actually compare a char), and it causes untold damage in
doing completely insane things.

For example, it suddenly starts warning if  you *are* being careful,
and explicitly use 'unsigned char array[]' things to avoid any sign
issues, and then want to do simple and straightforward things with
said array (like doing a 'strcmp()' on it).

Seriously, -Wpointer-sign is not just useless, it's actively _evil_.
The fact that you suggest that clearly means that you've never used
it.

                      Linus
