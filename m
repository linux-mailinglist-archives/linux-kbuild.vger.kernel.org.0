Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921D31C25A5
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 May 2020 15:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgEBN0a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 May 2020 09:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgEBN0a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 May 2020 09:26:30 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC18C061A0C;
        Sat,  2 May 2020 06:26:30 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id n11so5958056pgl.9;
        Sat, 02 May 2020 06:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pZ+ozzzn+Egb6aGFcqAOiguMXsTNTlDmjm5HqIzLcsA=;
        b=g4HmuNOhsaQs3d39Vn888/dZ6cgAXzauTfIu/g1cW7Lkujg+hlh75Sn+UfvZ+VdWhc
         z4D+exyjrg+sf3C8Q3I17AmTJks3Lmqr+SSGgakGnmNfKY3whTXmKkAv1aQ0MudynjKZ
         qSUOQ1s1HYDIL0FABhwre1j7PztF+zjdYY+01lPWreJR/BDQScJzZSnyCf25Y6dCJQz0
         ZpKYRsra/DY2CTSnIxX7DPJ/TtoQ0zN6ZLdk1W8kP/k/5sWlNRvXGEruQVCJNNX4pRT2
         foTaxqzF/ucwdPce9aJueilon2uxoQB6pAFGbPFzTVwNuqzojx4buoS6Zq+6/JCIW7om
         LZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pZ+ozzzn+Egb6aGFcqAOiguMXsTNTlDmjm5HqIzLcsA=;
        b=lQf738aMh1QRE4S83AK2DalWDMIA9s5SiJw/wsjwZE0yPv4K/hghWlK11s0GQuF+gW
         3bPU6L5Io2GKV/fpvNnvFYvpDXLPxFzvWuOonWiH47AjaPY51znCMFhQ1Eufcfmder/I
         +xG8O7xzb/iGPGo84dR4D/lfWh6W/WuoLUSGz8PCG0JYRR9cM2i0oDg9WxoKkBdf+Jbi
         +cbulXIiIIL7lZw7RcwLfu3ir+wb+D1BvctJoQUx5ZkjeLKjBVA7rIwyiNpnafuJoS+k
         gBg+ktDbechNsdDPlOsah1r+ENaZQOfOkxcosAd8WsAR+DeKMuYZr/HYrDqz8FMDH+Bu
         k29w==
X-Gm-Message-State: AGi0PuZTYwTmcbeFoYWSnzStdgDP3wk++u+Sb3/ijE0FKDiOhSF23RbX
        8suCR0lRFRzAGcZc908Jl9g=
X-Google-Smtp-Source: APiQypJa6q64s3+DGsJtgyv3Fd5GkoriDaNjiRyVlN7mHw+JZhrGzIo2KYcd2ME1vt+TSpAnLb9d2g==
X-Received: by 2002:a63:7e1b:: with SMTP id z27mr8389676pgc.19.1588425989343;
        Sat, 02 May 2020 06:26:29 -0700 (PDT)
Received: from mail.google.com ([149.248.10.52])
        by smtp.gmail.com with ESMTPSA id v64sm4535192pfb.20.2020.05.02.06.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 06:26:28 -0700 (PDT)
Date:   Sat, 2 May 2020 21:26:20 +0800
From:   Changbin Du <changbin.du@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Changbin Du <changbin.du@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] streamline_config.pl: add LOCALMODCONFIG_PRESERVE to
 preserve some kconfigs
Message-ID: <20200502132620.z6bo66ypc65eukge@mail.google.com>
References: <20200501023708.108830-1-changbin.du@gmail.com>
 <07f3fe15-ae8d-c11a-c29f-ed9c51c2addc@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07f3fe15-ae8d-c11a-c29f-ed9c51c2addc@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 01, 2020 at 09:51:17AM -0700, Randy Dunlap wrote:
> On 4/30/20 7:37 PM, Changbin Du wrote:
> > Sometimes it is useful to preserve batches of configs when making
> > localmodconfig. For example, I usually don't want any usb and fs
> > modules to be disabled. Now we can do it by:
> > 
> >  $ make LOCALMODCONFIG_PRESERVE="drivers/usb;fs" localmodconfig
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
> 
> typo:                                                           certain
> 
> > +                           or kconfig files by spcifying there paths in
> 
> again:                                            specifying their
> 
Thank you, I will fix them.

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
> > 
> 
> 
> -- 
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

-- 
Cheers,
Changbin Du
