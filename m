Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E55822FB7C
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jul 2020 23:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgG0VdL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 17:33:11 -0400
Received: from a27-193.smtp-out.us-west-2.amazonses.com ([54.240.27.193]:60322
        "EHLO a27-193.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726110AbgG0VdL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 17:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1595885590;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=r66qdttsZ/TCGXkXFVmKDGyxyyrSIBEyQvIvtjQiPyE=;
        b=Qsiz40S/qxCubWvxHIMcjkG4gAKzWHPlsk1JOWZ2+RiImATFP8l4PYfx1/O1KctF
        S+cNoU802ULrzYQ0xK9o6d4RfT9yL4GYMmC3f8g41ph3iM7fWPGHNy6IAgmoehk4qfx
        y38dxtq+EGCktwsH4nyb23Cs/Lb15W44b7i29bKo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1595885590;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=r66qdttsZ/TCGXkXFVmKDGyxyyrSIBEyQvIvtjQiPyE=;
        b=WfeZidBvXBeA2kW19yCuW6WWZ8oBY+GmuR7f4GWX4kSwsyl1Cwaj9dbCQK/m8RND
        gmtg6AeHD/8GOhtT3li3M5PlC2VbtY4yaYSpRmzpKHMbq9GIk7gDLsYqVq9RUzX3bXK
        FUOUDthZbyblNf5lPupbfsAYTfjp1kJWAL5wfI9A=
Subject: [Kernel.org Helpdesk #93182] Re: linux-kbuild missing from lore?
From:   "Chris Hoy Poy via RT" <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <rt-4.4.0-1686-1594408327-1443.93182-6-0@linuxfoundation>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <rt-4.4.0-1686-1594408327-1443.93182-6-0@linuxfoundation>
Message-ID: <0101017392319714-3d813ac3-7620-4874-8320-ff1f5de1d149-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: choypoy@linuxfoundation.org
To:     ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nhuck@google.com, rdunlap@infradead.org,
        sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Mon, 27 Jul 2020 21:33:10 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.07.27-54.240.27.193
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi all,

Apologies for delays! 

Have just tried to grab this shared file, and I'm getting 403'd (violates terms), 

I have an archiver subscribed, so new emails are being collected. 

cheers
/Chris


On Sat Jul 11 03:12:07 2020, ndesaulniers@google.com wrote:
> Hello, can the admin of the lore.kernel.org helpdesk please accept the
> following sanitized archive?
> 
> https://drive.google.com/file/d/1d0oS3fCYxGhB0p_IQum9Gh20B3aFxKeI/view?usp=sharing
> 
> With generous assistance from Hank Leininger from marc.info, I was
> able to get mbox's for linux-kbuild@vger.kernel.org dating back to
> 2008.
> 
> The archive was provided as a tarball of directories of gzip archives.
> To generate the above, I ran:
> 
> $ tar xvf linux-kbuild_2008-2020.tar
> $ find . -name \*.gz | xargs gunzip
> $ for F in $(find untared -type f); do ./list-archive-maker.py -s $F
> -e linux-kbuild -k linux-kbuild-known-ids.txt -l linux-
> kbuild.vger.kernel.org; done
> $ tar cf linux-kbuild.tar linux-kbuild
> $ xz -9 linux-kbuild.tar
> 
> as per https://korg.docs.kernel.org/lore.html.
> 
> This response is via the ticket #93182 filed at
> rt.linuxfoundation.org's web site.
> Thanks,
> ~Nick Desaulniers


-- 
Chris Hoy Poy
Collaborative Projects IT
The Linux Foundation
