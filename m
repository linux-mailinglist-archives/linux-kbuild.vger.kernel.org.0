Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802332AC255
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Nov 2020 18:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731601AbgKIRbz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Nov 2020 12:31:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:38558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729883AbgKIRbz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Nov 2020 12:31:55 -0500
Received: from quaco.ghostprotocols.net (unknown [179.97.37.151])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 931432083B;
        Mon,  9 Nov 2020 17:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604943114;
        bh=yqWKTHMgPilYv7pnYv+9v9ISyjjUzNWt+Ip7DgXoBVo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DTLTdjPbqlV77cxVqyH/vhsWVVUQJ9CrdEdDTc8oa6NEfG1n/i/Fk4f6QDj0Zqvx+
         1s5zBhO7OtKZLhzkTt4kXtGSDcwtiMtraGvihuVCtyfs+e0xrX8of4Udk2SG06SnRL
         KGBgO/k/eCijqN6jnTPJWWWjiJ3F0qIXb7P93hZ8=
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 8826D411D1; Mon,  9 Nov 2020 14:31:52 -0300 (-03)
Date:   Mon, 9 Nov 2020 14:31:52 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Jiri Olsa <jolsa@redhat.com>
Cc:     Ming Lei <tom.leiming@gmail.com>, Amy Parker <enbyamy@gmail.com>,
        linux-kbuild@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>
Subject: Re: 5.10 tree fails to build
Message-ID: <20201109173152.GB340169@kernel.org>
References: <CAE1WUT75gu9G62Q9uAALGN6vLX=o7vZ9uhqtVWnbUV81DgmFPw@mail.gmail.com>
 <CACVXFVNmYoh20atwG9DOE-ZXFMLqNgGucREBsWAEYnDV4eLs1Q@mail.gmail.com>
 <20201109103213.GA324561@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109103213.GA324561@krava>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Mon, Nov 09, 2020 at 11:32:13AM +0100, Jiri Olsa escreveu:
> On Mon, Nov 09, 2020 at 05:57:37PM +0800, Ming Lei wrote:
> > On Thu, Nov 5, 2020 at 12:58 PM Amy Parker <enbyamy@gmail.com> wrote:
> > >
> > > On all attempts to build the 5.10 tree (from either release candidate,
> > > Linus's tree, Greg's tree, etc), the build crashes on the BTFID vmlinux
> > > stage. I've tested this on several different devices with completely
> > > different hardware and kernel configs. The symbol for vfs_getattr
> > > appears to be missing. Compiles for all of these work on any compile
> > > on any 5.9 tree. I've tested all 4 5.9 dot-releases as well as the first
> > > two and last two release candidates and Greg's staging tree.

> > > The specific error is:
> > >   BTFIDS  vmlinux
> > > FAILED unresolved symbol vfs_getattr
> > > make: *** [Makefile:1164: vmlinux] Error 255

> > > Any thoughts as to what's causing this? The main machine I'm
> > > compiling with is running kernel 5.8.17 with dwarves 1.17. My
> > > kernel config is attached as `kernel_config`.

> > Turns out the issue is introduced in the following commit:

> > commit 6e22ab9da79343532cd3cde39df25e5a5478c692
> > Author: Jiri Olsa <jolsa@kernel.org>
> > Date:   Tue Aug 25 21:21:20 2020 +0200

> >     bpf: Add d_path helper

> > The issue can be observed reliably when building kernel in Fedora 33 with
> > F33's kernel config.

> > GCC: gcc version 10.2.1 20200826 (Red Hat 10.2.1-3) (GCC)
 
> hi,
> it's gcc dwarf issue tracked in here:
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97060
 
> it's introduced by the gcc version 10.2.1 and we
> were told it will take some time to fix
 
> so we took steps to workaround that, the patchset
> just got acked and it's on its way to get merged:
 
>   https://lore.kernel.org/bpf/20201106222512.52454-1-jolsa@kernel.org/
 
> it's change for both dwarves/pahole and kernel
 
> the quick workaround is to disable CONFIG_DEBUG_INFO_BTF
> option

I've applied the series and I'm now testing it, will tag v1.19 then.

- Arnaldo
