Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF8BD364CB9
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 23:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240257AbhDSVEJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 17:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238515AbhDSVEF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 17:04:05 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB1BC06174A;
        Mon, 19 Apr 2021 14:03:35 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id n12so40416362ybf.8;
        Mon, 19 Apr 2021 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DZAiVp0HPCvt+Q56acSFAC0/xsTpWCSEtHLPhq6sng4=;
        b=o3qng/pgSCa3Dc0G3aIezrIFgv7cqh67a4iPOYbRdaupA4JvOOk3fYkh0SBurKEOEf
         wXMiChhj3YBk5t5xIaEJYyb+NLTCVMSVklY8FDIESon1UoDL6cOmEdfVXwC5ooQA+M2i
         g/0o2wQxsOeIzX+AYGCyjX3pP78UodlqfzYkKPOvsqKRKg5lUF+aK0XdQn+6y0ANnYKA
         +Xt7LcxFHKxwEtJuTtej6qSWhPRAntsvto2U1crY22pCcbiPzu5OFPH8tKzJTvXipQTY
         C2aOxVrGtVQ6N2ZNLmMdIjOt1cpNcYsgR6X52kpvX0Napke6++67gL01OQrWJ22QlfrO
         5OdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DZAiVp0HPCvt+Q56acSFAC0/xsTpWCSEtHLPhq6sng4=;
        b=c5PTm7tYez22eWnO/qML8C/u2DfqJ85S1Hf6loak+6BbIRJxxI0fu85XF+VdwiWFJ0
         a3RGPKauWepAy4msqNWbUYC3oGN9y5tprF7rP0nQ0OlRWzE5Y9tw5iZlYe43x4QxKAmn
         EOekmzdDmW3G9xD60dCyyUjpsTWt0a9oJWC2NwXj3vm39pivLisC2Yh86V03TcdCNQq/
         jT+Gi35cMIZ/wSrhG38YBgq+JdKcjg56eaYA1hILpNszQZVJptHhkvXIX8ZuB5EGUns8
         43EptjwWh3cdgILubp8wR3OsKCk7JP3EJrP8GNXyWN9y01Bdg9onl0zBpMbk+ATVW/9I
         1Xdg==
X-Gm-Message-State: AOAM530HFyZAyW1vNGfwAnXEpe9oLI3ps1JvFfFqdT+HKlaaD5MREUUA
        MXzcKQNeRDqBzVsCac3SlYjQOWac5CtHHYl0Bfw=
X-Google-Smtp-Source: ABdhPJzF9sMh9cOnjNPTMM1z36oacvvQp41KT6/gWqFIoMoPpF3w9DNvmYGArCtMKt+Zzc2qVEbQR2ds1LQ7DPk8pRU=
X-Received: by 2002:a25:6803:: with SMTP id d3mr20848597ybc.422.1618866213945;
 Mon, 19 Apr 2021 14:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net> <CANiq72nv8CK8cyY4n3yqpL6GAmqmVP5+Ee-cgzT9Gi+ZRLE_Jw@mail.gmail.com>
 <20210419195850.GV7604@twin.jikos.cz> <20210419201721.GF2531743@casper.infradead.org>
In-Reply-To: <20210419201721.GF2531743@casper.infradead.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 19 Apr 2021 23:03:23 +0200
Message-ID: <CANiq72kEUEskKC=qA5q1ZiAJC9KKUcndVh6iZx_vJ1P=injF-g@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Matthew Wilcox <willy@infradead.org>
Cc:     dsterba@suse.cz, Peter Zijlstra <peterz@infradead.org>,
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

On Mon, Apr 19, 2021 at 10:18 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> Yes, I agree, we need a better story for name mangling.
> My proposal is that we store a pretty name which matches the source
> (eg rust_binder::range_alloc) and a sha1 of the mangled symbol
> (40 bytes of uninteresting hex).  Symbol resolution is performed against
> the sha1.  Printing is of the pretty name.  It should be obvious from
> the stack trace which variant of a function is being called, no?

If the pretty name is only `rust_binder::range_alloc`, that would not
be enough, since (in this case) that is a module name (i.e. the
namespace of the `DescriptorState` type). The function being called
here is `fmt` (the one outside the `<>`), which is a method of the
`Debug` trait.

We could perhaps reduce this down to:

    rust_binder::range_alloc::DescriptorState::fmt

without much ambiguity (in most cases).

Cheers,
Miguel
