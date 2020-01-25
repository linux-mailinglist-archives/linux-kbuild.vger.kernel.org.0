Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3260414933F
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Jan 2020 05:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgAYEGz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jan 2020 23:06:55 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:39206 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgAYEGz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 23:06:55 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 00P46fpI019106;
        Sat, 25 Jan 2020 13:06:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 00P46fpI019106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579925202;
        bh=yXBN9giGGVP8YFLjCvd9y2Y4psaEk7MMrDKaFu70VXE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=u5f/FDcnvvkrhKYyemiOe6acQtqrzHzb9mWpwmZQBMK0fRZ/cB4SVXydneD97r2c5
         3VmUofbpAabpQe6+/pZoInvUZSsOXSyw2nIfRATA+BPEOADmITAC0lQEfzy0Ha2rPh
         a29wj5sJjTfjU6XDc7byr+nHwt95SxjWCTbkpBTHBnLbN9INzjgbp6ZZNDqndbxb2e
         +6dPmICfy1FkDJBDKKyzOIZW0YAk7e5EwGdv2KWbMbhrARbGRXExAxzowetjzkr9ST
         uPCYQRvBn3htD3NewYb/PcdnAFbRQW45oNMGwvBVgpXcyYFfKSzlrs4ao1gkI5VuHX
         U6zRRFjQNkfMQ==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id o42so1570307uad.10;
        Fri, 24 Jan 2020 20:06:42 -0800 (PST)
X-Gm-Message-State: APjAAAUcOML2lHbzvb0HkUfebpWephOOEmw738xaayzkZAm+Agl445qR
        bnXHQZMcDLGrIqK70sD4kDvfRv84ucAui3xmfNk=
X-Google-Smtp-Source: APXvYqxkyrEJyZiENeFonfdlrdo6tmVzVX2f6OzQrNtsYHF8t0mWlvnE74i51eRlRaiR9/Frba/4vkqC3a3Sb4qJD94=
X-Received: by 2002:ab0:2881:: with SMTP id s1mr3744433uap.95.1579925201134;
 Fri, 24 Jan 2020 20:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20200115162529.11089-1-masahiroy@kernel.org> <20200115162529.11089-4-masahiroy@kernel.org>
 <2bedc86669d33dd2e9f3b97954710f1a8139be19.camel@decadent.org.uk>
In-Reply-To: <2bedc86669d33dd2e9f3b97954710f1a8139be19.camel@decadent.org.uk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 25 Jan 2020 13:06:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASmgxQEOdpbbdBxPU58+QZ5Rz6UZpe+1TYJLaHg8pER7g@mail.gmail.com>
Message-ID: <CAK7LNASmgxQEOdpbbdBxPU58+QZ5Rz6UZpe+1TYJLaHg8pER7g@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] builddeb: avoid invoking sub-shells where possible
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Riku Voipio <riku.voipio@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ben,

On Wed, Jan 22, 2020 at 4:24 AM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Thu, 2020-01-16 at 01:25 +0900, Masahiro Yamada wrote:
> [...]
> > -if is_enabled CONFIG_STACK_VALIDATION; then
> > -     echo tools/objtool/objtool >> debian/hdrobjfiles
> > -fi
> [...]
> > +{
> > +     if is_enabled CONFIG_STACK_VALIDATION; then
> > +             find tools/objtool -type f -executable
> > +     fi
> [...]
>
> And this is still undoing part of patch 1.
>

You are right. I will fix it.



-- 
Best Regards
Masahiro Yamada
