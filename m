Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C6F3BC44D
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jul 2021 02:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhGFAJm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Jul 2021 20:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbhGFAJl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 20:09:41 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E505C061574;
        Mon,  5 Jul 2021 17:07:04 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id l5so22715514iok.7;
        Mon, 05 Jul 2021 17:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HWIixnnyJo+DhFLgoAE7s9KutlRLM2MMSVTjE3yIFGE=;
        b=h/T+vh+XlJJWZ6wFsveY2rN5V4HkdSrNHYHfQd1w8wmXFNtpSHXM27nXa7yqhwnygM
         Vyn/aN4MQi4yxZQ+JbzfkJLCjUS9l4ovhYrponiy5zG+WeruKdo5xGNpzdm+W+30/Pxn
         SCNqOdke+quMakmVzzqG+LHKF7WqlfXkh1b2zMIAslGnK3dJBaDjOgy61jDMzUYwqLuz
         +mgx0q32H++67NI4wl66vYBU6DHAQVvaxjRO2unQmjw992fND+WjezDAfIC9ToFDu0/F
         a6IFWW3rGtm/7b1Q9qns3kpCicWrGTrM34ESQ2ACyf4PTw3S16rEFcfc6sLnzefYW7sj
         GDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWIixnnyJo+DhFLgoAE7s9KutlRLM2MMSVTjE3yIFGE=;
        b=fcjz65HZ2QGcLRgoY/TorQz3CvhL8caIk9TT55Qp99zJXaK4CjWTkGdBqh8eWOY7Th
         Xbfyl2Ewsi9qUvfMX6PCz0AL78evI06jXS2pCNNzNUpUyocP3afKZKcR/D8zSiW8/gZf
         FkbLiBrn5pedmEyGb4evMOIbaeHcap9Z9zFhG6dXgOuxDotbLTyI7NRciQd+B//u208K
         CC9h12LsEEmfymQ0coKBVmFD2vmcA8wd0A806o0xiPosX/sh9BrR7gCJA+UotxJ+OM14
         FY/SbORvJo6Hju815VFcDgyEDZ5Zu+LvsW3jvZCyF7veoTCOzD8EZOCAO9G/SHKh97Jp
         nb9Q==
X-Gm-Message-State: AOAM531GreD0JpYR7DyxQMgCAwPm0YLXxl6wVvm51mtWwnPF3u8iMXqf
        LBWCBevh13Eyi+e6iWC2kjfLB0hPwrCMH+cEHmU=
X-Google-Smtp-Source: ABdhPJzBWL15ESGqXCv8pNv+0U+/wqKBNs1LqLWgLVgncOWi6tUCc+7SJs2W7/G6qvZW6dQBrCUzFHzLpQzZq+2ulik=
X-Received: by 2002:a05:6602:42:: with SMTP id z2mr13537324ioz.91.1625530023507;
 Mon, 05 Jul 2021 17:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-14-ojeda@kernel.org>
 <20210705050234.GB30964@1wt.eu>
In-Reply-To: <20210705050234.GB30964@1wt.eu>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 6 Jul 2021 02:06:52 +0200
Message-ID: <CANiq72kvv1rYa-TY3EvM5tBc4d0bhuNH8u56b8PM4PQd1ngmTQ@mail.gmail.com>
Subject: Re: [PATCH 13/17] docs: add Rust documentation
To:     Willy Tarreau <w@1wt.eu>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 5, 2021 at 7:02 AM Willy Tarreau <w@1wt.eu> wrote:
>
> Miguel, the wording and style in this file is not much welcome, it looks
> like a copy-paste of an e-mail in the doc. The exclamation above "this is
> a very good news" doesn't really belong to a doc, and for readers who don't
> understand why it appears as a good news to the writer, it probably is an
> even less good news.

Yes, I can definitely be more formal here.

> In general you should avoid "we" and "you" when writing documentation.
> Prefer passive forms instead, which do not place a barrier between those
> who teach and those who learn. It's generally considered more inclusive
> in that it makes the reader not feel outside of the team who wrote it.

When I was writing this, I wondered the same thing, because in Spanish
this does look quite bad (in the sense of being too informal), and we
use the passive forms a lot more for things like this. So I am fine
rewriting this. Also, mixing we/you is not ideal either.

Having said that, I am not sure about English and whether people
prefer to read text with the passive form or not. In `Documentation/`
there seems to be a lot of "we"s and "you"s, but they could be wrong
too, of course.

> An additional note is that if the language imposes such unusual constraints
> on the editor, you should probably point to various known settins for most
> well-known editors.

Are you referring about style? If yes, it is possible to write the
code with a text editor with no extra features and then format it, so
that should not be a problem.

> You should also clearly indicate how to recheck (or adjust) individual
> files, not just say that the command supports it.

Sounds good -- I will do that.

Thanks a lot for reviewing the docs!

Cheers,
Miguel
