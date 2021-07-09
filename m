Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B224B3C25FC
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jul 2021 16:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhGIOfX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jul 2021 10:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhGIOfW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jul 2021 10:35:22 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6EEC0613DD;
        Fri,  9 Jul 2021 07:32:39 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id y8so12595478iop.13;
        Fri, 09 Jul 2021 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9iI9BBIN5ChfEI3FnxPdXxRRh4SsTOQ85Lm4ab50ZgU=;
        b=qTdTyUG2DaXjYQnvicuCU4wXgYVOIsZZ/gTmsMhPyGAYSSbCmQze7jcXn1myhKDH/E
         TLnHapoaZv0JcSyWRb7pvTNAsL4xhbhsohPMTufJJlsn6p+suF+fJfWtJkIUhJj5VfLR
         eKB/cVmq8UJroy6uZNOukKxKq8WjW7NYpF2zWeW91YAs5vzrOIHLvxaGqAGaTURQ/i0a
         xiZ1/ZwV+TUysnyvCa4VMkkFjlEP0WbT5GpcGD/caX3OzazowH55A3ptBc7o3m6X35aR
         rTt0o9TEv0J5+7cf2/QprWB2VWGA0lZxCLGlb6YQGIA+oM1LnNzu+y7I228AvUIterk/
         IAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9iI9BBIN5ChfEI3FnxPdXxRRh4SsTOQ85Lm4ab50ZgU=;
        b=h+bb+Y2ty98VFt8SmxZgVjJGEPIUOIW4mXlTCPpQLmk3joyzARYf+f2/ZQzirJIQ+K
         I8pkM8Y2BtgHfxmoCBF2r0YWE1K9nbX8YJv1GX1DgczkfhGPTlwcEpPlDnaagE8dJoyD
         XDjbAC/WX6W9pyF0zxr+u8fGEsev2tPBzX7wUxLX+SJBIUomCsNVszJHtTcSgoQnfUcW
         zqy/qhEPcSsMDW5a0YCL9XgDpcHf6L3WFykh4VCHbmjgULEsJJG3NbcjOnvaFlp2OmuX
         UM0Tmh7iZEEv6vUAqXO32GHwyCdJSK5VuwQG544+h/nEt3w1aEUBxruG6TY9C3Vhr7OH
         E5bg==
X-Gm-Message-State: AOAM531lic+BRvw6C/SYvn8YeXN6TZ0rSGiLN/z+JtaVXIrHBWUp/qXl
        TZz6LXjeHDO8yatE6a3Nhfv7bNmuQ/e3WkpxzuVzIARc0hEQ0A==
X-Google-Smtp-Source: ABdhPJwl0slWLkp3njIXYUBIMzEac6RkQRP7LsshuulJGZdJ5sz0WTWz/hY95X6eyXwS9K5zWEXwo0GqWHqdenJVfR0=
X-Received: by 2002:a02:a310:: with SMTP id q16mr33022208jai.8.1625841158612;
 Fri, 09 Jul 2021 07:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-6-ojeda@kernel.org>
 <YOV/oj0rjHhzluH2@elver.google.com>
In-Reply-To: <YOV/oj0rjHhzluH2@elver.google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jul 2021 16:32:27 +0200
Message-ID: <CANiq72=DSGH0PAz_oKDMG_YQAWbKLW_6jUeGCwdV6_ZnwPLrLQ@mail.gmail.com>
Subject: Re: [PATCH 05/17] rust: add C helpers
To:     Marco Elver <elver@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
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
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>,
        Yuki Okushi <jtitor@2k36.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 7, 2021 at 12:19 PM 'Marco Elver' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> What is the story with Rust and LTO? Intuitively, I would expect Rust
> code to only perform optimally if the kernel is built with LTO
> (currently only supported via Clang).

Cross-language LTO is possible and is used in other major projects.
For instance, Firefox seems to use it:

    https://bugzilla.mozilla.org/show_bug.cgi?id=1486042

However, we have not taken a look at it yet for the kernel.

> Because if calls to every one of these helpers are real calls, I would
> expect performance to be pretty poor. There's probably a reason these
> are macros or inlinable functions.

Maybe -- we need to measure.

> I would almost go so far and suggest that CONFIG_RUST be modified as
> follows:

Even if the performance was unacceptable, there are other ways than
LTO to solve this, such as implementing the equivalent macro/function
on Rust's side.

Furthermore, we need to consider GCC too.

Thus I would not be premature in making it depend on LTO.

Cheers,
Miguel
