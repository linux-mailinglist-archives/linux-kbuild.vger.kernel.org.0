Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8495946C324
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Dec 2021 19:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240780AbhLGSyp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Dec 2021 13:54:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240763AbhLGSyZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Dec 2021 13:54:25 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4A2C061748
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Dec 2021 10:50:53 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b40so426551lfv.10
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Dec 2021 10:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gmb+Apudh+c3b4tBgmQNZgnlcpZS4tKe6ho/6WlprlI=;
        b=QDFc9P5aML7+YtJ4kv8ohPRs/NxD8Xl31/KC9meyRbjsUWaCD8+eUYuX6yVUlGqPHd
         KK5IUmkhYJUj3NsARjU1eko53272JkmdRrJUgX+l9Aw8osNMVvggDJ3o5a2SoDGLt8Xb
         QZuDre4bR/z4KskwYlkuCw9lTYA7xJJPi1fr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gmb+Apudh+c3b4tBgmQNZgnlcpZS4tKe6ho/6WlprlI=;
        b=D6Mh5h9zvUwnm/NAQb9XqxPbEaya8ewrQmr3nio/OTUpx74z9Bah3IXvwliDI2v+sO
         jLQSA8j+oYxa4/4C7cgdF2Cvi5kPl/m0Dh0Wh9e/mlpRYEHM+FghsxsIU8bJr3skICYc
         AOE4f/A7NLXrmqA0uSHvOeAwHcXzuu4FSSt6HZzB6S+tsJVapFfUp+SMtvKi3SgeFjM2
         PBmsRlQOF1Geg06oWTiyjsmCNHy4T1KUtDNOm/fQsKUDYZ72O+p1+AskIoL4qcZDy1g7
         ZI9iIsLTYV7mbC0dGmReiqtVXp8Ge0LiF2Fm1TUqRJMyW6CaBM3Kxrh6Xzw4NUXd0EMp
         jdmA==
X-Gm-Message-State: AOAM530RB0hmIf0teMQeJMzxoB9jelDLxK6cNQLM4v7xEdPbnY7jVmKH
        /0lfQbws5gFs0nDgR3qExFPlG8lbaOErvYpnLv8=
X-Google-Smtp-Source: ABdhPJyXGKu6Q0i9uN+35bnCnduMzYEN5MChN1bTjWmkme+iv48cdqvXge+6mjKixAojLaimxUgy/A==
X-Received: by 2002:a05:6512:150a:: with SMTP id bq10mr42985403lfb.68.1638903051927;
        Tue, 07 Dec 2021 10:50:51 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id y6sm33242ljh.98.2021.12.07.10.50.51
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Dec 2021 10:50:51 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id bu18so608203lfb.0
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Dec 2021 10:50:51 -0800 (PST)
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr54258440wrn.318.1638903040805;
 Tue, 07 Dec 2021 10:50:40 -0800 (PST)
MIME-Version: 1.0
References: <20211207150927.3042197-1-arnd@kernel.org> <20211207150927.3042197-3-arnd@kernel.org>
 <CAHk-=wgwQg=5gZZ6ewusLHEAw-DQm7wWm7aoQt6TYO_xb0cBog@mail.gmail.com>
In-Reply-To: <CAHk-=wgwQg=5gZZ6ewusLHEAw-DQm7wWm7aoQt6TYO_xb0cBog@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Dec 2021 10:50:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjsdmyN3qYjA-Z4bqhin2ZFkssRaaTRm_LdJBqexTxWfQ@mail.gmail.com>
Message-ID: <CAHk-=wjsdmyN3qYjA-Z4bqhin2ZFkssRaaTRm_LdJBqexTxWfQ@mail.gmail.com>
Subject: Re: [RFC 2/3] headers: introduce linux/struct_types.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kernel test robot <lkp@intel.com>,
        Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tejun Heo <tj@kernel.org>, kernelci@groups.io,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 7, 2021 at 10:17 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Ugh. I liked your 1/3 patch, but I absolutely detest this one.

Actually, it was 3/3 I liked and that made sense to me.

1/3 isn't pretty, but I can live with it.

          Linus
