Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4F12F6393
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 15:58:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbhANO6s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 09:58:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47163 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725878AbhANO6q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 09:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610636240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/ppwJSqDEjfy1jUVKvhzNEie3ebwOMmvOLlmQbJW//U=;
        b=bAYULJ72QLdrUXKaYGPslyshEJJ3gw7hR/R8hdjhm/FBaOZmEPBNQ/KNXCiWdM25lWI+s/
        PWr1CjaMqAmYk+h/08kGeGutG1uuvHWOg4xSjxgmdVS+JB1sT2BMtUTTmOkgJ7hQy43K0o
        3NcUgKcvc51Vfqot2w4W/BSDBE4abuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-wv0VLSzDMN-f09iPugNMOw-1; Thu, 14 Jan 2021 09:57:16 -0500
X-MC-Unique: wv0VLSzDMN-f09iPugNMOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA301107ACF7;
        Thu, 14 Jan 2021 14:57:14 +0000 (UTC)
Received: from treble (ovpn-120-156.rdu2.redhat.com [10.10.120.156])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 39F5B10023B9;
        Thu, 14 Jan 2021 14:57:13 +0000 (UTC)
Date:   Thu, 14 Jan 2021 08:57:11 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Toolchain-dependent config options
Message-ID: <20210114145711.3yfx2x6snjij3bxl@treble>
References: <20210113222112.ej4rrd5xw2pwegvw@treble>
 <CAK7LNASbYiZ+UVTmUwRDGMMHQXO-oE-3a4RxbEqX+=dCG2U6dw@mail.gmail.com>
 <53fccf6d59938e94f71a823d704e26903b98fb7d.camel@petrovitsch.priv.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <53fccf6d59938e94f71a823d704e26903b98fb7d.camel@petrovitsch.priv.at>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 12:55:26PM +0100, Bernd Petrovitsch wrote:
> Hi all!
> 
> On Thu, 2021-01-14 at 13:56 +0900, Masahiro Yamada wrote:
> > On Thu, Jan 14, 2021 at 7:21 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> [...]
> > > If I copy a config with CONFIG_GCC_PLUGINS to another system which
> > > doesn't have the gcc-plugin-devel package, it gets silently disabled by
> > > "make olddefconfig".
> > > 
> > > I've seen multiple cases lately where this is causing confusion.  I
> > > suspect the problem is getting worse with recent added support for a
> > > variety of toolchains and toolchain-dependent features.
> > > 
> > > Would it be possible to have an error (or at least a warning) in this
> > > case?
> > > 
> > > For example, a "depends-error" which triggers an error if its failure
> > > would disable a feature?
> [...]
> > We disable any feature that is unsupported by the compiler in use.
> > 
> > Conventionally, we did that in the top Makefile
> > by using $(call cc-option, ) macro or by running some scripts.
> > 
> > Recently, we are moving such compiler tests to the Kconfig stage.
> > 
> > Anyway, we disable unsupported features so any combination
> > of CONFIG options builds successfully.
> > This will ease randconfg and allmodconfig tests.
> 
> For options of $CC, that makes sense since there are different
> compilers and lots of versions of them out there.
> 
> > A lot of people and CI systems are running allmodconfig tests
> > for various architectures and toolchains.
> 
> Isn't some kind of defying (or more killing) the usefulness
> of regression compile runs if one does `make allmodconfig`
> and some (lots?) of stuff gets automatically configured
> out just because some
> -dev(|el) package is missing?

Right, it sort of defeats the purpose of CI if new toolchain-dependent
features never get tested.  There needs to be some way to alert the user
they're not testing everything, despite "allyesconfig".

I suppose such config options can stop using this new "depends on
some_script" feature and just do it the old-fashioned way with an
$(error) in the makefile.

-- 
Josh

