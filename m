Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA472F87FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Jan 2021 22:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbhAOVzM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Jan 2021 16:55:12 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:42154 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbhAOVzL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jan 2021 16:55:11 -0500
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 10FLs8hP003555;
        Sat, 16 Jan 2021 06:54:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 10FLs8hP003555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610747649;
        bh=XU3Chwqkk39bmnq4nkdSFRKSv8Btv1XMVUJlsyr4mfE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Yu5U9l0/LQCLuAjgQVcW45hAxysl7duDodnBn+AmO9ZsdKv2jL83fGG0I01Z1ZhZ+
         MBNRfWnUiiZVZIwl2v9abEIVmOTcd0QOErqSGkTJ/XqcHVCDt9r4T0EqakMD/mKO29
         Wjj+vyHS4L+99gWKhpWKY/a3k486v2/fVoyxaK3Qmhul3yq0DXaMrP3Kqw70/6O3an
         vOGj1QJGHJJpJvI01XJvDGPOt+uhWUiYN7T/56ZYHxa1Nguw3z9cPbodhYtwOms3kc
         /6xL5B6qSldsEY+fCkhyZ3qLWn1TinxXezcxaU7kUECQNuvj8yhpfsnB8iIbLoS4x0
         +qmVGQBqF+pfg==
X-Nifty-SrcIP: [209.85.210.172]
Received: by mail-pf1-f172.google.com with SMTP id w2so6309923pfc.13;
        Fri, 15 Jan 2021 13:54:09 -0800 (PST)
X-Gm-Message-State: AOAM533cuBicJt/ZVShxGssQQtBdoP/zTbb9bIzAcqKIR7/zf2TA07jF
        HiV81Bl+/yn4k+7hfYcrJxyE4W2FH/iXd8UoSdA=
X-Google-Smtp-Source: ABdhPJwUvH6aIwm8Q0HnaQzlF2lErawdE38upxdLaSG0JrW3XDRTaK89sWz/NxG/IswMsDKo7E1BACVI/BQJKImGrYo=
X-Received: by 2002:a63:ff09:: with SMTP id k9mr14775205pgi.175.1610747648138;
 Fri, 15 Jan 2021 13:54:08 -0800 (PST)
MIME-Version: 1.0
References: <1610500731-30960-2-git-send-email-jjohnson@codeaurora.org>
 <1610660990-18812-1-git-send-email-jjohnson@codeaurora.org>
 <CAK7LNASHC5sNWxL0Ve8=f6=Gpf8ekVS41ETacBCTv5p72SVkNA@mail.gmail.com> <4c02050c4e95e4cb8cc04282695f8404@codeaurora.org>
In-Reply-To: <4c02050c4e95e4cb8cc04282695f8404@codeaurora.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 16 Jan 2021 06:53:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNASLQWiSfY_iGs8hv8mo_yQaKXPpKo7u0BxPpANwkRatQA@mail.gmail.com>
Message-ID: <CAK7LNASLQWiSfY_iGs8hv8mo_yQaKXPpKo7u0BxPpANwkRatQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: handle excessively long argument lists
To:     Jeff Johnson <jjohnson@codeaurora.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Prasad Sodagudi <psodagud@quicinc.com>,
        Elliot Berman <eberman@quicinc.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 16, 2021 at 5:15 AM <jjohnson@codeaurora.org> wrote:
>
> On 2021-01-14 17:12, Masahiro Yamada wrote:
> > On Fri, Jan 15, 2021 at 6:50 AM Jeff Johnson <jjohnson@codeaurora.org>
> > wrote:
> >>
> >> From: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
> >>
> >> Modules with a large number of compilation units may be
> >> exceeding AR and LD command argument list. Handle this gracefully by
> >> writing the long argument list in a file. The command line options
> >> read from file are inserted in place of the original @file option.
> >>
> >> The usage is well documented at
> >> https://www.gnu.org/software/make/manual/html_node/File-Function.html
> >>
> >> Signed-off-by: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
> >> Signed-off-by: Jeff Johnson <jjohnson@codeaurora.org>
> >> ---
> >
> >
> >
> >
> > First, is this a real problem?
> > If so, which module is exceeding the command line limit?
>
> On 2021-01-14 17:12, Masahiro Yamada wrote:
> > First, is this a real problem?
> > If so, which module is exceeding the command line limit?
>
> Mahesh & I appreciate all of the feedback.
>
> The issue is seen in an Android environment with an out-of-tree
> driver. The combination of long path names and a large number
> of source files is leading to the issue.
>
> Since Mahesh & I are not Kbuild gurus, is there an alternative
> solution to this issue?
>
> Jeff


I see.

The support for out-of-tree modules
is not nice in this regard, but fixing it
would need many changes.


The long-term solution might be to upstream your driver,
but it might not be possible.






One cheesy workaround might be to point the module path
via a symbolic link.


Let's say your module is located in a very deep
directory,
/home/foo/long/long/.../path/to/your/module


 make M=/home/foo/long/long/.../path/to/your/module modules

would fail due to the too long command line.




First, create a symbolic link as follows:

 ln -s /home/foo/long/long/.../path/to/your/module mod_dir


Then, pass the symbolic link to M= option.

 make M=mod_dir modules




-- 
Best Regards
Masahiro Yamada
