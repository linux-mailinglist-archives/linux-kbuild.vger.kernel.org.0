Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E38158433
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2020 21:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgBJUXR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Feb 2020 15:23:17 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33928 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgBJUXR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 15:23:17 -0500
Received: by mail-pl1-f194.google.com with SMTP id j7so3283137plt.1;
        Mon, 10 Feb 2020 12:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ZPyNdRMzlZA/EgPtOW/ashyr+RclR1MRUMFzXcbDPs=;
        b=Zwx8F06AJDFTR9u5SVMf3uPQdRAHoVgU8Vpz+CNJxuiB7/UP/rj6vi1x6Au32l4VyD
         s5ApUEWaYHW5CsdqsS7u+2Og1lvB1oafH2P3jUSOF7UkMu0869G9206N/il96kMjW38Q
         floIZR1P7Xk3TP4xu9rGToPzJZvS7ru6d9r70yrTmGScHg/YuOcrZcr85wfJCFlhhcpA
         6Fqe+HulrPchEDo6COmF+mmQWaIHPJndDTWHTTo3F9faqWR/sfNnlFWlxAOr/EhI83mW
         Mb86LfGofMrJZtOzkYGJd/ohWWPdGpM6cAdsOKuTvv4AHfahQWbXB8xv0W+pxfVGajtk
         pw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ZPyNdRMzlZA/EgPtOW/ashyr+RclR1MRUMFzXcbDPs=;
        b=gaT2kAI1MZPn8n+8q7+vO2EICJcSbLVxtz8/Lw2/Ah9S+w/E3JBG6fT7089fQo69WL
         Y49r3sKGS4Fw0niPYYuvFzi8OK51T80yzXpmzRfuAdXDPfUbrKCJ0XiXaLS2MQx3oxff
         CBFmgC8GHwu8qOPLz1oy0o9jBo4RPQfzuetvawjuHlFmAdxYtkbjAAddU+k0QVVBQTnb
         UU0eXg/1fbWWoG/YPBOCsOFGoADBvpClUHe0/8r3McfbD4B/tpy9LaiZAgyFZ6Q82tQW
         Re7wbrns0fGMDtV+Hk50wPL9UJ+qI0QmMkYIUB7jwcCIDQD5uEAvwgFriFlc8SJOYHw/
         m4Qg==
X-Gm-Message-State: APjAAAViWkLV0FSmPDrahiXtYz1+xgGhE0aJBFjvT5DGQhZmir8aVjtv
        +zyfEpydLrGPaXLm9v0FZVNvjZSB/mGUJD4CPSmXoOTDLo4=
X-Google-Smtp-Source: APXvYqwEi9X99EJBtc/g6cRAH4bES3VyrVA/HRQvk9tMM3fuXa2X6DrFV6E4KZ4SGKucr0ykRdhxcNqshoX+YSMBQz8=
X-Received: by 2002:a17:902:b598:: with SMTP id a24mr14172248pls.262.1581366195601;
 Mon, 10 Feb 2020 12:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20200124195859.86991-1-andriy.shevchenko@linux.intel.com>
 <20200127100542.GV32742@smile.fi.intel.com> <CAK7LNAQkKOheXLVq+sjjmBMzREBZYN8XkxzcVmkkVpN4OjjRGQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQkKOheXLVq+sjjmBMzREBZYN8XkxzcVmkkVpN4OjjRGQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 10 Feb 2020 22:23:04 +0200
Message-ID: <CAHp75VcWamYQGg8dWdgTWV5ShV_DT9bfcv0b+WKyPHK7PsVS5w@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Fix off-by-one error when generate a new version
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michal Simek <monstr@monstr.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 10, 2020 at 10:15 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Mon, Jan 27, 2020 at 7:05 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Jan 24, 2020 at 09:58:59PM +0200, Andy Shevchenko wrote:

...

> > > Additionally provide a unified way to get the current version of the build
> > > and use this in few callers. This will respect the KBUILD_BUILD_VERSION
> > > in case it's provided.

I still think there is second part in my patch to be considered, i.e. see above.

...

> I remember I was also hit by this one month ago or so.
>
> I did not dig into it at that time
> because the problem disappeared after doing something.
>
> Today, I took a look at this again.
> This is a regression caused by 56d589361572
>
> This patch should fix it:
> https://patchwork.kernel.org/patch/11374047/

Thank you.

-- 
With Best Regards,
Andy Shevchenko
