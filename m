Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58E5F23DE96
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Aug 2020 19:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbgHFR1g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Aug 2020 13:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729989AbgHFR1a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Aug 2020 13:27:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6100AC061574
        for <linux-kbuild@vger.kernel.org>; Thu,  6 Aug 2020 10:27:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t6so7016269pjr.0
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Aug 2020 10:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ewYCkcATopCvNDYw59muuBoxcshhuVm9QgmJxFQe45I=;
        b=QMknTST75tIMRcJIlcAWctlEExuHRpNQuPME8PjBidCJTnHziPexJfD6ygF3S0EPNk
         bg1T28dN/hSJjhMJbskc3G8iBB1mrCNrRlQfuNO77lGUaWHb13TUE4o5YOz2CNhne2Jo
         CfSszM8uN6mlUZb+gGpU/u36C3eShOZx/cGNL6gqKfXuh86kAXE1+stczsfLJ/73D8ND
         ApTVMpmCYfphZ7KhvjAVFkv60t1Wc5G7UJ4UtcPAgIVeR4f7HcocyEDdtN7RjB6D69B3
         G20M7vFpsX9xEV8rmaacemC2YiN1Wr1LjzF/tPpQN1zuJ3WoIokpD9NGJJOjSwDW+WyI
         SmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ewYCkcATopCvNDYw59muuBoxcshhuVm9QgmJxFQe45I=;
        b=YzeGa8gUsjd+me4jqR0uzD6/B/PRSCBqrxyfdx+LHHJJ3Cvp4kCPxvnqFHW4iRxWz9
         EM4CdD+T+rgWu1P70k/d4BmagurGEwvFjHRSVp7OYJD+DdFpKvcDKh9rQyHh3zy/PIjZ
         YwTQoIo2t8NuGc3r/Sm/CtgojVfAdJKk6Y55NHKQWFS8qeFgUYCdToRZKBAK5AuwYEp4
         FMzyY0TB7GmYIy2EOsSxyiGKS3PcsJFtZdrEWcEee4DwKrWa2gQca5/sXwjVJ1DOswJp
         ESkHF6h8c+qlIrvIvo6zqGHUAHO9MYmMA2UEVbx8pRl9oj01fABt2FiwQZAo2yDXXmni
         miRg==
X-Gm-Message-State: AOAM531VL2bjI5fCuihCdPZe4hNAZKde4RPNLgAjEgcRoi++j78NsLus
        5Lcto177WJKHrs3GElbfed7wOTzTqgepURUOTO2v4A==
X-Google-Smtp-Source: ABdhPJzCSpFEmv/pbhpRhlk3NmvWzm9fxVe+xTipoHQgOnnoqhtQVIuDK9FnJkwcC4lHrbIMljRUIFjS4msjdhiBYy0=
X-Received: by 2002:a17:90b:1103:: with SMTP id gi3mr9489404pjb.32.1596734849754;
 Thu, 06 Aug 2020 10:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <RT-Ticket-93182@linuxfoundation> <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org> <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <01010173c1e35fde-0cbf88a3-5ebe-43fa-be6b-af9c00a50864-000000@us-west-2.amazonses.com>
In-Reply-To: <01010173c1e35fde-0cbf88a3-5ebe-43fa-be6b-af9c00a50864-000000@us-west-2.amazonses.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 6 Aug 2020 10:27:18 -0700
Message-ID: <CAKwvOd=xLc1=kRRM8NBaeXqhXOTSYDg7AgLtqRth4vm7ODFA6w@mail.gmail.com>
Subject: Re: [Kernel.org Helpdesk #93182] Re: linux-kbuild missing from lore?
To:     kernel-helpdesk@rt.linuxfoundation.org
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Huckleberry <nhuck@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 5, 2020 at 8:49 PM Chris Hoy Poy via RT
<kernel-helpdesk@rt.linuxfoundation.org> wrote:
>
>
> Hi all,
>
> This should be active at
>
> https://lore.kernel.org/linux-kbuild

Looks great! Thanks for getting this stood up for us Chris, we appreciate it.

>
> I dont think we missed any, but there might have been a few slip past the gap between the archive and the subscription being active, feel free to forward a quick list of those days if necessary, and I'll pull them in too.

Comparing https://marc.info/?l=linux-kbuild, there's a small hole
between July 8-July 27/29.  I've reached out to Hank who can help get
me the archive for those dates, and I'll rerun the sanitizer and reach
out to you with a link.  Then it looks like lore.kernel.org should be
pretty complete for kbuild.
-- 
Thanks,
~Nick Desaulniers
