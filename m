Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C21C3BB68D
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 07:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhGEFFf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Jul 2021 01:05:35 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:57233 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229716AbhGEFFf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 01:05:35 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 16552YmW031002;
        Mon, 5 Jul 2021 07:02:34 +0200
Date:   Mon, 5 Jul 2021 07:02:34 +0200
From:   Willy Tarreau <w@1wt.eu>
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
Subject: Re: [PATCH 13/17] docs: add Rust documentation
Message-ID: <20210705050234.GB30964@1wt.eu>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <20210704202756.29107-14-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704202756.29107-14-ojeda@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 04, 2021 at 10:27:52PM +0200, ojeda@kernel.org wrote:
> From: Miguel Ojeda <ojeda@kernel.org>
> 
> Most of the documentation for Rust is written within the source code
> itself, as it is idiomatic for Rust projects. This applies to both
> the shared infrastructure at `rust/` as well as any other Rust module
> (e.g. drivers) written across the kernel.
(...)
> diff --git a/Documentation/rust/coding.rst b/Documentation/rust/coding.rst
> new file mode 100644
> index 00000000000..5cbe132f461
> --- /dev/null
> +++ b/Documentation/rust/coding.rst
> @@ -0,0 +1,92 @@
> +.. _rust_coding:
> +
> +Coding
> +======
> +
> +This document describes how to write Rust code in the kernel.
> +
> +
> +Coding style
> +------------
> +
> +The code is automatically formatted using the ``rustfmt`` tool. This is very
> +good news!

Miguel, the wording and style in this file is not much welcome, it looks
like a copy-paste of an e-mail in the doc. The exclamation above "this is
a very good news" doesn't really belong to a doc, and for readers who don't
understand why it appears as a good news to the writer, it probably is an
even less good news.

> +- If you contribute from time to time to the kernel, you do not need to learn
> +  and remember one more style guide. You will also need less patch roundtrips
> +  to land a change.
> +
> +- If you are a reviewer or a maintainer, you will not need to spend time on
> +  pointing out style issues anymore.
> +
> +.. note:: Conventions on comments and documentation are not checked by
> +  ``rustfmt``. Thus we still need to take care of those: please see
> +  :ref:`Documentation/rust/docs.rst <rust_docs>`.
> +
> +We use the tool's default settings. This means we are following the idiomatic
> +Rust style. For instance, we use 4 spaces for indentation rather than tabs.
> +
> +Typically, you will want to instruct your editor/IDE to format while you type,

In general you should avoid "we" and "you" when writing documentation.
Prefer passive forms instead, which do not place a barrier between those
who teach and those who learn. It's generally considered more inclusive
in that it makes the reader not feel outside of the team who wrote it.

For example the last sentences above could be reworded like this:

  The tool's default settings are used, which means the idiomatic Rust
  style is followed. For instance, 4 spaces are used for indentation
  rather than tabs.

  Typically editors/IDE will have to be instructed to format while typing.
  (...)

An additional note is that if the language imposes such unusual constraints
on the editor, you should probably point to various known settins for most
well-known editors.

> +when you save or at commit time. However, if for some reason you want
> +to reformat the entire kernel Rust sources at some point, you may run::
> +
> +	make LLVM=1 rustfmt
> +
> +To check if everything is formatted (printing a diff otherwise), e.g. if you
> +have configured a CI for a tree as a maintainer, you may run::
> +
> +	make LLVM=1 rustfmtcheck
> +
> +Like ``clang-format`` for the rest of the kernel, ``rustfmt`` works on
> +individual files, and does not require a kernel configuration. Sometimes it may
> +even work with broken code.

You should also clearly indicate how to recheck (or adjust) individual
files, not just say that the command supports it.

Regards,
Willy
