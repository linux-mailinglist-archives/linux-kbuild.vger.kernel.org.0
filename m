Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5321736833F
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Apr 2021 17:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbhDVPYq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Apr 2021 11:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236367AbhDVPYp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Apr 2021 11:24:45 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95141C06174A
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Apr 2021 08:24:10 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id k4-20020a7bc4040000b02901331d89fb83so3344319wmi.5
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Apr 2021 08:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1Rp8OfjVOSZyc4PmXdV4gllwWauLm90/cEmNM2YOoao=;
        b=YmheUYy0JFRyTOg+K4+AwxPa27H30+GcG5q0kEtquthxbh65SNajPAlQ0uStVHWUd2
         xZacQYvFay5OBSNVW05KkSipLF+fcOswbjQJeKwaWRLr3Z2MATvtYQRTxFEEWLzU4qbD
         INY/3HoRfnkMuN7lOc6L4FTKjW5Id4ezhEdCaVAoY7xunKv27cZ5VtbebBZ3Kx7W75Mt
         UZekoFANYM2mrJUjd6WdXFAKYSjqyo+JDgfQ3L6TrBMMdxLLxhRqieb2eEDvJmXQUQD9
         5tqxvAbpE+PQGvjkkyvioJmXsnZz2XxLvmFxdkcJGEitbUyw1jpb3fiSyprxJ9d3fif3
         SGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Rp8OfjVOSZyc4PmXdV4gllwWauLm90/cEmNM2YOoao=;
        b=BETkbhYUKjuCh+sAkmgHVuQcvoZ87Hi269206NB31ZdmzIIwpwe4lSUD5l4tRQuCSN
         4he+oOwEV0ZOQwyAmVwlSJSxIPzApFTPNZMyCYj8TAd9dEVeA3tm8uaXPb3uk+r+jPnF
         QfoXLJqJOw8dBUrWVanlgvI4k+g8TRkxqILM78QOeoJC0G9nD1avu2unBvhmJXPMS0H2
         0x/PlXPRQDwU/8JJxLT2+DjN9584tHunTqK8rw5CqxDikGbmV6r83BryFbs4FKh5L53X
         np9WiEi21RhlfsyNVGENfYniWnM1BJpuXMUAt+HLv7BMp2Gad58OWGGGRIKFNLE/vrIo
         Uvig==
X-Gm-Message-State: AOAM531D7bblsTI+Q8TRvBfpN7YVYkrIcJ4mVVer+Tben66xnkX0fnlk
        gh91+V3PBApfBHw9XV97Phqy
X-Google-Smtp-Source: ABdhPJwP1UTTNEtMjboT4KoKEwdKXPR9eB8oqTPSo7tqSdKoNAqg3Vwv1ccoDR1H2HLlj0ZOWYik4A==
X-Received: by 2002:a1c:9853:: with SMTP id a80mr4448063wme.44.1619105049152;
        Thu, 22 Apr 2021 08:24:09 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:35c3:2357:b268:5220])
        by smtp.gmail.com with ESMTPSA id f1sm4078646wru.60.2021.04.22.08.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 08:24:08 -0700 (PDT)
Date:   Thu, 22 Apr 2021 16:24:04 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YIGVFCymUn+4HBIj@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

First of all, thanks for the thoughtful feedback.

On Thu, Apr 22, 2021 at 12:03:13PM +0200, Linus Walleij wrote:
> I am sure you are aware of this document:
> Documentation/process/stable-api-nonsense.rst
> 
> We really like to change the internal APIs of the kernel, and it sounds to
> me like Rust really likes a rust-side-vs-C-side approach to APIs, requiring
> these wrappers to be written and maintained all over the place, and that
> is going to affect the mobility of the kernel-internal APIs and make them
> less mobile.

