Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0C42A2D0B
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 15:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbgKBOcZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Nov 2020 09:32:25 -0500
Received: from codesynthesis.com ([142.44.161.217]:46106 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgKBOcY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Nov 2020 09:32:24 -0500
Received: from brak.codesynthesis.com (unknown [105.184.207.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 6D6A35F1DE;
        Mon,  2 Nov 2020 14:32:23 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 27D7A1A800C4; Mon,  2 Nov 2020 16:32:19 +0200 (SAST)
Date:   Mon, 2 Nov 2020 16:32:19 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/2] kconfig: clean up header inclusion
Message-ID: <boris.20201102162336@codesynthesis.com>
References: <20201029155152.2467-1-boris@codesynthesis.com>
 <20201029155152.2467-3-boris@codesynthesis.com>
 <CAK7LNARRfK7LFrmJdMj4n77rb6pBYY=gXNLkfoSjk=pBJkg79w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARRfK7LFrmJdMj4n77rb6pBYY=gXNLkfoSjk=pBJkg79w@mail.gmail.com>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> On Fri, Oct 30, 2020 at 12:52 AM Boris Kolpackov
> <boris@codesynthesis.com> wrote:
> >
> > - Add missing includes.
> > - Remove no longer necessary includes.
> > - Separate non-portable header includes for easier porting.
> 
> I think the definition of "non-portable"
> depends on how far we expand the supported system.
> 
> I guess you want to segregate <unistd.h> and <sys/mmap.h>
> because you do not have them on Windows, correct?

Correct. I have a set of patches that make kconfig portable to
Windows. I assume there is no interest in these patches here so
I will be maintaining them out of tree (but let me know if my
assumption is wrong and I will happily submit them). Splitting
the header inclusions into two blocks make these patches a bit
cleaner and more resilient to changes.

Let me know if you would like me to change the patch to (1)
clarify the non-portable part or (2) get rid of the split.
