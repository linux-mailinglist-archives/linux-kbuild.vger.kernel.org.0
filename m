Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1957221785
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Jul 2020 00:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgGOWIu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Jul 2020 18:08:50 -0400
Received: from a27-30.smtp-out.us-west-2.amazonses.com ([54.240.27.30]:44404
        "EHLO a27-30.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726370AbgGOWIt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jul 2020 18:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=7jvkchcrhflv7qhbkgrcypyraifp65wy; d=rt.linuxfoundation.org;
        t=1594850928;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding;
        bh=3/6iA5swYS5O5SpQJbfLWm6vF/gbq5u4IMjVS9A11/o=;
        b=C6Y30YSk7YAJEBhAvkw0bbVeXFfcrb1I1GqQBp718Im4clo2UhSfmXJF8EaN9pL/
        eonD+H/rZCyG94QWqt1o0HRg9xsV0Sw3aq06y+sweyRIAEOoqbSFtVlGVkb3YIorCrA
        XuRuFM79yz8G2uj0fXDe2saMWEktXItDmc6swz/s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1594850928;
        h=Subject:From:Reply-To:In-Reply-To:References:Message-ID:To:CC:Content-Type:Date:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=3/6iA5swYS5O5SpQJbfLWm6vF/gbq5u4IMjVS9A11/o=;
        b=THS7sO9jdNf1BLltCL0vKi+VYHUHbvWSLafwe5M6AN4T43ZbOk0oh9Q0uVT3IOMy
        sRhYP13afXGcEioI7OfH+1PDKWGcRfzmkbwhoKQAKAvbwQjzTYYvSuBtX0X/gmoOA+n
        Qk4yrtvBADXtktduT1DhwBkZYC8yyLkpdgG2NpO4=
Subject: [Kernel.org Helpdesk #93182] Re: linux-kbuild missing from lore?
From:   "Konstantin Ryabitsev via RT" 
        <kernel-helpdesk@rt.linuxfoundation.org>
Reply-To: kernel-helpdesk@rt.linuxfoundation.org
In-Reply-To: <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
References: <RT-Ticket-93182@linuxfoundation>
 <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
Message-ID: <010101735485e880-432becb0-6240-4321-a6a0-ad65b9f84880-000000@us-west-2.amazonses.com>
X-RT-Loop-Prevention: linuxfoundation.org
X-RT-Ticket: linuxfoundation.org #93182
X-Managed-BY: RT 4.4.0 (http://www.bestpractical.com/rt/)
X-RT-Originator: konstantin@linuxfoundation.org
To:     ndesaulniers@google.com
CC:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nhuck@google.com, rdunlap@infradead.org,
        sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
X-RT-Original-Encoding: utf-8
Date:   Wed, 15 Jul 2020 22:08:48 +0000
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.07.15-54.240.27.30
Feedback-ID: 1.us-west-2.3ULHQnc20aILdVzjlbQ8UqO1WRWzA1U01b2uFAcT62w=:AmazonSES
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello, all:

We have a small backlog of lore.kernel.org requests at this time, but we should be able to get to it in short order. Thank you for your patience.

-K
