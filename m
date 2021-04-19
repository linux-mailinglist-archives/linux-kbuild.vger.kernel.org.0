Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5F3364D75
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Apr 2021 00:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhDSWEf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 18:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhDSWEf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 18:04:35 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A463C06174A;
        Mon, 19 Apr 2021 15:04:05 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id z1so40590400ybf.6;
        Mon, 19 Apr 2021 15:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lAsDnsyzYN4x8dN8mbR7x0mBnkheSZKpDi2Mjbobv/w=;
        b=JHTXGtXOWhUCpWAsPO3Qzz9691Wh+U57BXKUJYTH2tnwdgHc7JF1jVKrsrgyG+xAlU
         KMZ8V0zcrp714P+CzjRmmSAD1jueMBF3MsLRssB8YkeRnBq0jKH7VwJAfaZhBfSYmhoF
         XCz7/6pHABQHEJIo9qiIkuJSyfJlSC86U6khgnavGy/AcqiYMzhG1ll5ENnUpSJdGcBq
         fkgHwwvJnv1WaRnb333FpdU9zROF65VlMg65Fh7WhAhwYqrHVhyN3ggqG7cTbmWuotUJ
         8+bc3Hs2OMNb68u95MXJ86mAVaBldFNUVeU6l6W6pTcO6TgM1xT8rnZe+ejsHI23HtXH
         cGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lAsDnsyzYN4x8dN8mbR7x0mBnkheSZKpDi2Mjbobv/w=;
        b=M2zN1tXLfEKDLwyVbaKxHSm1xEDPgANhs1uZQb+Nh7DlwOGYsKfzWNrxFkXnGjvePK
         UuxHSEaWWbkHR9QLm9lxu5P5qwescl+wsFcbf+ecwdQNjJle1ehfuo8Jdqr4H0KkFBKI
         hNNkrhoDvEMO8e0zAFklA8UupPypwzyZhxJ55aUeoTMOo7cBalQAhQtzFmO6I7WsQxbu
         XuoycSG5yX964kZCLwY4k9UFpu7PCWyXf6u8iseDLOaUSOZoq2Js11ojdyblE6MRigVy
         RwMEN8QInA0PJWqrh9akxdeoNHMV6u3NG306Jos8mpttXm3gqYSFjC3SY30w79MViLYC
         5eWQ==
X-Gm-Message-State: AOAM532h7A1ntWJ8H+70NlQf4TIlrt6TVstOT2i8by/G38sTj2R6b+x+
        smdgG1MtRL8z0q/r+Os/TRBSBgjDxG+8ISuYbBM=
X-Google-Smtp-Source: ABdhPJyYnpH7oC2HKKNP0R/ypH05z1EhKrhnAeCoxnukfQ6sw8/KYKYRo46D/fkETEIokm+1oj0fZCpJ4sUfcperIX4=
X-Received: by 2002:a25:818f:: with SMTP id p15mr18066266ybk.135.1618869844259;
 Mon, 19 Apr 2021 15:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHkSO3TUktyPs4Nz@boqun-archlinux> <CAKwvOdnRx+8LhOAnH24CeZz2a2-MwF03oB7Um_pKBq8WAoLNxw@mail.gmail.com>
 <20210416184713.GI4212@paulmck-ThinkPad-P17-Gen-1> <CAKwvOdkpOZk-FXJ0iOLvhyQr7wVcWwzgc0gk_8KTtOfF_Q8Q3g@mail.gmail.com>
In-Reply-To: <CAKwvOdkpOZk-FXJ0iOLvhyQr7wVcWwzgc0gk_8KTtOfF_Q8Q3g@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 20 Apr 2021 00:03:52 +0200
Message-ID: <CANiq72kTynUAJdFa60p1BEZCAJmb5tANZNzTwFdzcdeNAzMiiw@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nick,

On Mon, Apr 19, 2021 at 10:36 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> This is a much different process than drafts thrown over the wall.
> What hope do any kernel contributors have to participate in the ISO
> WGs, other than hoping their contributions to a draft foresee/address
> any concerns members of the committee might have?  How do members of
> the ISO WG communicate with folks interested in the outcomes of their
> decisions?

For WG21, several folks write trip reports of each meeting, and you
can check the status of papers in GitHub at
https://github.com/cplusplus/papers/issues.

For WG14, there are way less papers going on. It is more or  less easy
to follow by reading the list of latest additions in the first pages
of the draft, as well as the Editor's Report.

> The two processes are quite different; one doesn't require "joining a
> national body" (which I assume involves some monetary transaction, if
> not for the individual participant, for their employer) for instance.
> (http://www.open-std.org/jtc1/sc22/wg14/www/contributing which links
> to https://www.iso.org/members.html; I wonder if we have kernel
> contributors in those grayed out countries?)

They are indeed very different processes. Being an ISO standard has
advantages and disadvantages.

In any case, I should note that not everyone that goes to the meetings
pays, e.g. some go as guests, some are funded by their country (or the
EU or other organizations), etc.

In fact, the bigger costs, in my experience, are the time commitment
(a week several times a year) and the costs of traveling (before the
pandemic, that is).

Furthermore, contributing proposals does not actually require
attending the meetings nor joining the committee -- some people
contribute to the standards via proxy, i.e. somebody else presents
their proposals in the committee.

> It was always very ironic to me that the most important body of free
> software was subject to decisions made by ISO, for better or for
> worse.  I would think Rust's RFC process would be more accessible to
> kernel developers, modulo the anti-github crowd, but with the Rust's
> community's values in inclusion I'm sure they'd be happy to accomodate
> folks for the RFC process without requiring github.  I'm not sure ISO
> can be as flexible for non-members.

Well, the kernel already ignores the C standard here and there. ;-) In
the end, it is "just" a standard -- the kernel and compilers can do
something else when they need.

> Either way, I think Rust's RFC process is something worth adding to
> the list of benefits under the heading "Why Rust?" in this proposed
> RFC.

The Rust RFC process has indeed upsides. It is very dynamic and easy
to participate, and allows for anybody to easily comment on proposals,
even anonymously. But, for better or worse, does not lead to an ISO
standard (which some people & companies really value, e.g. as
requirements in contracts etc.).

In the end, writing an RFC is similar to writing a paper for ISO. The
bigger differences, as mentioned above, are on the requirements if you
actually want to go there and present the paper yourself and/or if you
want to have voting rights etc.

Personally, I think some ISO policies could be improved for some types
of standards (or at least let WGs relax them to some degree), but...

Cheers,
Miguel
