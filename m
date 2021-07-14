Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D923C91FE
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 22:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232710AbhGNUZK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 16:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbhGNUZI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 16:25:08 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34B7C061762
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 13:22:16 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id v6so5768918lfp.6
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 13:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AWy+35KmmWPF9vsv4/yauNLhBLPVkzMejTzAkHJGLBM=;
        b=V37VAVm5NvLVGqND/F0vTJg46VZeConitLxxTHCs1N4UC3kwCcitLTAuULgE9P0yJ7
         JxRC/pqtzVf+u3u/c8M13eOZYvvD8y4ch9aoNPL3PEyFGZfOI7/lAvcnPkfI3gFhUBhB
         KHaX4h+Jp8OCMJ7rNg+VURB4Q4FkA9BEozZbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AWy+35KmmWPF9vsv4/yauNLhBLPVkzMejTzAkHJGLBM=;
        b=Fu+cYlE+VFJHbLe6Qu/ixmxeRmNAM4h50DA0IMmmTAsCUYYwt1YzywM9t3gRcGrpZ+
         WMP8iGZCRFqbqu642lHhsdleddAAGxHD1Z9B0folsgDPKktVQC8anS5Jem/puyhmlCb7
         +81x19WrskaJeGxwIgBtm582abYHtSNFvNrU+fnvSxt92bSaoRNfn4ZQY/BuRbLYvq2Q
         qhViKVcL0DEmBlJR4HZpwr/8r2NBMpPekJJk+PC2haVmTVFxYzxN4/YbU0VnNmgUHThn
         Bt1KpkfDTcXSNy9UGLaff3k+aBfiKKdMaUfbNProqT5krUX5xgT6JUguZ0qbEUSb7pr0
         2xMQ==
X-Gm-Message-State: AOAM533w1ElCnP5nSRjFbJd/G0MBoXpd8mdlBs2nuU+TUQrTFewkugFu
        JhlmScI8AM8+KT9arwxdDn2mqD+yaGn6JV3i
X-Google-Smtp-Source: ABdhPJw37ySlF8U9v3f5LwO0adYQkbbxyWIOuAy3+CzZpIrcHEhWDZ5r9x8OTi1WAZwQv81tQXNJew==
X-Received: by 2002:a05:6512:524:: with SMTP id o4mr47060lfc.165.1626294135026;
        Wed, 14 Jul 2021 13:22:15 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id u7sm354514lja.58.2021.07.14.13.22.13
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 13:22:13 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id q4so5247126ljp.13
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 13:22:13 -0700 (PDT)
X-Received: by 2002:a2e:81c4:: with SMTP id s4mr10564675ljg.251.1626294133222;
 Wed, 14 Jul 2021 13:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-3-ojeda@kernel.org>
 <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
 <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com> <87mtqo1wv6.fsf@disp2133>
In-Reply-To: <87mtqo1wv6.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Jul 2021 13:21:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
Message-ID: <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 14, 2021 at 1:09 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Are you thinking the hashed kernel symbols need to have their types
> included in the hash?

I think the hash should be the whole mangled name. So yes, for Rust
symbols they'd have the the type information.

>  Or is this just a hash to make the names a managable size?

No, if that was the only point of it, the "just use two bytes for
length" would be simpler.

But I don't think we want to do run-time de-mangling of names in the
kernel when doing stack traces, which implies that the kallsym
information in the kernel should be the de-mangled names.

That makes the names nice and readable, and also makes this "maximum
symbol length" thing a non-issue.

BUT.

It also means that you can't use those names for linking purposes, so
you'd then need to have a "full version" for that. But as Willy
pointed out elsewhere, you might as well just use a constant-sized
hash for that, rather than have both a manged and a de-mangled name.

                   Linus
