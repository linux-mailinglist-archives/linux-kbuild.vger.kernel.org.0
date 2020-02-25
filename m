Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 275D016F0C1
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2020 21:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbgBYU7h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Feb 2020 15:59:37 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43346 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728654AbgBYU7h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Feb 2020 15:59:37 -0500
Received: by mail-pg1-f195.google.com with SMTP id u12so134917pgb.10
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2020 12:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l4iIiKgZ3F5fVRZU+jMxKAB1P3b/lgfIZbluQQ7RBgg=;
        b=qYTPCkYAahUF4zPxst0kQF5J8/vc/2BezBXHhhRlDOYeqgskoi2uAFCUYtJ/jzZfWS
         5dffLkxHLwzHR8R+vUtRRZHjOQlymJLdgOnB8zDaYgd/xzVpeJfbH8ggSiG+tlewjtzX
         WCprmfHB4VCsjxXC5f9dGqb9V8mmaJx42e8kcL6enZ0a6wLEnFraVjlH15ieiFOBD0DA
         e+1+nq0Mu55AYqf5YP9EP4dl+TzEDeAN+AcdZtvhU6OxQIogDdfKGdQe5LHEyO39pSZt
         4HUHFndr7cMDtI2NtlJrXLQxrzNiCGEg+wSMjI/Y47ABvuw1ioz9fQzZqQjmfHQUkuXT
         ugLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l4iIiKgZ3F5fVRZU+jMxKAB1P3b/lgfIZbluQQ7RBgg=;
        b=cAy9/AmRCJfjPPnuKdjJw7URNcZ0sjQd8rvRhQQeFsWoncaTYxhfJGfbeHKpkMbXpz
         ZSk7rRSuSKWtjIdi5GORnMmbNqZoMZX49ovlli0U2lzAeYsEuou+wKjKCWwnHdfE4Ut5
         n8U2SZSSd1csZ6BSjZdof+BWQyjQ0hmXUp3cAiZaImuPs2uRu3Xl/ipolGIdVia47vzp
         8LEY3sbFCzwTDZQHhe6I5QGiwuM5C98ci5RO2Ypr/tAznbWEfTX489IOqMwXDPqoosu5
         8yQ30XhUvGmIJBJvbjS965nKaNDJaqJkNH4bJB95nEIQXHNedNq8/f9YcQ/I+vWFXvKx
         zGlA==
X-Gm-Message-State: APjAAAU78+E3uPvBCltLtchQL0aJa7wCvnAaMcx9Gpcb5B0GOnjm7Wgy
        6rcf2vk7vG3R2YxWN7LJ99RWrTt5QBPeGFw1KgUuTw==
X-Google-Smtp-Source: APXvYqzLuZWs29B9hUeIcVf8Zmto6Gx+iGZUlBReKdtGQkRIb/Vk49VhQ/NAnYYH0v5R4SQAoVrwGFn0m1gnqnK80+c=
X-Received: by 2002:a63:4e22:: with SMTP id c34mr371057pgb.263.1582664376061;
 Tue, 25 Feb 2020 12:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook> <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 25 Feb 2020 12:59:25 -0800
Message-ID: <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 24, 2020 at 8:16 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> > Should this also include an update to Documentation/process/changes.rst
> > with the minimum version required? (I would expect this to be "9" for Clang,
> > and "11" for ld.lld.)
>
> I think the clang one should be added in a separate patch that
> solidifies that in include/linux/compiler-clang.h with a CLANG_VERSION
> macro and version check, like in include/linux/compiler-gcc.h.
>
> ld.lld's minimum version should also be 9, what is the blocking issue
> that makes it 11?

I'm super hesitant to put a minimally required version of Clang, since
it really depends on the configs you're using.  Sure, clang-9 will
probably work better than clang-4 for some configs, but I would say
ToT clang built from source would be even better, as unrealistic as
that is for most people.  The question of "what's our support model"
hasn't realistically come up yet, so I don't really want to make a
decision on that right now and potentially pigeonhole us into some
support scheme that's theoretical or hypothetical.  We need to expand
out the CI more, and get more people to even care about Clang, before
we start to concern ourselves with providing an answer to the question
"what versions of clang are supported?"  But it's just a strong
opinion of mine, held loosely.

Either way, it can be done (or not) in a follow up patch.  I would
like to land some Documentation/ even if it's not perfect, we can go
from there.
-- 
Thanks,
~Nick Desaulniers
