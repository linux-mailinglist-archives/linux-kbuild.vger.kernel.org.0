Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39CE35FE79
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 01:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbhDNXfA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 19:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbhDNXe6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 19:34:58 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCE87C061574;
        Wed, 14 Apr 2021 16:34:36 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id c195so24049883ybf.9;
        Wed, 14 Apr 2021 16:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lpeq08hz5AFe13tA1HBxBv4F7DKthixhqDeaeuhPzqo=;
        b=RcHvTa4XIaTS5N3Ex/HbpYPVaN49e6k0T/y6QkMMmft+ABpIRAQFqBI9Ei7CfR9p7T
         MB7pGJpymxr/LQU1zO2DqR7roeV/JxnaE1li2O1JBq+MhzOkT/d5ip20USlS2pDr7RQZ
         fld2zhJ9XMf82hzNQP2VH3lg91STNXxcmTvrtDhfmW1p1v9/PFI4e5AeKem2JpJAZxeX
         gr4tauGFJ521zWOciWLgPhbIMZKdbMz0tsf15JduAeoQDKaTv6DQFnZ0gRizwcJ6bYPJ
         rxqnwc8Z434lKKgXVQ6mzlf2RFUx+FSNqOdvAR3mXEGustVigR7bMmsMdVUcsMH9yf37
         LMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lpeq08hz5AFe13tA1HBxBv4F7DKthixhqDeaeuhPzqo=;
        b=ullXS0NLTM3XrRJSkbFLPgoJdrpeStK1YD1Z+GhFgGHnVjaPoTVkhzETNFFPz8sMH0
         4XvtfzizH9utE6RPdCXB1DejHO5P7jGIke5gXo3BXKKdlB8XI0kbDcB5WiGmIeBXivk3
         DorXU7bZUs5XnDliHW8lyrK5mcsCNqT5Rye1ODUsv1tRLIE0oUGophI0iFH25XU9AkK6
         Sfd1NB7MCHgLdKqN0VR1gVlqHZKQWPG61WVI2bMEQ1BDX1DRP/11ZB7NeGG6iMBSyPS0
         kfosmJU3WglkQduOLlDCt8XgtM2dqmVxzFvQXug5QWog1ZAMdd7VIcL5sAf9fHgq8/mN
         xb5Q==
X-Gm-Message-State: AOAM532grkvcIilU7GyC5SdJfu3DGoUVql6vb+eywm0MhaWf76AYaX3d
        /wd+Ph+j6FFCZ4+KlR1mYfGk4yPnlR6Mla/qlwU=
X-Google-Smtp-Source: ABdhPJxmSfQlVHqPImE3jN3Xs98GzPwiT4MsZztyKgOPuWOzqTtTLp6Fazuc4tu0tp2hTTY0Uh/sNGcsTm0owhCBa4o=
X-Received: by 2002:a25:81ce:: with SMTP id n14mr568991ybm.33.1618443275959;
 Wed, 14 Apr 2021 16:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-11-ojeda@kernel.org>
 <CAKwvOdmXNAm+TcypR0dCayp9bJ7RFcgLx5sB8_2MfzO31T3PJg@mail.gmail.com>
In-Reply-To: <CAKwvOdmXNAm+TcypR0dCayp9bJ7RFcgLx5sB8_2MfzO31T3PJg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 15 Apr 2021 01:34:25 +0200
Message-ID: <CANiq72nnKU=TUxb0NGqwO_V-TJP9DOkzoYteVi2uhBgv3UB8cw@mail.gmail.com>
Subject: Re: [PATCH 10/13] Documentation: Rust general information
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nick,

Thanks a lot for looking into this!

On Thu, Apr 15, 2021 at 12:18 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Was this TODO meant to be removed, or is it still pending? If pending,
> on what? Being able to link back on itself if/once merged?

Still pending -- the plan is to upload the docs to kernel.org rather
than have them on GitHub, and ideally have one version done from the
CI automatically on e.g. every merge, but that requires some sorting
out.

But yeah, I could have put here the link to the temporary docs in
GitHub for the moment, good catch! +1

> Consider if the docs need any change here based on behavior related to
> Panics based on feedback thus far in the thread.

Indeed, it should be a very rare occurrence. I will add a sentence
saying that one needs to be really sure there is no other way out than
panicking.

I have to write a few more bits regarding some new guidelines we follow/enforce.

> That link has a comment that this was fixed.  Is the comment now stale?

There were a couple things to resolve regarding LLVM 12 last time I
looked into it, so I didn't update it (also, it is safer in general to
use the recommended nightly -- one never knows when things may break,
plus some nightlies do not include all the tools like `rustfmt`).

So my current plan is to recommend a given nightly, and update it only
when needed, in tandem with the CI builds (we also test
different/newer nightlies in the CI when possible, e.g. when the LLVM
12 bits are resolved, then we will also test one with LLVM 12).

> Perhaps worth another cross reference to :ref:`kbuild_llvm`?
> https://www.kernel.org/doc/html/latest/kbuild/llvm.html#getting-llvm
> Perhaps amend that then link to it from here?

+1

> Avoid terms like recent and modern.  Otherwise in a few years 0.56.0
> will be archaic, not recent, and you'll need to update your docs.  So

+1

> bindgen does not distribute libclang?

AFAIK, no, `bindgen` expects you to provide/install `libclang` (and
you have some knobs to control how it searches for it). But it looks
like they also allow to link it statically.

I was looking into this a while ago to upload a static version to
kernel.org somewhere (actually, a full Clang/LLVM and the rest of
tools for Rust support), so that kernel developers had an easier time
setting things up. Konstantin Ryabitsev told me it would be possible,
but we need to sort out a few details.

> Please reorder; prefer LLVM=1 to CC=clang.  Probably worth another
> cross reference to :ref:`kbuild_llvm`.

Will do!

> "new" as in changed, or "new" as in Rust previously did not mangle symbols?

Changed -- currently (in stable) they use what they call the `legacy`
mangling scheme, which is very similar to C++'s (and used the same
prefix, `_Z`).

Cheers,
Miguel
