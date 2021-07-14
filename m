Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4B2B3C921C
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 22:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234589AbhGNUeG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 16:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbhGNUeG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 16:34:06 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33A4C06175F;
        Wed, 14 Jul 2021 13:31:13 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id o8so2886860ilf.4;
        Wed, 14 Jul 2021 13:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TyOypBduh8zc4oZxw1Jw5CWPkP+HxfVRfcAuq+y3WDE=;
        b=NjmbscF6kBEfjMCLAWg3FCYvsVhOz3ydft84M9pkQa+4/61QXFa0dZsCmD/t2invcV
         nA8oTdYCEXtKnBqGc1wxQIYzg0Hd9IfrjR4DVkPKIe8dn21RL/H2GdsfoQqG9X2tpNM0
         E+kQJ7lPYFI63nkGDUj1qkE+222CIr47m76IO4nNuVkIFSiCNm5gmS2Xao9tV1f+95I/
         PWUKww46Xwygs/0sm2M21vz12wp4alF3ncG87lkxwzZbKJ9gV9PT7kswFUB3OgRyinEj
         uMbHIXYknS5MLCFr2RcOfjTAGubHPKSdFBtfDCKQreYagoBOG5/sC8JfL+aERwge2Rwm
         KZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TyOypBduh8zc4oZxw1Jw5CWPkP+HxfVRfcAuq+y3WDE=;
        b=SHhW05PliNzJxp6/xWWloXzVytdTSgtCqYfXoG9mq6JNkt7UELdvamfbwFfvyWu5Th
         3dxDD9ZlFm6D5r5vGeFh0U0E3LhgPfgvmQHpDS2hgSCbV/cPDSEkwUSEtDxS0laqSCbg
         irno04vW8/m9kBZU7Hfk99rwkAeiyHqoTLFcRMR7vGx0aLyyDMXsEZMpV5Xjac8WNwW/
         ShM9LxWw0VDauHevwr6vbsYJeyZNS+kOzEyLarU8g4uaqP/qMHHYldV+fA3jzQTIEvyx
         VnyBMAA/+JTjNsZ4tJLYpLj2Ze3BU1/fAGtMIf6qrkpErHusILMwPBqLfhFKv9GRj76g
         nKLw==
X-Gm-Message-State: AOAM532EOhGvN+RY7ZkCkrF9pxfWjiJhgBmfdeER3lnAvc7cQEPgmhaZ
        EisQOEn/3NesgZn5Fw148o67RtKXm3u80s0vzPU=
X-Google-Smtp-Source: ABdhPJwAE54QtGjk6wjdMpERVvuoGiexA+ZndhhjqLbavlG69FKpSkNdz0lq9rT6inmUt/bcgrTgVXYMaogwEQSrnvU=
X-Received: by 2002:a05:6e02:de6:: with SMTP id m6mr7931159ilj.203.1626294673267;
 Wed, 14 Jul 2021 13:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-4-ojeda@kernel.org>
 <CAKwvOdnO1ZbM_FzY3qwokEkWDxsr37t_u57H_wEO6Pbu6CqFZw@mail.gmail.com>
In-Reply-To: <CAKwvOdnO1ZbM_FzY3qwokEkWDxsr37t_u57H_wEO6Pbu6CqFZw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 14 Jul 2021 22:31:02 +0200
Message-ID: <CANiq72ncsna9J=xNHg+XqUyFthyRG9bh7Qdw1rb1_=9-GJJh5Q@mail.gmail.com>
Subject: Re: [PATCH 03/17] Makefile: generate `CLANG_FLAGS` even in GCC builds
To:     Nick Desaulniers <ndesaulniers@google.com>
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
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 14, 2021 at 8:14 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Patch LGTM; please keep an eye on the series:
> https://lore.kernel.org/lkml/20210707224310.1403944-2-ndesaulniers@google.com/
>
> If that lands in kbuild before this, this patch will need to be
> rebased to avoid a conflict in linux-next.
>
> So (tentatively :-P):
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the heads up!

Given how fast `rustc_codegen_gcc` is progressing, we may need to
prioritize getting
https://github.com/rust-lang/rust-bindgen/issues/1949 fixed so that we
can drop this hack altogether and go for proper, full GCC support.

> If the patch needs to be rebased on the series linked above, please
> drop my reviewed by tag and I will re-review. Perhaps putting me
> explicitly on Cc: in the commit message will help notify me if there
> are successive versions?

Ack -- will do that.

Cheers,
Miguel
