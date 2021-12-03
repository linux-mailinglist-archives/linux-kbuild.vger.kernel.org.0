Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00724680DE
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Dec 2021 00:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354390AbhLCXtH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Dec 2021 18:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354423AbhLCXtH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Dec 2021 18:49:07 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7261C061359
        for <linux-kbuild@vger.kernel.org>; Fri,  3 Dec 2021 15:45:42 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso5378027otj.11
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Dec 2021 15:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=60reH7R0DIOnYiDzjJxXKxDAKSmQYMrrZWuqMItQwS0=;
        b=lwLR59toSKg0d3DkxASJYGkZ8L16glxKUaDTTvF+88eWEDzjr4kjtxvRl33PVBnKDD
         htg85jvk5miIto3O0oC10nexmnVRUMkm0LPTObzhAaHdC9pSe7CF2JCNF75x/WGIkOG3
         PM1RuTN6Nhu5/g4qGlmgmqHRM2UZSR8UXi8+g/rcskGP7alvFuGEMFDeGahQ1pLEjsrX
         Z6EFmUfQjhtG/4rRPSVC1kWoUh+nSdz2aRIUoHXdKW8VYEFiDZIrfgmJAN7aC4i78hhh
         MVVhyQh/Hs2vmX+fTK9085aBpBW56vEUhxfheI0Ytpw8QrKAGkDBvIXT/x3LUmzXzWvU
         D5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=60reH7R0DIOnYiDzjJxXKxDAKSmQYMrrZWuqMItQwS0=;
        b=MZtfE/FbArqhBqdHXnH2Ed5FOimQl3Z6dDs3L/M0daMDKSk0EBUeKHJJHLNd7dpYke
         588M2YUEDFwyyGrN7ROojO1xSeAwuc0eFnarq9K2QtOtjYHDXHy7ikiynl8eOdoWE44n
         ip/EFrHL9NkDg1GJLh8G5AblqjZKCZLbPwzrF4M+3yUN7KG+Uo7pxvGUtG36jIJ3DQ/3
         slb6nqhoSBVcXpVUvRrQvn38hDVLGjVABp5TcW50TiPZuvLhrxLl5KkOsad54f+za7FK
         6H6AYn9iF+1wYWyKcBkm6L/D3rmQZLKKxb8y8H6tPtXXCG0g1DXxwPzS13T9hvWLtJ6n
         cunw==
X-Gm-Message-State: AOAM530GWwuWxMOpq5YgDhP3WqIcS2Jp6F1xrnTj4xwj5cg9ust1OGDR
        beZzk2pehK2lWC4ynrLVurlqmtSq+874Hajt0V/CZg==
X-Google-Smtp-Source: ABdhPJwprIsuAE81kQhNwY2u7JUyLZ0Gf1lKN54zx/jf0D8m6dhbAAqy4FkFq551WfGByrnkVKj8Umhm/PE2NQckFns=
X-Received: by 2002:a9d:77d1:: with SMTP id w17mr18546120otl.329.1638575142007;
 Fri, 03 Dec 2021 15:45:42 -0800 (PST)
MIME-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com> <20211130114433.2580590-5-elver@google.com>
 <YanbzWyhR0LwdinE@elver.google.com> <20211203165020.GR641268@paulmck-ThinkPad-P17-Gen-1>
 <20211203210856.GA712591@paulmck-ThinkPad-P17-Gen-1> <20211203234218.GA3308268@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20211203234218.GA3308268@paulmck-ThinkPad-P17-Gen-1>
From:   Marco Elver <elver@google.com>
Date:   Sat, 4 Dec 2021 00:45:30 +0100
Message-ID: <CANpmjNNUinNdBBOVbAgQQYCJVftgUfQQZyPSchWhyVRyjWpedA@mail.gmail.com>
Subject: Re: [PATCH v3 04/25] kcsan: Add core support for a subset of weak
 memory modeling
To:     paulmck@kernel.org
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, llvm@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 4 Dec 2021 at 00:42, Paul E. McKenney <paulmck@kernel.org> wrote:
[...]
> And to further extend this bug report, the following patch suppresses
> the error.
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit d157b802f05bd12cf40bef7a73ca6914b85c865e
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Fri Dec 3 15:35:29 2021 -0800
>
>     kcsan: selftest: Move test spinlock to static global

Indeed, that will fix the selftest. The kcsan_test has the same
problem (+1 extra problem).

We raced sending the fix. :-)
I hope this patch works for you:
https://lkml.kernel.org/r/20211203233817.2815340-1-elver@google.com

Thanks,
-- Marco
