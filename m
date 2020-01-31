Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6671514E73B
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2020 03:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgAaClD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jan 2020 21:41:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:54290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727749AbgAaClC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 21:41:02 -0500
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B87962082E;
        Fri, 31 Jan 2020 02:41:01 +0000 (UTC)
Date:   Thu, 30 Jan 2020 21:41:00 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] kconfig: localmodconfig: Minor clean ups to
 streamline_config.pl
Message-ID: <20200130214100.57b8239b@rorschach.local.home>
In-Reply-To: <CAK7LNATryPUSTm8wPTFHO=E5f=sVPM4T0UxT=BF2qeyVehsH6Q@mail.gmail.com>
References: <20200130122221.30029e32@gandalf.local.home>
        <CAK7LNAR1AJFDahD6cB_MryBd-79N_T5O9WV3CMEA+HOCDXZEig@mail.gmail.com>
        <20200130143941.23a0e217@gandalf.local.home>
        <CAK7LNATryPUSTm8wPTFHO=E5f=sVPM4T0UxT=BF2qeyVehsH6Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4git76 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 31 Jan 2020 11:08:59 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> OK, I see.  I will also try my best to send a notice email.
> I want to avoid a situation where two people
> are picking up the same patches without noticing each other.

BTW, I'm fine with changes to the localmodconfig code going through
your tree. Just let me give them acks. And if I end up having changes,
I'll send them to you.

Thanks!

-- Steve
