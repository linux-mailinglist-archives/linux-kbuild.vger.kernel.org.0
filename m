Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AADE422628
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 14:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234694AbhJEMS6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 08:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234354AbhJEMS6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 08:18:58 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6269C061749
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Oct 2021 05:17:07 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id e66-20020a9d2ac8000000b0054da8bdf2aeso23361410otb.12
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Oct 2021 05:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qtirudvd3CXF1rYRgKYcpMfzejgCL2epG1sP1VQEe9s=;
        b=KTwb/ogrtt/E591H/tN/VTYlhqrR9Vl5tddsqaZzE0kkrXYzv/GX8tid0+F3lr5qQq
         yPWVTg2B314ddDgSwSevNhKAu64R7YWiSygh+c8h3Asl4LsYrFegO/B6AISMwFJ6D8Vr
         XRXfMMIK8QWdqX+E7w/eSWk7FDRpKdoGDgzRD0PpaXqgSjJuzh6nSIptpD4f/Bs/ztSK
         2TK//39Gd5LVxzA5kd9wKdOxiLO1a+l5Db/we0xTTygfsehseuN2h/z0vzxEdg7X2hEt
         0wvhmExP39oZanRDPHEP3T1fKkhGJjnqPf1v/7cFh+00IaE9+I2+0LRHTzwjraO4OnYR
         TByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qtirudvd3CXF1rYRgKYcpMfzejgCL2epG1sP1VQEe9s=;
        b=LQjhdu7e2LnUVttGfSEo4DtjPAtUC4E60Kjba+VgraGYSsrbgUWH9gnjX0ZIHYx4OB
         qxO5S3PG4vnHkxsmdc3uduC0nAzdJ3qpPvUKizAv5Ytei6baLpmTGhIWrjTYDsPC3Z25
         9oODdVGZMUuTZeyd4G1Eo+5SzH5NTK5nT4GgLRtUUx9HAQoyomYWKFd90/1davIZULTF
         mhN836yQyfw9qb1AE9BZutW9dj9q/wcANWMZVzPxoEQw3T7Jq2M1RdnOJzcEPI3QGhKT
         xtMecrui+gjCdYep1SznYyySnIGSwXfKjq0rucJrttSGVfgGHMaqpdnhIwJ0/9TpKBBT
         DhWA==
X-Gm-Message-State: AOAM532syEEK0XGOCfHKTIK7BlBaWUFMasi+AO7naRZDAeBhulE/g8WS
        LRjz8DXV4LoeunX9Wa10g2Y5p6qezs5jcyLydFVMKg==
X-Google-Smtp-Source: ABdhPJwjDgxSZtLpmCXXe/rrN8LcDZxzExGHH2uRskhVorKYUt+/6c8rdV+/ZTp3iqUz8WZjpWJJNavoVIUkrlZN2QA=
X-Received: by 2002:a9d:3e04:: with SMTP id a4mr14216116otd.329.1633436226924;
 Tue, 05 Oct 2021 05:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com> <20211005105905.1994700-17-elver@google.com>
 <YVw+4McyFdvU7ZED@hirez.programming.kicks-ass.net>
In-Reply-To: <YVw+4McyFdvU7ZED@hirez.programming.kicks-ass.net>
From:   Marco Elver <elver@google.com>
Date:   Tue, 5 Oct 2021 14:16:55 +0200
Message-ID: <CANpmjNO6H2imqsGaLYqimm0POvqA65Pd3OYji-QzONMn=Ht6Og@mail.gmail.com>
Subject: Re: [PATCH -rcu/kcsan 16/23] locking/atomics, kcsan: Add
 instrumentation for barriers
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 5 Oct 2021 at 14:03, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Oct 05, 2021 at 12:58:58PM +0200, Marco Elver wrote:
> > @@ -59,6 +60,7 @@ atomic_add(int i, atomic_t *v)
> >  static __always_inline int
> >  atomic_add_return(int i, atomic_t *v)
> >  {
> > +     kcsan_mb();
> >       instrument_atomic_read_write(v, sizeof(*v));
> >       return arch_atomic_add_return(i, v);
> >  }
>
> This and others,.. is this actually correct? Should that not be
> something like:
>
>         kscan_mb();
>         instrument_atomic_read_write(...);
>         ret = arch_atomic_add_return(i, v);
>         kcsan_mb();
>         return ret;
>
> ?

In theory, yes, but right now it's redundant.

Because right now KCSAN only models "buffering", and no "prefetching".
So there's no way that a later instruction would be reordered before
this point. And atomic accesses are never considered for reordering,
so it's also impossible that it would  be reordered later.

Each kcsan_mb() is a call, so right now it makes sense to just have 1
call to be a bit more efficient.
