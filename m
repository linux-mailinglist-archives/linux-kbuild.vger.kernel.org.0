Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D58A125A5
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 May 2019 02:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfECAlW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 May 2019 20:41:22 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45835 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfECAlV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 May 2019 20:41:21 -0400
Received: by mail-oi1-f194.google.com with SMTP id t189so3144557oih.12
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2019 17:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i/LGIUMFfkHhxCSDT3fm51UOA28cPrGRFTawiLz9qdU=;
        b=FJIAYLW9LNf9oanARKl7TfF4hN+5D95QZaw548QJynu0CjT8BCwlpKeraO6t9YYkOs
         GtNX3/gAG5EXPOJwbqEw8XIrwSSwlKCrob0M1UGIcbcgu72bFgtpR14EttoAsQY2aDgu
         R3g2UNQXhcb3FGDMQxi+sYsTRkYHs3qzvEqqHMGSEtbYKM2QA4nxdIkJahuLnsBoO2+c
         TGr8njZSgd2pD66c4pynpYDwYtRx3F05qDNXkbRYRi3lANeuXFpYdvOTMjhMHRrrhF8P
         3i1MCfzjUMz11YJpZRIR9WsEPFVnmwGmtj8MUe4JYxQcAMMsvhz5BhNLX+0hNU5ukE4d
         83hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i/LGIUMFfkHhxCSDT3fm51UOA28cPrGRFTawiLz9qdU=;
        b=SX2EFyfDHUOK2JppD4fanjnlL8ER9wIKGnZVTTQU92RP5yHl/n/hW1Y+zII+km4kLH
         QT+Z0hEK4ENu7iXQbvomZmLMZ41IUVZUPHSneZ1tWny3idg5hW+mNmP5M5yYeMtETTI3
         uqVRVlh9yd7rAUzca+iyThQc8/R2IbVM4G5NmXMYS8lbZXar0slXhQFE0Dk9D/mysSkc
         /V5q9HBPe4efcn+CTxPYikZjyNu0MAZEXVNaKMGBZEp+5t1IQXxlLnlX6fK/J0AYD8Q2
         NYqhxWCG99zxb31hshH5tEK4syIJcMO7+qd/1jrXzBpj3qtLAOGzVH53ZCbWBF+mV9gW
         csfQ==
X-Gm-Message-State: APjAAAUkXqND+z0uyHiRuYoGGi7Fo+aTJWhqDQBn6OQz0e9c03qXOCyp
        MNvTThW3x+3cYV86us1FnnYTtqrTmAsvSkSElgGZsg==
X-Google-Smtp-Source: APXvYqx+IeNo/M2uU5es7ZAJsOSGR6b01vZ0dEQaWTEj9cNFRVwEHLuSMfXDE/OIHXARFXXWqbF1LQIlh8BGLZyE6Eo=
X-Received: by 2002:aca:4586:: with SMTP id s128mr4126147oia.148.1556844080319;
 Thu, 02 May 2019 17:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190502105053.GA12416@kroah.com> <20190502110513.GF12416@kroah.com>
In-Reply-To: <20190502110513.GF12416@kroah.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 2 May 2019 17:41:08 -0700
Message-ID: <CAFd5g46RyQ+jaV3bDejBaeca4Yv3G9ppT5JxdKqZw6PSbiSDYw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Kees Cook <keescook@google.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        shuah@kernel.org, devicetree <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        linux-um@lists.infradead.org,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        "Bird, Timothy" <Tim.Bird@sony.com>,
        Amir Goldstein <amir73il@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>, Jeff Dike <jdike@addtoit.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Kevin Hilman <khilman@baylibre.com>,
        Knut Omang <knut.omang@oracle.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Petr Mladek <pmladek@suse.com>,
        Richard Weinberger <richard@nod.at>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, wfg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 2, 2019 at 4:05 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, May 02, 2019 at 12:50:53PM +0200, Greg KH wrote:
> > On Wed, May 01, 2019 at 04:01:09PM -0700, Brendan Higgins wrote:
> > > ## TLDR
> > >
> > > I rebased the last patchset on 5.1-rc7 in hopes that we can get this in
> > > 5.2.
> >
> > That might be rushing it, normally trees are already closed now for
> > 5.2-rc1 if 5.1-final comes out this Sunday.
> >
> > > Shuah, I think you, Greg KH, and myself talked off thread, and we agreed
> > > we would merge through your tree when the time came? Am I remembering
> > > correctly?
> >
> > No objection from me.
> >
> > Let me go review the latest round of patches now.
>
> Overall, looks good to me, and provides a framework we can build on.
> I'm a bit annoyed at the reliance on uml at the moment, but we can work
> on that in the future :)

Eh, I mostly fixed that.

I removed the KUnit framework's reliance on UML i.e. the actual tests
now run on any architecture.

The only UML dependent bit is the KUnit wrapper scripts, which could
be made to work to support other architectures pretty trivially. The
only limitation here is that it would be dependent on the actual
workflow you are using.

In anycase, if you are comfortable reading the results in the kernel
logs, then there is no dependence on UML. (I should probably provide
some documentation on that...)

>
> Thanks for sticking with this, now the real work begins...

I don't doubt it.

>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Does this cover all the patches in this set?

Thanks!
