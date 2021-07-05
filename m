Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 458DC3BC428
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jul 2021 01:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhGEXoh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Jul 2021 19:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhGEXog (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 19:44:36 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C76C061574;
        Mon,  5 Jul 2021 16:41:59 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id q2so7503518iot.11;
        Mon, 05 Jul 2021 16:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aCfTGlMojGH7q1QJXZeZs8QLZ5ZIdBw7e0CZiF3gsR8=;
        b=JjR7sUvvS6kav5QF3hQkXuE/+JUWv711JB3bSDTJLFmmXRfe8IBINwG4J+7K/oC0UW
         5SGp8XmW6FqI6C0v1XafKKDptZzdHb5XXHCc+YVxlYl3G7+LRs2L3qHYglIpWXf6+U3z
         Mg73BE2DDh5AhQZZQJ2EmKmP0KvEPyiGmLU++YaWom97BaEeuTeGLaXhJP/Vw0V371xp
         Hk/cUx8/9ueKxPwnS05kTay2OWmjl7NY9xDwPZcv2nmTY7SJKqwjlJ6VbVS5ixhg8X4H
         4EJk6foOA1k0kLoxgmfiV8Lhar3bn2U6kvMEAFaYZqapEG/JvRDaUuLwnX6InCjza6sA
         LBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aCfTGlMojGH7q1QJXZeZs8QLZ5ZIdBw7e0CZiF3gsR8=;
        b=dfw1NDR+sHsrQTswHRZfWDDMA+zTG8uMPq5EuXzJeajVQ7ur6TGTnAYkzAIW3EfcMv
         sXkLzkNjhFUBtvl4az6k4Wi/AyD1t84KLRzmKYyfxZbg6AE3iGOLKOW6eZAt0MFzuZks
         x0QeViX3ssk9BhcLMEzWZxwgi5Y3uZV6TKINiDGpmW5rml0FsiP6RpaTYCjR2N3FBYYR
         Jv+QgxaTT4mKSPWKRn/uyUsm4K1y8ZGqno/v9YCL43uz0GDJU93W1tV5ojalZD5Ea9K9
         Tw0eyV+keM0Aoo9fgeqnnMVS0wN7Q3uuvRz9VT1RrdLiF7lzhKTENxnRk7HMzOwGoTHh
         i7TA==
X-Gm-Message-State: AOAM530uiu8FU6LnaDcUJXfi5rmm4/FV5A9o5wCBXedsM0xGvolXD05E
        GMyiHqukCLEfZ2o3jiWQShAdNCzwWqInWkK1fL+9IV5E/RKXig==
X-Google-Smtp-Source: ABdhPJynnrHlYbTRez7VPIlllJLW8es4fJMVagRPEOAQTtm4CF98jEkHhN86FvCfmqUJtwiQ5lR4OASElEYtMx+3JuI=
X-Received: by 2002:a6b:185:: with SMTP id 127mr6447845iob.64.1625528518759;
 Mon, 05 Jul 2021 16:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-16-ojeda@kernel.org>
 <20210705050518.GC30964@1wt.eu>
In-Reply-To: <20210705050518.GC30964@1wt.eu>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 6 Jul 2021 01:41:47 +0200
Message-ID: <CANiq72n5uxaQ52ME_WNfDQA5fZ=bNEr04Av7vz0AwWB8cOmCYQ@mail.gmail.com>
Subject: Re: [PATCH 15/17] scripts: add `generate_rust_analyzer.py`
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

On Mon, Jul 5, 2021 at 7:05 AM Willy Tarreau <w@1wt.eu> wrote:
>
> You should probably add some doc about this, as I have no idea how
> I'm supposed to use this from my editor.

Yeah, I can add a link to rust-analyzer's docs and/or the Language
Server Protocol site, and perhaps a couple steps on how to set it up;
but I would try to avoid repeating their documentation.

Cheers,
Miguel
