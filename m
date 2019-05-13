Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83D441AEDC
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 04:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbfEMCYM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 May 2019 22:24:12 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25654 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfEMCYM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:24:12 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x4D2O7T4006509;
        Mon, 13 May 2019 11:24:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4D2O7T4006509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557714248;
        bh=oLrUhw/m2FjJ5SEaguXhOl7W6A825StNmdgmwN/GKCQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dgafQMTRQMSEWc6opJhRFd/Wawdv46y3/g04X07nL88cyyvGqwQPUWQuo/VkSO/CB
         443TKx2YSd5dh6E46ptEHly4eE2OhALx6VRxbJgvO2xRmM1esbwoDOi802UyAbYdF2
         WNs4axwja9SUQbvnZBqgZ/ain2EyuH95/dgXX85GYo94MM2Xf8hl7Q9aC1mYvXvRwI
         22/5QutktaD6u4rquMCzUoWZ1/oMZu3P24hroO8w3eMnt4qcoqRE1c7v7jExdoi4u/
         iu7AC448HOEltPWDD+LkLlDkPKNerW/gpmaVeu+1avD0sut467y75PvUhSQRVlT+4F
         a1XSOTzKyirHg==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id v9so7042590vse.5;
        Sun, 12 May 2019 19:24:08 -0700 (PDT)
X-Gm-Message-State: APjAAAVVzkG/q+mIDj3QodMGxDV2a7asIUoiZlXt1YK+zzQkEXHM08/n
        0EA0PcuZtDqnwcT/W+BAdYoQwHxmR6DDGBw2hqg=
X-Google-Smtp-Source: APXvYqySA1kfFQutkmbnJQ+8v+Jv8NY3r2M0ECF0QR6x9NXM/y8mlGm9SqhQLeVCYtOudP71YnLTKmuCkWAg+Qc04HU=
X-Received: by 2002:a67:fc4:: with SMTP id 187mr12251355vsp.215.1557714247412;
 Sun, 12 May 2019 19:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064549.1302-1-yamada.masahiro@socionext.com>
 <CAGXu5jKDELCthqEcnL3TvC8DtMnfoWnOd14wrKpcReUxubdMCg@mail.gmail.com> <CAKwvOd=cbvYyVPcGYweMbPDM5WpBtZr8tOQgHu9BJiGqoq4RDg@mail.gmail.com>
In-Reply-To: <CAKwvOd=cbvYyVPcGYweMbPDM5WpBtZr8tOQgHu9BJiGqoq4RDg@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 13 May 2019 11:23:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJWiMsH0pVXcURxYndiqydrMuQiz=XXoANsE-vAAmL4A@mail.gmail.com>
Message-ID: <CAK7LNATJWiMsH0pVXcURxYndiqydrMuQiz=XXoANsE-vAAmL4A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -Wvla flag unconditionally
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 10, 2019 at 1:52 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> > On Wed, May 8, 2019 at 11:46 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > > This flag is documented in the GCC 4.6 manual, and recognized by
> > > Clang as well. Let's rip off the cc-option switch.
>
> Checked w/ godbolt w/ Clang 4 and GCC 4.6.4.
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>
> --
> Thanks,
> ~Nick Desaulniers

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
