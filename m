Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348A43648E4
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 19:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbhDSRPj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 13:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233720AbhDSRPi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 13:15:38 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5E3C06174A
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Apr 2021 10:15:08 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id r20so40246751ljk.4
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Apr 2021 10:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Bmo507F/5bu9hlmYhlWeaouTUfAlwfQadzbAaH/r4I=;
        b=gcayjzMAFQp9NqJ1mxkmW9p7qdxplYx4g8F2nepPWLeSSv7PVAVP4lSvgwF3EZpGC8
         N0jUmMcI3Othw/Kf5/A+/diKhWa9czIi630LzNUbnjlAZtqOIKDcBf+1HY8yYOvY6gHU
         fg/517SMW0BITGzRRuGmitMhGwyf/Tg4Y0ATw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Bmo507F/5bu9hlmYhlWeaouTUfAlwfQadzbAaH/r4I=;
        b=KmscV55EU9IUiyomdiXUrkT3wD9AgBAZFJFAsCZosv5GvBa48UZh4k5hcg3n9hUcPD
         jkk6OHt1LSt6lHSEoZuZ2b2o6dXRw4+evoTSw4/kjlw1xNGjQw6kVjyQr0GRvOILbYdH
         EFl9wcZ04SrR7u1cUwK0WMnqePTO4TFOpVy9q7ZZ7TL+BkG/CZ/2jC9AKRiacD5txDte
         T3esuKPWmHiLDJkcmnEJ18O2oOr5WG8W6fQgbQeLtAJQeaGBhoJtBGnDd4BoRqvVpQ48
         gSYusBQHQLm0hRZ7xSOOJn7wFtBQJIp7Uk9T3lip3H17JJ5r1HEsAcODDnQIGifSbP0Z
         /dKg==
X-Gm-Message-State: AOAM532Hqs6eLH6KzekLR0sQzT0JFAkR4DBAInsRnyx7IZg8BIFA3mOq
        RVaVARvtzprhadA1glXnXpODW+KzyYwOpz2m
X-Google-Smtp-Source: ABdhPJz68AFz+GOglg2yyChS3wdH+ig4+nS6vvI31EIwG/Zp9QdY7Hyqvwr9n8+L62ASJuW9rHg4lg==
X-Received: by 2002:a2e:b17b:: with SMTP id a27mr9586845ljm.160.1618852506945;
        Mon, 19 Apr 2021 10:15:06 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id q3sm1854770ljp.62.2021.04.19.10.15.05
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 10:15:06 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id n138so57262901lfa.3
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Apr 2021 10:15:05 -0700 (PDT)
X-Received: by 2002:a05:6512:1286:: with SMTP id u6mr12627687lfs.377.1618852505431;
 Mon, 19 Apr 2021 10:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com> <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com> <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
 <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com> <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
In-Reply-To: <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 19 Apr 2021 10:14:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com>
Message-ID: <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 19, 2021 at 2:36 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> I also don't see how this is better than seq_cst.
>
> But yes, not broken, but also very much not optimal.

I continue to feel like kernel people should just entirely ignore the
C++ memory ordering standard.

It's inferior to what we already have, and simply not helpful. It
doesn't actually solve any problems as far as the kernel is concerned,
and it generates its own set of issues (ie assuming that the compiler
supports it, and assuming the compiler gets it right).

The really subtle cases that it could have been helpful for (eg RCU,
or the load-store control dependencies) were _too_ subtle for the
standard.

And I do not believe Rust changes _any_ of that.

Any kernel Rust code will simply have to follow the LKMM rules, and
use the kernel model for the interfaces. Things like the C++ memory
model is simply not _relevant_ to the kernel.

         Linus
