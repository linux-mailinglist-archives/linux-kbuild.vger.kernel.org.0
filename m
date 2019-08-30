Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A607A3481
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Aug 2019 11:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfH3Jwi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Aug 2019 05:52:38 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53348 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfH3Jwi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Aug 2019 05:52:38 -0400
Received: by mail-wm1-f65.google.com with SMTP id 10so6611582wmp.3;
        Fri, 30 Aug 2019 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=tc17SwiXpDz1kgEk0p61gpWwIWAbuTeHVLdYo1NejAk=;
        b=DsCXS5AlfL8N6Pd/BW1O50jCajoaMNCX6Gh/ZpcI750WV99gdv/GDDQQOuhc+g7kQj
         PrR2UciBC/udBCeDc7zmvV0pv/IQag9tJFcZjNccdyoDyzV5Vli8kp00xaGABHm+22CJ
         QGjM5QwY08jOwBpS1IXIFSuNTqnPk6gv4KTDzPM3MfNPZATg578eAznzEnMbiYPhnIRm
         Bt8derDP1APJB4thdBFtrh4Qg5+sjwi5qq6M5nqQPWTRl35KDxRRkkH1lmZCzPhRiFG5
         hfF8Z3GoA4Kl6FR/fEmQPtAMX6hEUUaE5IqlzT4QBHyVfZWzz2wYNplNIvk7wtpXfEk3
         67qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=tc17SwiXpDz1kgEk0p61gpWwIWAbuTeHVLdYo1NejAk=;
        b=CxDaPOMN920h2wjotR27TudvViRynfs/5zCZBnMGtFaPMlTtlw+Xlwks8yb6iRjlIy
         mdJJ16nhIEqVLS8dWRzr/b9+k+HyDd3yuL/65UIqNSd+AyT55qFPUycmvnoalqWhammr
         lFqETx6v3GpVeR7KaCNkXDcyBUBer0Qjmot3twDPY2AJ1nkX7AQsmtyQNJXYbzpKjAsD
         oruKeMvjQrDtE1AkHLxYovrciKP6aM7hHPSXD+v/z/0fevcPcEED6vm/br0zNAn4wtxc
         LTb9N4E+DctGh35X7USPGTHwX8teOJVQealrxaLTjyXITtmT/ax9U6rzT6TfeA93CxwV
         wA2Q==
X-Gm-Message-State: APjAAAXbmy4Lou1uIQRwE9FwoNVQlKe3wPAj/ZAgX/Tt65QHPriFz2qa
        Zk+XkR2Sqb6QZCcR2vCmK3wCQ576Z7knJC6RhxQ=
X-Google-Smtp-Source: APXvYqypzwcOYYLIG7MVcOC8GJ2qXLrEkr2UlocT3ycDPxkWToyVuADTLoF3SbWMPb4REfw4xL2k75Z4f6QA6ctcV+w=
X-Received: by 2002:a7b:c013:: with SMTP id c19mr9625630wmb.118.1567158756429;
 Fri, 30 Aug 2019 02:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
 <20190828055425.24765-2-yamada.masahiro@socionext.com> <20190828182017.GB127646@archlinux-threadripper>
 <CAKwvOd=r5Y8hQQBeKZ6zAokPdyeT2AVKFsdviTvwV5AyDQQHrw@mail.gmail.com> <CA+icZUWmmC7CruvXx6U0cdXMLaMWJadU=T61E0om1rOuW3==pw@mail.gmail.com>
In-Reply-To: <CA+icZUWmmC7CruvXx6U0cdXMLaMWJadU=T61E0om1rOuW3==pw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 30 Aug 2019 11:52:24 +0200
Message-ID: <CA+icZUXX6YG7=4n60A3_HiTYE0SkNXd8yr4-pqfOsqg66QvXzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: allow Clang to find unused static inline
 functions for W=1 build
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Sven Schnelle <svens@stackframe.org>,
        Xiaozhou Liu <liuxiaozhou@bytedance.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Just as a sidenote:

From [PATCH v2] kbuild: enable unused-function warnings for W= build with Clang:

"Per the documentation [1], -Wno-unused-function will also disable
-Wunneeded-internal-declaration, which can help find bugs like
commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
I added -Wunneeded-internal-declaration to address it.

If you contribute to code clean-up, please run "make CC=clang W=1"
and check -Wunused-function warnings. You will find lots of unused
functions."

Isn't that missing in your double?

- Sedat -

[1] https://lkml.org/lkml/2019/8/27/729
