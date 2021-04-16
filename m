Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4703626EB
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 19:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235875AbhDPRf3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 13:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbhDPRf3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 13:35:29 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C27C061574;
        Fri, 16 Apr 2021 10:35:02 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id z1so30953338ybf.6;
        Fri, 16 Apr 2021 10:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5ujEctmO69nrSka+iEnrG7VWcba8Cvxge7HQMR22pA=;
        b=KMeJ/ud3DQLRV9ASlApoOyrI3MlIFDADDczD+1raBVdLUlgRh/T4jJOvjyk4Sfd9Z5
         G8AFBvMBYElsJyzt5gRj/hkV89x4wKQ8gmkbjjtE3M+QyPxFbgisby4xaOugXh7YzyVk
         PVRqLfp9Vss89KSRv3pQ16OwyKEyA3VF0C4tX2KygKmN2JyYn01g8EfLtrioZXOcMGae
         spvQr09baCdgx5LM2eyti/UE09W1taXgUXJnwrNt2m/Q8Wcb9iWTB8ci4l6bZVURmGrn
         lYVVq9yA6JKmQatiNc1tNuARggX4YmTCbG2OlPjFw4oR8p007Rs/eBz4tsxt95lvUX8m
         9exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5ujEctmO69nrSka+iEnrG7VWcba8Cvxge7HQMR22pA=;
        b=VIbD1/O1fMMtzpi6GL6KMR5X+MPxS43mLCxY2EsY+lM9p0n3qf0lUamr/XfbzqJU+j
         FoZZ0NsNPae1VEMVepfxn1snfe99wi/uMPPNelSOToGdJVdsr2jQYsbKIadKwarJCzbf
         myzCjiK/l5UlTu8ICKTtY8u7CdmztP+3uAfttci8Lxt8uKjUv4uZer6BkMJLO0yLMRX9
         QudouLXtwSX7Rg+uwQ0Bues3/rVdbDUzCbKawGmDC6ymEHnl/by/K0PYgcLr9fvDykSY
         iPc6WmxrxHnEclh7tSG/0QhuB8iQt0p7qpcAVhYU+B7zqL1NL65k/T/YeNa7+166vm7a
         6awg==
X-Gm-Message-State: AOAM533HCkfnR3jbx+FZm5L30FeVJ5erEI8XA+Wr16W7Ap6QJSTwYPS+
        YA+Hn4fvQtcq70HU4x//Y3tPfzDoqqKr+4I4HRo=
X-Google-Smtp-Source: ABdhPJzcG78cYSn/9ve3vuSXFsPX0vq0E3YYa4C7oemwpsSwZC5DNbnaBXJ66rA31FUswwjnLnDs2uVQqx/M2CO/x/U=
X-Received: by 2002:a25:cfc2:: with SMTP id f185mr382573ybg.26.1618594502305;
 Fri, 16 Apr 2021 10:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
In-Reply-To: <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 19:34:51 +0200
Message-ID: <CANiq72nv8CK8cyY4n3yqpL6GAmqmVP5+Ee-cgzT9Gi+ZRLE_Jw@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
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

On Fri, Apr 16, 2021 at 3:38 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> So if I read all this right, rust compiles to .o and, like any other .o
> file is then fed into objtool (for x86_64). Did you have any problems
> with objtool? Does it generate correct ORC unwind information?

I opened an issue a while ago to take a closer look at the ORC
unwinder etc., so it is in my radar (thanks for raising it up,
nevertheless!).

Currently, causing a panic in a nested non-inlined function (f -> g ->
h) in one of the samples with the ORC unwinder enabled gives me
something like:

[    0.903456]  rust_begin_unwind+0x9/0x10
[    0.903456]  ? _RNvNtCsbDqzXfLQacH_4core9panicking9panic_fmt+0x29/0x30
[    0.903456]  ? _RNvNtCsbDqzXfLQacH_4core9panicking5panic+0x44/0x50
[    0.903456]  ? _RNvCsbDqzXfLQacH_12rust_minimal1h+0x1c/0x20
[    0.903456]  ? _RNvCsbDqzXfLQacH_12rust_minimal1g+0x9/0x10
[    0.903456]  ? _RNvCsbDqzXfLQacH_12rust_minimal1f+0x9/0x10
[    0.903456]  ?
_RNvXCsbDqzXfLQacH_12rust_minimalNtB2_11RustMinimalNtCsbDqzXfLQacH_6kernel12KernelModule4init+0x73/0x80
[    0.903456]  ? _RNvXsa_NtCsbDqzXfLQacH_4core3fmtbNtB5_5Debug3fmt+0x30/0x30
[    0.903456]  ? __rust_minimal_init+0x11/0x20

But it also shows this one below:

[    0.903456]  ?
_RNvXs5_NtCsbDqzXfLQacH_11rust_binder11range_allocNtB5_15DescriptorStateNtNtCsbDqzXfLQacH_4core3fmt5Debug3fmt+0x60/0x60

So something does not look correct.

> AFAICT rust has try/throw/catch exception handling (like
> C++/Java/others) which is typically implemented with stack unwinding of
> its own.

Rust has optional unwinding for panics, yeah, but we don't enable it.
Instead, we tell the compiler to use its "abort" panic strategy. In
the handler currently we just call `BUG()`, but we will need to do
something less aggressive (e.g. kill the current thread).

But please note that it is not our plan to rely on panics for normal
error conditions. For instance, the allocations currently panic due to
our re-use of `alloc`, but will be fallible eventually (`Result`
etc.).

Cheers,
Miguel
