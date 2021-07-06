Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C39053BC4B6
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jul 2021 04:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhGFCMv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Jul 2021 22:12:51 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:57267 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhGFCMv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 22:12:51 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 16629og3032325;
        Tue, 6 Jul 2021 04:09:50 +0200
Date:   Tue, 6 Jul 2021 04:09:50 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
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
Message-ID: <20210706020950.GA32301@1wt.eu>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <20210704202756.29107-14-ojeda@kernel.org>
 <20210705050234.GB30964@1wt.eu>
 <CANiq72kvv1rYa-TY3EvM5tBc4d0bhuNH8u56b8PM4PQd1ngmTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kvv1rYa-TY3EvM5tBc4d0bhuNH8u56b8PM4PQd1ngmTQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 06, 2021 at 02:06:52AM +0200, Miguel Ojeda wrote:
> > In general you should avoid "we" and "you" when writing documentation.
> > Prefer passive forms instead, which do not place a barrier between those
> > who teach and those who learn. It's generally considered more inclusive
> > in that it makes the reader not feel outside of the team who wrote it.
> 
> When I was writing this, I wondered the same thing, because in Spanish
> this does look quite bad (in the sense of being too informal), and we
> use the passive forms a lot more for things like this. So I am fine
> rewriting this. Also, mixing we/you is not ideal either.

Indeed, I can imagine how informal it could sound in Spanish.

> Having said that, I am not sure about English and whether people
> prefer to read text with the passive form or not. In `Documentation/`
> there seems to be a lot of "we"s and "you"s, but they could be wrong
> too, of course.

It's possible. While I've seen it used a lot in training or step-by-step
instructions which aim to guide the reader through a procedure, it's not
commonly found in documentation. One principle to keep in mind is to only
focus on the subject. If your documentation describes a component or
process and does not involve a human, there's no reason for introducing
this human there. If it explicitly aims at the human (e.g. instructions),
of course it makes sense. But anything that can end up in a script does
not require a human and should avoid we/you.

> > An additional note is that if the language imposes such unusual constraints
> > on the editor, you should probably point to various known settins for most
> > well-known editors.
> 
> Are you referring about style? If yes, it is possible to write the
> code with a text editor with no extra features and then format it, so
> that should not be a problem.

Yes that's my point, it will likely be the first experience for most
casual visitors who have no idea how to reconfigure their editor or
who don't want to risk to break their existing config.

> > You should also clearly indicate how to recheck (or adjust) individual
> > files, not just say that the command supports it.
> 
> Sounds good -- I will do that.
> 
> Thanks a lot for reviewing the docs!

You're welcome.

Willy
