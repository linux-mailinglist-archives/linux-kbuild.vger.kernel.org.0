Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41F4E3BAF4C
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jul 2021 00:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhGDWKJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 18:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhGDWKJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 18:10:09 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C48DC061574;
        Sun,  4 Jul 2021 15:07:32 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id a6so18832071ioe.0;
        Sun, 04 Jul 2021 15:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=05she7BebQToiOG9+5YIFDb8dpV+qdvFN2Mp0G6JwGQ=;
        b=LQRXKRgAO0vpzVV64LGyfo0xEOESXt/ZiLWiXcL6ZkD4SI6XT1Ys+8k5r55z59mSNO
         FR9S7fCN3COu5vcXMQHbeX3FLi/9Dr1h6ZRIln6rBtxrDpQlrHp9+NNmT6+92cn8e0nV
         e4UXwkKjx5Baj+O60QynR9RKWJc0NT3haRn+1BtF1ZNitUbb6vl4quM3K/R0bLXX8ugJ
         SvPZ/+VbyAAMISQzaA66hB/zvw2YJnNeD11QHV7KW20Z083mT1xoSKT9moSC2yeIqGk5
         rMVCN6XggNPlnzVSq4TXeb/TRXtzaFth1YYt018lXyZjqphOSGgPLQtvLP2OdwmuY7iJ
         DPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=05she7BebQToiOG9+5YIFDb8dpV+qdvFN2Mp0G6JwGQ=;
        b=e1NO1f4SK3KehcYF7jKzVCzbdc7jtLb8YznVIzrE4gFTv1wOBoO6I1RVDY4RfrqMNw
         5V4GzxnPEvjKLKN8VWdtUvthyanO+HGzbsIYxnMGMzqtBBTZ2yXMSa028O+fuDolr1DZ
         VHACAcfQpbv4vrAchgMryMTugIPHo56zQRQzATFYWePGa1fgd3VXf132Gb21Yg4irrqh
         GPAlYkoMc5aDvAznpe5xHLP7JfUs1jMEIWlDAEsqtLF4ZwIVpghl/dWP48iV04acevqn
         UBqLaH1Hnj/39jS7QXn5ltKXh1Hl7f9+1OLYbV4DnVsndTUUm0+Ar4QbYTeSej4dZCig
         Jy7w==
X-Gm-Message-State: AOAM5324TJXmMOIg16ljTBdYv8bLdjgeek0uvy5XZVV5cM0YDDRZMrN+
        iLgjHAZDtO/Md4l+e1uMOnP2dxSTpY1fXKLbtxY=
X-Google-Smtp-Source: ABdhPJyf7yeKai3nFZGwoPrUbwfSUAY1oGznUME1VDuSKDHmocjr2HPL6vAi4QRegTKj1Ce5JwyYy2KH9AJ6fLztJ70=
X-Received: by 2002:a5d:8c9a:: with SMTP id g26mr1001143ion.121.1625436450576;
 Sun, 04 Jul 2021 15:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-2-ojeda@kernel.org>
 <YOIicc94zvSjrKfe@casper.infradead.org> <CANiq72=eHs870jbmZz8CUEUuN2NOCaKS9-F6-jAb0QXje2x1Eg@mail.gmail.com>
 <YOIpM3iFT5roz69i@casper.infradead.org> <YOIs1UiKjlF89sJx@casper.infradead.org>
In-Reply-To: <YOIs1UiKjlF89sJx@casper.infradead.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 5 Jul 2021 00:07:19 +0200
Message-ID: <CANiq72=4OpDhJRuo7xCWXhMuyttWAnRMKpCL7Soyqho9Qy8_8w@mail.gmail.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte lengths)
To:     Matthew Wilcox <willy@infradead.org>
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
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 4, 2021 at 11:49 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> I'm unfortunately in the middle of ripping apart and fixing up my test
> infrastructure, so I can't claim to have really tested it, and I don't
> have a module with a really large symbol anyway.  But I'll submit this
> to you as a proper patch with changelog if that's enough testing for you.

Sure, and thanks! I can give it a spin with our tests.

Cheers,
Miguel
