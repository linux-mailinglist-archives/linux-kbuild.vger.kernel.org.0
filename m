Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA41F362406
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 17:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234887AbhDPPeY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 11:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343772AbhDPPeY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 11:34:24 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3108C061760
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Apr 2021 08:33:57 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id k128so14537921wmk.4
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Apr 2021 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ytm6x2vLN84smHgW7vb9p/KsJj33G3R6bvIaflLv16E=;
        b=hJXWLfp4f8CDzTqfIgdSOObQIM1FLOSrZ2p0XRVjGVtTQi4L+zsddWxRrhd4kWa7n5
         X3ydnDUq9ENQeqWuhpQ390B65NX0dxsqk6MoVuNK6IeWQF4VkNmJu5a8gd9aHQosmUs6
         nWtcutBvfOyzxz9QkWvxlEJXnplGbhvOLECd7FYnvdJZX5h/Z+uHG/BaXbS7yCJPnodK
         Dz1jB/kk7PsZZ3I0jmXb3sx5LkoXoLCIKAmb6JdAl+DBvXK0XW7zQ7+maLVlgz3K/H4e
         aEYAoCCpW1z6qx9z0St9cTzk6VsvofHR9i5pU84J7acECE0VRI6BCXYPFAcCGgbrFNa4
         oRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ytm6x2vLN84smHgW7vb9p/KsJj33G3R6bvIaflLv16E=;
        b=KrE/stVQTpE7uq8G6OTW0G5Zyl2Cy4FG9EdN9K37sWd5mHJkLdK2iDlK/cxVKTpqX/
         vGUi+ruHBz2fpBmln/55Gth+15x7wiVkcGS0MDYR57AB8VivF0sGlrDoLPtJxbBXmzfi
         rIqBaqFpGPOWJ9qgr5Eewc7QWjeMeUCxvpdpqF2bAwkMSKhHvWgyZdFSkZwTvpHb3P4r
         dQVoBTd+XxxJdWQYZR5wu8F2M7xY6X9+bcg4otGBjgzfopYK8ujMCKJ5qU7WaRXYR5WO
         3XFFQw7nhyGjX7F7/J6vb1WcYxACCoCVb4Q9obnmlR4z7kvvlDA6ZmIdchorntUGdZVQ
         /iiQ==
X-Gm-Message-State: AOAM532DHyvCsDy0Xjw+lwalarwPw2FCoe9imwRuNpK704P4wpL5uS1C
        s52fUm+SGQ+fnBYLJACQpy49
X-Google-Smtp-Source: ABdhPJwdoLg+1ErpoqLIywM8fzr1a2vNVP9e9Ue/4v+FeKMWMF2/CbGEFdt4Cf7AmMquJc5zsiXF/w==
X-Received: by 2002:a1c:6646:: with SMTP id a67mr8967894wmc.86.1618587236337;
        Fri, 16 Apr 2021 08:33:56 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:51db:fb7a:d252:e3c1])
        by smtp.gmail.com with ESMTPSA id h17sm11209854wru.67.2021.04.16.08.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 08:33:56 -0700 (PDT)
Date:   Fri, 16 Apr 2021 16:33:51 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHmuX1NA5RF7C7XS@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 04:19:07PM +0200, Peter Zijlstra wrote:
> Does this also not prohibit constructs where modification must be done
> while holding two locks, but reading can be done while holding either
> lock?

I don't believe it does. Remember that we have full control of the abstractions,
so we can (and will when the need arises) build an abstraction that provides the
functionality you describe. For the read path, we can have functions that return
a read-only guard (which is the gateway to the data in Rust) when locking either
of the locks, or when showing evidence that either lock is already locked (i.e.,
by temporarily transferring ownership of another guard). Note that this is
another area where Rust offers advantages: read-only guards (in C, if you take a
read lock, nothing prevents you from making changes to fields you should only be
allowed to read); and the ability to take temporary ownership, giving it back
even within the same function.

Similarly, to access a mutable guard, you'd have to show evidence that both
locks are held.

> That's a semi common scheme in the kernel, but not something that's
> expressible by, for example, the Java sync keyword.
> 
> It also very much doesn't work for RCU, where modification must be done
> under a lock, but access is done essentially lockless.

Why not? RCU is a lock -- it may have zero cost in most (all?) architectures on
the read path, but it is a lock. We can model access to variables/fields
protected by it just like any other lock, with the implementation of lock/unlock
optimizing to no-ops on the read path where possible.

In fact, this is also an advantage of Rust. It would *force* developers to
lock/unlock the RCU lock before they can access the protected data.

> I would much rather have a language extention where we can associate
> custom assertions with variable access, sorta like a sanitizer:
> 
> static inline void assert_foo_bar(struct foo *f)
> {
> 	lockdep_assert_held(&f->lock);
> }
> 
> struct foo {
> 	spinlock_t lock;
> 	int bar __assert__(assert_foo_bar);
> };
> 
> Such things can be optional and only enabled for debug builds on new
> compilers.

These would be great, but would still fall short of the compile-time guaranteed
safety that Rust offers in these cases.

> C does indeed not have the concept of ownership, unlike modern C++ I
> think. But I would much rather see a C language extention for that than
> go Rust.
> 
> This would mean a far more agressive push for newer C compilers than
> we've ever done before, but at least it would all still be a single
> language. Convertion to the new stuff can be done gradually and where
> it makes sense and new extentions can be evaluated on performance impact
> etc.

I encourage you to pursue this. We'd all benefit from better C. I'd be happy to
review and provide feedback on proposed extensions that are deemed
equivalent/better than what Rust offers.

My background is also in C. I'm no Rust fanboy, I'm just taking what I think is
a pragmatic view of the available options.
