Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E1642C0527
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 13:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729064AbgKWMBU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 07:01:20 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:36735 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728882AbgKWMBT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 07:01:19 -0500
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0ANC0j36003445;
        Mon, 23 Nov 2020 21:00:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0ANC0j36003445
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606132845;
        bh=gXJU1j0tk/l4SrquKaTpMFBdizTn1Q3SlxK72caN7Qk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zG4VWBmwcHwR2PaRJ7JPKXwdEyVE8ywCmFxx7QHm36lZiz9jGcM+zrokCEwqm+ex1
         NAtveUgNlg91ZoRJZ4RyDLKOupFcxHmwZdKmfdplcJQhF70tkr7zR50RZkwPVYIh7m
         eOEPc+TwXIYBJ7/6Hiarx06TWFsGW9WSd1FOXQiENnxRtGQ1IO4grhHsVDq1OoeDH/
         SOwcQcYyU64fekfkzbugJ3fXEbz6f2rD2rtz4+qr3AQD2nbSmiY/OrMyuGJl2HW2EH
         A0XqRALWry+ucKuKcL6NvJi0l1X25/rsA7brSIOodWSL+II1EcahieaVsRkd0RIsaT
         76xm4I89yssaQ==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id k5so2292806plt.6;
        Mon, 23 Nov 2020 04:00:45 -0800 (PST)
X-Gm-Message-State: AOAM533jVab/VURYb1yjkbMQpEPl9RSC5+fxfLJzX3qPT4Odwy5t/mNF
        GMEFoRQUHZMBEa3juI8Ifp2PWZgLJ5X9ruZY08w=
X-Google-Smtp-Source: ABdhPJxtv7Cpkn97NRZPS4BXFkTGKAFmmn5n0xEeBIwBSXRbuJGzgtRAwg7HTPds4RAAIwIEJBuCrnk7p4Sj8haSlz0=
X-Received: by 2002:a17:902:aa94:b029:d8:5c6f:df56 with SMTP id
 d20-20020a170902aa94b02900d85c6fdf56mr23150032plr.71.1606132843231; Mon, 23
 Nov 2020 04:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20201026220331.3896226-1-arnd@kernel.org> <20201026220331.3896226-2-arnd@kernel.org>
 <20201027014846.GA368335@ubuntu-m3-large-x86> <20201027043213.GA2342477@ubuntu-m3-large-x86>
In-Reply-To: <20201027043213.GA2342477@ubuntu-m3-large-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Nov 2020 21:00:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNASFzy9dVk6_VB3Zu0Zqfsi8B50Dw7QQB1PwC-29RrMRgQ@mail.gmail.com>
Message-ID: <CAK7LNASFzy9dVk6_VB3Zu0Zqfsi8B50Dw7QQB1PwC-29RrMRgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile.extrawarn: limit -Wnested-externs to clang
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 27, 2020 at 1:32 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Oct 26, 2020 at 06:48:46PM -0700, Nathan Chancellor wrote:
> > On Mon, Oct 26, 2020 at 11:03:14PM +0100, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > The -Wnested-externs warning has become useless with gcc, since
> > > this warns every time that BUILD_BUG_ON() or similar macros
> > > are used.
> > >
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Also see:
> >
> > 2486baae2cf6 ("objtool: Allow nested externs to enable BUILD_BUG()")
> > 6cf4ecf5c51d ("perf build: Allow nested externs to enable BUILD_BUG() usage")
> >
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Actually, just delete this line altogether. -Wnested-externs is a GCC
> only warning, the flag is only present in clang for compatibility with
> GCC:
>
> https://clang.llvm.org/docs/DiagnosticsReference.html#wnested-externs
>
> With that, my reviewed by still stands.
>

I agree.



Arnd, will you send v2?

Please include
https://clang.llvm.org/docs/DiagnosticsReference.html#wnested-externs
as a reference.

Thanks.

-- 
Best Regards
Masahiro Yamada
