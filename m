Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC43247B2AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Dec 2021 19:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbhLTSOJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Dec 2021 13:14:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233660AbhLTSOI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Dec 2021 13:14:08 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7C8C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Dec 2021 10:14:07 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id j21so37494429edt.9
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Dec 2021 10:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yRCdjgadRWQtiaF5gGdusXinEGnEhFOjodc3u0xyUiE=;
        b=ftXfdKfvysQePVy8XDBHU8ojcajbvbwuUhcrV3VK46nlMUboj8sdt4kzipzvNlkJAe
         l0couRkMUHNajY1WblLcuyGIP7hukvW6plfzDzFYM77ivkGb9iyqfsGQhhMPO4nxB35X
         v/urXY0r7qXfS+k4jIkgHBYvCgpBKFJtnQcehDuDu5YCS0YemvPoeDYsinJsIPBXWxna
         HsV2DpSZyxFF/o1grCtXltPOjlH/cP78ejqk41gtkyBPtIlXw+/gCBK4ImqNKfdmGyPr
         UO54K7gG5XxtsJsmmSJMFGgXM7znz3SigUp+/b6QoeTAHerWtik1kp0JF57/tWetpzGz
         jFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yRCdjgadRWQtiaF5gGdusXinEGnEhFOjodc3u0xyUiE=;
        b=veHjTQcf7SMydKqdT408P0eDnjaGR934zLWOPbU7bJCOYpXid2DthULnmO0EzGFpRe
         +7L9U1C1Z3se//anEw0Mhz+DKn5kf4t/cKfai30p9/gko7J2ES1I55VIk/8c0+Nbj4h9
         W39p7o1EHVecgmtx/EsWiklBUWo9CD0Hz9gheubDYZPVND6wtOh7/HJt5fdui0Gv/nim
         rIcICLeQmYCT4xQrOBEhRLZ6rp8XMGs14EAIf66tKNFw0L93ofxiTJZzIMbomij/u9Wx
         duuaqdtamJaO6apfpBUGNYyb0hNZjYb/nPBVzYBgMaxIzPFgoRjbExUfnFp/fwiYNSD9
         /t7A==
X-Gm-Message-State: AOAM533w8dxTkIcrSOqSMdUc5sKiF9Mrji2H7quBsu3B+NG6Oaux8LaQ
        mAkAixfYPTRumjrh672E+R7LIdlDoQ+NJ15psx57oQ==
X-Google-Smtp-Source: ABdhPJxxX45n7tG85VxWHrhfN9ZyQFRFFdcAHKSCUj57pbmSa9tajKCCzUloH+6Y+Luv6CvHCmD+d93F7UCdwHE+hDE=
X-Received: by 2002:a17:906:e52:: with SMTP id q18mr13732450eji.278.1640024046224;
 Mon, 20 Dec 2021 10:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20211215172349.388497-1-willmcvicker@google.com> <CAK7LNAT=U9xE5QTPThRTf3V=WEh3WmUh6w-89mm+APjnYp701Q@mail.gmail.com>
