Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7FA2478EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Aug 2020 23:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgHQVgv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Aug 2020 17:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgHQVgt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Aug 2020 17:36:49 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C1AC061389
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 14:36:48 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id cq28so13588910edb.10
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 14:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jm8jZArYddhqUYv8uma7iesaEBvjq6SOsDLcRZUaQ/E=;
        b=K9ybUtGr6t0dUEotn+b5ds3wNHdUEMLBrVq/JaBumu59HnobQacNfCGqQl5mJHNbVA
         hkLWBuL6YoF8g3a1YCO+tfDSdddHQkHB/d4NFnZf0r0jOWl5e4HE9u22yd9cLQ+svWGM
         1fKT0VIsFmJ3woXTAuGbLupTo9xre9P3/nkK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jm8jZArYddhqUYv8uma7iesaEBvjq6SOsDLcRZUaQ/E=;
        b=dgTnKhtA3jcrdQfAaTpgkdtr6yWiMsTmRYwIJTvvHSJ78I+StsOJ5ai72pIDbK9h2x
         xDqK5taP2v1PKXi8GFGxuXiFX+iIW9Lv7ps1W8ocpyXyOiE1/sdFeDBscY5JvgmMKsZe
         JQaeOflsv4LWBnPp3gJjRZHbPPdKPvQuslzK3yva4YWewAUyAvMTNC5VX8+6H3yXrHcX
         LG3/trbhC6q/YDx3YbdRRsJumCWjvDKsCwsHJ7ZLAvIEXBdiLOJeFSUFXxV2a5NrFrMn
         TC9kbBOFdodpfVgeOyN5asKzLO68DEN8V8G/OyVNXkaAzZiPuy8b/n4txYdfnhHoUhOH
         Kw1w==
X-Gm-Message-State: AOAM530Kt2Mz35nNXeKJoVaLB/RP77pYcml0oC7ji9CRxvtsIjZ6zNyi
        OiwFinTxbQuCsb1dwzSZrU0aLOB0ALPbXA==
X-Google-Smtp-Source: ABdhPJxsV0Bt3wv1zOPjuXISv4zYGm31wOG8UaWU2D7rNH+XEwAmXz2gp5iaUtx7PTjPjFbsS67teA==
X-Received: by 2002:a05:6402:17f7:: with SMTP id t23mr17094077edy.301.1597700207269;
        Mon, 17 Aug 2020 14:36:47 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id ay5sm14419052edb.2.2020.08.17.14.36.46
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2020 14:36:47 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id t15so13548233edq.13
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Aug 2020 14:36:46 -0700 (PDT)
X-Received: by 2002:a05:6512:3b7:: with SMTP id v23mr8282877lfp.10.1597699793904;
 Mon, 17 Aug 2020 14:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com> <20200816175303.GB1236603@ZenIV.linux.org.uk>
 <20200817204223.GB12414@amd> <87lfid6kpi.fsf@x220.int.ebiederm.org>
In-Reply-To: <87lfid6kpi.fsf@x220.int.ebiederm.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 17 Aug 2020 14:29:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj04wKCjHz6b6d7N58xoS4AftnwTUBaXsEekQ5RhfWVnw@mail.gmail.com>
Message-ID: <CAHk-=wj04wKCjHz6b6d7N58xoS4AftnwTUBaXsEekQ5RhfWVnw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Yes. Finally remove '-Wdeclaration-after-statement'
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Al Viro <viro@zeniv.linux.org.uk>,
        Michael Witten <mfwitten@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        John Levon <john.levon@joyent.com>,
        John Levon <levon@movementarian.org>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 17, 2020 at 2:15 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Does anyone remember why we added this warning?  I had always thought
> it's purpose was to ensure we stayed within our chosen dialect of C.

As far as I'm concerned, that's the primary motivation.

I'm not seeing why we'd suddenly allow the "put variable declarations
anywhere" when we've been able to keep from doing it until now.

We're still building primarily good old K&R ANSI C, just with
extensions. Wild variable placement doesn't seem like a useful
extension.

(Other variable placement improvements are: block-scope variable
declarations inside the "for()" statement is very syntactically
useful, for example. THAT would be useful if we can finally enable it
without gcc going all wonky on us)

                Linus
