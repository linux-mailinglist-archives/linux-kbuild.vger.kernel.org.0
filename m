Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05889364A18
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 20:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241110AbhDSSvn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 14:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240144AbhDSSvm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 14:51:42 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B03CC061763
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Apr 2021 11:51:12 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 12so57399053lfq.13
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Apr 2021 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mvwuk72OV8nQxYdIe9d627zTpbWzXnBqVHooi1BCdcI=;
        b=ABIAZh0Yc6gK7Ft1wtnc4ohcPbNT4AIxM87QybtInWLGgYjHUnUzGJQO+0SQtmtF+P
         SJNEk+teRDbaI1T6wAN0fGq5AdHUpbsxHIxuCmNNPS1nc9teY9xfGzk1uG6n4KgcF6pi
         rwTMC5yQwaeCnKmG5juA/gDi6ahV1DltGgDNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mvwuk72OV8nQxYdIe9d627zTpbWzXnBqVHooi1BCdcI=;
        b=UDZfgELVdpsHVA7AfqIx94+BtaxEescmp2qGLf0nGPgmAVl0hC+kYm7B/kRuP7OJ7E
         PD+Lrh0/rOJf7v3e2ELqKSUxk1QKZxp6wzaNLLehWDf0Zl8p9k3GZD+TP1NqB6gXLnFo
         x9BayrMDN9v+h53NPjNK8Pev8rpg1VrTz7gAigep4o99CKQh7WG62ymywc0RD4e0saqW
         j8y1imoabCSs2RUwx9o+mfNLfc5m96CHvr5sO0WaW+1j9lkRuaS++Hy8HpQDdljEQZIB
         KSTuP2yfsvd1dM9CO9Om2+pw/t/otjGiniABQea6xn2s5kmRJU12xbYDt+pwZw0TJavi
         2PSg==
X-Gm-Message-State: AOAM532Lq+U10azYo4JVaYikMQd8X3L2UhBnJ/1AxJASBapRaTS3gowc
        bMQsr+kl+j46U0zhSKP3tiKUPtCiYpltiKG8
X-Google-Smtp-Source: ABdhPJwSrtYTGKgJOyoUcGS7kT/bf0mpW46DloCVocd8blzbw7Gao3/c6avIRB9OH9LKRk5GnSzF/A==
X-Received: by 2002:ac2:495b:: with SMTP id o27mr8428541lfi.373.1618858270393;
        Mon, 19 Apr 2021 11:51:10 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id f8sm1929129ljn.1.2021.04.19.11.51.08
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 11:51:09 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id z8so40573022ljm.12
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Apr 2021 11:51:08 -0700 (PDT)
X-Received: by 2002:a05:651c:1117:: with SMTP id d23mr12844637ljo.220.1618858268248;
 Mon, 19 Apr 2021 11:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com> <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com> <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
 <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com> <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
 <CAHk-=wjSrOcA0567rpn1PbYkGEgnw_sOmZ13JX87isrMq1dL-Q@mail.gmail.com> <ae079b78-1c26-ddb9-fb8f-83d27ba0c5a9@redhat.com>
In-Reply-To: <ae079b78-1c26-ddb9-fb8f-83d27ba0c5a9@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 19 Apr 2021 11:50:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiqX=uweoE+4hUTSLRsR87u2WAnYjmQtR1Zw0k0-cMocA@mail.gmail.com>
Message-ID: <CAHk-=wiqX=uweoE+4hUTSLRsR87u2WAnYjmQtR1Zw0k0-cMocA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 19, 2021 at 11:38 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> It changes it for the worse, in that access to fields that are shared
> across threads *must* either use atomic types

Well, we won't be using those broken types in the core kernel, so that
would all be entirely on the Rust side.

And I don't expect the Rust side to do a lot of non-locked accesses,
which presumably shouldn't need any of this anyway.

If Rust code ends up accessing actual real kernel data structures with
memory ordering, then that will be to types that do *not* follow the
useless C++ atomics, and that in turn presumably means that it will be
done as "unsafe" helpers that do what the LKMM does (ie READ_ONCE()
and all the rest of it).

                 Linus
