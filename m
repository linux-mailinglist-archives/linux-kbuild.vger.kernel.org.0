Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31B72CB660
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Dec 2020 09:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387884AbgLBIG6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 03:06:58 -0500
Received: from codesynthesis.com ([188.40.148.39]:48400 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387654AbgLBIG6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 03:06:58 -0500
Received: from brak.codesynthesis.com (unknown [105.225.210.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id AF6415F13B;
        Wed,  2 Dec 2020 08:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1606896376;
        bh=NwSxNJpRG1cLZQrYDrIIx0ik/5TmUkjMipEpsvX/aFA=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=tWpRQhYyW5M3szAzJa771WWDXja/qmmMQsmLnUeGzK+VzTatg+dnHW0rHLDDPcJx8
         aBazDDiO5l3GiLHfjLVhT/h76Un18ovnamY6k2V3gJWdflYqyap+gjFlOqWZ7F/7Ij
         Wffv5mgFWQQduhZ90L48orBLY7B29fND+sDQ5wYFlrzZzomZO0hp0xByOGae8Cnfp4
         k9Bj8E1TYuK0oU8aLbdDtRIzOnv9VEyQ1fkBKvFajXkIcDdFqiCWj6poyXUVyYUkA0
         WQaf8IUeCi9XqjTt1hRSaP2a2IPssDEm+yqivHqDNC3wboEhIvD36UdCtp65DBs1w/
         jUlGMU8LIlLbQ==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 8ED861A800C5; Wed,  2 Dec 2020 10:06:12 +0200 (SAST)
Date:   Wed, 2 Dec 2020 10:06:12 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: kconfig: diagnostics cleanups
Message-ID: <boris.20201202094405@codesynthesis.com>
References: <boris.20201125161355@codesynthesis.com>
 <CAK7LNAR+OkuHyELBYvcFZpO1b-bKe5rmodtGSuzxPhZsGwTSQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAR+OkuHyELBYvcFZpO1b-bKe5rmodtGSuzxPhZsGwTSQA@mail.gmail.com>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> We can change them if there is a reason, but I cannot see it in your
> description.

> Boris Kolpackov <boris@codesynthesis.com> wrote:
>
> > 1. Add 'warning' word to $(warning-if) output:

This will make the diagnostics consistent with other places in kconfig
where warnings are issued (see conf_warrning() in confdata.c).


> > 2. Print $(info) output to stderr instead of stdout.

There are two reasons:

1. Error, warning, and info are different diagnostics levels. It was
   surprising to me that the first two go to stderr while info goes
   to stdout. For example, as a user, if I redirect stderr, I would
   naturally expect all the diagnostics to go there.

2. More importantly, stdout is used by terminal-based UI configurators.
   So depending on exactly when $(info) is issued, its output could either
   be clobbered by UI (so the user won't notice it) or it can clobber UI
   (so the user will see broken UI).
