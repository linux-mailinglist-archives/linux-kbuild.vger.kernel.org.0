Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9993A3EBEE9
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Aug 2021 02:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235527AbhHNABs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Aug 2021 20:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235359AbhHNABr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Aug 2021 20:01:47 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F83CC0617AD
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Aug 2021 17:01:20 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id x7so18028050ljn.10
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Aug 2021 17:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0cQp32u2NcF373v0msQLwNnp6SgdDQeg+zlfqlBCVxs=;
        b=SJyek2YQs4GDm1j+iR12mh5bJ6WcoWHnhdxpt+Vhgxrlod0jOP5GKLmoHjrwhqjsWi
         u2V0jkpnLbuh67x7TlDaX9SNcNBLFOe36WHBPUU4HkqSTpUY3CnXZqYZyVa6zmdJtKY/
         9RA0VS4lPd4K7/d9SMH7XVFIYSR4u2zak2hVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0cQp32u2NcF373v0msQLwNnp6SgdDQeg+zlfqlBCVxs=;
        b=tnszEAM3/+rnDMh0PtSbKoTRFEMyADgwMD4J8KtuhD2ch++M0FL76hFoVNWylr1Z7f
         VSxs1S9Cx9lhNBYQq5DMMckOztYms7vkCiYYn3e/ngv5uZBv3yGonXRCE3KjIfw9NysA
         e0OsKuWQJ9B9gAbVaUyrilTy8tLl0rAAOxXxLCsEt53mMVRbGyiZz/5pQvRPRJNcsC80
         aN72R0HVB30gSMIknH8G3jNuPriPNHZtMQAWti9I2zeVPzt+Pq9l0uviSiCTBgLJ+cUw
         yWApgUnOhhQDCMRcdSchqy2d03UK8GJQN6pl/GjoYH0ZTUjbJxDFTbNi/wsLBvGL2lbE
         YssQ==
X-Gm-Message-State: AOAM530ak2zrid6lvifjJVriBMVbGHjmY/797nA9xktfGtcyhCcAqifv
        iqIID4EJY55HdFenmOz/5+Kq5pW49HGKyhOo
X-Google-Smtp-Source: ABdhPJwZ55Ug2E+B0+oa8GUvXN2GM3VSN9xqCGV4AOLZq+2FkSAOm5yVkN4Q+Oj6jpa81HQdGjBF9Q==
X-Received: by 2002:a2e:bf07:: with SMTP id c7mr3552441ljr.386.1628899278040;
        Fri, 13 Aug 2021 17:01:18 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id v1sm253219lfg.106.2021.08.13.17.01.17
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 17:01:17 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id t9so22992689lfc.6
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Aug 2021 17:01:17 -0700 (PDT)
X-Received: by 2002:ac2:5a1a:: with SMTP id q26mr3318792lfn.41.1628899276905;
 Fri, 13 Aug 2021 17:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210813224131.25803-1-rdunlap@infradead.org>
In-Reply-To: <20210813224131.25803-1-rdunlap@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 13 Aug 2021 14:01:01 -1000
X-Gmail-Original-Message-ID: <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
Message-ID: <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: use -Wno-main in the full kernel tree
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 13, 2021 at 12:41 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Build-tested on most ARCHes.

How about old versions of gcc? Or clang?

From a quick google, it seems like '-Wmain' means something else for
clang. But it is probably ok.

                 Linus
