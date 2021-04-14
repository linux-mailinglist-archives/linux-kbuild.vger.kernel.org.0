Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56AFB35FC84
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 22:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242133AbhDNUWe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 16:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbhDNUWd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 16:22:33 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13C5C061756
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 13:22:10 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z13so18290317lfd.9
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 13:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6thTORuT8bN7jwK094fMT/y8sU4GZakkr5R6ovUTdHI=;
        b=UAoa76Qtsf0pbMc9IJqG9ooEMfjhEIrknCxndD8VY6cPrguml69YvPFqGmlzuBSQzh
         FrdelVohMGw/UXPitS8jaS0vYBU01i6SIHCs/u+B0uDNa1/+o7AFCQGtYFo/uY/vW9FE
         e35iod5n6V1pTvp83DTqqYHvpeFqDSO7Dx/Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6thTORuT8bN7jwK094fMT/y8sU4GZakkr5R6ovUTdHI=;
        b=syIV20NB1NrIfAsvg04vjcpJ1Y3dnqK8otwIGRiQQKrRweVOwOufMIKsneYzAJH3gN
         pNJs2sr0Y6ayXMbogfzxjkV7pEqBAeT5ve6SEl5NRS4kUpOCnFxbTB4vCtVJrG+kbkU6
         cvjBi4gpFgY7bxq/73NsWdRLaULU8rMmS/atNj2hHk4uLicOSY0YYLeTlyu3KHZqmYT/
         ditStl7nIgysb5XbJF7UniTPgJz6Fir82nunUlPhRh2NhB7AXLTKT19C/tFXm9Jo/QtY
         kEfpoF4UrFpmCdBxxtEhkSvrVXzs2M/w+Zng/WFK76RLpOedvmHS3iLUefawVelMGVhS
         qcxw==
X-Gm-Message-State: AOAM533tNT1WgohKeW+2sFTcVx8gJObrIXsbTLZ55+MN2watbw13gIfu
        go/dkKWHXkR/RiB1I9hZlA03esxX7e8hILOz
X-Google-Smtp-Source: ABdhPJzL59AgYGUlwLk1SBjDl++/U3Naq4fKY0itDyJf/Xhgb+EZZIVxlTf9MtXVajoNMmMQk1LhMw==
X-Received: by 2002:a19:ac48:: with SMTP id r8mr20447073lfc.196.1618431728861;
        Wed, 14 Apr 2021 13:22:08 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id i22sm197893lfv.120.2021.04.14.13.22.08
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 13:22:08 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id r8so35186082lfp.10
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 13:22:08 -0700 (PDT)
X-Received: by 2002:a05:6512:1286:: with SMTP id u6mr16109842lfs.377.1618431727841;
 Wed, 14 Apr 2021 13:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414200953.GX2531743@casper.infradead.org>
In-Reply-To: <20210414200953.GX2531743@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 13:21:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdhVW3+YFHG5Le=mZMYf3mGjgv1f-Td=254bj9fYd7fg@mail.gmail.com>
Message-ID: <CAHk-=wgdhVW3+YFHG5Le=mZMYf3mGjgv1f-Td=254bj9fYd7fg@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Matthew Wilcox <willy@infradead.org>
Cc:     ojeda@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 1:10 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> There's a philosophical point to be discussed here which you're skating
> right over!  Should rust-in-the-linux-kernel provide the same memory
> allocation APIs as the rust-standard-library, or should it provide a Rusty
> API to the standard-linux-memory-allocation APIs?

Yeah, I think that the standard Rust API may simply not be acceptable
inside the kernel, if it has similar behavior to the (completely
broken) C++ "new" operator.

So anything that does "panic!" in the normal Rust API model needs to
be (statically) caught, and never exposed as an actual call to
"panic()/BUG()" in the kernel.

So "Result<T, E>" is basically the way to go, and if the standard Rust
library alloc() model is based on "panic!" then that kind of model
must simply not be used in the kernel.

             Linus

           Linus
