Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C54362724
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 19:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240778AbhDPRsJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 13:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235563AbhDPRsI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 13:48:08 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE233C061574;
        Fri, 16 Apr 2021 10:47:43 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id c195so30995859ybf.9;
        Fri, 16 Apr 2021 10:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9B3zLmsWW5JKnyeoXM62mq4ssLBBmbVfc6OxFpsrw9I=;
        b=hdcPyZUnuJB055x0jdoEeJrjGBSst+PTFbMj7iIqIkrtWwKEUAL/YVdX2GFEh6SsZU
         8WnfOHuG3US0GLHO3t7mRdptyFSOC3HNdtyOAutUEs/zw21sq5+h0oSsd1CGV71oiBmy
         9mI4rLxxTFdvbytHIaSOfiVecGSrq9SJONPZdPlKRt4s12EZbTpnC1OmGvTXlBHHlBTd
         rlaec/DMmHKTjbfdCxn3pm4z+Rv3rjVSxwGnw7m39LDA66AllX2JXRUM0a76go1f+Zcg
         JFP2QbyIiuouH5IsTOsjDnlU7QBrlKxRkIkF+GSHB+gyyJRmeafavZFcQNxUapwZO3RW
         CLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9B3zLmsWW5JKnyeoXM62mq4ssLBBmbVfc6OxFpsrw9I=;
        b=CDG2MKLvYyTMGHOe6xqQdIi3DS42pZS/8Hn9PBUm/l45DPF/X0RFIjptexp/28Gtn8
         aeIYVvaDk4fKYDBBeBhdegog7Tt3+Rf80hlNBsTxcrYTZpHzI6Ccmn5TLy/Y99iKEtF9
         2tTkpo8HjurGk8Y+/qPGnM30jahHOaVRdmXkqu17/mPfcsKvo7AW3C4JuB/Lg+3bIYYo
         5A/NGsvLjqTwPuziCyjFRRLUCnMIBGiUbv2YAXkwQi7AjORtEMbJcWpkQQeMWdkbdbVk
         2lOeRHDhD+3FcjsyTOyUBcyk+Dfj5V1eNjKhRHXpo9qnUk22crou8c7IkB6t9YCXAVTc
         S6qw==
X-Gm-Message-State: AOAM5330GCoEOqSAmQpQzxvo84xAiu19nnoR2xDP72kxJQJMRXFFjX6g
        5y/rihZDt+VHbwwuuR0WnNDc4lRhu0IoMrKWyQ8=
X-Google-Smtp-Source: ABdhPJzeRdmS95ayxhHbmPvr3HkEAHY/TbsX02E5nIbHerewe4bZjGqCyv67ELdtn+0Xhv0lZ2rxo0wxExt5A/CiwNM=
X-Received: by 2002:a25:bfc9:: with SMTP id q9mr360954ybm.33.1618595263104;
 Fri, 16 Apr 2021 10:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net> <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
In-Reply-To: <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 19:47:32 +0200
Message-ID: <CANiq72nx7ngazsH7sZgc=HeU0cNj45F9+-rwQb7AkdYsRCmRbQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 7:05 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Typical Rust error handling should match the regular kernel
> IS_ERR/ERR_PTR/PTR_ERR model fairly well, although the syntax is
> fairly different (and it's not limited to pointers).

Yeah, exactly. We already have a `KernelResult<T>` type which is a
`Result<T, Error>`, where `Error` is a wrapper for the usual kernel
int errors.

So, for instance, a function that can either fail or return `Data`
would have a declaration like:

    pub fn foo() -> KernelResult<Data>

A caller that needs to handle the error can use pattern matching or
one of the methods in `Result`. And if they only need to bubble the
error up, they can use the ? operator:

    pub fn bar() -> KernelResult<Data> {
        let data = foo()?;

        // `data` is already a `Data` here, not a `KernelResult<Data>`
    }

Cheers,
Miguel
