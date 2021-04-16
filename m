Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D809362594
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 18:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235281AbhDPQWC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 12:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235239AbhDPQV7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 12:21:59 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011B1C061756;
        Fri, 16 Apr 2021 09:21:34 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id y2so28633687ybq.13;
        Fri, 16 Apr 2021 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nCFii6aJURTER/vfLe/clZtaLhbRcW3ObBSmtuLHRng=;
        b=G34k3IkIwnzBMEEu+9qUraK5dQ02qIeP5EpIR1F/LZJEN7swi+5OcAJv3OIdzCWHkT
         ajBsfK5XFuDbxtX19Dx1EwRQMQNVmLF0P68KANot3JYXO56KT7S6pQjIKSK9tFffc7Uv
         TRVqxZKBtxwAFbj7rdPjyF4x5os+/RPhiR8IAEB/oUxs70Qj6IRMgy6nv/LKbCta+rGt
         tYwSYq8WYQNXjtyNbJ3FJhBu6vIPyZrIK/M+Rv7PO9A8gksEDp6aVeOYaB3vtX0LQtc3
         NWxQRdgMLI39DABjOaaPFlZjRyqx0+Da8mXle8uyvCgJjsj5dNyiU0o5YRCxgrt9FDHQ
         z/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nCFii6aJURTER/vfLe/clZtaLhbRcW3ObBSmtuLHRng=;
        b=SpyjijjlSAmP+XcS6EkJwA3KZ1ii7S3s4y7ABXHIx3IQEe1N7UIX0MHtRFYtdV2Teh
         28uP0eemiq7z0toE9TSiMOPuwenWPl3T1ct/usPY+vZlcUH7RZJLBz6b5uJtifVhCxN6
         i8P9sTEelaujoIMnkv4tA8xbHq9dklOKZYTjVbBEAaufFV1C0mU8GD2x2wZSla5SXY11
         q3L5iZMn8l5yGosgxgB7rV7GTYcan2jtKwdS0EYVQzErlS8mhxg8YGdg9zTx9HO77s5q
         Hk9wmroolx7LS2aKzQqIrUBbRzBcQI8Pz3KHz5ya62BQgpkHXNAyM7BKzBb9aG/rxROy
         j3ow==
X-Gm-Message-State: AOAM531F0Qeo4vGiEUoCoRJ/rcGqeCLdNuH2HvJG4EunQiERMxHl8ka+
        7PRsVuaAojYWmP2SY2QsNPv4EhJ4bD/Uq2FjbNo=
X-Google-Smtp-Source: ABdhPJy0Kixp3R8ObQCt6v/sL9MlswTFyXDE0CI1Ld7MwO5Tg0SWFJ801+kzVKHbmrATrM0JCfiFa59z/M50dEcsepg=
X-Received: by 2002:a25:7909:: with SMTP id u9mr12483269ybc.22.1618590093378;
 Fri, 16 Apr 2021 09:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com> <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <CANiq72n9ocqaFQnOjUO95_7Xd3wpWShtzMKrBQE2gN8jOyrW5g@mail.gmail.com> <YHmwoe8+mNPBFm1R@hirez.programming.kicks-ass.net>
In-Reply-To: <YHmwoe8+mNPBFm1R@hirez.programming.kicks-ass.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 18:21:22 +0200
Message-ID: <CANiq72=2g3nrbT9r-9=vW0toHgByLmzh2vYfWPGs6tUGLB9Y4g@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 5:43 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2659.htm
>
> That's just not making any damn sense what so ever. That seems to be
> about sprinkling abort() all over the place, which is just total
> rubbish.

No, it is not about that. It is semantically a no-op: N2659 is not
about a safe subset of C -- it just triggered discussions about it in
the reflector.

The point is that we think it is important to improve C for the kernel
too. We are not working on bringing Rust to the kernel "just because
we want Rust", but because we believe it has a sizable amount of
advantages that outweigh the costs.

Cheers,
Miguel
