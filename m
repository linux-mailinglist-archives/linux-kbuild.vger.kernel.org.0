Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509241CF951
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 17:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgELPf4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 11:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgELPfz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 11:35:55 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6194FC061A0C;
        Tue, 12 May 2020 08:35:54 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f15so5527945plr.3;
        Tue, 12 May 2020 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GaQi67xXTCCq9s+vL+93JtJPZ31nSIMxohklczm0o9M=;
        b=XI1juBPN0E3L82vUKX5XNPFQZQr7QMv5+8XYbnrNDS2eIecv804IygrY9t45/nlgtb
         vml1cxWQl2p94CAnk1brM2uvSsvYr8PTv2hcZ96N6echR0YwLV5Z7hqIMngNudntnpyv
         fVQw81aiWfDHGsXeUNP/RRnegYfOOpIsntAy6Mg3C0Cg1IvE7JrcqgVzlgYRYnLRCjPk
         Rq2O/RczDilU+uFDEWgdDqy5znHOy9Lj+hxnAi3u7dHtQipFo7jW/g2ZRLdKp0Bro/bo
         6UpYcgmJQzGrDRuD0f6zQOOj7OR6yWTQekvGxkazEeo3d+cwju9EwYCY2rRN4Q8if+28
         g+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GaQi67xXTCCq9s+vL+93JtJPZ31nSIMxohklczm0o9M=;
        b=SD19mcld3VzPt+s1WXA+mTaX+CtcBvz7sgkwji7z0n+m6zMXpvguq27pZ9D65Vx7hX
         g2ReBmDhVL0s0IGsm7gvOo633rPS+7sRU1ODQyVKhfsu3eA3zxzN4DDkamcNqPBnhI7Q
         wwfweK9eCNJVOguKqgRPgJrYsyNaBp0Zs+k2Lo8RaW9rrp/xf3lXDwr+DeEvy8Qa+Wc1
         i7C0o/GQLLssqKJrXx89Ho7y1bn9rReb3zU2ddmNE4UoRIFF8eCkeQLzr+pMUjhOqSpJ
         VDRXyImryfTTobAJLOLYEUfu3Ns+Bs1CF5yM7tst0Fayrf+mtGm/emuwRt/EXgnwhXY7
         WCuQ==
X-Gm-Message-State: AGi0PubBEwD7Hc38cEe3QVWMOwbJvF9JhXlQedjw2m/GwBvSOLhN+XZQ
        mnX4Seqeq0hkyzVlT7VDRSM=
X-Google-Smtp-Source: APiQypIXnEBqsiB6Uwa1EG1cqA5yzhGtKslQks31SGIR1YuV1oshqAoeWsz9n0BmxCXNf1RUJuYbXQ==
X-Received: by 2002:a17:902:8e8c:: with SMTP id bg12mr20760694plb.279.1589297753599;
        Tue, 12 May 2020 08:35:53 -0700 (PDT)
Received: from mail.google.com ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id v127sm2647887pfb.91.2020.05.12.08.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 08:35:52 -0700 (PDT)
Date:   Tue, 12 May 2020 23:35:43 +0800
From:   Changbin Du <changbin.du@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Changbin Du <changbin.du@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5] streamline_config.pl: add LMC_KEEP to preserve some
 kconfigs
Message-ID: <20200512153543.63zguogif2l4mybv@mail.google.com>
References: <20200510010603.3896-1-changbin.du@gmail.com>
 <CAK7LNARH_1nQRExVSCcJ=Twuze5AosG3z2GcA7zwnF6Vi52GWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARH_1nQRExVSCcJ=Twuze5AosG3z2GcA7zwnF6Vi52GWA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 12, 2020 at 03:52:04PM +0900, Masahiro Yamada wrote:
