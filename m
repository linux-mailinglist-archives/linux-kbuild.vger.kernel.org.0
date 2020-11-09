Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5612AB4ED
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Nov 2020 11:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgKIKc0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Nov 2020 05:32:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26962 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726176AbgKIKc0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Nov 2020 05:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604917945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ojDd9UbUlvSSIYtOEoN6+LDeXo037/LRDUQIzFlvMjA=;
        b=e8UIl67f9fX2zXOh7nOjzpDiDvTyNzu5jhDm2UQHC8rNFBlYjqvflxkuHovN11SrZpAqvz
        tEu1D/3ClpyPMOLIKigCC+3xdgTGy1OhU1BlSgSPWZqzxwaRpsg8h1VFQL8RbdUuaUIE9q
        qjaC9vzDsnP24hpD6CRi3Zzk+ireY9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283--2usXNnZPW6o9MPP-C--jg-1; Mon, 09 Nov 2020 05:32:19 -0500
X-MC-Unique: -2usXNnZPW6o9MPP-C--jg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DE55107AFC7;
        Mon,  9 Nov 2020 10:32:17 +0000 (UTC)
Received: from krava (unknown [10.40.195.171])
        by smtp.corp.redhat.com (Postfix) with SMTP id BF7175C5AF;
        Mon,  9 Nov 2020 10:32:14 +0000 (UTC)
Date:   Mon, 9 Nov 2020 11:32:13 +0100
From:   Jiri Olsa <jolsa@redhat.com>
To:     Ming Lei <tom.leiming@gmail.com>
Cc:     Amy Parker <enbyamy@gmail.com>, linux-kbuild@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: 5.10 tree fails to build
Message-ID: <20201109103213.GA324561@krava>
References: <CAE1WUT75gu9G62Q9uAALGN6vLX=o7vZ9uhqtVWnbUV81DgmFPw@mail.gmail.com>
 <CACVXFVNmYoh20atwG9DOE-ZXFMLqNgGucREBsWAEYnDV4eLs1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACVXFVNmYoh20atwG9DOE-ZXFMLqNgGucREBsWAEYnDV4eLs1Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 09, 2020 at 05:57:37PM +0800, Ming Lei wrote:
> On Thu, Nov 5, 2020 at 12:58 PM Amy Parker <enbyamy@gmail.com> wrote:
> >
> > On all attempts to build the 5.10 tree (from either release candidate,
> > Linus's tree, Greg's tree, etc), the build crashes on the BTFID vmlinux
> > stage. I've tested this on several different devices with completely
> > different hardware and kernel configs. The symbol for vfs_getattr
> > appears to be missing. Compiles for all of these work on any compile
> > on any 5.9 tree. I've tested all 4 5.9 dot-releases as well as the first
> > two and last two release candidates and Greg's staging tree.
> >
> > The specific error is:
> >   BTFIDS  vmlinux
> > FAILED unresolved symbol vfs_getattr
> > make: *** [Makefile:1164: vmlinux] Error 255
> >
> > Any thoughts as to what's causing this? The main machine I'm
> > compiling with is running kernel 5.8.17 with dwarves 1.17. My
> > kernel config is attached as `kernel_config`.
> 
> Turns out the issue is introduced in the following commit:
> 
> commit 6e22ab9da79343532cd3cde39df25e5a5478c692
> Author: Jiri Olsa <jolsa@kernel.org>
> Date:   Tue Aug 25 21:21:20 2020 +0200
> 
>     bpf: Add d_path helper
> 
> The issue can be observed reliably when building kernel in Fedora 33 with
> F33's kernel config.
> 
> GCC: gcc version 10.2.1 20200826 (Red Hat 10.2.1-3) (GCC)

hi,
it's gcc dwarf issue tracked in here:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=97060

it's introduced by the gcc version 10.2.1 and we
were told it will take some time to fix

so we took steps to workaround that, the patchset
just got acked and it's on its way to get merged:

  https://lore.kernel.org/bpf/20201106222512.52454-1-jolsa@kernel.org/

it's change for both dwarves/pahole and kernel

the quick workaround is to disable CONFIG_DEBUG_INFO_BTF
option

jirka

> 
> -- 
> Ming Lei
> 

