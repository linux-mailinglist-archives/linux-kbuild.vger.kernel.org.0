Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A8222FC2B
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 00:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgG0Way (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 18:30:54 -0400
Received: from a27-23.smtp-out.us-west-2.amazonses.com ([54.240.27.23]:59828
        "EHLO a27-23.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727090AbgG0Way (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 18:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1595889053;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=6o/drBipLGz7eyKYgjZE7T4dDYgCC90153RlmnRLaRc=;
        b=cjWthNCfMh8whQleNes1xjsM0tJmaNYgvssPszmE72ApixKzm1t+YJag9yN754wi
        Wh2SZNwOIaYr4n3vWylS5wzgmf0Is6DsIC7MHF5kNoxAMNvh3nuLDGzyfAks89yFq1u
        cyMxqi65GrE+aV6c5WxzmaCvAvXRSIXqCrx8yXGU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1595889053;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=6o/drBipLGz7eyKYgjZE7T4dDYgCC90153RlmnRLaRc=;
        b=mYbPLIAKafLm5MwEeX6gYhL7t31RzurN8K1+u+Z//nZgI2hY/wrqQSK+pmtE7cnP
        Qg1gnSAjNhjOKnrNRHZ+/L0oJVsQy9CpDkU+r1D/PmZ/QaSkKSDKr1EKVu5XoQdr4ov
        YZYPZaBqrr92v5s7vHVL0IM8w1VcQvFDKbaqcRro=
Subject: Re: [Kernel.org Helpdesk #93182] Re: linux-kbuild missing from lore?
From:   "Nick Desaulniers via RT" <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <CAKwvOdmbEOWdfFrXwWcakLSdZMQonLpneLm-OU9uFh17doGekA@mail.gmail.com>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <rt-4.4.0-1686-1594408327-1443.93182-6-0@linuxfoundation>
 <0101017392319714-3d813ac3-7620-4874-8320-ff1f5de1d149-000000@us-west-2.amazonses.com> <CAKwvOdmbEOWdfFrXwWcakLSdZMQonLpneLm-OU9uFh17doGekA@mail.gmail.com>
Message-ID: <0101017392666ec4-f938e2ce-b1f0-4219-ad2b-33f2e2fdf752-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nhuck@google.com, rdunlap@infradead.org,
        sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Mon, 27 Jul 2020 22:30:53 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.07.27-54.240.27.23
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 27, 2020 at 2:33 PM Chris Hoy Poy via RT
<kernel-helpdesk@rt.linuxfoundation.org> wrote:
>
> Hi all,
>
> Apologies for delays!
>
> Have just tried to grab this shared file, and I'm getting 403'd (violates terms),
>
> I have an archiver subscribed, so new emails are being collected.

Ever since a certain engineer decided to exfiltrate documents
regarding LIDAR we now internally have a completely locked down (read:
useless) version of google drive.  If you can send me your email
(other than kernel-helpdesk@rt.linuxfoundation) off list, then I might
be able to share this with you that way.  I was able to send an invite
to the helpdesk email, but I suspect that just filed a ticket
somewhere.

>
> cheers
> /Chris
>
>
> On Sat Jul 11 03:12:07 2020, ndesaulniers@google.com wrote:
> > Hello, can the admin of the lore.kernel.org helpdesk please accept the
> > following sanitized archive?
> >
> > https://drive.google.com/file/d/1d0oS3fCYxGhB0p_IQum9Gh20B3aFxKeI/view?usp=sharing
> >
> > With generous assistance from Hank Leininger from marc.info, I was
> > able to get mbox's for linux-kbuild@vger.kernel.org dating back to
> > 2008.
> >
> > The archive was provided as a tarball of directories of gzip archives.
> > To generate the above, I ran:
> >
> > $ tar xvf linux-kbuild_2008-2020.tar
> > $ find . -name \*.gz | xargs gunzip
> > $ for F in $(find untared -type f); do ./list-archive-maker.py -s $F
> > -e linux-kbuild -k linux-kbuild-known-ids.txt -l linux-
> > kbuild.vger.kernel.org; done
> > $ tar cf linux-kbuild.tar linux-kbuild
> > $ xz -9 linux-kbuild.tar
> >
> > as per https://korg.docs.kernel.org/lore.html.
> >
> > This response is via the ticket #93182 filed at
> > rt.linuxfoundation.org's web site.
> > Thanks,
> > ~Nick Desaulniers
>
>
> --
> Chris Hoy Poy
> Collaborative Projects IT
> The Linux Foundation



-- 
Thanks,
~Nick Desaulniers