> On Sun, May 10, 2020 at 10:06 AM Changbin Du <changbin.du@gmail.com> wrote:
> >
> > Sometimes it is useful to preserve batches of configs when making
> > localmodconfig. For example, I usually don't want any usb and fs
> > modules to be disabled. Now we can do it by:
> >
> >  $ make LMC_KEEP="drivers/usb:fs" localmodconfig
> >
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> >
> > ---
> > v4: fix typo.
> > v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
> > v2: fix typo in documentation. (Randy Dunlap)
> > ---
> >  Documentation/admin-guide/README.rst |  8 +++++++-
> >  scripts/kconfig/Makefile             |  1 +
> >  scripts/kconfig/streamline_config.pl | 21 +++++++++++++++++++++
> >  3 files changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> > index cc6151fc0845..407aa206bb70 100644
> > --- a/Documentation/admin-guide/README.rst
> > +++ b/Documentation/admin-guide/README.rst
> > @@ -209,10 +209,16 @@ Configuring the kernel
> >                             store the lsmod of that machine into a file
> >                             and pass it in as a LSMOD parameter.
> >
> > +                           Also, you can preserve modules in certain folders
> > +                           or kconfig files by specifying their paths in
> > +                           parameter LMC_KEEP.
> > +
> >                     target$ lsmod > /tmp/mylsmod
> >                     target$ scp /tmp/mylsmod host:/tmp
> >
> > -                   host$ make LSMOD=/tmp/mylsmod localmodconfig
> > +                   host$ make LSMOD=/tmp/mylsmod \
> > +                           LMC_KEEP="drivers/usb:drivers/gpu:fs" \
> > +                           localmodconfig
> >
> >                             The above also works when cross compiling.
> >
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index c9d0a4a8efb3..e0abbf5805f5 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -123,6 +123,7 @@ help:
> >         @echo  '  gconfig         - Update current config utilising a GTK+ based front-end'
> >         @echo  '  oldconfig       - Update current config utilising a provided .config as base'
> >         @echo  '  localmodconfig  - Update current config disabling modules not loaded'
> > +       @echo  '                    except those preserved by LMC_KEEP environment variable'
> >         @echo  '  localyesconfig  - Update current config converting local mods to core'
> 
> Just a nitpicking.
> 
> I was just about to apply this patch,
> then noticed this.
> 
> This works for localyesconfig as well as
> localmodconfig.
> 
> Do you want to add the note to localyesconfig too?
> 
> 
> LMC_ is an acronym of LOCAL_MOD_CONFIG_.
> Maybe it is OK because
> we mostly use localmodconfig,
> using localyesconfig is somewhat rare, I guess.
> 
> 
> Just a reminder, if you want to send v6
> or if you want me to pick this up as-is.
>
yes, I should also add note for localyesconfig. Please see update in v6. Thanks
for your kind reminder.

> Thanks.
> 
> 
> 
> 
> 
> 
> >         @echo  '  defconfig       - New config with default from ARCH supplied defconfig'
> >         @echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
> > diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> > index e2f8504f5a2d..19857d18d814 100755
> > --- a/scripts/kconfig/streamline_config.pl
> > +++ b/scripts/kconfig/streamline_config.pl
> > @@ -143,6 +143,7 @@ my %depends;
> >  my %selects;
> >  my %prompts;
> >  my %objects;
> > +my %config2kfile;
> >  my $var;
> >  my $iflevel = 0;
> >  my @ifdeps;
> > @@ -201,6 +202,7 @@ sub read_kconfig {
> >         if (/^\s*(menu)?config\s+(\S+)\s*$/) {
> >             $state = "NEW";
> >             $config = $2;
> > +           $config2kfile{"CONFIG_$config"} = $kconfig;
> >
> >             # Add depends for 'if' nesting
> >             for (my $i = 0; $i < $iflevel; $i++) {
> > @@ -591,6 +593,20 @@ while ($repeat) {
> >  }
> >
> >  my %setconfigs;
> > +my @preserved_kconfigs = split(/:/,$ENV{LMC_KEEP});
> > +
> > +sub in_preserved_kconfigs {
> > +    my $kconfig = $config2kfile{$_[0]};
> > +    if (!defined($kconfig)) {
> > +        return 0;
> > +    }
> > +    foreach my $excl (@preserved_kconfigs) {
> > +        if($kconfig =~ /^$excl/) {
> > +            return 1;
> > +        }
> > +    }
> > +    return 0;
> > +}
> >
> >  # Finally, read the .config file and turn off any module enabled that
> >  # we could not find a reason to keep enabled.
> > @@ -644,6 +660,11 @@ foreach my $line (@config_file) {
> >      }
> >
> >      if (/^(CONFIG.*)=(m|y)/) {
> > +        if (in_preserved_kconfigs($1)) {
> > +            dprint "Preserve config $1";
> > +            print;
> > +            next;
> > +        }
> >         if (defined($configs{$1})) {
> >             if ($localyesconfig) {
> >                 $setconfigs{$1} = 'y';
> > --
> > 2.25.1
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
Cheers,
Changbin Du
