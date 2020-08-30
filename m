Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB3E256D39
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Aug 2020 12:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgH3KC4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 30 Aug 2020 06:02:56 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:30316 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgH3KC4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Aug 2020 06:02:56 -0400
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 07UA2bf7006181;
        Sun, 30 Aug 2020 19:02:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 07UA2bf7006181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598781758;
        bh=6ArCffLXpfnWGTCIWQTHlQkALrjIxcH6Xcw6t7DJex0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PuH+DznTga6VuikvSnmiWyqOgj6+hoqrpymOEhgGe1av6T5P5wtq29JfvibuO2AAv
         TIKbvAt0FlXs//rLWaOPCqxLNS/Y8BqgQnrH3fjG3uOpTjjv90KWjUyARWcP/fchkV
         RoouoR+J3dIy30oGW+TjL75vB7dPJRObwdvjgEGjSPoED2vkHGmxY3FO0/+yfpYcPX
         8uqmYpt6zU3ROM5Ul6RyDPxTPUouHsomv6KBU5uDDc5Wz0J4+WU0btJw/ccOzlyolM
         JrSJnJjIlOPt5+8EODWc60UCc8z0Tgjk9meiepHTp2hsUWjFe1sfsFwAuRlgvA/B1n
         vBHa/rmQrBImg==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id i13so1592844pjv.0;
        Sun, 30 Aug 2020 03:02:38 -0700 (PDT)
X-Gm-Message-State: AOAM530krHPxKlxeSIGsZVEmkzHNCP2Kd3asqOuutIU5PVuE+5HyU0w5
        nC6STCSA77YUcQtK3MmQ1Umt2Zeh1dz2zAZ09e4=
X-Google-Smtp-Source: ABdhPJzgicTWOEXfVfk+vGTAPYxST/H41wENavnNHGohlSzydAIK4XerRG8o9rmAIFnbKzHssaQy6zUNVltnwYzzTuo=
X-Received: by 2002:a17:90a:fb53:: with SMTP id iq19mr6149179pjb.153.1598781757243;
 Sun, 30 Aug 2020 03:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200829081417.725978-1-masahiroy@kernel.org> <20200829081417.725978-6-masahiroy@kernel.org>
 <bd8696df-72b7-fb92-d53a-edff715fe5a0@infradead.org>
In-Reply-To: <bd8696df-72b7-fb92-d53a-edff715fe5a0@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 30 Aug 2020 19:01:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARoV41Z0gUSkRHx=CZFP5-KM+k-FrAm+CLLNW_1gxhXWw@mail.gmail.com>
Message-ID: <CAK7LNARoV41Z0gUSkRHx=CZFP5-KM+k-FrAm+CLLNW_1gxhXWw@mail.gmail.com>
Subject: Re: [PATCH 06/11] kconfig: qconf: allow to edit "int", "hex",
 "string" menus in-place
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Aug 30, 2020 at 1:54 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 8/29/20 1:14 AM, Masahiro Yamada wrote:
> > Previously, when you double-clicked the "int", "hex", or "string" menus,
> > a line-edit gadget showed up to allow you to input the value, which
> > looked clumsy.
> >
> > Also, it was buggy; the editor opened even if the config option was not
> > editable. For example, just try to double-click CC_VERSION_TEXT, which
> > has no prompt.
> >
> > This commit sub-classes QStyleItemDelegate to allow users to edit
> > "int", "hex", "string" menus in-place. Just double-click (or press
> > the F2 key) in the data column. Then, an editor widget is placed on
> > top of the item view.
>
> The F2 key doesn't work for me. I guess that's a desktop environment
> issue (I am using Xfce).


F2 works for me.
I am using metacity on Ubuntu.






> > The two methods are overridden:
> >
> >  createEditor - process only when the data column is being accessed
> >  and the menu is visible. Otherwise, return nullptr to disallow editing.
> >
> >  setModelData - take the new data from the editor, and set it to the
> >  addressed symbol. If it was successful, update all the list windows.
> >  Otherwise, (the reason for the failure is possibly the input data was
> >  out of range), set the old value back to the editor.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/kconfig/qconf.cc | 93 ++++++++++++++++++++++++++++++++--------
> >  scripts/kconfig/qconf.h  | 15 +++++++
> >  2 files changed, 91 insertions(+), 17 deletions(-)
> >
>
>
> --
> ~Randy
>


--
Best Regards
Masahiro Yamada
