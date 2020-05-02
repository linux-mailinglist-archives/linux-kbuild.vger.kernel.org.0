Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7491C25AB
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 May 2020 15:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgEBNbF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 May 2020 09:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbgEBNbF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 09:31:05 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1E2C061A0C;
        Sat,  2 May 2020 06:31:03 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id hi11so1243507pjb.3;
        Sat, 02 May 2020 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bi0gK7rrJKRdTZvFneMd4oOaGoQX/e6r+/P5aOhwl1E=;
        b=nLG5YrEzOR1tMnpUCFoPnzqI5uFF/GRwWkiJQ3PMIdyZRPmdeoGFLetDWbGXagN6OC
         tjwf6uHm71GGNRapjkXN4u5zUmF14rmVRwydDEbFAdoovEKJOj3OQRovBQ8bjiHVYPoQ
         CbyTJ3N+RDtjCoxf5vmBkcMXraxSGUkvNlPSW54hx6aUc4HeIliyCu9wOrYrWVpgR/vI
         7q8PKBoSN2HXAHpMeTpE1cG0anOkBMuoZLa5xynRAQwF6kYRsr+ZZkfl11GR6ilDJ/E9
         DdcswrHcDsB/qthCxPKEHdV+pSoJRNNVNKzC2Hdzv662Kdn8BhUgnsEPSNr2XrZn2pf9
         1MAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bi0gK7rrJKRdTZvFneMd4oOaGoQX/e6r+/P5aOhwl1E=;
        b=LXAHC0ODwSvqJk2wQWkW6CPX5Qqw+pyiRulG5v+th3DidCtXgL6tgb4F0jRvJ9i9Ue
         AWocY0K/TSrmrFq7DRThFewU/RoCtI6zti7gopaNYFb83Lacnu8o70aDPTHalkNZBfYz
         HhEOye9CMbgJXILP0Igpp1SulDdF7XWx6SZZaoOfEQx2yyPAM975t884hhN2l0cXx2ch
         MiGcSoq/4tIUsZRRs2blzhssTxESTct/0SQEEuRiMs44NHTeAL2IrQiajUQg7EbZs6US
         o7oGAKRNu+VrRY/PX1uOQ8ZpPD7nRr/zbSfHD+D5BkrgbVHbyf6U6cAigUwb2OhGnd/q
         KAsQ==
X-Gm-Message-State: AGi0PubO1SarXjfsjrnRlPIcenEJYkUc4oqkgpf5iu3WLoTFs3G3Qj07
        rqeT4f9qSWbTtbyUrrIWV7U=
X-Google-Smtp-Source: APiQypJoslrC0yy/20zS2szVUdwgz3Rf54Q0HZb5e4hjVx8x90E1xh4k/Xx/hV1HJTJ9Nt/tgEvIeA==
X-Received: by 2002:a17:90b:14ce:: with SMTP id jz14mr5899256pjb.30.1588426263256;
        Sat, 02 May 2020 06:31:03 -0700 (PDT)
Received: from mail.google.com ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id e196sm4546134pfh.43.2020.05.02.06.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 06:31:02 -0700 (PDT)
Date:   Sat, 2 May 2020 21:30:54 +0800
From:   Changbin Du <changbin.du@gmail.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Changbin Du <changbin.du@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] streamline_config.pl: add LOCALMODCONFIG_PRESERVE to
 preserve some kconfigs
Message-ID: <20200502133054.gx77eoas7u7gnxxm@mail.google.com>
References: <20200501023708.108830-1-changbin.du@gmail.com>
 <20200501130729.3a3e4994@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501130729.3a3e4994@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 01, 2020 at 01:07:29PM -0400, Steven Rostedt wrote:
> On Fri,  1 May 2020 10:37:08 +0800
> Changbin Du <changbin.du@gmail.com> wrote:
> 
> > Sometimes it is useful to preserve batches of configs when making
> > localmodconfig. For example, I usually don't want any usb and fs
> > modules to be disabled. Now we can do it by:
> > 
> >  $ make LOCALMODCONFIG_PRESERVE="drivers/usb;fs" localmodconfig
> 
> That's too much typing ;-) What about just "KEEP='drivers/usb;fs'"?
>
I think we'd better use a long name since it will be passed to the entire kbuild.
And we alreay have one named LOCALMODCONFIG_DEBUG. The prefix LOCALMODCONFIG_
can help to avoid namespace pollution.

> 
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > ---
> >  Documentation/admin-guide/README.rst |  8 +++++++-
> >  scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
> >  2 files changed, 30 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> > index cc6151fc0845..6deff95362f8 100644
> > --- a/Documentation/admin-guide/README.rst
> > +++ b/Documentation/admin-guide/README.rst
> > @@ -209,10 +209,16 @@ Configuring the kernel
> >                             store the lsmod of that machine into a file
> >                             and pass it in as a LSMOD parameter.
> >  
> > +                           Also, you can preserve modules in certen folders
> > +                           or kconfig files by spcifying there paths in
> > +                           parameter LOCALMODCONFIG_PRESERVE.
> > +
> >                     target$ lsmod > /tmp/mylsmod
> >                     target$ scp /tmp/mylsmod host:/tmp
> >  
> > -                   host$ make LSMOD=/tmp/mylsmod localmodconfig
> > +                   host$ make LSMOD=/tmp/mylsmod \
> > +                           LOCALMODCONFIG_PRESERVE="drivers/usb;drivers/gpu;fs" \
> > +                           localmodconfig
> >  
> >                             The above also works when cross compiling.
> >  
> > diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> > index e2f8504f5a2d..ab5d1e10a5d0 100755
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
> > +@presevered_kconfigs = split(/;/,$ENV{LOCALMODCONFIG_PRESERVE}) if (defined($ENV{LOCALMODCONFIG_PRESERVE}));
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
> 
> I'll have to test it out, but I like the idea!
> 
> -- Steve

-- 
Cheers,
Changbin Du
