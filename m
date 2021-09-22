Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3C5414CDD
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Sep 2021 17:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236366AbhIVPUV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Sep 2021 11:20:21 -0400
Received: from codesynthesis.com ([188.40.148.39]:51316 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbhIVPUV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Sep 2021 11:20:21 -0400
Received: from brak.codesynthesis.com (197-255-152-207.static.adept.co.za [197.255.152.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 70F146037E;
        Wed, 22 Sep 2021 15:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1632323929;
        bh=Fop8KzuTj8eJDYWxQnTsAojwrY2EXG/OV4zfG0aaIH4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=QveitF47fr2YPXgvZGRPBqlvmiv90lfX4H8ZJ42tUrArNFfFdmtPkLthPw2PPhk++
         rVo40kVwCSMmfyLqXjU7XZQqUPGe30eydO+rPZotX85zGwj8nboEbcBG0IAD3Unt06
         5d4iKtUtqYQXbC8eVO/WysF5szx1f5k6xu6F5TtOxt2nRUOer75MBsyvA/LndoUR53
         Yan+ABEofWI3NrBca3TvhvGeOENLMjHL1G4DA0E5ocgiJiz8AIXJgPZY5HYdu8z0Vq
         FqzBn3gThbAel1BLh/5x9366+4VhbQWZ5w3tcvyI1xpneDsFOT30JWg2tvQLhb2YUp
         8M+CWLh9Qvh9A==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 550821A800C4; Wed, 22 Sep 2021 17:18:43 +0200 (SAST)
Date:   Wed, 22 Sep 2021 17:18:43 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Richard Weinberger <richard@nod.at>
Cc:     masahiroy@kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] kconfig: Deny command substitution in string values
Message-ID: <boris.20210922165140@codesynthesis.com>
References: <20210920213957.1064-1-richard@nod.at>
 <20210920213957.1064-2-richard@nod.at>
 <boris.20210922090732@codesynthesis.com>
 <1402570794.96583.1632295660867.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402570794.96583.1632295660867.JavaMail.zimbra@nod.at>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Richard Weinberger <richard@nod.at> writes:

> > So effectively it's now impossible to include ` or $ in kconfig
> > string values. Seems like a major, backwards-incompatible
> > restriction.
> 
> Do you have a working example?

You mean of a project that uses kconfig and that is capable of
handling string values with these characters? If so, then yes,
see for example, libbuild2-kconfig[1] which is a build system
module that implements kconfig-based configuration support for
build2. In particular, it exposes values from .config  as
buildfile variables but it doesn't do this by sourcing .config.
Instead it loads .config using the kconfig API and then sets
the corresponding buildfile variables programmatically.


> Since the config is sourced in the scripts/setlocalversion it will
> not work correctly anyway.

The actual file being sources is include/config/auto.conf, not
.config, right?


> > I think if this is really desired, then it should be re-done with
> > escaping (similar to ") rather than outright banning inconvenient
> > characters.
> 
> Escaping is not so easy since the very same content is included
> in shell scripts (sertlocalversion), in Makefiles and in C files.

Again, I don't think it's .config that gets included in C files but 
rather include/generated/autoconf.h, right?


> At least I didn't find find a good way to escape these characters
> such that all three programming environments will accept it.

If my understanding is correct, then you are concerned with the
autoconf functionality: the auto.conf makefile and autoconf.h
header, and not the .config file itself. Perhaps it will be less
disruptive to do the escaping (or banning) at that level?

Specifically:

1. If you do escaping at that level, then you can do it differently
   for auto.conf and autoconf.h. Though auto.conf still seems to be
   read by both make and shell.

2. Alternatively, you can detect and ban the inconvenient characters
   when generating these files (I personally don't care for autoconf
   and have it disabled).

[1] https://github.com/build2/libbuild2-kconfig
