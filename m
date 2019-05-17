Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB49221385
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 07:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfEQFqF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 01:46:05 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38016 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfEQFqE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 01:46:04 -0400
Received: by mail-wm1-f68.google.com with SMTP id t5so4121598wmh.3;
        Thu, 16 May 2019 22:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g/qml3iUa9qZ8cs6AO/of4k3pVB/993rajYIEGU/bj8=;
        b=t87LvPnA5Bzggr787T5L0uzD6WpsbgmNyN2dWEfew35gx8D2yJLlSviz35gFQIdq8g
         FAwIZO6LP6fsUURfuPvyU5KK5Y6Q9kDxJMqvYh2w/3d/abvqRqgRL1ElLuv5avtsikyV
         MccWgNl8Y9q3OQOeSAFZs79yVCd+NyyhgHUZX7s9ra7lQrJzJoaycsvuEHpQE7yztw5G
         6uJIOlJPpz7xWETN2x0yPW/+rUBkgof+FNk6WfV2+4Q4Obcs12+QLO2MBI0DRVyARm4F
         57HvnKlHzy0HWO2ad4CcYSXcv7bYqmfsCpmfne7zGwpE1q941yfmUsExqWUX3z8FdCP+
         Sswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g/qml3iUa9qZ8cs6AO/of4k3pVB/993rajYIEGU/bj8=;
        b=mRNnF1uq0mwklPdmBVKmv+NsjNAI5c5Rjz5YlGuz+WnUP0o8BdXtsh4T6EVH6kz7uA
         A7hIeMG6aq4Ff0Fh3iqwPGDy+k4OF4GB95iMfXzR9ux9L6Ah84Dm/QVv+YtrxYTlBZqQ
         Mvx7ylWEDxZEKRRfXii34DlGdsOa93JR70XPiPqDZqKq4hgJL/dG/pGIcKOs8B5cIWra
         IvD3Nck7WmlUxZvjxfBgq72feH1bcEZn7ye7a1/9X2n07aXiAdUwxNn0Y+7akbv2fbJQ
         9JOQDVnBETmQgsfFCswPvRrMdNKq5z37smgI2ynPmERUkoY5M3BrBzBgqCjTFKL8DoDO
         /B/g==
X-Gm-Message-State: APjAAAXAaCw47LxBPy31G/jFgZT2/eAR8mVGWJ2nUnRf47DQxIQnDx7M
        IrRkkU7uPpXVcJaasgnR0CMalB3Hu/ruZ17w3Tw=
X-Google-Smtp-Source: APXvYqzNjH9+Ruuo2i8yW1BSgnXwAJkQ6DXwnpBNjovwkn8TDqra5j5vcTdLGxcI0rRey0qwE56zMA28tx8f/+tlLlU=
X-Received: by 2002:a1c:7e10:: with SMTP id z16mr772378wmc.98.1558071962277;
 Thu, 16 May 2019 22:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
 <CAK7LNARvQUPPBzdq7ac67h-xhB6tHZ4WPzBHZy+c3iHE_bi_Fg@mail.gmail.com> <20190517053658.GA3464@kroah.com>
In-Reply-To: <20190517053658.GA3464@kroah.com>
From:   Lucas De Marchi <lucas.de.marchi@gmail.com>
Date:   Thu, 16 May 2019 22:45:50 -0700
Message-ID: <CAKi4VAJQtPvPUKUpYgJdr1o3KHF47QyHw8jSxkO+1qz1Em57JQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Jessica Yu <jeyu@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 16, 2019 at 10:37 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 17, 2019 at 01:45:11PM +0900, Masahiro Yamada wrote:
> > On Fri, May 17, 2019 at 1:29 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > In the recent build test of linux-next, Stephen saw a build error
> > > caused by a broken .tmp_versions/*.mod file:
> > >
> > >   https://lkml.org/lkml/2019/5/13/991
> > >
> > > drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
> > > basename, and there is a race in generating .tmp_versions/asix.mod
> > >
> > > Kbuild has not checked this before, and it suddenly shows up with
> > > obscure error message when this kind of race occurs.
> > >
> > > Non-unique module names cause various sort of problems, but it is
> > > not trivial to catch them by eyes.
> > >
> > > Hence, this script.
> > >
> > > It checks not only real modules, but also built-in modules (i.e.
> > > controlled by tristate CONFIG option, but currently compiled with =y).
> > > Non-unique names for built-in modules also cause problems because
> > > /sys/modules/ would fall over.
> > >
> > > I tested allmodconfig on the latest kernel, and it detected the
> > > following:
> > >
> > > warning: same basename if the following are built as modules:
> > >   drivers/regulator/88pm800.ko
> > >   drivers/mfd/88pm800.ko
> > > warning: same basename if the following are built as modules:
> > >   drivers/gpu/drm/bridge/adv7511/adv7511.ko
> > >   drivers/media/i2c/adv7511.ko
> > > warning: same basename if the following are built as modules:
> > >   drivers/net/phy/asix.ko
> > >   drivers/net/usb/asix.ko
> > > warning: same basename if the following are built as modules:
> > >   fs/coda/coda.ko
> > >   drivers/media/platform/coda/coda.ko
> > > warning: same basename if the following are built as modules:
> > >   drivers/net/phy/realtek.ko
> > >   drivers/net/dsa/realtek.ko
> > >
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > ---
> >
> >
> > One more question popped up.
> >
> > External modules are out of scope of the community,
> > but it is possible that people create an external module
> > that happens to have the same name as an upstream driver.
>
> That is their bug, nothing we can do about that :)

It's actually not a bug. For external modules it works pretty much as
intended. See DEPMOD.D(5): the search directive tells what's the
preference among the directories for modules with the same name.
depmod respects that order and put the right one into your
modules.dep.

This allows to put external modules in a different dir and also to
make backports of modules from recent to ancient kernels.  These
modules with the same name are usually the same module, with a
different version. Of course what we have here and you are fixing is a
different story.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi
