Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183D641426F
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Sep 2021 09:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbhIVHTV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Sep 2021 03:19:21 -0400
Received: from codesynthesis.com ([188.40.148.39]:49652 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbhIVHTU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Sep 2021 03:19:20 -0400
Received: from brak.codesynthesis.com (197-255-152-207.static.adept.co.za [197.255.152.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id B169D602A0;
        Wed, 22 Sep 2021 07:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1632295069;
        bh=c2UpXL4PSLygQM+bqjl2J+S9hO6kM62k4HRY4VC2ziQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=I+TzQHQ8SZED5DYDOKTb1U637g23JhDwGOKKgQc+Nh4Vg4kp/9+cJM1teBEwe89xq
         C6A9l3iw/DA9T8wC0eZzkr/s45KFZ2w5lsVsxkAKHysug1B4QMb0Ia7KyZepX4NI3H
         fyBkk08gKYVOF3mw30GFJ5Ng1GnbHwn8qf4j7yud4tgt814e6M6NuuwYhdaF0Jxy4f
         IhLe9y9fiqEtTYz/P9f30/S7oZ69KNsiNyNyyhOxG4MlEnbGndjkX/PD1Jv6im/0Qs
         8hk1pGsyfa18onu5yn11EnAYy+VeslqjT3Rk1F6vGxqml5k2szPFmL6EWbMFYhiZKn
         PvZwrsIrGcVOg==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 452951A800C4; Wed, 22 Sep 2021 09:17:44 +0200 (SAST)
Date:   Wed, 22 Sep 2021 09:17:44 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Richard Weinberger <richard@nod.at>
Cc:     masahiroy@kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] kconfig: Deny command substitution in string values
Message-ID: <boris.20210922090732@codesynthesis.com>
References: <20210920213957.1064-1-richard@nod.at>
 <20210920213957.1064-2-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920213957.1064-2-richard@nod.at>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Richard Weinberger <richard@nod.at> writes:

> The post processed .config file will get included in shell
> and makefiles.

That depends on who you ask: a number of projects other than the
Linux kernel use kconfig for configuration and some of them do
neither of those. I also don't believe the Linux kernel sources
.config in shell (but I may be wrong).


> So make sure that a string does not contain
> symbols that allow command substitution.
> If such a malformed string is found, return empty string
> and report it.

So effectively it's now impossible to include ` or $ in kconfig
string values. Seems like a major, backwards-incompatible
restriction.

I think if this is really desired, then it should be re-done with
escaping (similar to ") rather than outright banning inconvenient 
characters.
