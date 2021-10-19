Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0448F4341EC
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 01:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhJSXRK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Oct 2021 19:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhJSXRJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Oct 2021 19:17:09 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25069C06161C;
        Tue, 19 Oct 2021 16:14:56 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id y17so20136704ilb.9;
        Tue, 19 Oct 2021 16:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zrpUaoVvt5AlUK4ZVm+tzAJguis11QzWu+GC5e0/HsQ=;
        b=R2CXYQwuyS8tpS5KHqWJYBfj5mAki/U4l8yzO1/O+VV55lknzcm4yP+iTceUFKFRMA
         TvgrR/4ozjGcX9AVdZkDURNRg7kzqud4WyaLRsKCMdyMbJn71upAJ/2SglfXs20NhjUt
         FYEtZsG0eTqsJWswVdsrPnX5KWN+2qqfVSTGrNcn4PNQHdf6GcgA5C+tc6RER1tl+oZd
         EWI5ZcVh8H/8OHcbLsW8kJHXaDpAK6xOgVvp+m/G+1MGinIxPIiLzD1iceuX2yXVfNpQ
         Fr4byRZ8CdQtASjg4R5Z2+lSDPceDnHhCFpkPiwLskFt4v41vvuSFeZmXyV9/A2TSaqf
         4tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zrpUaoVvt5AlUK4ZVm+tzAJguis11QzWu+GC5e0/HsQ=;
        b=RuvbK5cg63XCRsRFMVdzk+zblK/pKBITgwNkVkLisCGs2fsx5xOHl4sUqS7dlYb0Vz
         0cqhMTkyH58UUCEsojjkzU8LmJPs7nlBAs1FcVlDVWFXs6Ryre8FOVxjj5SYOXzmtNlv
         eDWSq/pZAN7daB0RwBH/cWoPJUlDcVxNKo1EG+vwOSDOojAfXkxxrjIuMJjUYoad+u2Q
         6/LSXQ6eoRyOcAfcRWTd9uFOrO80PDbMUMfxc632fw2ui505lScakkig3cpAnQSAZyDN
         hUrKkJrmgXQithkQwo8rB3YTZ5KAcrDG5eXyBQygC61pld3d17s+z/WSUqL+hsSUYKil
         DxHQ==
X-Gm-Message-State: AOAM531ujvZ7WqHnhv26isYvIF7RFHuaM7jX+h8jrEIHIDI7XdGdfw1U
        b3RC3lypiaaF0NEkwp5on+YBKgIe9QumwD12KAs=
X-Google-Smtp-Source: ABdhPJy3iJPFtUkZwa1+rcrOFAnL5k4AxU9bHWqWoOMWZ4Nhr2D4WUwI27a154ZG/6ykw/rBduzXUJAf6Ze3juWMYdw=
X-Received: by 2002:a05:6e02:1543:: with SMTP id j3mr20327074ilu.151.1634685295474;
 Tue, 19 Oct 2021 16:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <1634337180-92127-1-git-send-email-ashimida@linux.alibaba.com> <202110191006.68BB660@keescook>
In-Reply-To: <202110191006.68BB660@keescook>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 20 Oct 2021 01:14:44 +0200
Message-ID: <CANiq72k9GMuCtJq0=3Csk1yO8imGkveXJ5io0gjJH3+R73RRdg@mail.gmail.com>
Subject: Re: [PATCH] [PATCH V5]ARM64: SCS: Add gcc plugin to support Shadow
 Call Stack
To:     Kees Cook <keescook@chromium.org>
Cc:     Dan Li <ashimida@linux.alibaba.com>,
        Qing Zhao <qing.zhao@oracle.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>, frederic@kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, yifeifz2@illinois.edu,
        Steven Rostedt <rostedt@goodmis.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, andreyknvl@gmail.com,
        Colin King <colin.king@canonical.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Marco Elver <elver@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-hardening@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 19, 2021 at 11:40 PM Kees Cook <keescook@chromium.org> wrote:
>
> Anyway, this is a long way to say that I don't think I want to add
> a new gcc-plugin when it is at "State 2" (i.e. Clang has support but
> GCC doesn't.) There's no need to "prove" that the compiler feature is
> generally desirable, so it's best to get this into GCC directly.

Sounds reasonable.

Cc'ing linux-toolchains, by the way.

Cheers,
Miguel
