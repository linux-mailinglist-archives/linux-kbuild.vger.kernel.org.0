Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA71422C14
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 17:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235754AbhJEPPf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 11:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235551AbhJEPPe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 11:15:34 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395E9C061755
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Oct 2021 08:13:44 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id o20so19942997wro.3
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Oct 2021 08:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PWCYDGGbLpSMPRQR7ZAmGiH0fGx9oqlU5WKkX0Mb0qU=;
        b=C1yvQF0yUncj5rEDsqvtLNOh+x9A7zVvyBPM9/XAkJfELhfc8AMhISJj64NOPiegea
         6JaYRoh2a4a8Ncik3T0v2Z6LPHWswvBeUX8M6NZ4jCkN4IEr3RdBho3Kd9rLpWJpM0V7
         nAz428jBaLXsB3HI0R0UXCgzALnskQ+gT1Wuytyc91NjoM4QkNs6yNoNLLP+H7Kf3aF7
         4mPFuU3GM98fENzdmGwNxmmAh6ePRObn3Xcmc0CdJfqyOPb1S20AuzfRXoOXfq0YejFs
         5rUMpTiUdv/XOm8Bnfc39Y8QxXGwt9qYF2AbGEI/cO9MnsFx/isXdnG/CQge/XznLXKO
         qP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PWCYDGGbLpSMPRQR7ZAmGiH0fGx9oqlU5WKkX0Mb0qU=;
        b=GDBuZh8cZoQ3Siw06N90JSSesoYXPZrq7mhQFI32urS2VBhbnAWFiqLW7Q7YlU0vNA
         3TCfLxAbfkcwp2USqanCRrZRYUrWn+NgzxxZseFKniAt+/yvlYRvk3RrYmYFMQcJd1bH
         IQRbUR4kKMDtmgowlkpOE0r8VVSdBwNfByCga4VDaHP4jd6yl1WwbWnfu1e652MC88kT
         bZ5PJKmxIknpXLr4p0ZI36iJnlitm7pKU7fm98B5eJ83ouNnH4KqfRnckv+1UnwzCGxy
         ZbImowqel0QcXESPwUNrT6PnzWEQm7PWMbx4PnoLr2VD1iw1kTdncHIsMzJP24/NwyEC
         O5Cg==
X-Gm-Message-State: AOAM533Wgin9w0voV5Tsofd4J4qTFiAuCPMKF9LQfL73WJ4VSfThyaFO
        bGKVBiikLS3aybuoBLvVu7+m2w==
X-Google-Smtp-Source: ABdhPJyHHQBSLIiixiOSj+09iVqstHSdw/JX82YLQyteKWj/W+BkVDOWUO25EZpQcPNg2mg9qLt/bg==
X-Received: by 2002:adf:e6d0:: with SMTP id y16mr22269412wrm.181.1633446822192;
        Tue, 05 Oct 2021 08:13:42 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:e44f:5054:55f8:fcb8])
        by smtp.gmail.com with ESMTPSA id a2sm4377335wru.82.2021.10.05.08.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 08:13:41 -0700 (PDT)
Date:   Tue, 5 Oct 2021 17:13:35 +0200
From:   Marco Elver <elver@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     "Paul E . McKenney" <paulmck@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH -rcu/kcsan 23/23] objtool, kcsan: Remove memory barrier
 instrumentation from noinstr
Message-ID: <YVxrn2658Xdf0Asf@elver.google.com>
References: <20211005105905.1994700-1-elver@google.com>
 <20211005105905.1994700-24-elver@google.com>
 <YVxjH2AtjvB8BDMD@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVxjH2AtjvB8BDMD@hirez.programming.kicks-ass.net>
User-Agent: Mutt/2.0.5 (2021-01-21)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 05, 2021 at 04:37PM +0200, Peter Zijlstra wrote:
> On Tue, Oct 05, 2021 at 12:59:05PM +0200, Marco Elver wrote:
> > Teach objtool to turn instrumentation required for memory barrier
> > modeling into nops in noinstr text.
> > 
> > The __tsan_func_entry/exit calls are still emitted by compilers even
> > with the __no_sanitize_thread attribute. The memory barrier
> > instrumentation will be inserted explicitly (without compiler help), and
> > thus needs to also explicitly be removed.
> 
> How is arm64 and others using kernel/entry + noinstr going to fix this?
> 
> ISTR they fully rely on the compilers not emitting instrumentation,
> since they don't have objtool to fix up stray issues like this.

So this is where I'd like to hear if the approach of:

 | #if !defined(CONFIG_ARCH_WANTS_NO_INSTR) || defined(CONFIG_STACK_VALIDATION)
 | ...
 | #else
 | #define kcsan_noinstr noinstr
 | static __always_inline bool within_noinstr(unsigned long ip)
 | {
 | 	return (unsigned long)__noinstr_text_start <= ip &&
 | 	       ip < (unsigned long)__noinstr_text_end;
 | }
 | #endif

and then (using the !STACK_VALIDATION definitions)

 | kcsan_noinstr void instrumentation_may_appear_in_noinstr(void)
 | {
 | 	if (within_noinstr(_RET_IP_))
 | 		return;

works for the non-x86 arches that select ARCH_WANTS_NO_INSTR.

If it doesn't I can easily just remove kcsan_noinstr/within_noinstr, and
add a "depends on !ARCH_WANTS_NO_INSTR || STACK_VALIDATION" to the
KCSAN_WEAK_MEMORY option.

Looking at a previous discussion [1], however, I was under the
impression that this would work.

[1] https://lkml.kernel.org/r/CANpmjNMAZiW-Er=2QDgGP+_3hg1LOvPYcbfGSPMv=aR6MVTB-g@mail.gmail.com
