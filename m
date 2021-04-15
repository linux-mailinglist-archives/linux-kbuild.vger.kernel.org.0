Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2347F35FFAE
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 03:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbhDOBjV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 21:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhDOBjV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 21:39:21 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFD4C061756
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 18:38:59 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n10so13664plc.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 18:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bX6POsGmP4rs/rcLgPiRiQi4oaHEHZ6HqQN4nR2RIow=;
        b=QsNXz83U6yLc/9B6Ylh4qLBbM+mPoSDKwIE36jf24RToMnYA6W/NTMnk4CSkDaUDu1
         fchQlGZSES0NTLp9wu5LBdzEchrvbRvU9yKyeV2C6p6gEALe0GLxpC0aSOGEOyTJgPOr
         +t6OqHmIWMjLTfFGARripHpVxPqOF70SbTut4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bX6POsGmP4rs/rcLgPiRiQi4oaHEHZ6HqQN4nR2RIow=;
        b=ZSvuEdSZSplgpLS9xZu8BpvN0Gp6I8yiiuvm3DH0Vdc3/uuRkueUu4J9pxUN9vU6Wc
         pLZHDO/6UFppH43L9BbMVhD2XhV5AlyuP/Ef3bF8uICJFsfXU8zz78pRbILvyVlSVu4r
         MwAqLQglh7K02uIUBBhDmktjrd+V3O5OyAJkl2gN5TNvB7NrBUJFL6pEKKAYA59Xn8r9
         CYOS/xaf5zjky8aSx07FJ9UsUe6dZX5yJMiUQDKOpCm703/nP6IgehMwqbI+YODyhw3f
         SqLzwYUVILr6wXLPd8+hKsp44qhbjl4sT4oWQ0GUyefsvAFIalJZgaQiDvUkRgSTnhwH
         eYPw==
X-Gm-Message-State: AOAM530LVfAys1wyD52Ix2JFfy3vsWnLbsJRBKWyxnqCcle9L71+kxAS
        q7RQOoupLDHuO71D70NgpQOZ3A==
X-Google-Smtp-Source: ABdhPJwd5bR54OWgpgBTnm6xH0X8VpmlK7vpSuR0Oz+hSNYVch3S//NX4ZCB3JzVG85QOgXpbg0aOw==
X-Received: by 2002:a17:902:e851:b029:eb:1fd0:fa8e with SMTP id t17-20020a170902e851b02900eb1fd0fa8emr1262234plg.38.1618450738773;
        Wed, 14 Apr 2021 18:38:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o9sm516255pfh.217.2021.04.14.18.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 18:38:58 -0700 (PDT)
Date:   Wed, 14 Apr 2021 18:38:56 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <202104141820.7DDE15A30@keescook>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
 <CANiq72mSMtfdRFPGJKuoqCBFdsa_xHvx9ATjcB7QSunQdDHBuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mSMtfdRFPGJKuoqCBFdsa_xHvx9ATjcB7QSunQdDHBuw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Before anything else: yay! I'm really glad to see this RFC officially
hit LKML. :)

On Wed, Apr 14, 2021 at 10:20:51PM +0200, Miguel Ojeda wrote:
>   - On floating-point, 128-bit, etc.: the main issue is that the
> `core` library is a single big blob at the moment. I have already
> mentioned this to some Rust team folks. We will need a way to "cut"
> some things out, for instance with the "feature flags" they already
> have for other crates (or they can split `core` in to several, like
> `alloc` is for similar reasons). Or we could do it on our side
> somehow, but I prefer to avoid that (we cannot easily customize `core`
> like we can with `alloc`, because it is tied to the compiler too
> tightly).

Besides just FP, 128-bit, etc, I remain concerned about just basic
math operations. C has no way to describe the intent of integer
overflow, so the kernel was left with the only "predictable" result:
wrap around. Unfortunately, this is wrong in most cases, and we're left
with entire classes of vulnerability related to such overflows.

When originally learning Rust I was disappointed to see that (by default)
Rust similarly ignores the overflow problem, but I'm glad to see the
very intentional choices in the Rust-in-Linux design to deal with it
directly. I think the default behavior should be saturate-with-WARN
(this will match the ultimate goals of the UBSAN overflow support[1][2]
in the C portions of the kernel). Rust code wanting wrapping/checking
can expressly use those. The list of exploitable overflows is loooong,
and this will remain a weakness in Rust unless we get it right from
the start. What's not clear to me is if it's better to say "math with
undeclared overflow expectation" will saturate" or to say "all math must
declare its overflow expectation".

-Kees

[1] https://github.com/KSPP/linux/issues/26
[2] https://github.com/KSPP/linux/issues/27

-- 
Kees Cook
