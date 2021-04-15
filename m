Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6C433606F7
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 12:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbhDOKTB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 06:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbhDOKTA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 06:19:00 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D35CC061574;
        Thu, 15 Apr 2021 03:18:35 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id v72so4820351ybe.11;
        Thu, 15 Apr 2021 03:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PcaOmJM+RUTf70CDN4cJXMLtcTANk8Y9Xg/5XpH9Ox8=;
        b=pG9s2mX6BuQVFDgO9/yYn5LO4TXJktxm3v+6r93VXWMPYllgdwmRQMlcc+MHJEvO0h
         1mM5jOsvbxO0kB9vKK+X523HSAWI20NImJYNkPrLoY9VKymrWLLbZ1Lexj/s56DRXPuk
         3nKBP129CzBdRUqwBnj3h93Y6bHeOiJPhSwHAGoHxO6Eq/bTfjRVCI5s8OFxTu8WXoVk
         GobTETgvHtMb4p9zxwKPn85ikY4QK6RFykOU/py4BXj5EkpJDJfi8sAz2hz+d1OJ4mms
         MPtLN54vYJbxA+2aHT9GqQfaLb9hKywEZ1leuB1pIXQO/4TnhlyNHhDLyc/mowjQQBl8
         c7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PcaOmJM+RUTf70CDN4cJXMLtcTANk8Y9Xg/5XpH9Ox8=;
        b=fE9AWNkyLGncKNE7lLhvXwIBu6OadHzaaYXJpECS3wyoe58ciUCcThKXXz3+rcpWSe
         O5l3U0Z1Uvlk+aspOXyu/3GVJKR6YsS94RrGX5rdBmBDAcGVG3obM35qwGJr3lit8JuV
         bg9D216mwwLAZmaj2fN5ZZF0mjXw0HZdfqRf/3QrDZcDG8Ho+8KR+i4Rqgq5nixN6QBb
         6CF2WIdIsmAMAG4dgJ9YBoFx60+GjTiiLcwbXTmc2+/pqvt+dTmYFIeK3k9ZIYIsoZei
         s5B8erkzAWCbt8anwqUt189bAcpXu4p8hV4LkmS16AL+PSjpwYE/1hCZ2frfxzDp5ftc
         OhXQ==
X-Gm-Message-State: AOAM532vidIxcrCom1D/bRa0X05WzSkDlNblq/FycUAnEDpjYmXiNjs+
        7VbAPcloVqKQK/S9Dr/loQceg5+0rbVeXtHvll6Tzg6sAOA=
X-Google-Smtp-Source: ABdhPJzev0b00I8H04t+puKpS9oVCBptJMCnMWYb+B/5VWVKSlqdlGbQLNgzZFp4lzd16JFDSQttdzMZoCUJEDkrjec=
X-Received: by 2002:a25:81ce:: with SMTP id n14mr3064323ybm.33.1618481914302;
 Thu, 15 Apr 2021 03:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-4-ojeda@kernel.org>
 <YHc7pHjwmDJrkXqZ@archlinux-ax161>
In-Reply-To: <YHc7pHjwmDJrkXqZ@archlinux-ax161>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 15 Apr 2021 12:18:23 +0200
Message-ID: <CANiq72=+PwvbsuTatQ3mJekmrcMaM2Nb2YPnyAEAO29sTjmxPw@mail.gmail.com>
Subject: Re: [PATCH 03/13] Makefile: Generate CLANG_FLAGS even in GCC builds
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michal Suchanek <msuchanek@suse.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nathan,

Sorry, with all the other things I ended up not replying to you before
going to sleep.

On Wed, Apr 14, 2021 at 8:59 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Shuffling this around will cause this issue (I never saw you CC'd on the
> thread).
>
> https://lore.kernel.org/r/f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de/
>
> Perhaps that patch should be added to this series?

Ah, thanks for the pointer! Yeah, I was not aware of that thread. It
is good to find these bits though, that's why we are in linux-next
after all! :)

Cheers,
Miguel
