Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFC2336B66B
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Apr 2021 18:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbhDZQE1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Apr 2021 12:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbhDZQE1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Apr 2021 12:04:27 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E12DC061574;
        Mon, 26 Apr 2021 09:03:45 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id s9so7157838ybe.5;
        Mon, 26 Apr 2021 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gd4ZhEau0qWA2BMeNjBvJSwbDJZQ4gsJUf4VrIX6+54=;
        b=mm3aD12HkBeYcRFSoCWjfkfjRqTOgeMAI0SXaX/PQzrSFKL/l2PZ/M+m4L3sszHP3s
         XRVtgM4w7hJlcvexlT9t34U9TMl/7iyBp26PhAviJlvbSJ09uR8cb1KVUpMXT7jtHAY+
         /KYiCnJuuGeRi2XpRytf+32ZIjyXrhY4s5XoUndagshRFVUA9Ws3LGQh1f8JHd2UAwFJ
         mCr6IlObZYCak7xrXl/I8ylbSA/IX9oq6LXwBK33FS34+Un/gLC3HbhNX4xEfanZF+H/
         aqDIncbwaAWx0QnxNzToQzoE6oVD4JJqHLJvphBfDcU9ngGK+zp7mGEZnaDFpIBP5mU5
         rkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gd4ZhEau0qWA2BMeNjBvJSwbDJZQ4gsJUf4VrIX6+54=;
        b=NwstO1pcVGjLT1k8BqS88izcxxcs+Npv6EmaTFiVLf+EImTEisD4p4JNmYl8WRvDej
         TsMThDf672IfS02ulqSApIGuehsKF00v2bbiNS52D2CpaxfSovdHd1hSHvWiimpjdIiM
         q5wQa8QZQ6YSvCThRpV4IkUKWJrJomhIS3j/ogUiLAUCaRkcQ4beVEvP1s5xgmUQ8ccL
         t856ToewLum71iGQTyLHS4USuqKiRnlBXM9Ub/sUdVA27xwQhn4Q4VMAGN0VhnGmqGj+
         pOi7a3N5IVr9Q5FmKDynpBbWVcm7CXzwk9M7ZvlqgwvZRZPAkR9FkvmKW6klZ3aWsS2Y
         O3fA==
X-Gm-Message-State: AOAM530qm714ONCRqBUx+zLE8s0sBau2GGBfBvJMP8re7aQ5Pz+IZFrG
        45g0xtaA5NnKzKfyVjN4Y0um03jUImBnJZmv6HM=
X-Google-Smtp-Source: ABdhPJyZbmD3r5DnAQLJo+hcsM5MEAzeCoCaQm//N+Yyqb5Ur/oT8kBKWb4m4+w0X7R+Du5POs39jHYvBMfutm3ccsE=
X-Received: by 2002:a25:9085:: with SMTP id t5mr27355436ybl.26.1619453024883;
 Mon, 26 Apr 2021 09:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <YIGVFCymUn+4HBIj@google.com> <CACRpkdat-4BbKHMBerdxXBseMb9O3PiDRZmMLP_OWFE2ctSgEg@mail.gmail.com>
 <YIbQ3dHOpyD/yymW@google.com>
In-Reply-To: <YIbQ3dHOpyD/yymW@google.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 26 Apr 2021 18:03:33 +0200
Message-ID: <CANiq72ngdcxj44cybyRE57ziMQ16DNzOG2U=cOM=X=6eZ_YMwA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 26, 2021 at 4:40 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:
>
> I see now that Miguel has already responded to this thread so I'll stop here.
> Happy to follow up on anything.

No, no, the message was directed to you, and you gave very nice examples! :)

I think having both replies is great, we gave different perspectives.

Cheers,
Miguel
