Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6288362215
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 16:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244654AbhDPOVj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 10:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243051AbhDPOVj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 10:21:39 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85077C061574;
        Fri, 16 Apr 2021 07:21:14 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id x76so20277360ybe.5;
        Fri, 16 Apr 2021 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t2GyCAH28OFUKirekIiqG8QH/lg+7x2E9PX/3Ek0zoE=;
        b=DN4360cPG7/skv/Q3gCUFB73HgA3nzH+525Cgqh/o/Sulu0m4bTBwnHevUocDCwwi6
         3qKax591nZdA0Ojb9AD3uRCojJykqMb+8bJHhI+Nqkdf9/DJwxtNq/NR8pC79rWyC7T1
         auBKfUYycwbn6OXqgA5WR9zkM+uswdjdM6SUkV3McSJaZpHLKY2JiBOGP3ueW9iJnAMn
         IZP+dT6lmrZi0uK5RGzHWWA2ni+Ngn7SPxd0Cw3UO6vxmRc8FwVBxda/Hzpud1hVUjpp
         sQe2N34/JXAfj5aBTxyAzE6SlWTMIbR3o1kVakAQkmK1xkhe78cdZz3SjJdxDi+o9oak
         ZLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t2GyCAH28OFUKirekIiqG8QH/lg+7x2E9PX/3Ek0zoE=;
        b=LrvISHeis84s5EpObdJmQtUvdow83rCZ2l6GuVs+ksEBGg2sNTKZrxkxsd6CN3N60h
         CJQbc5KSJBAWz27XrrrMGZupizmVt4q3c9RHVdeD+J3NHT6n3MTbmlpVG2AyASviub4M
         YgXmcLcD2kQztsXJr07p9E6vbNchLgXAbGVctAgFey3AO80oNiMBo2JStKdi6o6DRA1u
         fW8V1OhjZaPuIDm5KnMm1aQtkoDXSbQwV+xEIWGjvXEIEz9dXOvnHCTRR+D4OAgAwfht
         ZtXsoZsjA07Zo01oHxt8C5E9Dy5/IqdrGcgHqP7sh6moDbySESY1TfX0QfOLUl/rAlxc
         hk9Q==
X-Gm-Message-State: AOAM532oXh8MOsgVm+B8j6fGbPm1N4EMOw41x/vIq71IhOoPLunJ+nQE
        taBSWwsW3e0rc+m5KenubDeOrLjiAMvpaiWesrs=
X-Google-Smtp-Source: ABdhPJwVsoVQM4VZt7oKFcbdYa2NYRotI8uUuXF4t8Xeg5W0UK22rrX/4IWKKe6OqKVB+3im4D0wY+ZKRHlKUQVjdwI=
X-Received: by 2002:a25:6803:: with SMTP id d3mr12588384ybc.422.1618582873937;
 Fri, 16 Apr 2021 07:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
In-Reply-To: <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 16:21:02 +0200
Message-ID: <CANiq72=LE64F9VDvr5aajeBNfXCvVK+yXN8m97jo-E6TDHNVbg@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 1:24 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> IMO RAII is over-valued, but just in case you care, the below seems to
> work just fine. No fancy new language needed, works today. Similarly you
> can create refcount_t guards, or with a little more work full blown
> smart_ptr crud.

Please note that even smart pointers (as in C++'s `std::unique_ptr`
etc.) do not guarantee memory safety. Yes, they help a lot writing
sound code (in particular exception-safe C++ code), but they do not
bring the same guarantees.

That's why using C language extensions (the existing ones, that is) to
recreate RAII/guards, smart pointers, etc. would only bring you to a
point closer to C++, but not to Rust.

Cheers,
Miguel
