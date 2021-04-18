Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1491836366E
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Apr 2021 17:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhDRPwG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 18 Apr 2021 11:52:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231341AbhDRPwF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Apr 2021 11:52:05 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90E06C061761
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Apr 2021 08:51:36 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id y124-20020a1c32820000b029010c93864955so19147054wmy.5
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Apr 2021 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OtKw10qEvbW4vVJ7LgDYq6Lw3KkFyEL4NmBJkuZOV+o=;
        b=wI9ZYZdipjoG+WBfdtD11eqltuXuPkKeZePxTrK9r0jW3SdtouH8LNr/gS3aR6hZ/W
         vJULJ27nh78HN6MqOBeYYf1R2m7CgNWF1PirBl7FpzcmFBpFjMDs4L55JeFMHITFXVn/
         ztlV8Up0gMBG7mNZcGy/cms2aMgZD/tYaCpuQJuBFGK8PYc0TlanBX8FCjWUp959Vs5c
         NNkRTyzNt9wsn6+DH6KQvzSyH+7NIB8KPBorzwQUpWVVALfJwi8fYl7K48ceFbLO63ut
         /193s5Rkr2cYSWlDg48jjKb3zjodyB+zYGNu0B9YXUWRWnNd7dvI2eQbC8NycfF8y1WV
         tg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OtKw10qEvbW4vVJ7LgDYq6Lw3KkFyEL4NmBJkuZOV+o=;
        b=iTMExBFSwPQ8y0LtEUkcI5o5oMiy2mwmodt2of8uenT5LF4r4PxnSvVdgQvlMTJGcc
         dLR5VOqG9UEBp0f37DPnGlXgkdJRmHviInx4MxFvSTeR4wcVDVvIV5Y8jJYjASkOA7Q1
         3zDEk4w1OIMdjMFmj6vgpMWV9Ffygpe/cWOsGi5gUJgKuvofhvB2WJnUhnO26yXiqOvm
         KVseXRzssgiuY3PTtfNe3l+7ydwd04DJFZzqG11sXh8unwelidzONwBt91AQ4kv5Z5D6
         j2Du/CAAyCu52Yupj6TZk+AFdPrHoPI2W/NKTkOQss1SSkcpXrk4OXv5UZNWCyhNB1so
         19/w==
X-Gm-Message-State: AOAM530VV3xbpSja6bluUPv6mKr0Sg/Ddcdo2MWKSR1gvMUTqni77tHh
        ftVoH2+WogGAtSiG/HaZJMDa
X-Google-Smtp-Source: ABdhPJyrkMnxGIkLrosVJLsRh5oNdjvpEKR9/be+0/gpccSgpInNrF8k8+QX7jRgxsO2uET3pdoziw==
X-Received: by 2002:a05:600c:3548:: with SMTP id i8mr14715981wmq.110.1618761089071;
        Sun, 18 Apr 2021 08:51:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:b40b:f0d6:b292:d186])
        by smtp.gmail.com with ESMTPSA id v4sm20768292wrf.36.2021.04.18.08.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 08:51:28 -0700 (PDT)
Date:   Sun, 18 Apr 2021 16:51:24 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Willy Tarreau <w@1wt.eu>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHxVfOS9vU7riv+Y@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <YHroRuI7lYDABWJR@google.com>
 <20210417142126.GA15678@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210417142126.GA15678@1wt.eu>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 04:21:27PM +0200, Willy Tarreau wrote:
> Well, I can't express how much I hate abstractions because I constantly
> need to know what it's doing under the hood, and I spend my time reading
> the output asm code because I always want to confirm my assumptions about
> the compiler not cheating on me (and not hitting one of its bugs),
> especially after C compilers have become so smart that they completely
> replace your code with what they think is better for you, (including
> nothing),

I understand the feeling. One thing I can say about the abstractions we've been
talking about is that they're zero-cost. So you'd still have the ability to
inspect generated code and relate that to source, although it would still be
subject to optimisations like C (or perhaps more optimisations as the compiler
knows more about the code).

> so I guess all of this is really not for someone like me.

This may indeed be the case. But I'd invite you to try it out for yourself
anyway before discounting it. I used to hate destructors in C++ because they
were called implicitly: C was king because I had full control. Now I find myself
publicly backing Rust. I feel the advantages outweigh the cost.

> However while I'm pretty sure that based on our respective experiences
> we'd probably disagree forever on a wide number of approaches when it
> comes to deciding whether the developer or the compiler should have the
> last say, I sincerely appreciate that you take the time to calmly explain
> your differing views and the rationale behind, so many thanks for this!

Thank you. I also appreciate your willingness to engage with us.

Cheers,
-Wedson
