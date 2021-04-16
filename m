Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FC5362648
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 19:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235590AbhDPRGC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 13:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234774AbhDPRGB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 13:06:01 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EC1C061574
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Apr 2021 10:05:36 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i10so9927046lfe.11
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Apr 2021 10:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AcDAVQ+0h+jENPZeM69/kZwGZfdDXc/0125nsKSlnZg=;
        b=dnz1bYqVAlRM6259A+dx+Rc2q9Qis0LBOOOmkDKaY6WJu06OAB3WTXaPaSSbSH2kHN
         CUxAYJW2MSUb6KLd9VHkZqoeTvqRIILdDBdw4/TbIMff3ssQa3bNYa96Mu2MipKekQxe
         RdIn9i/ob2oUe8MI005glSrjfmJXy7RQVtkC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AcDAVQ+0h+jENPZeM69/kZwGZfdDXc/0125nsKSlnZg=;
        b=IiDdMPuF8NBaB+aWk7r7Z1NbKPWMSGoMaLvpyF78c7b4uN4j91wqQ1Dm3h0P8kPc8M
         Keu3ooUdsW08XoTuE3fkTOzAugvEe+yvkX7h5ceYbI1g5Trjx6o2nYQC2n+emVKNz+n8
         gjDya5IDZ+TTDylz3c7p8IPXrEa+rJ3V+2iYMoIHTTeHszdzfLJLJc8MBhdvu4/VDjNu
         k7LnvRQhPNMyXVq69ZXGKRs/HOtJc53AGQhlgVM6zApXR6eALGFWxNphdtJYKxYPUFsc
         AMfwzkqz9LqL6qFlKM3TPMJdMXmiu1zW/FoOY2WLEwFl9NjH//uhCLjMikoJHAfdEY+o
         rBRQ==
X-Gm-Message-State: AOAM5329GChF8TfWH2GcBC6xJCODn1KZ2BN7Fkk5fHDJSap0+l4LFQrt
        xRZ+tRvL6okEGwbqcoWvybiGTeEY/GqG99Dh
X-Google-Smtp-Source: ABdhPJzQfDa10GsGHoTQyvLn8PIi2KkOSyUM4qt+ZNzDADTWhA9CXmhg54Cc+p6YGez5+rcXGVnVSA==
X-Received: by 2002:a19:68b:: with SMTP id 133mr3634106lfg.151.1618592735355;
        Fri, 16 Apr 2021 10:05:35 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id w23sm1034984lfu.132.2021.04.16.10.05.34
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 10:05:35 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id x20so15526138lfu.6
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Apr 2021 10:05:34 -0700 (PDT)
X-Received: by 2002:a05:6512:1286:: with SMTP id u6mr3571784lfs.377.1618592734654;
 Fri, 16 Apr 2021 10:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
In-Reply-To: <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 16 Apr 2021 10:05:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
Message-ID: <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     ojeda@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Fri, Apr 16, 2021 at 6:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> AFAICT rust has try/throw/catch exception handling (like
> C++/Java/others) which is typically implemented with stack unwinding of
> its own.

I was assuming that the kernel side would never do that.

There's some kind of "catch_unwind()" thing that catches a Rust
"panic!" thing, but I think it's basically useless for the kernel.

Typical Rust error handling should match the regular kernel
IS_ERR/ERR_PTR/PTR_ERR model fairly well, although the syntax is
fairly different (and it's not limited to pointers).

                Linus
