Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE9E36E472
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 07:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbhD2FWB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 01:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhD2FWB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 01:22:01 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CCE4C06138B;
        Wed, 28 Apr 2021 22:21:15 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id i4so39369698ybe.2;
        Wed, 28 Apr 2021 22:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=bk5Ob7CCSkxgpUrCOFhPasSXGbwrQ7f0CMySgOzlGqY=;
        b=eQqoItrc2wWfeqt0tZsaF1mnNI1b28o0F595TuAnJRAubWC3U+vs9T+D6wQNl05lUN
         /EczTswTMaCwPEtx4lVqJBBHtZsTd5oAZqeP91PtY6Q0+5XciuzlL6so+qihW5gVERjR
         ilxCqjcg44bJNYUiWc3EDyeQgandNWvXoSqZVsDvY5WjBAUu1bkwVp90NhY0gw8xt/oy
         dhiX6d7nxUR1UVD5YOvrHPzI6gAJ8NGmjIV4zddYgGsCJc+Mud5KJ0kTVPAyw0nJk9x4
         Q0FsaHAO7VTG+KlAuXdxEZoyYxRluNtYsDG9y0T68HNLNerbfNsp8IBpgClCJpE/1HO8
         KM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=bk5Ob7CCSkxgpUrCOFhPasSXGbwrQ7f0CMySgOzlGqY=;
        b=Fq/B8utBnFBEj7rJXigKTPYVhdCKkhEPUz2HT19jipaQc8+ZDfnrK7yd44yERxmsAb
         66d9wLeW4HRO+M9gdE260Um9uAI4n6JPSrBnYh3dPpH2Q8Hr5Oj2H36BG5RVOKqXQjMk
         BObDAhchYCYOfSPXwvtYUSFq8I4bFcFFYRBKAAkRss6BVZ7eFuoX/+gqrSeIyliIaaYz
         og2rIiiXKSmAq1lNMhrYykj1WPbIji1AU3I6/TlD5wRAcOUE006h1dN3M0k2p02OsaQr
         XuhIH3eoeahK2dAgkHLaJoRpjcPxd+WFYHqIVQdk8R9w56SftezPmgIMWdckl7hi26fk
         9l4Q==
X-Gm-Message-State: AOAM531o5FoLMWI2G5NNWlu/yBpw2XUtCETFOjddrgo8kXfCgcwi8N74
        DSYS70EweyTfzyj6HKxiRZMmixCq4IJZjA0e5Xc=
X-Google-Smtp-Source: ABdhPJwFM334XR+nINOlxp/4VwcZmel8tWLP2MPOVPqARa6kJ3YiRgrskngSS8sFfLvJhqaovvMtFy574eQ+6JeN5oc=
X-Received: by 2002:a25:c941:: with SMTP id z62mr43669776ybf.130.1619673674769;
 Wed, 28 Apr 2021 22:21:14 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mceier+kernel@gmail.com
From:   Mariusz Ceier <mceier+kernel@gmail.com>
Date:   Thu, 29 Apr 2021 05:21:04 +0000
Message-ID: <CAJTyqKMLaav7VCAZS9p8wh0UamACYq9p6h=LsyrCeLqG_O2Jcw@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 28/04/2021, Nick Desaulniers <ndesaulniers@google.com> wrote:
> On Wed, Apr 28, 2021 at 11:34 AM Mariusz Ceier <mceier+kernel@gmail.com>
> wrote:
>>
>> Maybe it would also be worthwhile to make the requirement that the
>> kernel must be buildable with free software (not just open source
>> software) explicit ?
>
> The kernel is already buildable by LLVM (and clang); in fact Android,
> CrOS, and Google's production servers already do so.
> https://clangbuiltlinux.github.io/

LLVM/clang is not free software (it's just open source), so it doesn't
matter if kernel builds or not with it. What should matter is whether
it is buildable with at least one GPL compiler like GCC.

> --
> Thanks,
> ~Nick Desaulniers
>
