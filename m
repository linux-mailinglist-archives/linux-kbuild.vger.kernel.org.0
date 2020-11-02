Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0692A25F2
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 09:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgKBISW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Nov 2020 03:18:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29408 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727802AbgKBISW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Nov 2020 03:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604305100;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=p2/Gm5Zzs68XWZ1TIg04nCFfNOqnMxjP5SvlL/3RU60=;
        b=OK1ZF3ds9m/zPPDtfYsnIGG0sV1Tcpx0kuiguoelJL3P42Gv8aoAX9fw5ytvBGiYv/uGaF
        EMpzDIdmuv1tzAaRiQOBsqS8dP4+2Tn5V2IuTpH+aFiQVvdmJbxV1dNDXU5sKaPNXR68oq
        5UD68L5df+IseCrTGRdahwze9Hab+PM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-l823rQMPM8OOJ7PVoyo1Jw-1; Mon, 02 Nov 2020 03:18:16 -0500
X-MC-Unique: l823rQMPM8OOJ7PVoyo1Jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A2AD6D581;
        Mon,  2 Nov 2020 08:18:15 +0000 (UTC)
Received: from tucnak.zalov.cz (ovpn-113-127.ams2.redhat.com [10.36.113.127])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id BE8C619C78;
        Mon,  2 Nov 2020 08:18:14 +0000 (UTC)
Received: from tucnak.zalov.cz (localhost [127.0.0.1])
        by tucnak.zalov.cz (8.16.1/8.16.1) with ESMTPS id 0A28IBmo2320689
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Mon, 2 Nov 2020 09:18:11 +0100
Received: (from jakub@localhost)
        by tucnak.zalov.cz (8.16.1/8.16.1/Submit) id 0A28IAlA2320688;
        Mon, 2 Nov 2020 09:18:10 +0100
Date:   Mon, 2 Nov 2020 09:18:10 +0100
From:   Jakub Jelinek <jakub@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
Message-ID: <20201102081810.GB3788@tucnak>
Reply-To: Jakub Jelinek <jakub@redhat.com>
References: <20201022012106.1875129-1-ndesaulniers@google.com>
 <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 02, 2020 at 11:20:41AM +0900, Masahiro Yamada wrote:
> > --- /dev/null
> > +++ b/scripts/test_dwarf5_support.sh
> > @@ -0,0 +1,4 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +set -eu
> > +echo ".file 0 \"asdf\"" | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
> 
> 
> 
> Please tell me how this script detects the dwarf-5 capability.
> 
> 
> This script fails for GCC 10.

One thing is GCC DWARF-5 support, that is whether the compiler
will support -gdwarf-5 flag, and that support should be there from
GCC 7 onwards.

Another separate thing is whether the assembler does support
the -gdwarf-5 option (i.e. if you can compile assembler files
with -Wa,-gdwarf-5) for GNU as I think that is binutils 35.1,
i.e. very new); but only if you want to pass the -Wa,-gdwarf-5
only when compiling *.s and *.S files.  That option is about whether
the assembler will emit DWARF5 or DWARF2 .debug_line.
It is fine to compile C sources with -gdwarf-5 and use DWARF2
.debug_line for assembler files if as doesn't support it.

Yet another thing is if you can pass -Wa,-gdwarf-5 even when
compiling C files.  There are several bugs in that category that have been
fixed only in the last few days on binutils trunk, I'd suggest
just not to bother, GCC 11 will have proper test for fixed assembler
and will pass -gdwarf-5 to as when compiling even C sources with -gdwarf-5.
The reason is to get DWARF5 .debug_line (.debug_line is usually produced
by the assembler, not compiler, from .file/.loc directives).

	Jakub

