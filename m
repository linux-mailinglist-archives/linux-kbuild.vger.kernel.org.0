Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 409FD100792
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2019 15:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfKROlv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Nov 2019 09:41:51 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37100 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727121AbfKROlu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Nov 2019 09:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574088109;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zWOuHjtcr+jgrXR9pO0XmYBgEY/ms4Num4NmyM+C6gs=;
        b=X3bgh4M/IpUnT5h4bYjAbofbyAwSTCRcpEljE94ZO/X9IQ+VkVsidb3xq9OncrC+Z32h9F
        AbhI2IHa4+lgfw1mK1H9AtbX5jl58UMpi/qvK0qet9CkeY5MgFyCjSJHcKRpq1cXWvdWRr
        KvpmsoW2scdJ2AMsQwnIHAn2hdmfV+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-jeNprMmrNECxHQTR4Wq5wg-1; Mon, 18 Nov 2019 09:41:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F67918C3940;
        Mon, 18 Nov 2019 14:41:42 +0000 (UTC)
Received: from treble (ovpn-121-122.rdu2.redhat.com [10.10.121.122])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B6BDE5DDAA;
        Mon, 18 Nov 2019 14:41:39 +0000 (UTC)
Date:   Mon, 18 Nov 2019 08:41:37 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     'Shile Zhang' <shile.zhang@linux.alibaba.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "x86@kernel.org" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [RFC PATCH v3 7/7] x86/unwind/orc: remove run-time ORC unwind
 tables sort
Message-ID: <20191118144137.ibxel2hmp57jvspc@treble>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-8-shile.zhang@linux.alibaba.com>
 <893d3caf85cd4ed0921fab84cfe28cad@AcuMS.aculab.com>
 <20191115174649.ldif5o7xqo5ntxeo@treble>
 <5fe9024bc69c4a4eb115b3c2f3f9bcd1@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <5fe9024bc69c4a4eb115b3c2f3f9bcd1@AcuMS.aculab.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: jeNprMmrNECxHQTR4Wq5wg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 18, 2019 at 10:05:02AM +0000, David Laight wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> > Sent: 15 November 2019 17:47
> > On Fri, Nov 15, 2019 at 04:51:24PM +0000, David Laight wrote:
> > > From: Shile Zhang
> > > > Sent: 15 November 2019 06:48
> > > ...
> > > >  arch/x86/kernel/unwind_orc.c | 8 +++++---
> > > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_=
orc.c
> > > > index 332ae6530fa8..280da6fa9922 100644
> > > > --- a/arch/x86/kernel/unwind_orc.c
> > > > +++ b/arch/x86/kernel/unwind_orc.c
> > > > @@ -273,9 +273,11 @@ void __init unwind_init(void)
> > > >  =09=09return;
> > > >  =09}
> > > >
> > > > -=09/* Sort the .orc_unwind and .orc_unwind_ip tables: */
> > > > -=09sort(__start_orc_unwind_ip, num_entries, sizeof(int), orc_sort_=
cmp,
> > > > -=09     orc_sort_swap);
> > > > +=09/*
> > > > +=09 * Note, orc_unwind and orc_unwind_ip tables has been sorted in
> > > > +=09 * vmlinux link phase by sorttable tool at build time.
> > > > +=09 * Its ready for binary search now.
> > > > +=09 */
> > >
> > > How fast is sort() if the table is sorted?
> > > Relying on the kernel sources and build scripts always being in sync =
seems dangerous.
> > > Probably better to leave the sort in for a release of two.
> >=20
> > This patch comes after the build script changes, so they'd be in sync.
> > What would the concern be?
>=20
> Mostly that if, for any reason, the build script changes are missing noth=
ing
> will detect the error - but the results will be very confusing.
> If the sort is fast for sorted inputs (some algorithms aren't) then leavi=
ng
> it in won't take that long.

But why would the build script changes be missing...

And it should fail gracefully for oopses anyway: stack traces will just
have a bunch of question marks.

--=20
Josh

