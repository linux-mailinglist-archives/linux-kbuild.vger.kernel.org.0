Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB388BF22
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 19:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfHMRCb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 13:02:31 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44200 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbfHMRCb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 13:02:31 -0400
Received: by mail-pf1-f194.google.com with SMTP id c81so2938654pfc.11
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 10:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BG31IdTtyicCDPh3vXx1nhiittmwUB0Yq2rcUYCbYUo=;
        b=K8XRlY7JDJXLNNvGqHfdVZJQ9a5VNjCkjwZANDUW9TuuB1ZEzYERq3mQwjA8BJ9Y4s
         6XJQTwJpGEgBRyf8UaDjL5hrQiCF2jXaT3Pvmh8bbF9bFBcB6C+4UHT8SpOLWJSHDzrD
         mlDFiQwDwmY3oYYVCIbumbAWcbokEXIT+zEgaWsug4nYa6isFt3sH8TYHWYCPi0m9IPA
         XElwL6x+27qM3o+3I+oxteDi0nbA4Uo/Uk+dz7ss+8bCoHNYg6vG++6KRWD0JEefIpaL
         qfYFRveEQPkczl1IiwPGtk6E4NYNbK4FWlm87eXuk8Ui9uwOfgH1pdPq3nnModSdZ2NK
         Ex/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BG31IdTtyicCDPh3vXx1nhiittmwUB0Yq2rcUYCbYUo=;
        b=Z9fDeT7TUX9ehiHNwgydLmzjhi3ANLamdsywextH7ZmqbKxBVD0J1inEZ/HM9CVGgs
         QCWYekstJ/Z7uwqoY3DQmYktWUEHAI4GP+XeesDVZ5W/NTv4WF9gDIYMNmpabxUyJuYh
         9tNfK+nFoB94y+tHz2v+9AhZRCgEtfo3xBZIz0oXHiD9DZ2iskFfJ9O0ySL7Qi9h1QDq
         C77GiMMecFU9y8U7wcsX50fs5dsvf60qaBpOZiaahbhTlGC+RXjlRRBB1GyGat0ZJASQ
         /LRhC6ZYyT/CEuOkLDGibEKU8TcvZ/GK0YCd7HYpsuwfqAPPcWe/OXEwDkE3sGiZyuKT
         GXKw==
X-Gm-Message-State: APjAAAWZXZfmcHP6tWU3+Y09CmkR/0qRrYPa4osEEu9XNHZNyoLaw6sq
        WpW7qS507kZYTC96LXJJOt9YTW4US7vaXqC4MyYm7Q==
X-Google-Smtp-Source: APXvYqwySabXHotNvQRy/UUN/EhAL08CmISGwSZKsEXDa2DGE+8KsL0EhT8WGXmfoKi4f5IrGA753TLXzw9BhWqTRdA=
X-Received: by 2002:aa7:8f2e:: with SMTP id y14mr12687349pfr.113.1565715749878;
 Tue, 13 Aug 2019 10:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
 <20190813082336.GB17627@kroah.com> <f0e1a6efa8f21ab93935c4c19e13b904d4a71f98.camel@oracle.com>
In-Reply-To: <f0e1a6efa8f21ab93935c4c19e13b904d4a71f98.camel@oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 13 Aug 2019 10:02:18 -0700
Message-ID: <CAFd5g45eK8LRgXj0vnY4ONB70+EeR2gjk+Dv9+b6Lgf+ykJu-Q@mail.gmail.com>
Subject: Re: [RFC 00/19] Integration of Kernel Test Framework (KTF) into the
 kernel tree
To:     Knut Omang <knut.omang@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Shreyans Devendra Doshi <0xinfosect0r@gmail.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Hidenori Yamaji <hidenori.yamaji@sony.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Timothy Bird <Tim.Bird@sony.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 13, 2019 at 2:51 AM Knut Omang <knut.omang@oracle.com> wrote:
>
> On Tue, 2019-08-13 at 10:23 +0200, Greg Kroah-Hartman wrote:
> > On Tue, Aug 13, 2019 at 08:09:15AM +0200, Knut Omang wrote:
> > > and in the making::
> > >
> > > kunit/                        (kernel only (UML))
> >
> > You are going to have to integrate this with kunit, to come up with a
> > superset of both in the end.
>
> Yes, I agree - getting to a unified approach has been my intention since I first brought this
> up at LPC'17.
>
> > And I do not think that kunit is only UML, it's just that seems to be
> > what Brendan tests with, but should work with other arches as well.
>
> If I get Brendan right, it is UML only now but can be extended to also support
> kernels running on real hardware. Still it is kernel only, while KTF also has the
> hybrid mode, where a test can have code and assertions both in user mode and kernel mode.
> This is made easier and more streamlined by letting all reporting happen from user mode.

Nope, the KUnit patchset currently under review *does* support any
architecture; we have tested it on x86, ARM, and UML, but it should
work on any architecture.

I added support for that a while ago due to popular demand.
