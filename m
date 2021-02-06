Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D9D311D24
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 13:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhBFMmo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 07:42:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhBFMmn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 07:42:43 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0518DC06174A
        for <linux-kbuild@vger.kernel.org>; Sat,  6 Feb 2021 04:42:02 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id q9so8453055ilo.1
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Feb 2021 04:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=UbxfTKofRZ0zDRdPhBk7pcEJRlGo0uKnxytA8tD0pMk=;
        b=jAj481HUA443Viz4HitfGY+teyP77dfUmJ976uxara/RDRKeGtziinsFAPK0gd8deU
         yT5iu5OuZdBH+WZvuM/IjWQGLVWTQhGYJlkOcB4h7BGTSdcc4miwwdl+UH8DSb0W4XRE
         dEF7ZBNoQ8rmWQkvQWPgqcWK6u//BrUASlUuyjQVMX85dS72sohCQvjnTBpO2NCOm1Gd
         M6Tl92/Hlj6ZPnnm5OU67zt6V87Ep9WzIz3QOSmvyv6d1KMVHotdfpGU2LgjBXnNHvuP
         tAUpYmw8MGIgj4F/naDFQUtM1E293kq/7bjfgBsBUop/M9Yikzk/zSZgp5BtZB/TXU1r
         +AmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=UbxfTKofRZ0zDRdPhBk7pcEJRlGo0uKnxytA8tD0pMk=;
        b=nKwqfJwIPHTfNMDPYT7e/uDz6YjUK91tmPvN9NewVfDFnD3E2J+AB7vKoOi2M4ex5C
         jDgHdtTA572+YeXiSOFC+VRJ+jEctRchJaQLmpmeldIipYgvg1T4hEXjvgckwH7oGDoy
         25J7UCoLO0GdWfDx2Vke8YsZHBFr/vRUtCEPakaK1QZcDZFNF1X30fpmjk9tBX380BvY
         JLFnvvyEJ4PoDLGZ+we3XBnpp42+XUy+3T5YSrJ/uId2IFb1EGQ1/EIuc9c3qPepsgTO
         3028ZtNuIpzbkT9Bf/YSTAcZU2GmLelGSAABIxemz2Xp+4vmaTI0CFaazBhp+1EZqSjm
         /d6g==
X-Gm-Message-State: AOAM533TN93pkGxR/kuCrtu0pjmJjKhDAC9V2BJMFpdhZAVlvFRHXrBr
        scGsrThIgwPbktETWu68Txc9Nn+wSMMhwTUQsyQ=
X-Google-Smtp-Source: ABdhPJwT+ILx2h5RN6BZnChOvBhj4l3o1cC8oS12jB5U9sCDdOw4yehZts5fAfwxXyQ0z37JmaZ4GO7z2wlofexkkTo=
X-Received: by 2002:a92:ce46:: with SMTP id a6mr8368566ilr.10.1612615322419;
 Sat, 06 Feb 2021 04:42:02 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUjb_71mWwWFMYN_OPZir2vStLq1kDY1O+JCFjtmEEBjA@mail.gmail.com>
In-Reply-To: <CA+icZUUjb_71mWwWFMYN_OPZir2vStLq1kDY1O+JCFjtmEEBjA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 6 Feb 2021 13:41:51 +0100
Message-ID: <CA+icZUUFxpcoA8ejitXuRwXP_4NyjOr2McB3EC1qJMBeMaR90A@mail.gmail.com>
Subject: Re: Using GNU AS from a selfmade binutils v2.35.2
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Just wanna let you know, I filed a bug to Debian BTS namely "binutils
2.35.2 release".

- Sedat -

[1] https://bugs.debian.org/982086
