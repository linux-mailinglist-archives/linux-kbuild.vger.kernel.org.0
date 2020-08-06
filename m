Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE3A23D7DB
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Aug 2020 10:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgHFIMb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Aug 2020 04:12:31 -0400
Received: from a27-23.smtp-out.us-west-2.amazonses.com ([54.240.27.23]:56390
        "EHLO a27-23.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726799AbgHFIMa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Aug 2020 04:12:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1596701547;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=aOFXnlCuTOHuo0CD29VS7VKzIMCLL6nCO7qWZYWe7OA=;
        b=DaGxoVoKXpw5KttEBUIesZSPYVwNlGDuBwCEE65WtOIJizz/pLzwdAs7TUUF67g0
        3WN+IK9HtlWJjbT9hDZqnZ+2uUhMRf1yO3y8vfIQS0EnywgWLM8BwqOcB83WxOohTBx
        UiD6+ukWXxnhO8zEsziSQpKLdqm14yrRZRgo0k+c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1596701547;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=aOFXnlCuTOHuo0CD29VS7VKzIMCLL6nCO7qWZYWe7OA=;
        b=Pqn06RfJb+fNI9OsY/COLEZpEZPg02cRvBls29CeWG2CS7DlC+XAEX/VMZm/v1Hu
        wsgnzwa1wJLCFEme6c6JM2Ns4UmiY9PdtDq0vXHeAybTZfD2q4NgpywTP4YKy7ymlOR
        BpdjrRHYy21P+PNIEYRyJJ3MaE2xY25E/OJXZkxs=
Subject: Re: [Kernel.org Helpdesk #93182] Re: linux-kbuild missing from lore?
From:   "masahiroy@kernel.org via RT" 
        <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <CAK7LNAS9WF=hGCC+T2SeEJOKcLPwCkQ=iO80RL=vsafx8gAhCQ@mail.gmail.com>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <01010173c1e35fde-0cbf88a3-5ebe-43fa-be6b-af9c00a50864-000000@us-west-2.amazonses.com> <CAK7LNAS9WF=hGCC+T2SeEJOKcLPwCkQ=iO80RL=vsafx8gAhCQ@mail.gmail.com>
Message-ID: <01010173c2d41af0-785da8f3-48e2-4acd-81f4-7d56f4a9a328-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: masahiroy@kernel.org
To:     ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, michal.lkml@markovi.net,
        nhuck@google.com, rdunlap@infradead.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Thu, 6 Aug 2020 08:12:27 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.08.06-54.240.27.23
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
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