In-Reply-To: <CAK7LNAT=U9xE5QTPThRTf3V=WEh3WmUh6w-89mm+APjnYp701Q@mail.gmail.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Mon, 20 Dec 2021 10:13:50 -0800
Message-ID: <CABYd82YUpf5OCuE6q87UZ5+LiRtxqd2yiM25s85KQnxTFcyRzQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] kbuild: install the modules.order for external modules
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 17, 2021 at 5:01 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> (Cc: Lucas De Marchi)
>
> On Thu, Dec 16, 2021 at 2:23 AM Will McVicker <willmcvicker@google.com> wrote:
> >
> > Add support to install the modules.order file for external modules
> > during module_install in order to retain the Makefile ordering
> > of external modules. This helps reduce the extra steps necessary to
> > properly order loading of external modules when there are multiple
> > kernel modules compiled within a given KBUILD_EXTMOD directory.
> >
> > To handle compiling multiple external modules within the same
> > INSTALL_MOD_DIR, kbuild will append a suffix to the installed
> > modules.order file defined like so:
> >
> >   echo ${KBUILD_EXTMOD} | sed 's:[./_]:_:g'
> >
> > Ex:
> >   KBUILD_EXTMOD=/mnt/a.b/c-d/my_driver results in:
> >   modules.order._mnt_a_b_c_d_my_driver
> >
> > The installed module.order.$(extmod_suffix) files can then be cat'd
> > together to create a single modules.order file which would define the
> > order to load all of the modules during boot.
>
>
> So, the user must do this manually?
>
> cat extra/modules.order._mnt_a_b_c_d_my_driver  \
>    extra/modules.order._mnt_e_f_g_h_my_driver \
>    >> modules.order
>
> This is so ugly, and incomplete.
>
> I cc'ed the kmod maintainer, who may have
> comments or better approach.
>
>
>
>
>
>
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  scripts/Makefile.modinst | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index ff9b09e4cfca..2e2e31696fd6 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -24,6 +24,10 @@ suffix-$(CONFIG_MODULE_COMPRESS_XZ)  := .xz
> >  suffix-$(CONFIG_MODULE_COMPRESS_ZSTD)  := .zst
> >
> >  modules := $(patsubst $(extmod_prefix)%, $(dst)/%$(suffix-y), $(modules))
> > +ifneq ($(KBUILD_EXTMOD),)
> > +extmod_suffix := $(subst /,_,$(subst .,_,$(subst -,_,$(KBUILD_EXTMOD))))
> > +modules += $(dst)/modules.order.$(extmod_suffix)
> > +endif
> >
> >  __modinst: $(modules)
> >         @:
> > @@ -82,6 +86,12 @@ $(dst)/%.ko: $(extmod_prefix)%.ko FORCE
> >         $(call cmd,strip)
> >         $(call cmd,sign)
> >
> > +ifneq ($(KBUILD_EXTMOD),)
> > +$(dst)/modules.order.$(extmod_suffix): $(MODORDER) FORCE
> > +       $(call cmd,install)
> > +       @sed -i "s:^$(KBUILD_EXTMOD):$(INSTALL_MOD_DIR):g" $@
> > +endif
> > +
> >  else
> >
> >  $(dst)/%.ko: FORCE
> > --
> > 2.34.1.173.g76aa8bc2d0-goog
> >
>
>
> --
> Best Regards
> Masahiro Yamada
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

Hi Masahiro,

Thanks for your response! I agree with you that this is ugly and would
love feedback on the direction to take this. With regards to
incompleteness, the existing kbuild implementation for external
modules is already incomplete in the sense that it doesn't even
attempt to install the already generated modules.order files to
INSTALL_MOD_DIR. I believe this patch gets us a little closer to
closing the gap, but agree it's nowhere complete. I would be happy to
fully close the gap if I knew that it would be accepted or welcomed.
Let me give you some insight on how we currently do this on Android
and how this patch changes that.

Currently, the Android build.sh script (which is used to compile the
Android Common Kernel) supports the build variable EXT_MODULES which
is a list of paths to external modules to be compiled. The build
script loops through this list and calls "make modules" and "make
modules_install" to compile and install the external modules. Then,
the build script creates the modules.order file like this:

cd ${MODLIB}
find extra -type f -name "*.ko" | sort >> modules.order

Sorting is used so that the modules.order file is deterministic. This
proposed patch allows us to use the Makefile defined ordering instead
of this sorted ordering. In Android the paths to external modules must
be relative to the kernel repository. For example, the kernel and all
external modules are all cloned within a root directory and the paths
in EXT_MODULES are all relative to the root directory. So our build.sh
script can use the relative path from the root directory as part of
INSTALL_MOD_DIR to get rid of the suffix ugliness. For example, we can
do this:

for EXT_MOD in ${EXT_MODULES}; do
  # make modules
  make -C ${EXT_MOD} ...
  # make modules_install
  make -C ${EXT_MOD} ...  INSTALL_MOD_DIR="extra/${EXT_MOD}" modules_install
done

for EXT_MOD in ${EXT_MODULES}; do
  modules_order_file=$(ls ${MODLIB}/extra/${EXT_MOD}/modules.order.*)
  cat ${modules_order_file} >> ${MODLIB}/modules.order
done

Since kbuild doesn't know about how many external modules there are
nor does it retain any information about each individual call to "make
modules" or "make modules_install", we can't do the concatenation
within the Makefile.modinst script. To close the gap, we could add an
additional make target that one could call after all of the external
modules have been installed to do this concatenation, but I wasn't
sure how open everyone would be to accepting this. Let me know your
thoughts on that.

Thanks,
Will
