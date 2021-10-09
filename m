Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082E8427D45
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Oct 2021 22:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhJIUXA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sat, 9 Oct 2021 16:23:00 -0400
Received: from lithops.sigma-star.at ([195.201.40.130]:54788 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhJIUXA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Oct 2021 16:23:00 -0400
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id CE89E61B8F4A;
        Sat,  9 Oct 2021 22:21:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id IoC5xEtAuGLU; Sat,  9 Oct 2021 22:20:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id CB9F961B8F4F;
        Sat,  9 Oct 2021 22:20:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id XWCIRKwpHBSo; Sat,  9 Oct 2021 22:20:59 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 4321E61B8F4E;
        Sat,  9 Oct 2021 22:20:59 +0200 (CEST)
Date:   Sat, 9 Oct 2021 22:20:59 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     anton ivanov <anton.ivanov@cambridgegreys.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        davidgow <davidgow@google.com>, masahiroy <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        linux-um <linux-um@lists.infradead.org>, x86 <x86@kernel.org>
Message-ID: <356575565.55001.1633810859041.JavaMail.zimbra@nod.at>
In-Reply-To: <5B27741E-71A5-41CF-912C-D299248691F7@sipsolutions.net>
References: <20211008215133.9371-1-rdunlap@infradead.org> <CABVgOS=QVysVtN5seB5hp7hHAw5P0yuOaA3rgkRtEyiJu-1H6Q@mail.gmail.com> <05939461-793d-2266-8752-1b593bab8eec@infradead.org> <f0ead035-f05b-73fb-1fd4-48c1eff8bc92@cambridgegreys.com> <5B27741E-71A5-41CF-912C-D299248691F7@sipsolutions.net>
Subject: Re: [PATCH] um: Add missing "FORCE" target when using if_changed
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: Add missing "FORCE" target when using if_changed
Thread-Index: 3qI3xePmo35WxSGdCSPP24CgyiEeOQ==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

----- Ursprüngliche Mail -----
> Von: "Johannes Berg" <johannes@sipsolutions.net>
> An: "anton ivanov" <anton.ivanov@cambridgegreys.com>, "Randy Dunlap" <rdunlap@infradead.org>, "davidgow"
> <davidgow@google.com>
> CC: "masahiroy" <masahiroy@kernel.org>, "Michal Marek" <michal.lkml@markovi.net>, "Nick Desaulniers"
> <ndesaulniers@google.com>, "linux-kbuild" <linux-kbuild@vger.kernel.org>, "Jeff Dike" <jdike@addtoit.com>, "richard"
> <richard@nod.at>, "linux-um" <linux-um@lists.infradead.org>, "x86" <x86@kernel.org>
> Gesendet: Samstag, 9. Oktober 2021 15:06:01
> Betreff: Re: [PATCH] um: Add missing "FORCE" target when using if_changed

> On 9 October 2021 07:36:36 CEST, Anton Ivanov <anton.ivanov@cambridgegreys.com>
> wrote:
> 
>>The patch by Johannes is not in the pending list in patchwork, so it
>>looks like Richard has processed it and it will be in the next pull request.
> 
> I think it's still open:
> https://patchwork.ozlabs.org/project/linux-um/patch/20210928115146.277bec2328bb.If70926505d16d6c6a229002eb6d3f6838b546175@changeid/

This patch is now in linux-next.

Thanks,
//richard
