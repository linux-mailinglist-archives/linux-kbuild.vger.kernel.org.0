Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1416921BD71
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jul 2020 21:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgGJTMJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 Jul 2020 15:12:09 -0400
Received: from a27-29.smtp-out.us-west-2.amazonses.com ([54.240.27.29]:53750
        "EHLO a27-29.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726872AbgGJTMJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Jul 2020 15:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1594408328;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=W+EbcKzbjaY+wig7h1/eRc8u3Q2jSaGGxUyFu637LSM=;
        b=NP0A0GPQlrfKbObxMhDG6eMIBphVeHisQnZNl0RsqQQJmoKAgv+6+e+0mv+HicVh
        P0A/KPnqFphVlqZxxPRrGSZJfNjnC10HPDFwXxT+PVKrwNf6Dte+sn+ydZUf0pdXulN
        PitPh/udxLTvsHAPcNYT7YOwB0pxikQ5NFukjYZE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1594408328;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=W+EbcKzbjaY+wig7h1/eRc8u3Q2jSaGGxUyFu637LSM=;
        b=CromhuLggUaHAlylMCHOMeMBcUKwFDhJ2ZefEawMRKvZ0/fsEQiLg3ziJwKTwhqe
        aMB/zpYUyuyKGfV5JJBM81SEDFCrKQPhRTi9OOaMuWBaQ+7M4YC2nu2Ruf4Kf/eEIz1
        uKO0Nqo1ul1x//uWge5u7Ez0s+TVD0+5/RtErXuE=
Subject: [Kernel.org Helpdesk #93182] Re: linux-kbuild missing from lore?
From:   "Nick Desaulniers via RT" <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
Message-ID: <010101733a245c41-96c4c771-a7f6-4fb8-b75d-c8cb11377c72-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nhuck@google.com, rdunlap@infradead.org,
        sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Fri, 10 Jul 2020 19:12:08 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.07.10-54.240.27.29
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello, can the admin of the lore.kernel.org helpdesk please accept the following sanitized archive?

https://drive.google.com/file/d/1d0oS3fCYxGhB0p_IQum9Gh20B3aFxKeI/view?usp=sharing

With generous assistance from Hank Leininger from marc.info, I was able to get mbox's for linux-kbuild@vger.kernel.org dating back to 2008.

The archive was provided as a tarball of directories of gzip archives. To generate the above, I ran:

$ tar xvf linux-kbuild_2008-2020.tar
$ find . -name \*.gz | xargs gunzip
$ for F in $(find untared -type f); do ./list-archive-maker.py -s $F -e linux-kbuild -k linux-kbuild-known-ids.txt -l linux-kbuild.vger.kernel.org; done
$ tar cf linux-kbuild.tar linux-kbuild
$ xz -9 linux-kbuild.tar

as per https://korg.docs.kernel.org/lore.html.

This response is via the ticket #93182 filed at rt.linuxfoundation.org's web site.
Thanks,
~Nick Desaulniers
