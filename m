Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212541F4667
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2020 20:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgFISjQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jun 2020 14:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728227AbgFISjP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 14:39:15 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E93C05BD1E
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2020 11:39:14 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id jz3so1772995pjb.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2020 11:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oUUlKxLjSlKhbNUJ+/fS04FbBkWKQBhciBLdETtik1Q=;
        b=muEdWnYfglQpo6mlvoIfHWOj2y/b2HPEYx/I/P/+afdRB9/f6IdVu5VnGI/3lcvXLS
         I9FafGnjLFcRGiW36DCgnPzai2sfXVCBdgJRXMrqAW3e7b14inpyi/jwHBpjdNDnVDY1
         GBTg1KJ1wEa1aW+kWXIDPsZzAOyVi1GSGs3y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oUUlKxLjSlKhbNUJ+/fS04FbBkWKQBhciBLdETtik1Q=;
        b=ErPlIj/ya2aH/xv2/ZbOrVdPJzlABl7OqA8zTzBPDEwHEV/rziUSG2McBup93Ktx2b
         D2BWdU0ILLDqV1uNb/Zwbk9R2OnKj3cCW8AgVwWpcX2okf2TuA71qPel6y6A+Trhz0eE
         ScxL9obWpLevtZoRfJQ5SPCfq4hgQkbyLn0+0HU2QRt3ZHSJH4MK7NZy8ud5xUJAC+d+
         Vn3yy8zQoKfyO0iDcGLPpWj0BHR+EsC0yDniLmVwJ+Z/COwTeX17yKEM1sLY2JdMu2Oc
         w6VpkRuIvWte8EgHbMXqDwwsykBDdR8STypjl9NP5N6IiJ5pynt93Uwd6RuDdCy+iJRp
         A7ow==
X-Gm-Message-State: AOAM530L1CD3LkrRzTHqFxDgkM+0c3e+mB+57sUsaOd2f7PsjFxis4bw
        syQXX2tBn7mzravgdYfufyuMig==
X-Google-Smtp-Source: ABdhPJwtO8ctv+axOrlGnu6BhxO/Dmuz6uhavpkS9vfR+Ml1dYIGadDqm0xyQLuzwR4BmnGnulrmGw==
X-Received: by 2002:a17:90b:4d10:: with SMTP id mw16mr6182260pjb.143.1591727953613;
        Tue, 09 Jun 2020 11:39:13 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u14sm11238034pfk.211.2020.06.09.11.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 11:39:12 -0700 (PDT)
Date:   Tue, 9 Jun 2020 11:39:11 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Jann Horn <jannh@google.com>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-kbuild@vger.kernel.org,
        the arch/x86 maintainers <x86@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel list <linux-kernel@vger.kernel.org>, gcc@gcc.gnu.org,
        notify@kernel.org
Subject: Re: [PATCH 1/5] gcc-plugins/stackleak: Exclude alloca() from the
 instrumentation logic
Message-ID: <202006091133.412F0E89@keescook>
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-2-alex.popov@linux.com>
 <CAG48ez05JOvqzYGr3PvyQGwFURspFWvNvf-b8Y613PX0biug8w@mail.gmail.com>
 <70319f78-2c7c-8141-d751-07f28203db7c@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70319f78-2c7c-8141-d751-07f28203db7c@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 04, 2020 at 06:23:38PM +0300, Alexander Popov wrote:
> On 04.06.2020 17:01, Jann Horn wrote:
> > On Thu, Jun 4, 2020 at 3:51 PM Alexander Popov <alex.popov@linux.com> wrote:
> >> Some time ago Variable Length Arrays (VLA) were removed from the kernel.
> >> The kernel is built with '-Wvla'. Let's exclude alloca() from the
> >> instrumentation logic and make it simpler. The build-time assertion
> >> against alloca() is added instead.
> > [...]
> >> +                       /* Variable Length Arrays are forbidden in the kernel */
> >> +                       gcc_assert(!is_alloca(stmt));
> > 
> > There is a patch series from Elena and Kees on the kernel-hardening
> > list that deliberately uses __builtin_alloca() in the syscall entry
> > path to randomize the stack pointer per-syscall - see
> > <https://lore.kernel.org/kernel-hardening/20200406231606.37619-4-keescook@chromium.org/>.
> 
> Thanks, Jann.
> 
> At first glance, leaving alloca() handling in stackleak instrumentation logic
> would allow to integrate stackleak and this version of random_kstack_offset.

Right, it seems there would be a need for this coverage to remain,
otherwise the depth of stack erasure might be incorrect.

It doesn't seem like the other patches strictly depend on alloca()
support being removed, though?

> Kees, Elena, did you try random_kstack_offset with upstream stackleak?

I didn't try that combination yet, no. It seemed there would likely
still be further discussion about the offset series first (though the
thread has been silent -- I'll rebase and resend it after rc2).

> It looks to me that without stackleak erasing random_kstack_offset can be
> weaker. I mean, if next syscall has a bigger stack randomization gap, the data
> on thread stack from the previous syscall is not overwritten and can be used. Am
> I right?

That's correct. I think the combination is needed, but I don't think
they need to be strictly tied together.

> Another aspect: CONFIG_STACKLEAK_METRICS can be used for guessing kernel stack
> offset, which is bad. It should be disabled if random_kstack_offset is on.

Agreed.

-- 
Kees Cook