The Rust-side-vs-C-side is because we want to provide an environment where we
can write kernel code (e.g., a driver) and if we stick to safe code (i.e.,
we don't use the Rust keyword "unsafe"), then we can be confident that our
code is free of memory safety issues (assuming, of course, that the abstractions
are sound).

Calling C functions directly would not allow us to do this.

As for mobility, I have the impression that this could potentially increase
mobility in that for Rust maintainers would need to change one place (the
wrapper) as opposed to a number of drivers using an API (if it's mostly an
argument/change kind of thing). Of course, if it's something like removing an
API then we'd have to change everywhere.

I'd like to reassure you that it is not our intention to create a stable api,
restrict mobility, or anything of that sort. Though I do acknowledge Rust may
complicate things (more on this below).

> If it means I need to write and review less patches related to NULL
> dereference and use-after-free etc etc, then it may very well be worth
> it.

Indeed that's part of our goal. A class of vulnerabilities is removed by
construction; others are harder to create accidentally. Reviewers would also
know that unsafe blocks need extra attention.
 
> But as subsystem maintainer I'd like a clear picture of this wrapper
> overhead, what does it usually entail? A typical kernel API has
> vtable and a few variables, not much more than that.
> 
> I go to patch 12/13 and I see things like this:
> 
> +/// A descriptor of wrapped list elements.
> +pub trait GetLinksWrapped: GetLinks {
> +    /// Specifies which wrapper (e.g., `Box` and `Arc`) wraps the list entries.
> +    type Wrapped: Wrapper<Self::EntryType>;
> +}
> +
> +impl<T: ?Sized> GetLinksWrapped for Box<T>
> +where
> +    Box<T>: GetLinks,
> +{
> +    type Wrapped = Box<<Box<T> as GetLinks>::EntryType>;
> +}
> +
> +impl<T: GetLinks + ?Sized> GetLinks for Box<T> {
> +    type EntryType = T::EntryType;
> +    fn get_links(data: &Self::EntryType) -> &Links<Self::EntryType> {
> +        <T as GetLinks>::get_links(data)
> +    }
> +}

We want the runtime overhead to be zero. During development, as you rightly
point out, there is the overhead of creating and maintaining these abstractions
for use in Rust. The code above is not a good example of a wrapper because it's
not wrapping kernel C functionality.

A better example is Pages, which wraps a pointer to struct page:

    pub struct Pages<const ORDER: u32> {
        pages: *mut bindings::page,
    }

If you call Pages::new(), alloc_pages() is called and returns a
KernelResult<Pages>. If the allocation fails you get an error back, otherwise
you get the pages: there is no possibility of forgetting to check the return
value and accidentally dereferencing a NULL pointer.

We have ORDER as a compile-time argument to the type, so we know at compile-time
how many pages we have at no additional runtime cost. So, for example, when we
have to free the pages, the destructor knows what the right argument is when
calling free_pages.

The fact that you have a destructor also ensures that you don't accidentally
forget to free the pages, so no leaks. (We don't have it implemented because
we haven't needed it yet, but we can have get_page/put_page with proper
ownership, i.e., after the equivalent of put_page, you can no longer touch the
page, enforced at compile time).

We provide an `insert_page` associated function that maps the given page to a
vma by calling vm_insert_page. (Only works if ORDER is zero.)

We provide a `kmap` associated function that maps one of the pages and returns a
mapping, which itself has a wrapper type that ensures that kunmap is called when
it goes out of scope.

Anyway, what I'm trying to show here is that the wrappers are quite thin and are
intended to enforce safety (where possible) and correct usage. Does it make
sense? I'm glad to go into more details if desired.

> All subsystem maintainers are expected to understand and maintain
> wrappers like these, right? That means all subsystem maintainers need
> to be elevated to understand the above without effort if you wake them
> up in their sleep at 4 in the morning.

I suppose they'd need to understand the wrappers that I talked about above, not
the ones you copied (those are wrapping something else and maintainers of other
subsystems are not expected to write this sort of code).

There are other possible approaches too:
1. Explicitly exclude Rust support from certain subsystems, say, no Rust USB
drivers (just a random example).
2. Maintainers may choose to not care about Rust, breaking it on api changes.

Naturally I'd prefer Rust support to be a first-class citizen but I mention the
above for completeness.

> Get me right, we are of course good at doing really complicated stuff,
> that's what engineers do. But we are not Iron Man. We need a clear
> way into understanding and maintaining wrappers and we need support
> with it when we don't understand it, so the kernel would need a Rust
> wrapper maintainer that we can trust to stay around for the long term,
> i.e. until their retirement, while actively teaching others for decades.
> For an example see how RCU is maintained.

Agreed. The only part that I'm not sure about is whether we need to put all the
burden on a single person for the rest of their career. In the beginning, of
course, but over time I would expect (hope?) experts would emerge and some of
the load would be distributed.
 
Cheers,
-Wedson
