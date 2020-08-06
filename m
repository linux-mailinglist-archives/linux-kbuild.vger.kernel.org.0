Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4BE23D7DC
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Aug 2020 10:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgHFIMl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Aug 2020 04:12:41 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:22759 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgHFIMj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Aug 2020 04:12:39 -0400
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0768CF4t030174
        for <linux-kbuild@vger.kernel.org>; Thu, 6 Aug 2020 17:12:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0768CF4t030174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596701536;
        bh=sebDeJZaGYppF560BzODXGbtBduobkt3uyNZoCdYdXA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L8b6fvu77i/wtOOnBZ4iVkAMbWZ0YS4Qi9Q6cvGclVKDL0KeZ9tAo0Kv5EksqVJxz
         tDfAgTiQZIzSL32JXjmJ9KuoxjbRZ6MURF6KE+xwJ6eiPY9Nh6UVQNDXFrgvDUIw8l
         WwunTpziAf+zkYoJ8WlmegFBEmwNbSSC3dG0Kfs/U2LblyxdmIGcbmLixtPQUrtRNY
         sXUZtZV3L0h7u9m2z7w4t+gQaYcF8B9flZ7S9KNMmyERruez014RXdIGHKl5VjJME/
         qyz7F9GrusecmEi/XHIM86lT0aRIBSTNH+bIVKZoG5sD2LCdJ8dA8qWq7EelXkyHTa
         2TyKWc2WheuVQ==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id q200so620604vke.6
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Aug 2020 01:12:15 -0700 (PDT)
X-Gm-Message-State: AOAM532V/vi5OfJYlfzR4FZv7OsQ9XidQOplUSIuTXrtvAP8cyf2mWGN
        oDFcic95dUMFSd3V9peph4172hw/xlekBxCf7+M=
X-Google-Smtp-Source: ABdhPJysYnmRRe+E5PpeRXjmjuw64L/APrjgsqpn8mVpsiKY6XZYKXnonzmRn6v7nlwNfJHZdheKcj04Ji4FypvSEPc=
X-Received: by 2002:a1f:8f52:: with SMTP id r79mr5860954vkd.96.1596701534476;
 Thu, 06 Aug 2020 01:12:14 -0700 (PDT)
MIME-Version: 1.0
References: <RT-Ticket-93182@linuxfoundation> <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org> <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <01010173c1e35fde-0cbf88a3-5ebe-43fa-be6b-af9c00a50864-000000@us-west-2.amazonses.com>
In-Reply-To: <01010173c1e35fde-0cbf88a3-5ebe-43fa-be6b-af9c00a50864-000000@us-west-2.amazonses.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 6 Aug 2020 17:11:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS9WF=hGCC+T2SeEJOKcLPwCkQ=iO80RL=vsafx8gAhCQ@mail.gmail.com>
Message-ID: <CAK7LNAS9WF=hGCC+T2SeEJOKcLPwCkQ=iO80RL=vsafx8gAhCQ@mail.gmail.com>
Subject: Re: [Kernel.org Helpdesk #93182] Re: linux-kbuild missing from lore?
To:     kernel-helpdesk@rt.linuxfoundation.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Huckleberry <nhuck@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 6, 2020 at 12:49 PM Chris Hoy Poy via RT
<kernel-helpdesk@rt.linuxfoundation.org> wrote:
>
>
> Hi all,
>
> This should be active at
>
> https://lore.kernel.org/linux-kbuild


Thank you very much!



>
> I dont think we missed any, but there might have been a few slip past the gap between the archive and the subscription being active, feel free to forward a quick list of those days if necessary, and I'll pull them in too.
>
> cheers
> /Chris

-- 
Best Regards
Masahiro Yamada
