Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6355035FED1
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 02:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbhDOAXY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 20:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbhDOAXX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 20:23:23 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82F5C06175F
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 17:22:59 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id o16so25189891ljp.3
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 17:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yXZNUo89r2h1yes0UyVOBhU7OBJhuW/Q19qWBxn/2nM=;
        b=rXj+cH/RJJkrB/AlmWQGkz1A8EbtqNB8KsnTCaMCUwWaZA1N7BmjNBTIwkXkA4mZbo
         sVrXJkLciidxw0LrI6ww5V+5d02ksBfZlhmr45AvcPXr6nRSoBNgInd6OLWlbh1GyYCc
         zNvfXQNGJfy4PyfXfL7Xcojhh5kHWQWSoHm/rpq8xLCUOL3lJpJRhfewGiGhvArNBGAY
         NyBLc8ZYmgurVBwz7FzkK4PY9dOl07m/dOSZc75lfLCg38Bfxu9P5cbB7oY2MsiL5RMz
         EEPWWKaiHm+TAR/UqXwcno6h3cgNtJRkd+Ro07iV83uZKO4Wy55/U5cfFm+nq2mkRH+E
         FRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yXZNUo89r2h1yes0UyVOBhU7OBJhuW/Q19qWBxn/2nM=;
        b=qCTgOEMwu4J6FdcSstNAu9LcH5BoAV1/6g52rdvnuBiiCKwEs6ck20oEZ8igQKcNEk
         cbWMstJm29qNJd7X4awZwAdlM+GUJaWN98cw1FMONVrS+KqVR5oVEGT7DB3rAyyuEeyO
         6g4QJrJ4Gd8nbUnvqYYOBIVEAnhj/hKeGA3UfZ1hLuoxZGtAUQShJW3SzX6Ic/2I7xqV
         yOEZcpV1riOl6a9+4dnYb0cdcfHSEGXs3q/UXBeWESrhk6dOYaWfyu3G1hscTJiEvSA+
         NLrO8qzbJqLSJk9CfNfcr2NEESzoI3DmzulG2Lw5Yb3+bDSVvTqax3+974g992Pu01Sf
         OGvw==
X-Gm-Message-State: AOAM531Ntzmj/6YiUE2d5sT52xn3ImHjzV8nkxPw4JYsdE4WFYpGxhhy
        2wbImmjAEQgGvxsIOuADW21rE6sOp3QlDd9cSh/L+Q==
X-Google-Smtp-Source: ABdhPJwuIf84XGcLpyrpotifCJFS1sv3n4h0mHFn320uKh8eaoB7u9uNPGDcrrYVDBF0cLM74gjBTXavRVGSwP/cZNE=
X-Received: by 2002:a2e:b817:: with SMTP id u23mr304996ljo.116.1618446178052;
 Wed, 14 Apr 2021 17:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Apr 2021 17:22:46 -0700
Message-ID: <CAKwvOdm8s7Yp8e=8tpscY805-bjQWyoNVzhFZnH4KL-q9ZP4Hw@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 11:47 AM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> Some of you have noticed the past few weeks and months that
> a serious attempt to bring a second language to the kernel was
> being forged. We are finally here, with an RFC that adds support
> for Rust to the Linux kernel.
>
> This cover letter is fairly long, since there are quite a few topics
> to describe, but I hope it answers as many questions as possible
> before the discussion starts.
>
> If you are interested in following this effort, please join us
> in the mailing list at:
>
>     rust-for-linux@vger.kernel.org
>
> and take a look at the project itself at:
>
>     https://github.com/Rust-for-Linux

Looks like Wedson's writeup is now live. Nice job Wedson!
https://security.googleblog.com/2021/04/rust-in-linux-kernel.html
-- 
Thanks,
~Nick Desaulniers
