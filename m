Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D86364CA4
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 22:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242804AbhDSU4X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 16:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242467AbhDSU4T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 16:56:19 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF13C06138A;
        Mon, 19 Apr 2021 13:54:48 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id v3so38066000ybi.1;
        Mon, 19 Apr 2021 13:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=aCM5KvzcuaSH8PgmjA12v/xhf+h1AKtzkBArU6j5MCE=;
        b=URaTNbaExtEjXJaD8vbbSmBPhI/bVCzNjLHzcekqpOpTrJTd+Wod3riJZLQKZMxtlM
         8kEcJSMHGoYwZpQ+jv6yWVXKecEfIxKhMxX7gGxqHZHMFSXXyBefGJo+fe8RM4LyidiR
         j70TBzzKd6V59V3OGVjXgRexckD0FnpqStNJfv+c1+EM8vdhofAAmg34c4U9ZR3uZ5CP
         ryyv62cHUoSFpeTXz8ocgg6PHslmsAEt/d4aebw2LBMsa6wVy1Trcbh1oKt87ji0bFAg
         X5QOkFWt+yaeekNVX5g1y57ZMoqhho4yJCij/90EDWzhxQaydFZhymEEwyjJ/0ilvC38
         dg2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=aCM5KvzcuaSH8PgmjA12v/xhf+h1AKtzkBArU6j5MCE=;
        b=lBBSqrjek/M5/dxpw//kgFGRH7X11ZV6/JkkfFSGDIQ0+hh0wHcNLj7wthP1JCQlVa
         DpFuo3+8dNImKfEHRgypa2tNit6fJLmhVfNyyeDLNci6/r3HRf8zxGgWbhsC5MqvFIxk
         Jo28awEGtgeP6lzrVU/17/ZcqPFQzjfjCZoovDHnZJ9ZSf+ZcwP5tYFfgcUKXZjPNu8n
         jp7aMMj7RrqR5Swa7Lj5+t59rNElHeZ+EpaorMXI1VAilecb0ksGoSw/ohBn+cXPLWN6
         WCjTlT0u6+M8KK9fZ18K1HXKgy0v5ewT2tTUinps0iMOffC7Z6GRUks5Y8MNOyp3FQjc
         PBpg==
X-Gm-Message-State: AOAM530bz0jSY9KVLSUTdRvjxezdiV2hNQtr9KScU03+nnNtmmdnimjb
        BLM1z6Z6bzkNVJX9S8J/U+guWbUxUDry0srdX00=
X-Google-Smtp-Source: ABdhPJyaYIbfc4cW5qvFG9hENkVMCJYUuS82M0OwXiPIYErRHqo1pBo4NFKmv2I3CQp46FMoXxABmwEPNE+xsxALTTU=
X-Received: by 2002:a5b:912:: with SMTP id a18mr19428673ybq.247.1618865688041;
 Mon, 19 Apr 2021 13:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net> <CANiq72nv8CK8cyY4n3yqpL6GAmqmVP5+Ee-cgzT9Gi+ZRLE_Jw@mail.gmail.com>
 <20210419195850.GV7604@twin.jikos.cz>
In-Reply-To: <20210419195850.GV7604@twin.jikos.cz>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 19 Apr 2021 22:54:36 +0200
Message-ID: <CANiq72=a-xLF7rUDZ=gwYs2=G6AAa2Gsj1UoZQBdhQBuBgF+qQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     dsterba@suse.cz, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
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

Hi David,

On Mon, Apr 19, 2021 at 10:01 PM David Sterba <dsterba@suse.cz> wrote:
>
> for simple functions it's barely parseable but the following is hardly
> readable
>
> translates to
>
>   <rust_binder[8787f43e282added]::range_alloc::DescriptorState as core[8787f43e282added]::fmt::Debug>::fmt

Some details can be omitted without much problem, e.g. try the `-i`
option of `c++filt`:

    <rust_binder::range_alloc::DescriptorState as core::fmt::Debug>::fmt

Cheers,
Miguel
