Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7058335FB89
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353285AbhDNTUE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353262AbhDNTUB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:20:01 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28B3C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 12:19:39 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id e14so22247906lfn.11
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 12:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2NCuqqnTNRZqz4gVa7VmF8X9q5BSGA2MnI49n6bMs7A=;
        b=dCmT2JevlN2Um24EUlGKuB1noKIv7ps6g0KvoFc8NO7f9Egls/Mith+iaPjQtsQfnr
         V3m5Niy5LYKZYm6IIrt5kn+7wbQBG2dzlRjqlgBgfDXYfOc9ZchG7DC8UHzaS3kiP/3M
         I5Wq5Fh4vLEyyOX6IyyZ6+LRoWZP+OivJSbUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2NCuqqnTNRZqz4gVa7VmF8X9q5BSGA2MnI49n6bMs7A=;
        b=Yy5GAPatw2NsGjXlyEhbKvwXOWwkJDiBhcbVdvUVI4ziD/ejmQ1HGvbrMIKAcN4T8U
         ojWo2rFKPQEy74LYZKNVhtBZWCdjbSjQqBSVojEhmS5IQFwW4h/ybdxrFn6hNt48Kwuj
         inE8OFwKcR5FSKaGjFyrSs92TzFJcJz3hRZ1TE2wY1tQUfBZOZuv2IP+hXfG8Hh4EhXC
         roBM5f1tceA6tRz+ijttxIi85hv6fgYze5LcCzjXAI/6qSXwSu4DLXqy3SeVYnbWDhrZ
         ZBvi2RLIFdw8Heb3zqBsjqiqxha3wsDLoRMN3z2Donzy+Q8ccMZC4uVbBuY1IB4xw5nw
         PzyA==
X-Gm-Message-State: AOAM5331J6qbSTPZ4OiQ2SAf/XrxdfkVrFuj57VTc1bY/D7h8edLOyxS
        GHBB0WH+PsG62GBm7S2hHbicHRk98fnwE+mP
X-Google-Smtp-Source: ABdhPJwV64c1/xPnrRBNTK/c7c36mEqP88eMlDeDbjrOnWvoYdoGVElLPuXcctZcci0HB9zPig4TUA==
X-Received: by 2002:a05:6512:3047:: with SMTP id b7mr10708422lfb.598.1618427978173;
        Wed, 14 Apr 2021 12:19:38 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id g29sm151835lfj.267.2021.04.14.12.19.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:19:37 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 12so34900494lfq.13
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 12:19:36 -0700 (PDT)
X-Received: by 2002:a05:6512:31c7:: with SMTP id j7mr18301122lfe.41.1618427976755;
 Wed, 14 Apr 2021 12:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-6-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-6-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:19:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJvJJtd2mpYpx5+zn_hPrSOqGqi-Pxb7e+h+anhsLnQg@mail.gmail.com>
Message-ID: <CAHk-=wgJvJJtd2mpYpx5+zn_hPrSOqGqi-Pxb7e+h+anhsLnQg@mail.gmail.com>
Subject: Re: [PATCH 05/13] Rust: Compiler builtins crate
To:     ojeda@kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 11:46 AM <ojeda@kernel.org> wrote:
>
> We also need a helpers C source file to contain some forwarders
> to C macros and inlined functions. For the moment, we only need it
> to call the `BUG()` macro, but we will be adding more later.

Not being a Rust person, I can only guess based on random pattern
matching, but this _looks_ like these "panicking intrinsics" panic at
run-time (by calling BUG()).

Is there some way these things could cause built-time link errors
instead, so that if somebody uses 128-bit shifts, or floating point
ops in the rust code, they show up as build failures, not as run-time
ones?

Hmm?

          Linus
