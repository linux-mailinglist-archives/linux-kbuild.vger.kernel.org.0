Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46DA8FE44B
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 18:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfKORq7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 12:46:59 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:44989 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726505AbfKORq7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 12:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573840018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HGq8jc1LJlY1741ot7fezu8w/ETUBmd5wl0nIESlykU=;
        b=JcPIWFFadQsubpdW7FThfa6cG0L3FOhJKpFfZU8qIEcKCevBfFv/TMOv3w1JkK9C0rSgYP
        qUKE//Vjlx7ETvw0mecehCHJwlqIkUzQvYzA8c/zDGvrZKfUKNo9nq/ByHziqeJFCXI0QK
        wN9P+5g8r3YmpLHYO7omZsZNwnysDY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-5obBkpWmNaOQOhyMmkCmhg-1; Fri, 15 Nov 2019 12:46:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E13DA1005510;
        Fri, 15 Nov 2019 17:46:52 +0000 (UTC)
Received: from treble (ovpn-120-26.rdu2.redhat.com [10.10.120.26])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 42BCD5C548;
        Fri, 15 Nov 2019 17:46:51 +0000 (UTC)
Date:   Fri, 15 Nov 2019 11:46:49 -0600
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
Message-ID: <20191115174649.ldif5o7xqo5ntxeo@treble>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-8-shile.zhang@linux.alibaba.com>
 <893d3caf85cd4ed0921fab84cfe28cad@AcuMS.aculab.com>
MIME-Version: 1.0
In-Reply-To: <893d3caf85cd4ed0921fab84cfe28cad@AcuMS.aculab.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 5obBkpWmNaOQOhyMmkCmhg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 15, 2019 at 04:51:24PM +0000, David Laight wrote:
> From: Shile Zhang
> > Sent: 15 November 2019 06:48
> ...
> >  arch/x86/kernel/unwind_orc.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.=
c
> > index 332ae6530fa8..280da6fa9922 100644
> > --- a/arch/x86/kernel/unwind_orc.c
> > +++ b/arch/x86/kernel/unwind_orc.c
> > @@ -273,9 +273,11 @@ void __init unwind_init(void)
> >  =09=09return;
> >  =09}
> >=20
> > -=09/* Sort the .orc_unwind and .orc_unwind_ip tables: */
> > -=09sort(__start_orc_unwind_ip, num_entries, sizeof(int), orc_sort_cmp,
> > -=09     orc_sort_swap);
> > +=09/*
> > +=09 * Note, orc_unwind and orc_unwind_ip tables has been sorted in
> > +=09 * vmlinux link phase by sorttable tool at build time.
> > +=09 * Its ready for binary search now.
> > +=09 */
>=20
> How fast is sort() if the table is sorted?
> Relying on the kernel sources and build scripts always being in sync seem=
s dangerous.
> Probably better to leave the sort in for a release of two.

This patch comes after the build script changes, so they'd be in sync.
What would the concern be?

--=20
Josh

