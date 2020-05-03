Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1301C2927
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 May 2020 02:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgECAKX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 May 2020 20:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgECAKX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 20:10:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB43DC061A0C;
        Sat,  2 May 2020 17:10:22 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r4so6658160pgg.4;
        Sat, 02 May 2020 17:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j0I6jYWaKY4+V4FMpcS76pI7d2z/G1zMDmPX9h3fut8=;
        b=CikoTH8R+IrjHXImCPhE51UyBre5MwyLY+w5YSoZHMaeftwCZu+1Df34EVyXWiD9Sg
         IbdSMGUJj5yvN6bYFwU93JzzQdycjfLCGSPtjGfbsKgrc/BP9e1UROWxo+OSb31jZvzk
         8QAcV9Q1qPbSrc4zEr+Obf1D/axbN+UJ1XMf82lBQFx5wOox6HXgYdRIVVm1Lngv62ub
         GwYBYFqNyOqOPP25bb9x/pniUaH/2VhNolnLK/lFlAnR+yxrx4fABXaNc4zDJFEuj1ee
         9UshZEtCgcugafRPAHFP4P+8zQVD9C5q2Wvt4hBFnX48xvwNzXi4qiqq6fWtSShBhb9d
         ddLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j0I6jYWaKY4+V4FMpcS76pI7d2z/G1zMDmPX9h3fut8=;
        b=EXkNkLr+ZRxY8647MQQur3nEvu7eh55L70rsHVeXgqdM2pICfyYwU4+XWi6SdJsSBZ
         62urFGknVkNmfo55XKLsnLiX34vCcVEgbvsGypwbRpA1hDxjaNNXt9W5YyQ6HGCkCJbP
         NXXIR90Azubz/xd1KuKbdKKVU18q1kacdwCIrELCvqiWd/zI3sneSESWQyDRp+9okyJP
         F4epO0QX193NwMF37YUd8tlUEapBcK4sG7Y/bhx7MGatVIbXyvpkZ8VTv/NJLyQnspoG
         kkOl7wGAXxMEORi4vFRk5CZRrx6yRRGhnGIt2kg+H695Gvx6kVfVbLl16A7jo3s7/MbJ
         au/g==
X-Gm-Message-State: AGi0PuYvtrWHyc1unxAaSYsJ8w3W0LSnbmHc9e/YpwgWX/N2to26PkYU
        OiSVXc6sS4ZVINcaW3xrWzo=
X-Google-Smtp-Source: APiQypKnVsQsDZ4ldItm0kvZ+IyDjuj3mJh4QKU7S2CoeEAm0FsB6Az9waUAWcdGvE3HzdSegHQSXQ==
X-Received: by 2002:a63:d60a:: with SMTP id q10mr11099642pgg.37.1588464622384;
        Sat, 02 May 2020 17:10:22 -0700 (PDT)
Received: from mail.google.com ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id o190sm5319704pfb.178.2020.05.02.17.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 17:10:21 -0700 (PDT)
Date:   Sun, 3 May 2020 08:10:15 +0800
From:   Changbin Du <changbin.du@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Changbin Du <changbin.du@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3] streamline_config.pl: add LMC_KEEP to preserve some
 kconfigs
Message-ID: <20200503001015.e2rjecyq46ykp3dm@mail.google.com>
References: <20200502153052.5461-1-changbin.du@gmail.com>
 <6a0c13c6-148d-74b3-4ddc-7252b8b112bf@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a0c13c6-148d-74b3-4ddc-7252b8b112bf@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 02, 2020 at 08:50:22AM -0700, Randy Dunlap wrote:
> On 5/2/20 8:30 AM, Changbin Du wrote:
> > Sometimes it is useful to preserve batches of configs when making
> > localmodconfig. For example, I usually don't want any usb and fs
> > modules to be disabled. Now we can do it by:
> > 
> >  $ make LMC_KEEP="drivers/usb;fs" localmodconfig
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > 
> > ---
> > v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
> > v2: fix typo in documentation. (Randy Dunlap)
> > ---
> >  Documentation/admin-guide/README.rst |  8 +++++++-
> >  scripts/kconfig/Makefile             |  1 +
> >  scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
> >  3 files changed, 31 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> > index cc6151fc0845..f7b02ce61ea7 100644
> > --- a/Documentation/admin-guide/README.rst
> > +++ b/Documentation/admin-guide/README.rst
> > @@ -209,10 +209,16 @@ Configuring the kernel
> >                             store the lsmod of that machine into a file
> >                             and pass it in as a LSMOD parameter.
> >  
> > +                           Also, you can preserve modules in certain folders
> > +                           or kconfig files by spcifying their paths in
> 
>                                                   specifying
> 
> More below.
>
Will fix them, thank you!

> 
> > +                           parameter LMC_KEEP.
> > +
> >                     target$ lsmod > /tmp/mylsmod
> >                     target$ scp /tmp/mylsmod host:/tmp
> >  
> > -                   host$ make LSMOD=/tmp/mylsmod localmodconfig
> > +                   host$ make LSMOD=/tmp/mylsmod \
> > +                           LMC_KEEP="drivers/usb;drivers/gpu;fs" \
> > +                           localmodconfig
> >  
> >                             The above also works when cross compiling.
> >  
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index c9d0a4a8efb3..e0abbf5805f5 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -123,6 +123,7 @@ help:
> >  	@echo  '  gconfig	  - Update current config utilising a GTK+ based front-end'
> >  	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
> >  	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
> > +	@echo  '                    except those preserved by LMC_KEEP environment variable'
> >  	@echo  '  localyesconfig  - Update current config converting local mods to core'
> >  	@echo  '  defconfig	  - New config with default from ARCH supplied defconfig'
> >  	@echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
> > diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> > index e2f8504f5a2d..f3a2ceed1e82 100755
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
> >  	if (/^\s*(menu)?config\s+(\S+)\s*$/) {
> >  	    $state = "NEW";
> >  	    $config = $2;
> > +	    $config2kfile{"CONFIG_$config"} = $kconfig;
> >  
> >  	    # Add depends for 'if' nesting
> >  	    for (my $i = 0; $i < $iflevel; $i++) {
> > @@ -592,6 +594,22 @@ while ($repeat) {
> >  
> >  my %setconfigs;
> >  
> > +my @presevered_kconfigs;
> 
> s/presevered/preserved/g  (g means globally, throughout this script)
> 
> > +@presevered_kconfigs = split(/;/,$ENV{LMC_KEEP}) if (defined($ENV{LMC_KEEP}));
> > +
> > +sub in_presevered_kconfigs {
> > +    my $kconfig = $config2kfile{$_[0]};
> > +    if (!defined($kconfig)) {
> > +        return 0;
> > +    }
> > +    foreach my $excl (@presevered_kconfigs) {
> > +        if($kconfig =~ /^$excl/) {
> > +            return 1;
> > +        }
> > +    }
> > +    return 0;
> > +}
> > +
> >  # Finally, read the .config file and turn off any module enabled that
> >  # we could not find a reason to keep enabled.
> >  foreach my $line (@config_file) {
> > @@ -644,6 +662,11 @@ foreach my $line (@config_file) {
> >      }
> >  
> >      if (/^(CONFIG.*)=(m|y)/) {
> > +        if (in_presevered_kconfigs($1)) {
> > +            dprint "Preserve config $1";
> > +            print;
> > +            next;
> > +        }
> >  	if (defined($configs{$1})) {
> >  	    if ($localyesconfig) {
> >  	        $setconfigs{$1} = 'y';
> > 
> 
> thanks.
> -- 
> ~Randy
> 

-- 
Cheers,
Changbin Du
