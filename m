Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF0E3C8B14
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 20:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhGNSlB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 14:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239999AbhGNSlB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 14:41:01 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A11C06175F
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 11:38:08 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id h4so3617302ljo.6
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 11:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UdE1i3Kh9CyaztlMs6Tom/6/6Qs2gen6RQY/2APYkeY=;
        b=AXUtjv8MBQH8lKyt8M63dEIAEyBBfZrNFhon2JDYHbP1g+yLEi5UGwHgeTtHD7JMzD
         5/meP3Fz2bjUIG/4XaEtp2OAIWuDOfPQSLD3N1sGNVUh2JuTITrBZZdz75qhCHORTJva
         TtLgvs1nXcRVcFsizTQ9LbO1cPauI/fXnLalwCGRrDV7BNs427ICRgamdxMMNO/Cq15e
         g7qq3ze+lwC8sSIHZvHWvcvcmZnpGdlw0t5u0Qj721Gl1aiJpZDjnZYTm38s9bF7kpx0
         gbcacwGpEZDQ0tfvCS4UG5t6MWlmfOP8V87XlK64YFbJkovf0LCvSyn9LdUtUgGQOpfj
         G39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UdE1i3Kh9CyaztlMs6Tom/6/6Qs2gen6RQY/2APYkeY=;
        b=CW5hhgSqbfQm8ybOrWSS0wwfVpWfF5FOnn72QHJTcZB35WNDKEUe95Q4Fz8AkrOj9l
         6phE+yEQKyUR1Wn9Q9ChnRo2PY5G7697IsZsmhi0sRvYOqs5SqXQPpVzGDqXmy4KZBiT
         KncusFWUgXGQEy1ece3Sf3horKQSM+s+egWmuwsKlc99qytrfhgDjCN6OlOCIM2DR32q
         Hh/qW7GICXjWZTjgu6oF2cJKtc572XfllP9E30bdULGYedHBprshL35UAP0EMfmh5qnp
         hLrzQPR4eVpO+QFLl0tMPvwz5FR37KI1hLNz5VRRbF2owRHeStYeLrXOMUhi6tQ6rbFl
         xLsg==
X-Gm-Message-State: AOAM531bk1QZJ7JJWBWqSQPNicNBi91rfwBWO+rPcJGxaXTS5HyD7dsq
        WOVxqE5YLZfwP5cHdn0wEzZ0r+mbgdAIQ4t912Oruw==
X-Google-Smtp-Source: ABdhPJzc+8HrSkvVMTS1cH/YGyicPG4iEYUp9Do12RUNJ4Kv+xTpm0YsDfVyh/mgmhohYw2Rn99Fy6m4zbhW4b0l6yE=
X-Received: by 2002:a2e:8247:: with SMTP id j7mr10122299ljh.495.1626287886436;
 Wed, 14 Jul 2021 11:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-14-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-14-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Jul 2021 11:37:54 -0700
Message-ID: <CAKwvOdmei2Ckfk5xgkvo8wEXEFK=Yv5-yjKhHoi_bmVr4MiEnw@mail.gmail.com>
Subject: Re: [PATCH 13/17] docs: add Rust documentation
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 4, 2021 at 1:29 PM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> Most of the documentation for Rust is written within the source code
> itself, as it is idiomatic for Rust projects. This applies to both
> the shared infrastructure at `rust/` as well as any other Rust module
> (e.g. drivers) written across the kernel.
>
> These documents contain general information that does not fit
> particularly well in the source code, like the Quick Start guide.
>
... snip ...
> +rust-analyzer
> +*************
> +
> +The `rust-analyzer <https://rust-analyzer.github.io/>`_ language server can
> +be used with many editors to enable syntax highlighting, completion, go to
> +definition, and other features.
> +
> +``rust-analyzer`` will need to be
> +`configured <https://rust-analyzer.github.io/manual.html#non-cargo-based-projects>`_
> +to work with the kernel by adding a ``rust-project.json`` file in the root folder.
> +A ``rust-project.json`` can be generated by building the Make target ``rust-analyzer``,
> +which will create a ``rust-project.json`` in the root of the output directory.

Is rust-analyzer necessary to talk about? I think most kernel
developers aren't using LSP clients, so it doesn't seem necessary to
talk about for kernel development IMO.  If a developer would like to
use an LSP client, they should refer to the documentation of their LSP
client.



Should Documentation/process/changes.rst be updated to note which
versions of all of these tools are currently supported?


> +     - ``armv6`` and compatible only, ``RUST_OPT_LEVEL >= 2``

For the compat table, for 32b ARM, why is v6 supported but not v7? Why
only when optimizations are enabled?

> +Currently, the Rust compiler (``rustc``) uses LLVM for code generation,
> +which limits the supported architectures we can target. In addition, support
> +for building the kernel with LLVM/Clang varies (see :ref:`kbuild_llvm`),
> +which ``bindgen`` relies on through ``libclang``.

Doesn't this also depend on rustc having support for a given target
triple? Just because LLVM has a backend for a given architecture
doesn't mean rustc can target it, right?
-- 
Thanks,
~Nick Desaulniers
