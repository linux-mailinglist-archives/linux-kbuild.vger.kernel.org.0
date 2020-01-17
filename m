Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 919941401E8
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 03:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388867AbgAQC2z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Jan 2020 21:28:55 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:17483 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388334AbgAQC2z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 21:28:55 -0500
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 00H2SZbI032140;
        Fri, 17 Jan 2020 11:28:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 00H2SZbI032140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579228116;
        bh=hqIiFv0vlbk8v+McocbQfQ5XPxeoUcGd8URuFu7Q58Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UryCtISmpl6ZveBO5j2rBQqorginb3L64L2Dl8IzEG1fkHySHZYmgq8j5mcHAnW/u
         mqgLT6na5kDRgEzxtWXWYvJGdwAuNLwrbUKEFjiI2IV1T7vhZN9Tzk5jMm5PlGgEEo
         BK7ud2aq9T2CNt9qWankSN0dhJx8Ywp/1YQBVIc6k56fyOqJHHY4xs23+nnS/ZG74P
         kiNtcuz+nGTXkJd5n8+FIEWhx7y7RE3QQzU2lCJ849K++2VdQwIc1i4X2W5EjEBsLz
         Tj1eLac6/LgyLVY7qClcfW9VfnYtvliIz6MAF1X0+f2/CQ6QmSkpIzONYg2n1bCRFL
         Hv8Td0npQmZGw==
X-Nifty-SrcIP: [209.85.221.174]
Received: by mail-vk1-f174.google.com with SMTP id d17so6259178vke.5;
        Thu, 16 Jan 2020 18:28:35 -0800 (PST)
X-Gm-Message-State: APjAAAUJ3u+Oe4uYahJjvFP93wj0D1vtbfHT8HvxCf7M/E69vbiDt5rP
        g9bd3kBtnd7nZjY+ddAabouN2hqFnSFnmVe+CYU=
X-Google-Smtp-Source: APXvYqwWZbIDWqll+Cx58kBUpBqVexGuN4IKXN1PvpIpSjaTkK0d/oE+iO4nLo5BNsIrbQGNEZc/51CY2BPdQui+sH4=
X-Received: by 2002:a1f:252:: with SMTP id 79mr23167280vkc.96.1579228114985;
 Thu, 16 Jan 2020 18:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20200113232212.138327-1-helgaas@kernel.org> <20200116125255.56eba406@lwn.net>
In-Reply-To: <20200116125255.56eba406@lwn.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 17 Jan 2020 11:27:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRg+DYRuRbbWMz+++BNhM==omTK26tTC1bBXQUNiMK9w@mail.gmail.com>
Message-ID: <CAK7LNARRg+DYRuRbbWMz+++BNhM==omTK26tTC1bBXQUNiMK9w@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix documentation typos
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 17, 2020 at 4:52 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Mon, 13 Jan 2020 17:22:11 -0600
> Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> > From: Bjorn Helgaas <bhelgaas@google.com>
> >
> > Fix a couple typos in kconfig-language documentation.
> >
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> >  Documentation/kbuild/kconfig-language.rst | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Looks good to me; Masahiro I assume you'll be taking this one?
>
> Thanks,
>
> jon


I can pick this up, but I commented on the first paragraph.

(I do not know what is the best way to describe the
plural form of a special keyword...)







--
Best Regards
Masahiro Yamada
